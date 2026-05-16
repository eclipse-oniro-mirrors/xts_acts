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
export function testNumberConversion() {
    const str ="123 Hello"
    return str.startsWith(123);
}

export function testBooleanConversion() {
    const str ="true story"
    return str.startsWith(true);
}

export function testUndefinedConversion() {
    const str ="undefined value"
    return str.startsWith(undefined);
}

export function testNullConversion() {
    const str ="null pointer"
    return str.startsWith(null);
}

export function testObjectConversion() {
    const str = "[object Object]";
    const obj = {};
    return str.startsWith(obj);
}

export function testArrayConversion() {
    const str = "1,2,3";
    return str.startsWith([1, 2, 3]);
}

export function testRegExpException() {
    const str = "Hello World";
    try {
        str.startsWith(/Hello/);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testPositionStringNumber() {
    const str = "Hello World";
    return str.startsWith("World", "6");
}

export function testPositionNull() {
    const str = "Hello World";
    return str.startsWith("Hello", null);
}

export function testRegexError() {
    const str = "Hello World";
    try {
        str.startsWith(/Hello/);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testRegexFlagsError() {
    const str = "Hello World";
    try {
        str.startsWith(/hello/i);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testRegExpObjectError() {
    const str = "Hello World";
    const regex = new RegExp("Hello");
    try {
        str.startsWith(regex);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testNullThisError() {
    try {
        String.prototype.startsWith.call(null, "test");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testUndefinedThisError() {
    try {
        String.prototype.startsWith.call(undefined, "test");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testToStringError() {
    const str = "test";
    const obj = {
        toString() {
            throw new Error("toString error");
        }
    };
    try {
        str.startsWith(obj);
        return "no error";
    } catch (e) {
        return e.message;
    }
}

export function testDynamicTemplateString() {
    const str = "Hello World";
    const name = "World";

    return [
        str.startsWith(`Hello ${name}`, 0),
        str.startsWith(`Hello ${name}`)
    ];
}

export function testStrictThis() {
    "use strict";
    function test() {
        return this?.startsWith?.("H");
    }
    return test() === undefined;
}

export function testCall() {
    const str = "Hello World";
    return String.prototype.startsWith.call(str, "Hello");
}

export function testApply() {
    const str = "Hello World";
    return String.prototype.startsWith.apply(str, ["Hello"]);
}

export function testBind() {
    const str = "Hello World";
    const boundStartsWith = String.prototype.startsWith.bind(str);
    return boundStartsWith("Hello");
}

export function testArrayObjError() {
    const arr = ["H", "e", "l", "l", "o"];
    try {
        Array.prototype.startsWith.call(arr, "H");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function testCustomObj() {
    const obj = {
        toString() {
            return "Hello World";
        }
    };
    return String.prototype.startsWith.call(obj, "Hello");
}

export function testIterator() {
    const str = "Hello World";
    const chars = [...str];
    return str.startsWith(chars[0]);
}

export function testProtoChain() {
    const str = "Hello";
    const strObj = new String(str);
    return [
        str.hasOwnProperty("startsWith"),
        String.prototype.hasOwnProperty("startsWith"),
        "startsWith" in strObj
    ];
}

export function testModifyProto() {
    const original = String.prototype.startsWith;
    String.prototype.startsWith = function(search) {
        return original.call(this, search);
    };
    const str = "Hello";
    const res = str.startsWith("H");
    String.prototype.startsWith = original;
    return res;
}

export function testFrozen() {
    const str = Object.freeze("Hello World");
    return str.startsWith("Hello");
}

export function testSealed() {
    const str = Object.seal("Hello World");
    return str.startsWith("Hello");
}

export function testProxy() {
    const str = "Hello World";
    const proxy = new Proxy(new String(str), {
        get(target, prop) {
            if (prop === "startsWith") {
                return target.startsWith.bind(target);
            }
            return target[prop];
        }
    });
    return proxy.startsWith("Hello");
}


export function testStartsWithCrossContext() {
    const primitiveStr = "Hello World";
    const stringObj = new String("Hello World");
    const jsonStr = JSON.parse('"Hello World"');

    return [
        primitiveStr.startsWith("Hello"),
        stringObj.startsWith("Hello"),
        String.prototype.startsWith.call(stringObj, "Hello"),
        jsonStr.startsWith("Hello")
    ];
}