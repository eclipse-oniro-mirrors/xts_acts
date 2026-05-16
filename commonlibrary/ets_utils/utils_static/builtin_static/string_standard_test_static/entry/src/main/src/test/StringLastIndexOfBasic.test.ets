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

export interface LastIndexOfExpectedPair {
  result: number;
  expected: number;
}

export interface RegexMatchLastIndexResult {
  lastIndex: number;
  lastMatch: string | null;
  expectedIndex: number;
  expectedMatch: string;
}

export interface RegexSearchLastIndexResult {
  lastIndexOf: number;
  searchResult: number;
  expectedLast: number;
  expectedSearch: number;
}

class LastIndexOfSearchObj {
  toString(): string {
    return 'test';
  }
}

namespace lastIndexOfHelperTest {
  export function testArrayParam001(): LastIndexOfExpectedPair {
    const arr: number[] = [1, 2, 3];
    const result: number = '1,2,3'.lastIndexOf(arr.join(','));
    return { result: result, expected: 0 };
  }

  export function testArrayParam002(): LastIndexOfExpectedPair {
    const arr: number[] = [1, 2, 3];
    const result: number = 'test1,2,3test'.lastIndexOf(arr.join(','));
    return { result: result, expected: 4 };
  }

  export function testArrayParam003(): LastIndexOfExpectedPair {
    const arr: string[] = ['a', 'b', 'c'];
    const result: number = 'a,b,c'.lastIndexOf(arr.join(','));
    return { result: result, expected: 0 };
  }

  export function testDateParam001(): LastIndexOfExpectedPair {
    const date: Date = new Date('2020-01-01');
    const dateStr: string = date.toString();
    const result: number = dateStr.lastIndexOf(String(date));
    return { result: result, expected: 0 };
  }

  export function testNullParam001(): LastIndexOfExpectedPair {
    const result: number = 'null value'.lastIndexOf('null');
    return { result: result, expected: 0 };
  }

  export function testNullParam002(): LastIndexOfExpectedPair {
    const result: number = 'testnulltest'.lastIndexOf('null');
    return { result: result, expected: 4 };
  }

  export function testNullParam003(): LastIndexOfExpectedPair {
    const result: number = 'is null'.lastIndexOf('null');
    return { result: result, expected: 3 };
  }

  export function testUndefinedParam001(): LastIndexOfExpectedPair {
    const result: number = 'undefined'.lastIndexOf('undefined');
    return { result: result, expected: 0 };
  }

  export function testUndefinedParam002(): LastIndexOfExpectedPair {
    const result: number = 'is undefined'.lastIndexOf('undefined');
    return { result: result, expected: 3 };
  }

  export function testUndefinedParam003(): LastIndexOfExpectedPair {
    const result: number = 'test undefined test'.lastIndexOf('undefined');
    return { result: result, expected: 5 };
  }

  export function testNoParam001(): LastIndexOfExpectedPair {
    const result: number = 'undefined'.lastIndexOf('undefined');
    return { result: result, expected: 0 };
  }

  export function testNoParam002(): LastIndexOfExpectedPair {
    const result: number = 'test undefined'.lastIndexOf('undefined');
    return { result: result, expected: 5 };
  }

  export function testNoParam003(): LastIndexOfExpectedPair {
    const result: number = 'hello'.lastIndexOf('undefined');
    return { result: result, expected: -1 };
  }

  export function testIntParam001(): LastIndexOfExpectedPair {
    const result: number = '123456'.lastIndexOf('3');
    return { result: result, expected: 2 };
  }

  export function testIntParam002(): LastIndexOfExpectedPair {
    const result: number = 'test123test'.lastIndexOf('123');
    return { result: result, expected: 4 };
  }

  export function testIntParam003(): LastIndexOfExpectedPair {
    const result: number = '2019-12-31'.lastIndexOf('31');
    return { result: result, expected: 8 };
  }

  export function testFloatParam001(): LastIndexOfExpectedPair {
    const result: number = '3.14'.lastIndexOf('3.14');
    return { result: result, expected: 0 };
  }

