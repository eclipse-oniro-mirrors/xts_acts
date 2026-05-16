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
export function testSingleCharReplace() {
    const str = "aabbcc";
    const result = str.replaceAll("b", ".");
    return result;
}
export function testMultiCharReplace() {
    const str = "hello world";
    const result = str.replaceAll("ll", "LL");
    return result;
}
export function testLongStrReplace() {
    const str = "The quick brown fox jumps over the lazy dog";
    const result = str.replaceAll("quick brown fox", "slow white cat");
    return result;
}
export function testGlobalReplaceAll() {
    const paragraph = "I think Ruth's dog is cuter than your dog!";
    const result = paragraph.replaceAll("dog", "monkey");
    return result;
}
export function testReplaceConsecutive() {
    const str = "aaa";
    const result = str.replaceAll("a", "b");
    return result;
}
export function testReplaceAlternate() {
    const str = "ababab";
    const result = str.replaceAll("ab", "cd");
    return result;
}
export function testReplaceNonExistent() {
    const str = "hello world";
    const result = str.replaceAll("xyz", "123");
    return result;
}
export function testHandleEmptyStr() {
    const str = "";
    const result = str.replaceAll("a", "b");
    return result;
}
export function testRegexWithGlobal() {
    const str = "aabbcc";
    const regex = /b/g;
    const result = str.replaceAll(regex, ".");
    return result;
}
export function testReplaceNoGlobal() {
    const str = "aabbcc";
    const regex = /b/;
    try {
        str.replaceAll(regex, ".");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}
export function testGlobalIgnoreCase() {
    const paragraph = "I think Ruth's dog is cuter than your Dog!";
    const regex = /Dog/gi;
    const result = paragraph.replaceAll(regex, "ferret");
    return result;
}
export function testGlobalMultiline() {
    const str = "line1\nline2\nline1";
    const regex = /line1/gm;
    const result = str.replaceAll(regex, "replaced");
    return result;
}
export function testGlobalUnicode() {
    const str = "";
    const regex = /./gu;
    const result = str.replaceAll(regex, "");
    return result;
}
export function testGlobalSticky() {
    const str = "test1test2test3";
    const regex = /test/gy;
    let result = "";
    let pos = 0;
    regex.lastIndex = 0;
    while (regex.test(str)) {
        result += str.substring(pos, regex.lastIndex - 4) + "REPLACED";
        pos = regex.lastIndex;
    }
    result += str.substring(pos);
    return result;
}
export function testMultiRegexFlags() {
    const str = "Café CAFÉ café";
    const regex = /café/giu;
    const result = str.replaceAll(regex, "coffee");
    return result;
}
export function testDotWildcard() {
    const str = "cat bat rat";
    const regex = /.at/g;
    const result = str.replaceAll(regex, "XXX");
    return result;
}
export function testCharacterClass() {
    const str = "a1b2c3";
    const regex = /[0-9]/g;
    const result = str.replaceAll(regex, "#");
    return result;
}
export function testBoundaryMatch() {
    const str = "cat category catch";
    const regex = /\bcat\b/g;
    const result = str.replaceAll(regex, "dog");
    return result;
}
export function testNegatedClass() {
    const str = "a1b2c3";
    const regex = /[^0-9]/g;
    const result = str.replaceAll(regex, "#");
    return result;
}
export function testCapturingGroup() {
    const str = "hello world";
    const regex = /(\w+) (\w+)/g;
    const result = str.replaceAll(regex, "$2 $1");
    return result;
}
export function testNamedGroup() {
    const str = "John Smith";
    const regex = /(?<first>\w+) (?<last>\w+)/g;
    const result = str.replaceAll(regex, "$<last>, $<first>");
    return result;
}
export function testNonCapturingGroup() {
    const str = "abc123def456";
    const regex = /(?:abc|def)\d+/g;
    const result = str.replaceAll(regex, "matched");
    return result;
}
export function testMultiCaptureGroup() {
    const str = "2021-12-25 2022-01-01";
    const regex = /(\d{4})-(\d{2})-(\d{2})/g;
    const result = str.replaceAll(regex, "$2/$3/$1");
    return result;
}
export function testPositiveLookahead() {
    const str = "test123test456test";
    const regex = /test(?=\d)/g;
    const result = str.replaceAll(regex, "MATCH");
    return result;
}
export function testNegativeLookahead() {
    const str = "test123test456test";
    const regex = /test(?!\d)/g;
    const result = str.replaceAll(regex, "MATCH");
    return result;
}
export function testPositiveLookbehind() {
    const str = "$100 $200 €300";
    const regex = /(?<=\$)\d+/g;
    const result = str.replaceAll(regex, "XXX");
    return result;
}
export function testNegativeLookbehind() {
    const str = "$100 $200 €300";
    const regex = /(?<!\$)\d+/g;
    const result = str.replaceAll(regex, "XXX");
    return result;
}
export function testZeroOrMore() {
    const str = "ab abb abbb a";
    const regex = /ab*/g;
    const result = str.replaceAll(regex, "X");
    return result;
}
export function testOneOrMore() {
    const str = "ab abb abbb a";
    const regex = /ab+/g;
    const result = str.replaceAll(regex, "X");
    return result;
}
export function testZeroOrOne() {
    const str = "color colour";
    const regex = /colou?r/g;
    const result = str.replaceAll(regex, "X");
    return result;
}
export function testExactCount() {
    const str = "a aa aaa aaaa";
    const regex = /a{2}/g;
    const result = str.replaceAll(regex, "X");
    return result;
}
export function testMinCount() {
    const str = "a aa aaa aaaa";
    const regex = /a{2,}/g;
    const result = str.replaceAll(regex, "X");
    return result;
}
export function testRangeCount() {
    const str = "a aa aaa aaaa";
    const regex = /a{2,3}/g;
    const result = str.replaceAll(regex, "X");
    return result;
}
export function testUnicodeLetters() {
    const str = "Hello世界123";
    const regex = /\p{L}/gu;
    const result = str.replaceAll(regex, "X");
    return result;
}
export function testUnicodeNumbers() {
    const str = "123④⑤⑥";
    const regex = /\p{N}/gu;
    const result = str.replaceAll(regex, "#");
    return result;
}
export function testUnicodeEmoji() {
    const str = "Hello 😊 World 🌍";
    const regex = /\p{Emoji}/gu;
    const result = str.replaceAll(regex, "");
    return result;
}

export function testCaptureReplaceOffset() {
    const string = "aaa";
    const positions = [];
    const result = string.replaceAll("a", (match, offset) => {
        positions.push(offset);
        return match;
    });
    return positions;
}
export function testReplaceWithOffset() {
    const str = "hello";
    const result = str.replaceAll("l", (match, offset, string) => {
        return `${string.length}-${offset}`;
    });
    return result;
}
export function testRegexGroupReplace() {
    const str = "a1b2c3";
    const result = str.replaceAll(/(\w)(\d)/g, (match, p1, p2, offset) => {
        return `${p1}[${p2}]`;
    });
    return result;
}
export function testNamedGroupReplace() {
    const str = "John Smith Jane Doe";
    const regex = /(?<first>\w+) (?<last>\w+)/g;
    const result = str.replaceAll(regex, (match, first, last, offset, string, groups) => {
        return `${groups.last}, ${groups.first}`;
    });
    return result;
}
export function testReplaceReturnUndefined() {
    const str = "abc";
    const result = str.replaceAll("b", () => undefined);
    return result;
}
export function testReplaceReturnNull() {
    const str = "abc";
    const result = str.replaceAll("b", () => null);
    return result;
}
export function testReplaceReturnOffset() {
    const str = "aaa";
    const result = str.replaceAll("a", (match, offset) => offset);
    return result;
}
export function testReplaceReturnObject() {
    const str = "abc";
    const result = str.replaceAll("b", () => ({ key: "value" }));
    return result;
}
export function testReplaceMaxInteger() {
    const str = "aaa";
    const result = str.replaceAll("a", Number.MAX_SAFE_INTEGER);
    return result;
}
export function testBooleanReplaceStr() {
    'use strict';
    const str = "true false true";
    const result = str.replaceAll(true, "yes");
    return result;
}

export function testObjectReplaceStr() {
    'use strict';
    const str = "[object Object] test";
    const obj = {};
    const result = str.replaceAll(obj, "OBJ");
    return result;
}

export function testNullReplaceStr() {
    'use strict';
    const str = "null value null";
    const result = str.replaceAll(null, "NULL");
    return result;
}

export function testUndefinedReplaceStr() {
    'use strict';
    const str = "undefined value undefined";
    const result = str.replaceAll(undefined, "UNDEFINED");
    return result;
}

export function testArrayReplaceStr() {
    'use strict';
    const str = "1,2,3 test 1,2,3";
    const result = str.replaceAll([1, 2, 3], "ARRAY");
    return result;
}

export function testSymbolReplaceError() {
    'use strict';
    const str = "test";
    const e = true;
    try {
        str.replaceAll(Symbol("test"), "X");
    } catch (e) {
        console.log(e instanceof TypeError);
        return e instanceof TypeError;
    }
}

export function testNumberReplaceVal() {
    'use strict';
    const str = "aaa";
    const result = str.replaceAll("a", 123);
    return result;
}

export function testBooleanReplaceVal() {
    'use strict';
    const str = "aaa";
    const result = str.replaceAll("a", true);
    return result;
}

export function testArrayReplaceVal() {
    'use strict';
    const str = "aaa";
    const result = str.replaceAll("a", [1, 2]);
    return result;
}

export function testObjectReplaceVal() {
    'use strict';
    const str = "aaa";
    const result = str.replaceAll("a", { key: "value" });
    return result;
}

export function testNullReplaceVal() {
    'use strict';
    const str = "aaa";
    const result = str.replaceAll("a", null);
    return result;
}

export function testUndefinedReplaceVal() {
    'use strict';
    const str = "aaa";
    const result = str.replaceAll("a", undefined);
    return result;
}

export function testReplaceAllFirst() {
    'use strict';
    const str = "aaa";
    const result1 = str.replaceAll("a", "b");
    const result2 = str.replace("a", "b");
    return [result1,result2];
}

export function testReplaceMethodCompare() {
    'use strict';
    const str = "aaa";
    const result1 = str.replace(/a/, "b");
    const result2 = str.replaceAll(/a/g, "b");
    return [result1,result2];
}

export function testSplitJoinEquiv() {
    'use strict';
    const str = "a-b-c";
    const result1 = str.replaceAll("-", "_");
    const result2 = str.split("-").join("_");
    return [result1,result2];
}

export function testEmptyStrReplace() {
    'use strict';
    const str = "abc";
    const result1 = str.replaceAll("", "_");
    const result2 = str.split("").join("_");
    return [result1,result2];
}

export function testReplaceMatchedContent() {
    'use strict';
    const str = "test123test456";
    const matches = str.match(/\d+/g);
    let result = str;
    matches.forEach(match => {
        result = result.replaceAll(match, `[${match}]`);
    });
    return result;
}
export function testMatchAllReplace() {
    'use strict';
    const str = "test123test456";
    const regex = /\d+/g;
    let result = str;
    const matches = [];
    for (const match of str.matchAll(regex)) {
        matches.push(match[0]);
    }
    return matches;
}

export function testMultipleReplaceChain() {
    'use strict';
    const str = "abc123def456";
    const result = str
        .replaceAll("abc", "ABC")
        .replaceAll("def", "DEF")
        .replaceAll(/\d/g, "#");
    return result;
}

export function testReplaceAllChain() {
    'use strict';
    const str = "  hello world  ";
    const result = str
        .trim()
        .replaceAll(" ", "_")
        .toUpperCase();
    return result;
}

export function testComplexChainCall() {
    'use strict';
    const str = "  Hello, World!  ";
    const result = str
        .trim()
        .replaceAll(",", "")
        .replaceAll("!", "")
        .toLowerCase()
        .replaceAll(" ", "-");
    return result;
}

export function testReplaceResultSame() {
    'use strict';
    const str = "aaa";
    const result1 = str.replaceAll("a", "b");
    const result2 = str.replaceAll("a", "b");
    return result1 == result2;
}

export function testRegexTypeError() {
    'use strict';
    let bool1 = false;
    let bool2 = false;
    const str = "test";
    const regex = /test/;
    try {
        str.replaceAll(regex, "replaced");
    } catch (e) {
        bool1 = e instanceof TypeError;
        bool2 = e.message.includes("global");
    }
    return [bool1,bool2];
}

export function testNullUndefinedError() {
    let bool1 = false;
    let bool2 = false;
    try {
        String.prototype.replaceAll.call(null, "a", "b");
    } catch (e) {
        bool1 = e instanceof TypeError
    }
    try {
        String.prototype.replaceAll.call(undefined, "a", "b");
    } catch (e) {
        bool2 = e instanceof TypeError;
    }
    return bool1 == true && bool2 == true;
}

export function testCustomSymbolError() {
    'use strict';
    const str = "test";
    const customPattern = {
        [Symbol.replace]: () => {
            throw new Error("Custom error");
        },
        flags: "g"
    };
    try {
        str.replaceAll(customPattern, "replacement");
    } catch (e) {
        return e.message;
    }
}

export function testCustomObjectReplace() {
    'use strict';
    const str = "hello world";
    const customPattern = {
        [Symbol.replace](string, replacement) {
            return string.replace(/o/g, replacement);
        },
        flags: "g"
    };
    const result = str.replaceAll(customPattern, "X");
    return result;
}

export function testSymbolReplaceReturn() {
    'use strict';
    const str = "test";
    const customPattern = {
        [Symbol.replace]() {
            return "custom result";
        },
        flags: "g"
    };
    const result = str.replaceAll(customPattern, "replacement");
    return result;
}

export function testSymbolReplaceAccess() {
    'use strict';
    const str = "test";
    const customPattern = {
        [Symbol.replace](string, replacement) {
            return "replaced";
        },
        get flags() {
            console.log("flags accessed");
            return "g";
        }
    };
    const result = str.replaceAll(customPattern, "X");
    return result;
}

export function testSimpleTemp(){
    'use strict';
    const template = "Hello {{name}}, welcome to {{place}}";
    const data = { name: "Alice", place: "Wonderland" };
    let result = template.replaceAll("{{name}}", data.name);
    result = result.replaceAll("{{place}}", data.place);
    return result;
}
export function testStringObject(){
    const strObj = new String("hello");
    const result = String.prototype.replaceAll.call(strObj, "l", "L");


    return result;
}
export function testNonStringObj(){
    'use strict';
    const num = 123;
    const result = String.prototype.replaceAll.call(num, "2", "X");
    return result;
}
export function testArrayAs(){
    'use strict';
    const arr = [1, 2, 3];

    const result = String.prototype.replaceAll.call(arr, ",", "-");
    return result;
}
export function testDateObjectAs(){
    'use strict';
    const date = new Date("2021-01-01");
    const result = String.prototype.replaceAll.call(date, "2021", "2022");
    return result;
}
export function testProxyObjIntercept() {
    'use strict';
    const str = "hello";
    const target = {
        str: str,
        replaceAll(pattern, replacement) {
            return this.str.replaceAll(pattern, replacement);
        }
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === "replaceAll") {
                return function(pattern, replacement) {
                    return target.replaceAll(pattern, replacement);
                };
            }
            return target[prop];
        }
    });
    const result = proxy.replaceAll("l", "x");
    return result;
}
export function testReadOnlyAttr(){
    'use strict';
    const str = "hello";
    try {
        str.length = 10;
    } catch (e) {
        console.log("Cannot set readonly property");
    }
    const result = str.replaceAll("l", "L");
    return result;
}

export function testLastIndex(){
    'use strict';
    const str = "aaa";
    const regex = /a/g;
    regex.lastIndex = 2;
    const result = str.replaceAll(regex, "b");
    return result;
}
export function testReplaceAllChars(){
    'use strict';
    const str = "hello";
    const result = str.replaceAll("l", "L");
    const chars = [...str];
    return [ result, chars ];
}