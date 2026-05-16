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
export function testModifylength() {
    const str = "hello";
    let isTypeError = false;
    try {
        str.length = 10;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return {
        isTypeError: isTypeError,
        length: str.length,
        content: str
    };
}
export function testForInLoop() {
    const str = "hello";
    let hasLength = false;
    for (let key in str) {
        if (key === "length") hasLength = true;
    }
    return hasLength;
}
export function testObjectKeys() {
    const str = "hello";
    const keys = Object.keys(str);
    return {
        hasLength: keys.includes("length"),
        keys: keys
    };
}
export function testStrictDeleteLength() {
    const str = "hello";
    let isTypeError = false;
    try {
        delete str.length;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return {
        isTypeError: isTypeError,
        length: str.length
    };
}
export function testAllDeleteLength() {
    const str = "hello";
    const desc = Object.getOwnPropertyDescriptor(str, "length");
    return {
        value: desc.value,
        writable: desc.writable,
        enumerable: desc.enumerable,
        configurable: desc.configurable
    };
}
export function testTraverseString() {
    const str = "hello";
    const chars = [];
    for (let i = 0; i < str.length; i++) {
        chars.push(str.charAt(i));
    }
    return chars;
};
export function testReverseStringLength() {
    const str = "hello";
    let reversed = "";
    for (let i = str.length - 1; i >= 0; i--) {
        reversed += str.charAt(i);
    }
    return reversed;
};
export function testLengthSlice() {
    const str = "hello world";
    const results = {
        substringFull: str.substring(0, str.length),
        sliceFull: str.slice(0, str.length),
        substringPartial: str.substring(str.length - 5),
        slicePartial: str.slice(-5)
    };
    return results;
}
export function testSafeSubstr() {
    function safeSubstring(str, start, end) {
        const safeStart = Math.max(0, Math.min(start, str.length));
        const safeEnd = Math.max(0, Math.min(end, str.length));
        return str.substring(safeStart, safeEnd);
    }
    const results = {
        case1: safeSubstring("hello", 0, 100),
        case2: safeSubstring("hello", -5, 3)
    };
    return results;
}
export function testCompareLength() {
    const str = "a,b,c";
    const arr = str.split(",");
    const results = {
        strLength: str.length,
        arrLength: arr.length
    };
    return results;
}
export function testSplitLength() {
    const str = "hello";
    const arr = str.split("");
    const results = {
        strLength: str.length,
        arrLength: arr.length,
        isRecovered: arr.join("") === str
    };
    return results;
}
export function testFindLength() {
    const str = "hello world";
    const index = str.indexOf("world");
    const results = {
        isIndexValid: index < str.length,
        isFound: index !== -1
    };
    return results;
}
export function testCheckInclusion() {
    const str = "hello world";
    function contains(str, substr) {
        const index = str.indexOf(substr);
        return index >= 0 && index < str.length;
    }
    const results = {
        hasWorld: contains(str, "world"),
        hasXyz: contains(str, "xyz")
    };
    return results;
}
export function testTrimLength() {
    const str = "  hello  ";
    const results = {
        original: str.length,
        trimmed: str.trim().length,
        trimStart: str.trimStart().length,
        trimEnd: str.trimEnd().length
    };
    return results;
}
export function testTrimEmpty() {
    // 定义判断trim后是否为空的函数
    function isWhitespace(str) {
        return str.trim().length === 0;
    }
    const results = {
        allSpaces: isWhitespace("   "),
        hasChar: isWhitespace("  a  "),
        emptyStr: isWhitespace("")
    };
    return results;
}
export function testRepeatLength() {
    const str = "ab";
    const results = {
        repeat3: str.repeat(3).length,
        repeat0: str.repeat(0).length,
        repeat5: str.repeat(5).length
    };
    return results;
}
export function testRepeatCalc() {
    const str = "hello";
    const times = 10;
    const repeated = str.repeat(times);
    const results = {
        repeatedLength: repeated.length,
        isEqual: repeated.length === str.length * times
    };
    return results;
}
export function testPadLength() {
    const str = "hello";
    const results = {
        padStart: str.padStart(10).length,
        padEnd: str.padEnd(10).length,
        padStartWith: str.padStart(10, "ab").length,
        padEndWith: str.padEnd(10, "ab").length
    };
    return results;
}
export function testPadNoFill() {
    const str = "hello";
    const results = {
        padStart: str.padStart(3).length,
        padEnd: str.padEnd(3).length
    };
    return results;
}
export function testReplaceLength() {
    const str = "hello world";
    const results = {
        replace: str.replace("world", "js").length,
        replaceFirst: str.replace("o", "00").length,
        replaceAll: str.replaceAll("o", "00").length
    };
    return results;
}
export function testEscapeLength() {
    const results = {
        slashN: "\\n".length,
        newLine: "\n".length,
        slashT: "\\t".length,
        tab: "\t".length,
        doubleSlash: "\\\\".length,
        singleSlash: "\\".length
    };
    return results;
}
export function testUnicodeLen() {
    const results = {
        literalU: "\\u0041".length,
        charA: "\u0041".length,
        literalEmoji: "\\u{1F600}".length,
        emoji: "\u{1F600}".length
    };
    return results;
}
export function testAsciiLen() {
    const results = {
        nullChar: "\0".length,
        hex00: "\x00".length,
        hex01: "\x01".length,
        hex1F: "\x1F".length,
        hex7F: "\x7F".length
    };
    return results;
}
export function testSpreadLength() {
    const str = "hello";
    const arr = [...str];
    return {
        strLength: str.length,
        arrLength: arr.length
    };
}
export function testSurrogateLength() {
    const str = "😄😁";
    const arr = [...str];
    return {
        strLength: str.length,
        arrLength: arr.length,
        arrContent: arr
    };
}
export function countCharacters(str) {
    let count = 0;
    for (let char of str) {
        count++;
    }
    return count;
}
export function testCountChars() {
    return {
        hello: countCharacters("hello"),
        emoji: countCharacters("😄😁")
    };
}
export function testAccessByIndex() {
    const str = "hello";
    return {
        firstChar: str[0],
        lastChar: str[str.length - 1],
        middleChar: str[Math.floor(str.length / 2)]
    };
}
export function testBoundaryIndex() {
    const str = "hello";
    return {
        firstIndex: str[0],                // "h"
        beyondLastIndex: str[str.length],  // undefined
        lastIndex: str[str.length - 1],    // "o"
        negativeIndex: str[-1]             // undefined
    };
}
export function testLengthIndexIter() {
    const str = "hello";
    let result = "";
    for (let i = 0; i < str.length; i++) {
        result += str[i];
    }
    return {
        iterResult: result
    };
}
export function testReverseIter() {
    const str = "hello";
    let result = "";
    for (let i = str.length - 1; i >= 0; i--) {
        result += str[i];
    }
    return result;
}
export function testValidLength() {
    function isValidLength(str, min, max) {
        return str.length >= min && str.length <= max;
    }
    return {
        case1: isValidLength("hello", 1, 10),
        case2: isValidLength("", 1, 10),
        case3: isValidLength("a".repeat(20), 1, 10)
    };
}
export function testEmptyByLength() {
    function isNotEmpty(str) {
        return str.length > 0;
    }
    return {
        case1: isNotEmpty("hello"),
        case2: isNotEmpty(""),
        case3: isNotEmpty(" ")
    };
}
export function testTruncate() {
    function truncate(str, maxLen) {
        if (str.length <= maxLen) return str;
        return str.substring(0, maxLen) + "...";
    }
    return {
        case1: truncate("hello world", 5),
        case2: truncate("hi", 5)
    };
}
export function testSafeSubstring() {
    function safeSubstring(str, start, length) {
        const end = Math.min(start + length, str.length);
        return str.substring(start, end);
    }
    return {
        case1: safeSubstring("hello", 1, 3),
        case2: safeSubstring("hello", 2, 10)
    };
}
export function testLeftPad() {
    function leftPad(str, len, char = " ") {
        if (str.length >= len) return str;
        return char.repeat(len - str.length) + str;
    }
    return {
        case1: leftPad("5", 3, "0"),
        case2: leftPad("hello", 10)
    };
}
export function testRightPad() {
    function rightPad(str, len, char = " ") {
        if (str.length >= len) return str;
        return str + char.repeat(len - str.length);
    }
    return {
        case1: rightPad("5", 3, "0"),
        case2: rightPad("hello", 10)
    };
}
export function testFormatFixed() {
    function formatFixed(str, width) {
        if (str.length >= width) return str.substring(0, width);
        return str.padEnd(width);
    }
    return {
        case1: formatFixed("hello", 10),
        case2: formatFixed("hello world", 5)
    };
}
export function testCenter() {
    function center(str, width) {
        if (str.length >= width) return str;
        const leftPad = Math.floor((width - str.length) / 2);
        const rightPad = width - str.length - leftPad;
        return " ".repeat(leftPad) + str + " ".repeat(rightPad);
    }
    return {
        case1: center("hi", 10)
    };
}
export function testCountWords() {
    function countWords(str) {
        if (str.trim().length === 0) return 0;
        return str.trim().split(/\s+/).length;
    }
    return {
        case1: countWords("hello world"),
        case2: countWords(""),
        case3: countWords("   ")
    };
}
export function testLengthCompare() {
    function normalizeSpaces(str) {
        return str.trim().replace(/\s+/g, " ");
    }
    const original = "  hello   world  ";
    const normalized = normalizeSpaces(original);

    return {
        originalLen: original.length,
        normalizedLen: normalized.length
    };
}
export function testLengthInTagFunction() {
    function tag(strings, ...values) {
        return {
            stringsLength: strings.length,
            valuesLength: values.length
        };
    }
    const a = 1, b = 2;
    return tag`hello ${a} world ${b}`;
}
export function testJsonParseLength() {
    const json = '"hello\\nworld"';
    const str = JSON.parse(json);
    return {
        jsonLength: json.length,
        parsedLength: str.length
    };
}
