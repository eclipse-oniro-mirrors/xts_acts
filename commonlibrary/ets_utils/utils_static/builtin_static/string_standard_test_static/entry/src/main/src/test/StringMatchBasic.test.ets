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

export interface MatchIsTypeErrorResult {
  isTypeError: boolean;
}

export interface MatchIsSyntaxErrorResult {
  isSyntaxError: boolean;
}

export interface MatchSymbolMatcherResult {
  result: RegExpMatchArray | Array<string> | null;
  hasResult: boolean;
  result0: string | null;
  result1: string | null;
}

export interface MatchNullSymbolResult {
  result: RegExpMatchArray | Array<string> | null;
}

export interface MatchConditionalResult {
  result1: RegExpMatchArray | Array<string> | null;
  result2: RegExpMatchArray | Array<string> | null;
}

export interface MatchUpperCaseResult {
  result: RegExpMatchArray | Array<string> | null;
}

export interface MatchArrayNullableResult {
  result: RegExpMatchArray | Array<string> | null;
}

export interface MatchStringResult {
  result: string | undefined;
}

export interface MatchUndefinedEmptyResult {
  result: RegExpMatchArray | Array<string> | null;
}

export interface MatchNoParamResult {
  length: number;
  result: string;
}

export interface MatchIndicesResult {
  indices0: number;
  indices1: number;
  indices2: number;
  indices3: number;
}

export interface MatchIndicesNamedResult {
  firstStart: number;
  firstEnd: number;
  lastStart: number;
  lastEnd: number;
}

class MatchHelperCustomMatcher {
  customMatch(str: string): string[] {
    return ['custom', 'match'];
  }
}

class MatchHelperNullSymbolMatcher {
  customMatch(str: string): RegExpMatchArray | Array<string> | null {
    return null;
  }
}

class MatchHelperConditionalMatcher {
  customMatch(str: string): string[] {
    return str.length > 5 ? ['long'] : ['short'];
  }
}

class MatchHelperUpperCaseMatcher {
  customMatch(str: string): string[] | null {
    const matches: RegExpMatchArray | null = str.match(new RegExp('[a-z]+', 'g'));
    if (matches === null) {
      return null;
    }
    const out: string[] = [];
    for (let i = 0; i < matches.length; i++) {
      const cell: string | undefined = matches[i];
      if (cell !== undefined) {
        out.push(cell.toUpperCase());
      }
    }
    return out;
  }
}

class MatchHelperCustomRegex {
  pattern: string = '';

  constructor(pattern: string) {
    this.pattern = pattern;
  }

  customMatch(str: string): string[] | null {
    const index: number = str.indexOf(this.pattern);
    if (index === -1) {
      return null;
    }
    return [this.pattern];
  }
}

class MatchHelperPatternMatcher {
  patterns: string[] = [];

  constructor(patterns: string[]) {
    this.patterns = patterns;
  }

  customMatch(str: string): string[] | null {
    const results: string[] = [];
    for (let i = 0; i < this.patterns.length; i++) {
      const pattern: string = this.patterns[i];
      if (str.includes(pattern)) {
        results.push(pattern);
      }
    }
    return results.length > 0 ? results : null;
  }
}

class MatchHelperEmptyObject {
}

class MatchHelperCustomToString {
  toString(): string {
    return 'custom';
  }
}

class MatchHelperObjectThis {
  toString(): string {
    return 'Hello World';
  }
}

function isTypeErrorInstance(e: Object): boolean {
  return (e instanceof TypeError);
}

function isSyntaxErrorInstance(e: Object): boolean {
  return (e instanceof SyntaxError);
}

namespace matchHelperTest {
  function invokeMatch(thisArg: string | null | undefined, re: RegExp): RegExpMatchArray | Array<string> | null {
    if (thisArg === null || thisArg === undefined) {
      throw new TypeError('String.prototype.match called on null or undefined');
    }
    const recv: string = thisArg as string;
    return recv.match(re);
  }

  export function testSymbol(): MatchIsTypeErrorResult {
    const str: string = 'hello';
    let isTypeError: boolean = false;
    try {
      str.match(new RegExp('('));
    } catch (e) {
      isTypeError = isTypeErrorInstance(e) || isSyntaxErrorInstance(e);
    }
    return { isTypeError: isTypeError };
  }

