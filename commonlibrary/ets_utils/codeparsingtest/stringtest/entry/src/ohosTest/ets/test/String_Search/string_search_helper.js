/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export function testNullUndefined() {
    let result1, result2;
    
    try {
        const str1 = "test";
        result1 = str1.search(null);
        result1 = "null";
    } catch (e) {
        result1 = e.name;
    }
    
    try {
        const str2 = "test";
        result2 = str2.search(undefined);
        result2 = "undefined";
    } catch (e) {
        result2 = e.name;
    }
    
    return [result1, result2];
}

export function testCustomSymbol() {
    const str = "hello world";
    const customSearcher = {
        [Symbol.search](string) {
            return string.indexOf("world");
        }
    };
    const result = str.search(customSearcher);
    return result;
}

export function testSymbolReturnsNumber() {
    const str = "hello";
    const customSearcher = {
        [Symbol.search](string) {
            return 42;
        }
    };
    const result = str.search(customSearcher);
    return result;
}

export function testSymbolReturnsNegOne() {
    const str = "hello";
    const customSearcher = {
        [Symbol.search](string) {
            return -1;
        }
    };
    const result = str.search(customSearcher);
    return result;
}

export function testSymbolThrowsError() {
    const str = "hello";
    const customSearcher = {
        [Symbol.search](string) {
            throw new Error("Search failed");
        }
    };
    let error;
    try {
        str.search(customSearcher);
    } catch (e) {
        error = e.message;
    }
    return error;
}

export function testNumberParam() {
    const str = "hello world";
    const result = str.search(123);
    return result;
}

export function testBooleanParam() {
    const str = "hello world";
    const result = str.search(true);
    return result;
}

export function testNullParam() {
    const str = "hello world";
    const result = str.search(null);
    return result;
}

export function testUndefinedParam() {
    const str = "hello world";
    const result = str.search(undefined);
    return result;
}

export function testArrayParam() {
    const str = "hello world";
    const result = str.search(["hello", "world"]);
    return result;
}

export function testObjectParam() {
    const str = "hello world";
    const result = str.search({key: "value"});
    return result;
}

export function testCharAtMatch() {
    const str = "hello world";
    const index = str.search(/w/);
    const char = str[index];
    return char;
}

export function testUnmatchedBrackets() {
    const str = "hello";
    let error = false;
    try {
        const result = str.search(new RegExp("[abc"));
    } catch (e) {
        error = true;
    }
    return error;
}

export function testNonStringObject() {
    let result = -1;
    try {
        result = String.prototype.search.call(123, /1/);
    } catch (e) {
        console.log("Error:", e.message);
    }
    return result;
}

export function testSearchOnNull() {
    let error = false;
    try {
        const result = String.prototype.search.call(null, /a/);
    } catch (e) {
        error = true;
    }
    return error;
}

export function testSearchOnUndefined() {
    let error = false;
    try {
        const result = String.prototype.search.call(undefined, /a/);
    } catch (e) {
        error = true;
    }
    return error;
}

export function testSearchOnObject() {
    const obj = { toString: () => "hello" };
    const result = String.prototype.search.call(obj, /h/);
    return result;
}

export function testSearchOnArray() {
    const arr = [1, 2, 3];
    const result = String.prototype.search.call(arr, /1/);
    return result;
}

export function testNoArgument() {
    const str = "undefined";
    const result = str.search();
    return result;
}

export function testWithNaN() {
    const str = "NaN";
    const result = str.search(NaN);
    return result;
}

export function testWithInfinity() {
    const str = "Infinity";
    const result = str.search(Infinity);
    return result;
}

export function testWithFunction() {
    const str = "function";
    const result = str.search(function(){});
    return result;
}

export function testSymbolSearchThrowsError() {
    const str = "hello";
    const customSearcher = {
        [Symbol.search]() {
            throw new TypeError("Custom error");
        }
    };
    let error = false;
    try {
        str.search(customSearcher);
    } catch (e) {
        error = true;
    }
    return error;
}

export function testSymbolSearchReturnsNonNumber() {
    const str = "hello";
    const customSearcher = {
        [Symbol.search]() {
            return "not a number";
        }
    };
    const result = str.search(customSearcher);
    return result;
}

export function testSymbolSearchReturnsNaN() {
    const str = "hello";
    const customSearcher = {
        [Symbol.search]() {
            return NaN;
        }
    };
    const result = str.search(customSearcher);
    return result;
}