  export function testFloatParam002(): LastIndexOfExpectedPair {
    const result: number = 'value: 2.5'.lastIndexOf('2.5');
    return { result: result, expected: 7 };
  }

  export function testFloatParam003(): LastIndexOfExpectedPair {
    const result: number = 'test1.5test'.lastIndexOf('1.5');
    return { result: result, expected: 4 };
  }

  export function testNegativeParam001(): LastIndexOfExpectedPair {
    const result: number = 'temp: -5'.lastIndexOf('-5');
    return { result: result, expected: 6 };
  }

  export function testNegativeParam002(): LastIndexOfExpectedPair {
    const result: number = '-10-20-30'.lastIndexOf('-20');
    return { result: result, expected: 3 };
  }

  export function testNegativeParam003(): LastIndexOfExpectedPair {
    const result: number = 'value:-1.5'.lastIndexOf('-1.5');
    return { result: result, expected: 6 };
  }

  export function testTrueParam001(): LastIndexOfExpectedPair {
    const result: number = 'true or false'.lastIndexOf('true');
    return { result: result, expected: 0 };
  }

  export function testTrueParam002(): LastIndexOfExpectedPair {
    const result: number = 'istrue'.lastIndexOf('true');
    return { result: result, expected: 2 };
  }

  export function testTrueParam003(): LastIndexOfExpectedPair {
    const result: number = 'test true test'.lastIndexOf('true');
    return { result: result, expected: 5 };
  }

  export function testFalseParam001(): LastIndexOfExpectedPair {
    const result: number = 'true or false'.lastIndexOf('false');
    return { result: result, expected: 8 };
  }

  export function testFalseParam002(): LastIndexOfExpectedPair {
    const result: number = 'isfalse'.lastIndexOf('false');
    return { result: result, expected: 2 };
  }

  export function testFalseParam003(): LastIndexOfExpectedPair {
    const result: number = 'test false test'.lastIndexOf('false');
    return { result: result, expected: 5 };
  }

  export function testObjParam001(): LastIndexOfExpectedPair {
    const obj: LastIndexOfSearchObj = new LastIndexOfSearchObj();
    const result: number = 'this is a test'.lastIndexOf(obj.toString());
    return { result: result, expected: 10 };
  }

  export function testObjParam002(): LastIndexOfExpectedPair {
    const obj: LastIndexOfSearchObj = new LastIndexOfSearchObj();
    const result: number = 'testtest'.lastIndexOf(obj.toString());
    return { result: result, expected: 4 };
  }

  export function testNumToString001(): LastIndexOfExpectedPair {
    const result: number = 'value: 123'.lastIndexOf('123');
    return { result: result, expected: 7 };
  }

  export function testNumToString002(): LastIndexOfExpectedPair {
    const result: number = 'test123test'.lastIndexOf(String(123));
    return { result: result, expected: 4 };
  }

  export function testNumToString003(): LastIndexOfExpectedPair {
    const result: number = '123456'.lastIndexOf('123');
    return { result: result, expected: 0 };
  }

  export function testBoolToString001(): LastIndexOfExpectedPair {
    const result: number = 'is true'.lastIndexOf('true');
    return { result: result, expected: 3 };
  }

  export function testBoolToString002(): LastIndexOfExpectedPair {
    const result: number = 'is false'.lastIndexOf('false');
    return { result: result, expected: 3 };
  }

  export function testBoolToString003(): LastIndexOfExpectedPair {
    const result: number = String(true).lastIndexOf('true');
    return { result: result, expected: 0 };
  }

  export function testStrPosition001(): LastIndexOfExpectedPair {
    const result: number = 'hello'.lastIndexOf('l', 3);
    return { result: result, expected: 3 };
  }

  export function testStrPosition002(): LastIndexOfExpectedPair {
    const result: number = 'hello'.lastIndexOf('l', 2);
    return { result: result, expected: 2 };
  }

  export function testStrPosition003(): LastIndexOfExpectedPair {
    const result: number = 'test'.lastIndexOf('t', 3);
    return { result: result, expected: 3 };
  }

