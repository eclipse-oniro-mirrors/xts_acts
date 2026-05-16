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

export function testSymbol() {
  const str = "hello";
  const sym = Symbol("test");
  let isTypeError = false;
  try {
    const result = str.match(sym);
  } catch (e) {
    isTypeError = e instanceof TypeError;
  }
  return { isTypeError };
}

export function testPrototypeNull() {
  let isTypeError = false;
  try {
    String.prototype.match.call(null, /test/);
  } catch (e) {
    isTypeError = e instanceof TypeError;
  }
  return { isTypeError };
}

export function testPrototypeUndefined() {
  let isTypeError = false;
  try {
    String.prototype.match.call(undefined, /test/);
  } catch (e) {
    isTypeError = e instanceof TypeError;
  }
  return { isTypeError };
}

export function testInvalidEscape() {
  let isSyntaxError = false;
  try {
    const result = "test".match(/\x1/);
  } catch (e) {
    isSyntaxError = e instanceof SyntaxError;
  }
  return { isSyntaxError };
}

export function testUnclosedCharClass() {
  let isSyntaxError = false;
  try {
    const regex = new RegExp('[abc');
    const result = "test".match(regex);
  } catch (e) {
    isSyntaxError = e instanceof SyntaxError;
  }
  return { isSyntaxError };
}

export function testUnclosedGroup() {
  let isSyntaxError = false;
  try {
    const regex = new RegExp('(abc');
    const result = "test".match(regex);
  } catch (e) {
    isSyntaxError = e instanceof SyntaxError;
  }
  return { isSyntaxError };
}

export function testInvalidQuantifier() {
  let isSyntaxError = false;
  try {
    const regex = new RegExp('a**');
    const result = "test".match(regex);
  } catch (e) {
    isSyntaxError = e instanceof SyntaxError;
  }
  return { isSyntaxError };
}

export function testSymbolMatcher() {
  const customMatcher = {
    [Symbol.match](str) {
      return ["custom", "match"];
    }
  };
  const str = "Hello World";
  const result = str.match(customMatcher);
  return { result, hasResult: result !== null, result0: result ? result[0] : null, result1: result ? result[1] : null };
}

export function testNullSymbolMatcher() {
  const customMatcher = {
    [Symbol.match](str) {
      return null;
    }
  };
  const str = "Hello World";
  const result = str.match(customMatcher);
  return { result };
}

export function testConditionalMatcher() {
  const conditionalMatcher = {
    [Symbol.match](str) {
      return str.length > 5 ? ["long"] : ["short"];
    }
  };
  const result1 = "Hello World".match(conditionalMatcher);
  const result2 = "Hi".match(conditionalMatcher);
  return { result1, result2 };
}

export function testUpperCaseMatcher() {
  const upperCaseMatcher = {
    [Symbol.match](str) {
      const matches = str.match(/[a-z]+/g);
      return matches ? matches.map((s) => s.toUpperCase()) : null;
    }
  };
  const result = "hello world".match(upperCaseMatcher);
  return { result };
}

export function testCustomRegexClass() {
  class CustomRegex {
    pattern;
    constructor(pattern) {
      this.pattern = pattern;
    }
    [Symbol.match](str) {
      const index = str.indexOf(this.pattern);
      if (index === -1) return null;
      return [this.pattern];
    }
  }
  const matcher = new CustomRegex("World");
  const result = "Hello World".match(matcher);
  return { result };
}

export function testPatternMatcherClass() {
  class PatternMatcher {
    patterns;
    constructor(patterns) {
      this.patterns = patterns;
    }
    [Symbol.match](str) {
      const results = [];
      for (const pattern of this.patterns) {
        if (str.includes(pattern)) {
          results.push(pattern);
        }
      }
      return results.length > 0 ? results : null;
    }
  }
  const matcher = new PatternMatcher(["hello", "world", "test"]);
  const result = "hello world".match(matcher);
  return { result };
}

export function testNumberParam() {
  let str = "The number is 42";
  let result = str.match(42);
  return { result: result[0] };
}

export function testNaNParam() {
  let str = "NaN is not a number";
  let result = str.match(NaN);
  return { result: result[0] };
}

export function testInfinityParam() {
  let str = "Infinity";
  let result = str.match(Infinity);
  return { result: result[0] };
}

export function testTrueParam() {
  let str = "This is true statement";
  let result = str.match(true);
  return { result: result[0] };
}

export function testFalseParam() {
  let str = "This is false statement";
  let result = str.match(false);
  return { result: result[0] };
}

export function testUndefinedParam() {
  let str = "This is undefined variable";
  let result = str.match(undefined);
  return { result: result[0] };
}

export function testUndefinedEmptyString() {
  let str = "";
  let result = str.match(undefined);
  return { result };
}

export function testNullParam() {
  let str = "This is null and void";
  let result = str.match(null);
  return { result: result[0] };
}

export function testNullInString() {
  let str = "null pointer";
  let result = str.match(null);
  return { result: result[0] };
}

export function testObjectParam() {
  let str = "[object Object] is default";
  let obj = {};
  let result = str.match(obj);
  return { result: result[0] };
}

export function testCustomToString() {
  let str = "custom text here";
  let obj = {
    toString() {
      return "custom";
    }
  };
  let result = str.match(obj);
  return { result: result[0] };
}

export function testArrayParam() {
  let str = "a,b,c";
  let result = str.match(["a,b"]);
  return { result: result[0] };
}

export function testEmptyArray() {
  let str = "hello";
  let result = str.match([]);
  return { result: result[0] };
}

export function testBigIntParam() {
  let str = "The number is 9007199254740991";
  let big = BigInt(9007199254740991);
  let result = str.match(big);
  return { result: result[0] };
}

export function testLargeBigInt() {
  let str = "The value is 9007199254740993";
  let big = BigInt("9007199254740993");
  let result = str.match(big);
  return { result: result[0] };
}

export function testNoParam() {
  let str = "Hello";
  let result = str.match();
  return { length: result.length, result: result[0] };
}

export function testEmptyStringNoParam() {
  let str = "";
  let result = str.match();
  return { length: result.length, result: result[0] };
}

export function testPrototypeCall() {
  let result = String.prototype.match.call("Hello World", /World/);
  return { result: result[0] };
}

export function testStringObject() {
  let strObj = new String("Hello World");
  let result = strObj.match(/World/);
  return { result: result[0] };
}

export function testNumberThis() {
  let result = String.prototype.match.call(123, /2/);
  return { result: result[0] };
}

export function testObjectThis() {
  let obj = { toString: () => "Hello World" };
  let result = String.prototype.match.call(obj, /World/);
  return { result: result[0] };
}

export function testArrayThis() {
  let arr = [1, 2, 3];
  let result = String.prototype.match.call(arr, /2/);
  return { result: result[0] };
}

export function testIndices() {
  let str = "abc";
  let result = str.match(/(a)(b)(c)/d);
  return {
    indices0: result.indices[0][0],
    indices1: result.indices[0][1],
    indices2: result.indices[1][0],
    indices3: result.indices[1][1]
  };
}

export function testIndicesNamedGroups() {
  let str = "John Smith";
  let result = str.match(/(?<first>\w+)\s(?<last>\w+)/d);
  return {
    firstStart: result.indices.groups.first[0],
    firstEnd: result.indices.groups.first[1],
    lastStart: result.indices.groups.last[0],
    lastEnd: result.indices.groups.last[1]
  };
}

