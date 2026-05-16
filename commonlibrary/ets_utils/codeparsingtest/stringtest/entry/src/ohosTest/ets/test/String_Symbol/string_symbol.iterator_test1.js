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
export function testGetStringIterator(str) {
    return str[Symbol.iterator]();
}

export function testOwnProperty() {
    const str = "test";
    return [Symbol.iterator in String.prototype, str.hasOwnProperty(Symbol.iterator)];
}

export function testGetIteratorFromIterator(iteratorObj) {
    return iteratorObj[Symbol.iterator]();
}

export function testStringSpreadToArray(str) {
    return [...str];
}

export function testCodePoints(str) {
    const result = [];
    for (let i = 0; i < str.length; ) {
        const first = str.charCodeAt(i);
        if (first >= 0xD800 && first <= 0xDBFF && i + 1 < str.length) {
            const second = str.charCodeAt(i + 1);
            if (second >= 0xDC00 && second <= 0xDFFF) {
                const cp = (first - 0xD800) * 0x400 + (second - 0xDC00) + 0x10000;
                result.push(String.fromCodePoint(cp));
                i += 2;
                continue;
            }
        }
        result.push(str[i]);
        i++;
    }
    return result;
}

export function testCodeNums(str) {
    const chars = testCodePoints(str);
    return chars.map((c) => c.codePointAt(0));
}

export function testRebuildNums(str) {
    const nums = testCodeNums(str);
    return String.fromCodePoint(...nums) === str;
}

export function testArrayLiteralSpread(str) {
    return ["a", "b", ...str, "e"];
}

export function testArrayDestructuringString(str) {
    const [a, b, c, ...rest] = str;
    return [a, b, c, rest];
}

export function testDestructuringSwapVariables(str) {
    let [x, y] = str;
    [x, y] = [y, x];
    return [x, y];
}

export function testDestructuringDefaultValue(str) {
    const [first, second = "default"] = str;
    return [first, second];
}

export function testSetFromString(str) {
    const set = new Set(str);
    return [set.size, set.has("l")];
}

export function testMapFromString(str) {
    const chars = [...str];
    const map = new Map(chars.map((char, i) => [char, i]));
    return [map.get(chars[0]), map.get(chars[1])];
}

export function testPromiseAllUpper(str) {
    const promises = [...str].map((char) => Promise.resolve(char.toUpperCase()));
    return Promise.all(promises);
}

export function testFromStr(str) {
    const arr = Array.from(str);
    return [arr, Array.isArray(arr)];
}

export function testFromMap(str) {
    return Array.from(str, Number);
}

export function testNextIntegrity(str) {
    const iter = str[Symbol.iterator]();
    const result1 = iter.next();
    return ["value" in result1, "done" in result1, result1.value, result1.done];
}

export function testNextIgnoreParams(str) {
    const iter = str[Symbol.iterator]();
    return [iter.next("ignored").value, iter.next("also ignored").value];
}

export function testNextLazyConsume(str) {
    const iter = str[Symbol.iterator]();
    const first = iter.next();
    const second = iter.next();
    return [first.value, second.value, first.done, second.done];
}

export function testIterReturn(str) {
    const iter = str[Symbol.iterator]();
    return typeof iter.return === "function";
}

export function testIterPremature(str) {
    const iter = str[Symbol.iterator]();
    iter.next();

    let retObj;
    if (iter.return) {
        retObj = iter.return();
    }

    const afterObj = iter.next();
    return [retObj ? retObj.done : false, retObj ? retObj.value : undefined, afterObj.done, afterObj.value];
}

export function testIterThrow(str) {
    const iter = str[Symbol.iterator]();
    return typeof iter.throw;
}

export function testIterExhausted(str) {
    const iter = str[Symbol.iterator]();
    const n1 = iter.next();
    const n2 = iter.next();
    const n3 = iter.next();
    const n4 = iter.next();
    return [n1.done, n2.done, n3.done, n4.done, n3.value, n4.value];
}

export function testIterNoReset(str) {
    const iter1 = str[Symbol.iterator]();
    const v1 = iter1.next().value;
    const v2 = iter1.next().value;

    const iter2 = str[Symbol.iterator]();
    const v1b = iter2.next().value;
    return [v1, v2, v1b];
}

export function testModifyNext(str) {
    const iter = str[Symbol.iterator]();
    iter.next = function () {
        return { value: "X", done: false };
    };
    const res = iter.next();
    return [res.value, res.done];
}

export function testStringObjMutation() {
    const strObj = new String("hello");
    const iter = strObj[Symbol.iterator]();
    try {
        strObj[0] = "H";
    } catch (e) {
        
    }
    const res = iter.next();
    return res.value;
}

export function testIterCallTypeErrorNonString() {
    try {
        return (String.prototype[Symbol.iterator].call(123), false);
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testIterNumber() {
    const iter = String.prototype[Symbol.iterator].call(123);
    return [iter.next().value, iter.next().value, iter.next().value];
}

export function testIterCallTypeErrorNull() {
    try {
        return (String.prototype[Symbol.iterator].call(null), false);
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testIterCallTypeErrorUndef() {
    try {
        return (String.prototype[Symbol.iterator].call(undefined), false);
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testStringLoopToArray(str) {
    const result = [];
    for (const char of str) {
        result.push(char);
    }
    return result;
}

export function testStringForOfCount(str) {
    let count = 0;
    for (const char of str) {
        count++;
    }
    return count;
}

export function testStringForOfWithBreak(str) {
    const result = [];
    for (const char of str) {
        if (char === " ") break;
        result.push(char);
    }
    return result;
}

export function testStringForOfWithContinue(str) {
    const result = [];
    for (const char of str) {
        if (char >= "0" && char <= "9") continue;
        result.push(char);
    }
    return result;
}

export function testFreqLR(str) {
    const freq = {};
    for (const char of str) {
        freq[char] = (freq[char] || 0) + 1;
    }
    return [freq["l"] || 0, freq["o"] || 0];
}

export function testUniqueHello(str) {
    const unique = Array.from(new Set(str));
    const hasH = unique.includes("h");
    const hasE = unique.includes("e");
    const hasL = unique.includes("l");
    const hasO = unique.includes("o");
    return [unique.length, hasH, hasE, hasL, hasO];
}

export function testReverseJoin(str) {
    return [...str].reverse().join("");
}

export function testUpperJoin(str) {
    return [...str].map((c) => c.toUpperCase()).join("");
}