  export function testBoolPosition001(): LastIndexOfExpectedPair {
    const result: number = 'hello'.lastIndexOf('h', 1);
    return { result: result, expected: 0 };
  }

  export function testBoolPosition002(): LastIndexOfExpectedPair {
    const result: number = 'hello'.lastIndexOf('h', 0);
    return { result: result, expected: 0 };
  }

  export function testBoolPosition003(): LastIndexOfExpectedPair {
    const result: number = 'hello'.lastIndexOf('e', 0);
    return { result: result, expected: -1 };
  }

  export function testRegexMatch001(): RegexMatchLastIndexResult {
    const str: string = 'test1 test2 test3';
    const lastIndex: number = str.lastIndexOf('test');
    const pattern: RegExp = new RegExp('test', 'g');
    const matches: RegExpMatchArray | null = str.match(pattern);
    let lastMatch: string | null = null;
    if (matches !== null && matches.length > 0) {
      const lastIdx: int = (matches.length as int) - 1;
      const piece: string | undefined = matches[lastIdx];
      lastMatch = piece !== undefined ? piece : null;
    }
    return {
      lastIndex: lastIndex,
      lastMatch: lastMatch,
      expectedIndex: 12,
      expectedMatch: 'test'
    };
  }

  export function testRegexSearch001(): RegexSearchLastIndexResult {
    const str: string = 'test.test.test';
    const lastIndexOf: number = str.lastIndexOf('.');
    const dotPattern: RegExp = new RegExp('\\.');
    const searchResult: number = str.search(dotPattern);
    return {
      lastIndexOf: lastIndexOf,
      searchResult: searchResult,
      expectedLast: 9,
      expectedSearch: 4
    };
  }
}