export function testSymbolSearchReturnsInfinity() {
    const str = "hello";
    const customSearcher = {
        [Symbol.search]() {
            return Infinity;
        }
    };
    const result = str.search(customSearcher);
    return result;
}

export function testSearchAndIndexOf() {
    const str = "hello world";
    const searchResult = str.search(/world/);
    const indexOfResult = str.indexOf("world");
    return searchResult === indexOfResult;
}

export function testRegexSupport() {
    const str = "hello123world";
    const searchResult = str.search(/\d+/);
    return searchResult;
}

export function testIndexOfPerf() {
    const str = "hello world";
    const indexOfResult = str.indexOf("world");
    return indexOfResult;
}

export function testMatchIndex() {
    const str = "hello world";
    const searchResult = str.search(/world/);
    const matchResult = str.match(/world/);
    return [searchResult, matchResult ? matchResult.index : -1];
}

export function testFirstMatch() {
    const str = "hello hello";
    const searchResult = str.search(/hello/);
    const matchResult = str.match(/hello/g);
    return [searchResult, matchResult ? matchResult.length : 0];
}

export function testNoMatchDiff() {
    const str = "hello";
    const searchResult = str.search(/z/);
    const matchResult = str.match(/z/);
    return [searchResult, matchResult];
}

export function testIndexVsBool() {
    const str = "hello world";
    const searchResult = str.search(/world/);
    const testResult = /world/.test(str);
    return [searchResult, testResult];
}

export function testSimulateTest() {
    const str = "hello world";
    const exists = str.search(/world/) !== -1;
    return exists;
}

export function testEfficiency() {
    const str = "hello world";
    const regex = /world/;
    const testResult = regex.test(str);
    const searchExists = str.search(regex) !== -1;
    return [testResult, searchExists];
}

export function testThenReplace() {
    const str = "hello world";
    const index = str.search(/world/);
    let newStr = str;
    if (index !== -1) {
        newStr = str.replace(/world/, "JavaScript");
    }
    return newStr;
}

export function testVerifyReplace() {
    const str = "hello world";
    const newStr = str.replace(/world/, "JavaScript");
    const index = newStr.search(/JavaScript/);
    return index;
}

export function testConditionalReplace() {
    const str = "hello world";
    let newStr = str;
    if (str.search(/world/) !== -1) {
        newStr = str.replace(/world/, "JavaScript");
    }
    return newStr;
}

export function testThenSplit() {
    const str = "hello world";
    const index = str.search(/ /);
    let parts = [];
    if (index !== -1) {
        parts = str.split(" ");
    }
    return parts;
}

export function testVerifySeparator() {
    const str = "hello,world";
    const separator = /,/;
    let partsLength = 0;
    if (str.search(separator) !== -1) {
        const parts = str.split(",");
        partsLength = parts.length;
    }
    return partsLength;
}

export function testExtractSubstring() {
    const str = "hello world";
    const index = str.search(/world/);
    const substring = str.substring(index);
    return substring;
}

export function testBeforeAfterMatch() {
    const str = "hello world";
    const index = str.search(/world/);
    const before = str.slice(0, index);
    const after = str.slice(index);
    return [before, after];
}

export function testBoundarySlice() {
    const str = "hello";
    const index = str.search(/z/);
    const substring = index !== -1 ? str.slice(index) : str;
    return substring;
}

export function testIncludesBool() {
    const str = "hello world";
    const searchResult = str.search(/world/);
    const includesResult = str.includes("world");
    return [searchResult, includesResult];
}

export function testIncludesNotSupport() {
    const str = "hello123world";
    const searchResult = str.search(/\d+/);
    return searchResult;
}

export function testSimpleCheck() {
    const str = "hello world";
    const includesResult = str.includes("world");
    const searchExists = str.search(/world/) !== -1;
    return [includesResult, searchExists];
}

export function testSimulateStartsWith() {
    const str = "hello world";
    const startsWithHello = str.search(/^hello/) !== -1;
    return startsWithHello;
}

export function testSimulateEndsWith() {
    const str = "hello world";
    const endsWithWorld = str.search(/world$/) !== -1;
    return endsWithWorld;
}

export function testStartsWithEndsWith() {
    const str = "hello world";
    const startsWithHello = str.startsWith("hello");
    const endsWithWorld = str.endsWith("world");
    return [startsWithHello, endsWithWorld];
}