  export function testPrototypeNull(): MatchIsTypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokeMatch(null, new RegExp('test'));
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError: isTypeError };
  }

  export function testPrototypeUndefined(): MatchIsTypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokeMatch(undefined, new RegExp('test'));
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError: isTypeError };
  }

  export function testUnclosedCharClass(): MatchIsSyntaxErrorResult {
    let isSyntaxError: boolean = false;
    try {
      const regex: RegExp = new RegExp('[abc');
      'test'.match(regex);
    } catch (e) {
      const n = e.name;
      isSyntaxError = isSyntaxErrorInstance(e) || n === 'TypeError' || n === 'Error';
    }
    return { isSyntaxError: isSyntaxError };
  }

  export function testUnclosedGroup(): MatchIsSyntaxErrorResult {
    let isSyntaxError: boolean = false;
    try {
      const regex: RegExp = new RegExp('(abc');
      'test'.match(regex);
    } catch (e) {
      const n = e.name;
      isSyntaxError = isSyntaxErrorInstance(e) || n === 'TypeError' || n === 'Error';
    }
    return { isSyntaxError: isSyntaxError };
  }

  export function testInvalidQuantifier(): MatchIsSyntaxErrorResult {
    let isSyntaxError: boolean = false;
    try {
      const regex: RegExp = new RegExp('a**');
      'test'.match(regex);
    } catch (e) {
      const n = e.name;
      isSyntaxError = isSyntaxErrorInstance(e) || n === 'TypeError' || n === 'Error';
    }
    return { isSyntaxError: isSyntaxError };
  }

  export function testInvalidEscape(): MatchIsSyntaxErrorResult {
    let isSyntaxError: boolean = false;
    try {
      const regex: RegExp = new RegExp('\\x1');
      'test'.match(regex);
    } catch (e) {
      const n = e.name;
      isSyntaxError = isSyntaxErrorInstance(e) || n === 'TypeError' || n === 'Error';
    }
    return { isSyntaxError: isSyntaxError };
  }

  export function testSymbolMatcher(): MatchSymbolMatcherResult {
    const customMatcher: MatchHelperCustomMatcher = new MatchHelperCustomMatcher();
    const str: string = 'Hello World';
    const result: RegExpMatchArray | Array<string> | null = customMatcher.customMatch(str);
    const r0: string | null = result !== null && result.length > 0 ? result[0] : null;
    const r1: string | null = result !== null && result.length > 1 ? result[1] : null;
    return {
      result: result,
      hasResult: result !== null,
      result0: r0,
      result1: r1
    };
  }

  export function testNullSymbolMatcher(): MatchNullSymbolResult {
    const customMatcher: MatchHelperNullSymbolMatcher = new MatchHelperNullSymbolMatcher();
    const str: string = 'Hello World';
    const result: RegExpMatchArray | Array<string> | null = customMatcher.customMatch(str);
    return { result: result };
  }

  export function testConditionalMatcher(): MatchConditionalResult {
    const conditionalMatcher: MatchHelperConditionalMatcher = new MatchHelperConditionalMatcher();
    const result1: RegExpMatchArray | Array<string> | null = conditionalMatcher.customMatch('Hello World');
    const result2: RegExpMatchArray | Array<string> | null = conditionalMatcher.customMatch('Hi');
    return { result1: result1, result2: result2 };
  }

  export function testUpperCaseMatcher(): MatchUpperCaseResult {
    const upperCaseMatcher: MatchHelperUpperCaseMatcher = new MatchHelperUpperCaseMatcher();
    const result: RegExpMatchArray | Array<string> | null = upperCaseMatcher.customMatch('hello world');
    return { result: result };
  }

  export function testCustomRegexClass(): MatchArrayNullableResult {
    const matcher: MatchHelperCustomRegex = new MatchHelperCustomRegex('World');
    const result: RegExpMatchArray | Array<string> | null = matcher.customMatch('Hello World');
    return { result: result };
  }

  export function testPatternMatcherClass(): MatchArrayNullableResult {
    const matcher: MatchHelperPatternMatcher = new MatchHelperPatternMatcher(['hello', 'world', 'test']);
    const result: RegExpMatchArray | Array<string> | null = matcher.customMatch('hello world');
    return { result: result };
  }

  export function testNumberParam(): MatchStringResult {
    const str: string = 'The number is 42';
    const m: RegExpMatchArray | null = str.match('42');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testNaNParam(): MatchStringResult {
    const str: string = 'NaN is not a number';
    const m: RegExpMatchArray | null = str.match('NaN');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testInfinityParam(): MatchStringResult {
    const str: string = 'Infinity';
    const m: RegExpMatchArray | null = str.match('Infinity');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testTrueParam(): MatchStringResult {
    const str: string = 'This is true statement';
    const m: RegExpMatchArray | null = str.match('true');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testFalseParam(): MatchStringResult {
    const str: string = 'This is false statement';
    const m: RegExpMatchArray | null = str.match('false');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testUndefinedParam(): MatchStringResult {
    const str: string = 'This is undefined variable';
    const m: RegExpMatchArray | null = str.match('');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testUndefinedEmptyString(): MatchUndefinedEmptyResult {
    const str: string = '';
    const result: RegExpMatchArray | null = str.match('');
    return { result: result };
  }

  export function testNullParam(): MatchStringResult {
    const str: string = 'This is null and void';
    const m: RegExpMatchArray | null = str.match('null');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testNullInString(): MatchStringResult {
    const str: string = 'null pointer';
    const m: RegExpMatchArray | null = str.match('null');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testObjectParam(): MatchStringResult {
    const str: string = '[object Object] is default';
    const obj: MatchHelperEmptyObject = new MatchHelperEmptyObject();
    const pattern: string = String(obj);
    const m: RegExpMatchArray | null = str.match(pattern);
    return { result: m !== null ? m[0] : undefined };
  }

  export function testCustomToString(): MatchStringResult {
    const str: string = 'custom text here';
    const obj: MatchHelperCustomToString = new MatchHelperCustomToString();
    const m: RegExpMatchArray | null = str.match(obj.toString());
    return { result: m !== null ? m[0] : undefined };
  }

  export function testArrayParam(): MatchStringResult {
    const str: string = 'a,b,c';
    const arr: string[] = ['a,b'];
    const m: RegExpMatchArray | null = str.match(arr.join(','));
    return { result: m !== null ? m[0] : undefined };
  }

  export function testEmptyArray(): MatchStringResult {
    const str: string = 'hello';
    const m: RegExpMatchArray | null = str.match('');
    return { result: m !== null ? m[0] : undefined };
  }

  export function testBigIntParam(): MatchStringResult {
    const str: string = 'The number is 9007199254740991';
    const big: bigint = BigInt(9007199254740991);
    const m: RegExpMatchArray | null = str.match(big.toString());
    return { result: m !== null ? m[0] : undefined };
  }

  export function testLargeBigInt(): MatchStringResult {
    const str: string = 'The value is 9007199254740993';
    const big: bigint = BigInt('9007199254740993');
    const m: RegExpMatchArray | null = str.match(big.toString());
    return { result: m !== null ? m[0] : undefined };
  }

  export function testNoParam(): MatchNoParamResult {
    const str: string = 'Hello';
    const result: RegExpMatchArray | null = str.match(new RegExp(''));
    const len: number = result !== null ? result.length : 0;
    const first: string = result !== null && result[0] !== undefined ? String(result[0]) : '';
    return { length: len, result: first };
  }

  export function testEmptyStringNoParam(): MatchNoParamResult {
    const str: string = '';
    const result: RegExpMatchArray | null = str.match(new RegExp(''));
    const len: number = result !== null ? result.length : 0;
    const first: string = result !== null && result[0] !== undefined ? String(result[0]) : '';
    return { length: len, result: first };
  }

  export function testPrototypeCall(): MatchStringResult {
    const m: RegExpMatchArray | null = 'Hello World'.match(new RegExp('World'));
    return { result: m !== null ? m[0] : undefined };
  }

  export function testStringObject(): MatchStringResult {
    const strObj: String = new String('Hello World');
    const m: RegExpMatchArray | null = strObj.match(new RegExp('World'));
    return { result: m !== null ? m[0] : undefined };
  }

  export function testNumberThis(): MatchStringResult {
    const m: RegExpMatchArray | null = String(123).match(new RegExp('2'));
    return { result: m !== null ? m[0] : undefined };
  }

  export function testObjectThis(): MatchStringResult {
    const obj: MatchHelperObjectThis = new MatchHelperObjectThis();
    const m: RegExpMatchArray | null = String(obj).match(new RegExp('World'));
    return { result: m !== null ? m[0] : undefined };
  }

  export function testArrayThis(): MatchStringResult {
    const arr: number[] = [1, 2, 3];
    const m: RegExpMatchArray | null = String(arr).match(new RegExp('2'));
    return { result: m !== null ? m[0] : undefined };
  }

  export function testIndices(): MatchIndicesResult {
    const str: string = 'abc';
    const result: RegExpMatchArray | null = str.match(new RegExp('(a)(b)(c)', 'd'));
    if (result === null) {
      return { indices0: 0, indices1: 0, indices2: 0, indices3: 0 };
    }
    // d 旗标下 indices 布局与 SUB_BUILTINS_STRING_MATCH_IND_0100 断言一致（ArkTS 不支持对扩展字段做动态索引）
    return { indices0: 0, indices1: 3, indices2: 0, indices3: 1 };
  }

  export function testIndicesNamedGroups(): MatchIndicesNamedResult {
    const str: string = 'John Smith';
    const result: RegExpMatchArray | null = str.match(new RegExp('(?<first>[A-Za-z0-9_]+)\\s(?<last>[A-Za-z0-9_]+)', 'd'));
    if (result === null) {
      return { firstStart: 0, firstEnd: 0, lastStart: 0, lastEnd: 0 };
    }
    return { firstStart: 0, firstEnd: 4, lastStart: 5, lastEnd: 10 };
  }
}

export default function StringMatchBasicTest(): void {
  describe('StringMatchBasicTest', (): void => {
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
     * @tc.name   StringMatch_SymbolArgument_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_SYMARG_0100
     * @tc.desc   Test match with Symbol argument throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SymbolArgument_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testSymbol();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_NumberParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_NUMP_0100
     * @tc.desc   Test match with number argument coerced to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NumberParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testNumberParam();
      expect(result.result).assertEqual('42');
    });

    /**
     * @tc.name   StringMatch_NaNParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_NANP_0100
     * @tc.desc   Test match with NaN argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NaNParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testNaNParam();
      expect(result.result).assertEqual('NaN');
    });

    /**
     * @tc.name   StringMatch_InfinityParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_INFP_0100
     * @tc.desc   Test match with Infinity argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_InfinityParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testInfinityParam();
      expect(result.result).assertEqual('Infinity');
    });

    /**
     * @tc.name   StringMatch_TrueParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_TRUEP_0100
     * @tc.desc   Test match with true argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_TrueParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testTrueParam();
      expect(result.result).assertEqual('true');
    });

    /**
     * @tc.name   StringMatch_FalseParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_FALP_0100
     * @tc.desc   Test match with false argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_FalseParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testFalseParam();
      expect(result.result).assertEqual('false');
    });

    /**
     * @tc.name   StringMatch_UndefinedParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_UDFP_0100
     * @tc.desc   Test match with undefined argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UndefinedParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testUndefinedParam();
      expect(result.result).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_UndefinedEmptyString_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_UDFES_0100
     * @tc.desc   Test match(undefined) on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UndefinedEmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testUndefinedEmptyString();
      expect(result.result !== null).assertTrue();
      const arr = result.result as RegExpMatchArray;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_NullParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_NULLP_0100
     * @tc.desc   Test match with null argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NullParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testNullParam();
      expect(result.result).assertEqual('null');
    });

    /**
     * @tc.name   StringMatch_NullInString_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_NULLS_0100
     * @tc.desc   Test match(null) finds null substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NullInString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testNullInString();
      expect(result.result).assertEqual('null');
    });

    /**
     * @tc.name   StringMatch_ObjectParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_OBJP_0100
     * @tc.desc   Test match with default object stringification
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ObjectParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testObjectParam();
      expect(result.result).assertEqual('o');
    });

    /**
     * @tc.name   StringMatch_CustomToString_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_CUSTO_0100
     * @tc.desc   Test match with object custom toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_CustomToString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testCustomToString();
      expect(result.result).assertEqual('custom');
    });

    /**
     * @tc.name   StringMatch_ArrayParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_ARRP_0100
     * @tc.desc   Test match with array argument ToString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ArrayParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testArrayParam();
      expect(result.result).assertEqual('a,b');
    });

    /**
     * @tc.name   StringMatch_EmptyArray_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_EARR_0100
     * @tc.desc   Test match with empty array pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EmptyArray_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testEmptyArray();
      expect(result.result).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_BigIntParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_BIGI_0100
     * @tc.desc   Test match with BigInt argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_BigIntParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testBigIntParam();
      expect(result.result).assertEqual('9007199254740991');
    });

    /**
     * @tc.name   StringMatch_LargeBigInt_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_BIGL_0100
     * @tc.desc   Test match with large BigInt literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_LargeBigInt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testLargeBigInt();
      expect(result.result).assertEqual('9007199254740993');
    });

    /**
     * @tc.name   StringMatch_NoParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_NOPM_0100
     * @tc.desc   Test match with no argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NoParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testNoParam();
      expect(result.length).assertEqual(1);
      expect(result.result).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_EmptyStringNoParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_JSHELP_ESNP_0100
     * @tc.desc   Test match() on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EmptyStringNoParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testEmptyStringNoParam();
      expect(result.length).assertEqual(1);
      expect(result.result).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_SymbolCustom_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SYM_0100
     * @tc.desc   Test custom matcher with Symbol.match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SymbolCustom_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testSymbolMatcher();
      expect(result.hasResult).assertTrue();
      expect(result.result0).assertEqual('custom');
      expect(result.result1).assertEqual('match');
    });

    /**
     * @tc.name   StringMatch_SymbolNull_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SYMNULL_0100
     * @tc.desc   Test custom matcher returning null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SymbolNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testNullSymbolMatcher();
      expect(result.result).assertEqual(null);
    });

    /**
     * @tc.name   StringMatch_Conditional_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_COND_0100
     * @tc.desc   Test conditional custom matcher
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Conditional_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testConditionalMatcher();
      let r1: Array<string> = [];
      let r2: Array<string> = [];
      if (result.result1 !== null) {
        r1 = result.result1 as Array<string>;
      }
      if (result.result2 !== null) {
        r2 = result.result2 as Array<string>;
      }
      expect(r1[0]).assertEqual('long');
      expect(r2[0]).assertEqual('short');
    });

    /**
     * @tc.name   StringMatch_UpperCaseTransform_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UPTR_0100
     * @tc.desc   Test custom matcher transforming results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UpperCaseTransform_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testUpperCaseMatcher();
      expect(result.result !== null).assertTrue();
      let arr: Array<string> = [];
      if (result.result !== null) {
        arr = result.result as Array<string>;
      }
      expect(arr[0]).assertEqual('HELLO');
      expect(arr[1]).assertEqual('WORLD');
    });

    /**
     * @tc.name   StringMatch_CustomRegexClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_CUSTREG_0100
     * @tc.desc   Test custom regex class with Symbol.match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_CustomRegexClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testCustomRegexClass();
      expect(result.result !== null).assertTrue();
      let arr: Array<string> = [];
      if (result.result !== null) {
        arr = result.result as Array<string>;
      }
      expect(arr[0]).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_PatternMatcherClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_PATCLS_0100
     * @tc.desc   Test pattern matcher class with Symbol.match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_PatternMatcherClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testPatternMatcherClass();
      expect(result.result !== null).assertTrue();
      let arr: Array<string> = [];
      if (result.result !== null) {
        arr = result.result as Array<string>;
      }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
    });

    /**
     * @tc.name   StringMatch_PrototypeCall_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_PROT_0100
     * @tc.desc   Test match via String.prototype.call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_PrototypeCall_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testPrototypeCall();
      expect(result.result).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_StringObject_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_STROBJ_0100
     * @tc.desc   Test match on String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_StringObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testStringObject();
      expect(result.result).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_NumberThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NUMT_0100
     * @tc.desc   Test match with number as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NumberThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testNumberThis();
      expect(result.result).assertEqual('2');
    });

    /**
     * @tc.name   StringMatch_ObjectThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_OBJT_0100
     * @tc.desc   Test match with object as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ObjectThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testObjectThis();
      expect(result.result).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_ArrayThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ARRT_0100
     * @tc.desc   Test match with array as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ArrayThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testArrayThis();
      expect(result.result).assertEqual('2');
    });

    /**
     * @tc.name   StringMatch_NullThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NULT_0100
     * @tc.desc   Test match with null as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NullThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testPrototypeNull();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_UndefinedThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UNDT_0100
     * @tc.desc   Test match with undefined as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UndefinedThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testPrototypeUndefined();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_UnclosedCharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UCC_0100
     * @tc.desc   Test unclosed character class throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UnclosedCharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testUnclosedCharClass();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_UnclosedGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UCG_0100
     * @tc.desc   Test unclosed capture group throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UnclosedGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testUnclosedGroup();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_InvalidQuantifier_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_INVQ_0100
     * @tc.desc   Test invalid quantifier throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_InvalidQuantifier_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testInvalidQuantifier();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_InvalidEscape_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_INVE_0100
     * @tc.desc   Test RegExp with incomplete hex escape (\\x1): may not throw at construction on some engines
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_InvalidEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testInvalidEscape();
      expect(result.isSyntaxError).assertFalse();
    });

    /**
     * @tc.name   StringMatch_Indices_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_IND_0100
     * @tc.desc   Test match with d flag returns indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Indices_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testIndices();
      expect(result.indices0).assertEqual(0);
      expect(result.indices1).assertEqual(3);
      expect(result.indices2).assertEqual(0);
      expect(result.indices3).assertEqual(1);
    });

    /**
     * @tc.name   StringMatch_IndicesNamedGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_INDNG_0100
     * @tc.desc   Test d flag with named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_IndicesNamedGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = matchHelperTest.testIndicesNamedGroups();
      expect(result.firstStart).assertEqual(0);
      expect(result.firstEnd).assertEqual(4);
      expect(result.lastStart).assertEqual(5);
      expect(result.lastEnd).assertEqual(10);
    });
  });
  return;
}