export default function StringLastIndexOfBasicTest(): void {
  describe('StringLastIndexOfBasicTest', (): void => {
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
     * @tc.name   StringLastIndexOf_ArrayParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ARRAYPARAM_0100
     * @tc.desc   Test lastIndexOf with array parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ArrayParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testArrayParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_ArrayParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ARRAYPARAM_0200
     * @tc.desc   Test lastIndexOf with another array parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ArrayParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testArrayParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_ArrayParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ARRAYPARAM_0300
     * @tc.desc   Test lastIndexOf with third array parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ArrayParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testArrayParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_DateParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_DATEPARAM_0100
     * @tc.desc   Test lastIndexOf with Date object parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_DateParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testDateParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NullParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLPARAM_0100
     * @tc.desc   Test lastIndexOf with null parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNullParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NullParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLPARAM_0200
     * @tc.desc   Test lastIndexOf with null search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNullParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NullParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLPARAM_0300
     * @tc.desc   Test lastIndexOf with null position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNullParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_UndefinedParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNDEFINEDPARAM_0100
     * @tc.desc   Test lastIndexOf with undefined parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UndefinedParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testUndefinedParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_UndefinedParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNDEFINEDPARAM_0200
     * @tc.desc   Test lastIndexOf with undefined search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UndefinedParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testUndefinedParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_UndefinedParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNDEFINEDPARAM_0300
     * @tc.desc   Test lastIndexOf with undefined position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UndefinedParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testUndefinedParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NoParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOPARAM_0100
     * @tc.desc   Test lastIndexOf with no parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NoParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNoParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NoParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOPARAM_0200
     * @tc.desc   Test lastIndexOf called with empty arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NoParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNoParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NoParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOPARAM_0300
     * @tc.desc   Test lastIndexOf with missing parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NoParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNoParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_IntParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_INTPARAM_0100
     * @tc.desc   Test lastIndexOf with integer parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_IntParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testIntParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_IntParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_INTPARAM_0200
     * @tc.desc   Test lastIndexOf with integer search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_IntParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testIntParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_IntParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_INTPARAM_0300
     * @tc.desc   Test lastIndexOf with integer position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_IntParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testIntParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_FloatParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FLOATPARAM_0100
     * @tc.desc   Test lastIndexOf with float parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FloatParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testFloatParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_FloatParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FLOATPARAM_0200
     * @tc.desc   Test lastIndexOf with float search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FloatParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testFloatParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_FloatParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FLOATPARAM_0300
     * @tc.desc   Test lastIndexOf with float position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FloatParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testFloatParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NegativeParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGATIVEPARAM_0100
     * @tc.desc   Test lastIndexOf with negative number parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegativeParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNegativeParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NegativeParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGATIVEPARAM_0200
     * @tc.desc   Test lastIndexOf with negative search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegativeParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNegativeParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NegativeParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGATIVEPARAM_0300
     * @tc.desc   Test lastIndexOf with negative position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegativeParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNegativeParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_TrueParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TRUEPARAM_0100
     * @tc.desc   Test lastIndexOf with boolean true parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_TrueParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testTrueParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_TrueParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TRUEPARAM_0200
     * @tc.desc   Test lastIndexOf with true as search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_TrueParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testTrueParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_TrueParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TRUEPARAM_0300
     * @tc.desc   Test lastIndexOf with true as position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_TrueParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testTrueParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_FalseParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FALSEPARAM_0100
     * @tc.desc   Test lastIndexOf with boolean false parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FalseParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testFalseParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_FalseParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FALSEPARAM_0200
     * @tc.desc   Test lastIndexOf with false as search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FalseParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testFalseParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_FalseParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FALSEPARAM_0300
     * @tc.desc   Test lastIndexOf with false as position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FalseParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testFalseParam003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_ObjParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_OBJPARAM_0100
     * @tc.desc   Test lastIndexOf with object parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ObjParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testObjParam001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_ObjParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_OBJPARAM_0200
     * @tc.desc   Test lastIndexOf with object toString conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ObjParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testObjParam002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NumToString_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMTOSTRING_0100
     * @tc.desc   Test lastIndexOf with number to string conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumToString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNumToString001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NumToString_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMTOSTRING_0200
     * @tc.desc   Test lastIndexOf with number search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumToString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNumToString002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_NumToString_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMTOSTRING_0300
     * @tc.desc   Test lastIndexOf with number position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumToString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testNumToString003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolToString_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLTOSTRING_0100
     * @tc.desc   Test lastIndexOf with boolean to string conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolToString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testBoolToString001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolToString_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLTOSTRING_0200
     * @tc.desc   Test lastIndexOf with boolean search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolToString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testBoolToString002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolToString_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLTOSTRING_0300
     * @tc.desc   Test lastIndexOf with boolean position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolToString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testBoolToString003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_StrPosition_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRPOSITION_0100
     * @tc.desc   Test lastIndexOf with string position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StrPosition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testStrPosition001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_StrPosition_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRPOSITION_0200
     * @tc.desc   Test lastIndexOf with numeric string position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StrPosition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testStrPosition002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_StrPosition_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRPOSITION_0300
     * @tc.desc   Test lastIndexOf with string numeric position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StrPosition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testStrPosition003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolPosition_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLPOSITION_0100
     * @tc.desc   Test lastIndexOf with boolean position parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolPosition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testBoolPosition001();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolPosition_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLPOSITION_0200
     * @tc.desc   Test lastIndexOf with true as position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolPosition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testBoolPosition002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolPosition_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLPOSITION_0300
     * @tc.desc   Test lastIndexOf with false as position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolPosition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testBoolPosition003();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringLastIndexOf_RegexMatch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REGEXMATCH_0100
     * @tc.desc   Test lastIndexOf interaction with regex match method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RegexMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testRegexMatch001();
      expect(result.lastIndex).assertEqual(result.expectedIndex);
      expect(result.lastMatch).assertEqual(result.expectedMatch);
    });

    /**
     * @tc.name   StringLastIndexOf_RegexSearch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REGEXSEARCH_0100
     * @tc.desc   Test lastIndexOf interaction with regex search method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RegexSearch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = lastIndexOfHelperTest.testRegexSearch001();
      expect(result.lastIndexOf).assertEqual(result.expectedLast);
      expect(result.searchResult).assertEqual(result.expectedSearch);
    });
  });
}
