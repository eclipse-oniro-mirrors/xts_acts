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
export function testEmptyChars() {
    const str = new String("test");
    let result=str.hasOwnProperty("valueOf");
    let result2=String.prototype.hasOwnProperty("valueOf");
    return [result,result2];
}
export function testLookupFlow() {
    const str = new String("test");
    let result=(str.valueOf === String.prototype.valueOf);
    let result2=(String.prototype.valueOf === Object.prototype.valueOf);
    return [result,result2];
}
export function testImplicitCall() {
    const strObj = new String("10");
    const result = strObj * 2;
    return result;
}
export function testInvokeValue() {
    function tag(strings, ...values) {
        return strings[0] + values[0].valueOf();
    }
    const strObj = new String("world");
    const result = tag`Hello ${strObj}`;
    return result;
}
export function testObjProp() {
    const strObj = new String("key");
    const obj = { [strObj]: "value" };
    let result=obj.key;
    return result;
}
export function testCallObj() {
    const str = new String("test");
    const result = String.prototype.valueOf.call(str);
    return result;
}
export function testApplyObj() {
    const str = new String("test");
    const result = String.prototype.valueOf.apply(str);
    return result;
}
export function testBindObj() {
    const str = new String("test");
    const boundValueOf = String.prototype.valueOf.bind(str);
    const result = boundValueOf();
    return result;
}
export function testPrimitive() {
    const result = String.prototype.valueOf.call("hello");
    return result;
}
export function testCallValue() {
    const strObj = new String("world");
    const result = String.prototype.valueOf.call(strObj);
    return result;
}
export function testWithParams() {
    const str = new String("test");
    const result = str.valueOf("extra", "params");
    return result;
}
export function testFrozenObj() {
    const str = new String("frozen");
    Object.freeze(str);
    const result = str.valueOf();
    return result;
}
export function testSealedObj() {
    const str = new String("sealed");
    Object.seal(str);
    const result = str.valueOf();
    return result;
}
export function testAfterValue() {
    const str = new String("test");
    str.customProp = "custom";
    const result = str.valueOf();
    const temp = result.customProp;
    return [result,temp];
}
export function testPrimitiveStr() {
    const result = String.prototype.valueOf.call("test");
    return result;
}
export function testAfterSymbol() {
    const sym = Symbol("custom");
    const str = new String("test");
    str[sym] = "symbol value";
    const result = str.valueOf();
    return [result,result[sym]];
}
export function testAfterAccessor() {
    const str = new String("test");
    Object.defineProperty(str, 'custom', {
        get() {
            return 'custom value';
        },
        set(val) {
            console.log('setting:', val);
        }
    });
    const result = str.valueOf();
    return result;
}
export function testValidateInput(input) {
    const strObj = new String(input);
    const value = strObj.valueOf();
    return value.length > 0 && value.trim() === value;
}
export function testCleanData(data) {
    const strObj = new String(data);
    return strObj.valueOf().trim().toLowerCase();
}
export function testConcat(...args) {
    return args.map(arg => {
        if (arg instanceof String) {
            return arg.valueOf();
        }
        return String(arg);
    }).join("");
}
export function testCompareStrings(str1, str2) {
    const val1 = str1 instanceof String ? str1.valueOf() : str1;
    const val2 = str2 instanceof String ? str2.valueOf() : str2;
    return val1 === val2;
}
export function testSerialize(obj) {
    if (obj instanceof String) {
        return { type: "String", value: obj.valueOf() };
    }
    return obj;
}
export function testDeepClone(obj) {
    if (obj instanceof String) {
        return new String(obj.valueOf());
    }
    return obj;
}
export function testUniqueStrings(arr) {
    const seen = new Set();
    return arr.filter(item => {
        const value = item instanceof String ? item.valueOf() : item;
        if (seen.has(value)) {
            return false;
        }
        seen.add(value);
        return true;
    });
}
export function testPrimitiveOne() {
    const result = String.prototype.valueOf.call("primitive");
    return result;
}
export function testCallNull() {
    let error1, error2;
    try {
        String.prototype.valueOf.call(null);
    } catch (e) {
        error1 = e;
    }
    try {
        String.prototype.valueOf.call(undefined);
    } catch (e) {
        error2 = e;
    }
    return [error1,error2];
}
export function testCallString(value) {
    try {
        const result = String.prototype.valueOf.call(value);
        return { success: true, result, type: typeof result };
    } catch (e) {
        return { success: false, error: e };
    }
}
export function testObjBase() {
    const obj = {
        valueOf() {
            return "from valueOf";
        }
    };
    return obj;
}
export function testObjPrim() {
    const obj = {
        valueOf() {
            return "from valueOf";
        },
        [Symbol.toPrimitive](hint) {
            return `from toPrimitive, hint: ${hint}`;
        }
    };
    return obj;
}
export function testSymbol() {
    const str = new String("test");
    const result=str[Symbol.toPrimitive];
    return result;

    }
export
    class MyStringLike {
    constructor(value) {
        this.value = value;
    }
    valueOf() {
        return this.value;
    }
    toString() {
        return this.value;
    }
}
export class MyStringLike2 {
    constructor(value) {
        this.value = value;
    }
    [Symbol.toPrimitive](hint) {
        if (hint === "string") {
            return this.value; // string hint：返回原始字符串值
        }
        if (hint === "number") {
            return Number(this.value); // number hint：返回数值类型值
        }
        return this.value; // default hint：默认返回字符串值
    }
}
export function testObjPair() {
    const obj = {
        valueOf() {
            return "valueOf";
        },
        toString() {
            return "toString";
        }
    };
    return obj;
}
export function testObjToStr() {
const obj = {
    valueOf() {
        return {};
    },
    toString() {
        return "toString";
    }
};
return obj;
}
export function testObjThrow() {
    const obj = {
        valueOf() {
            return {};
        },
        toString() {
            return {};
        }
    };
    return obj;
}
export function testObjCaseA() {
    const obj = {
        valueOf() {
            console.log("valueOf called");
            return 42;
        },
        toString() {
            console.log("toString called");
            return "100";
        }
    };
    return obj;
}
export function testObjCaseB() {
    const obj = {
        valueOf() {
            console.log("valueOf called");
            return 42;
        },
        toString() {
            console.log("toString called");
            return "100";
        }
    };
    return obj;
}
export function testObjCaseC() {
    const obj = {
        valueOf() {
            console.log("valueOf called");
            return 42;
        },
        toString() {
            console.log("toString called");
            return "100";
        }
    };
    return obj;
}

export function testReflectApply() {
    const str = new String("test");
    return Reflect.apply(String.prototype.valueOf, str, []);
}

export function testApplyEqual() {
    const str = new String("test");
    const result1 = Reflect.apply(String.prototype.valueOf, str, []);
    const result2 = String.prototype.valueOf.apply(str, []);
    return [result1, result2];
}

export function testReflectObj() {
    const str = new String("test");
    const proxy = new Proxy(str, {});
    const result = String(proxy.valueOf());
    return result;
}

export function testProxyType() {
    const str = new String("test");
    const proxy = new Proxy(str, {
        get(target, prop) {
            if (prop === "valueOf") {
                console.log("valueOf accessed");
            }
            return Reflect.get(target, prop);
        }
    });

    const valueOfMethod = proxy.valueOf;
    console.log(typeof valueOfMethod);
    return typeof valueOfMethod;
}

export function testProxyApply() {
    const str = new String("test");
    const valueOfProxy = new Proxy(str.valueOf, {
        apply(target, thisArg, args) {
            console.log("valueOf called");
            return Reflect.apply(target, thisArg, args);
        }
    });
    const result = valueOfProxy.call(str);
    return result;
}

export function testProxyOverride() {
    const str = new String("test");
    const proxy = new Proxy(str, {
        get(target, prop) {
            if (prop === "valueOf") {
                return function() {
                    return "modified: " + target.valueOf();
                };
            }
            return Reflect.get(target, prop);
        }
    });
    const result = proxy.valueOf();
    return result;
}

export function testValueDesc() {
    const str = new String("test");
    const desc = Object.getOwnPropertyDescriptor(String.prototype, "valueOf");
    if (!desc) {
        return [false, false];
    }
    console.log(str.valueOf());
    const writable = desc.writable === true;
    const configurable = desc.configurable === true;
    return [writable, configurable];
}

export function testFrozenValue() {
    const str = new String("test");
    Object.defineProperty(str, "valueOf", {
        value: function() {
            return "frozen valueOf";
        },
        writable: false,
        configurable: false
    });
    const result = str.valueOf();
    return result;
}

export function testDeleteFallback() {
    const str = new String("test");
    str.valueOf = function() {
        return "custom valueOf";
    };
    const customResult = str.valueOf();
    delete str.valueOf;
    const fallbackResult = str.valueOf();
    return [customResult, fallbackResult];
}

export function testCustomPropValueOf() {
    const str = new String("test");
    str.customProp = "custom";
    const result = str.valueOf();
    const hasCustom = Reflect.has(Object(result), "customProp");
    return [result, hasCustom];
}

export function testLoopValueOf() {
    const str = new String("test");
    const results = [];
    for (let i = 0; i < 5; i++) {
        results.push(str.valueOf());
    }
    return results.every(r => r === "test");
}

export function testCompareTwoStrings() {
    const str1 = new String("test");
    const str2 = new String("test");
    const result1 = str1.valueOf() === str2.valueOf();
    const result2 = str1.valueOf() === "test";
    return [result1, result2];
}

export function testNullValueOfThrow() {
    try {
        String.prototype.valueOf.call(null);
        return [false, ""];
    } catch (e) {
        return [e instanceof TypeError, e.name];
    }
}

export function testUndefValueOfThrow() {
    try {
        String.prototype.valueOf.call(undefined);
        return [false, ""];
    } catch (e) {
        return [e instanceof TypeError, e.name];
    }
}

export function testStrictNullMsg() {
    "use strict";
    try {
        String.prototype.valueOf.call(null);
        return [false, ""];
    } catch (e) {
        return [e instanceof TypeError, e.message];
    }
}

export function testNumValueOfThrow() {
    const num = 123;
    try {
        String.prototype.valueOf.call(num);
        return [false, ""];
    } catch (e) {
        return [e instanceof TypeError, e.name];
    }
}

export function testBoolValueOfThrow() {
    const bool = true;
    try {
        String.prototype.valueOf.call(bool);
        return [false, ""];
    } catch (e) {
        return [e instanceof TypeError, e.name];
    }
}

export function testPlainObjThrow() {
    const obj = { key: "value" };
    try {
        String.prototype.valueOf.call(obj);
        return [false, ""];
    } catch (e) {
        return [e instanceof TypeError, e.name];
    }
}

export function testArrThrow() {
    const arr = [1, 2, 3];
    try {
        String.prototype.valueOf.call(arr);
        return [false, ""];
    } catch (e) {
        return [e instanceof TypeError, e.name];
    }
}

export function testInvalidValueOf() {
    const invalidValues = [null, undefined, 123, true, {}, []];
    for (let i = 0; i < invalidValues.length; i++) {
        const value = invalidValues[i];
        try {
            String.prototype.valueOf.call(value);
            return false;
        } catch (e) {
            if (!(e instanceof TypeError)) {
                return false;
            }
        }
    }
    return true;
}

export function testStrObjProto() {
    const str = new String("test");
    const obj = {};
    return [
        str.valueOf() === "test",
        str.valueOf() === str,
        obj.valueOf() === obj
    ];
}

export function testProtoValueRef() {
    const str = new String("test");
    return [
        str.valueOf === String.prototype.valueOf,
        str.valueOf === Object.prototype.valueOf,
        String.prototype.valueOf !== Object.prototype.valueOf
    ];
}

export function testValueOfOwn() {
    const str = new String("test");
    return [
        str.hasOwnProperty("valueOf"),
        String.prototype.hasOwnProperty("valueOf"),
        Object.prototype.hasOwnProperty("valueOf")
    ];
}

export function testDeleteStrValueOf() {
    const originalValueOf = String.prototype.valueOf;
    try {
        delete String.prototype.valueOf;
        const str = new String("test");
        const result = str.valueOf();
        return result === str;
    } finally {
        String.prototype.valueOf = originalValueOf;
    }
}

export function testInstanceValueOf() {
    const str = new String("test");
    str.valueOf = function() {
        return "instance valueOf";
    };
    return [str.valueOf(), str.hasOwnProperty("valueOf")];
}

export function testProtoWrap() {
    const originalValueOf = String.prototype.valueOf;
    try {
        String.prototype.valueOf = function() {
            return "overridden: " + originalValueOf.call(this);
        };
        const str = new String("test");
        return str.valueOf();
    } finally {
        String.prototype.valueOf = originalValueOf;
    }
}

export class MyString extends String {
    valueOf() {
        const original = super.valueOf();
        return `[${original}]`;
    }
}

export function testMyStringValueOf() {
    const myStr = new MyString("test");
    return myStr.valueOf();
}

export function testJsonObjWrap() {
    const obj = {
        name: new String("John"),
        age: 30
    };
    return JSON.stringify(obj);
}

export function testJsonArrWrap() {
    const arr = [new String("a"), new String("b"), new String("c")];
    return JSON.stringify(arr);
}

export function testStrToJson() {
    const str = new String("test");
    str.toJSON = function() {
        return "custom json";
    };
    return JSON.stringify(str);
}

export function testObjToJsonValueOf() {
    let toJsonCalled = false;
    let valueOfCalled = false;
    const obj = {
        value: new String("test"),
        toJSON() {
            toJsonCalled = true;
            return this.value.valueOf();
        }
    };
    obj.value.valueOf = function() {
        valueOfCalled = true;
        return "test";
    };
    const json = JSON.stringify(obj);
    return [json, toJsonCalled, valueOfCalled];
}

export function testCircularStrJson() {
    const str = new String("test");
    str.self = str;
    try {
        const json = JSON.stringify(str);
        return [json, true];
    } catch (e) {
        return [e.message, false];
    }
}

export function testCircularObjJson() {
    const obj = { name: new String("test") };
    obj.name.parent = obj;
    try {
        const json = JSON.stringify(obj);
        return [json, true];
    } catch (e) {
        return [e.message, false];
    }
}

export function testCircularObjReplacer() {
    const obj = { name: new String("test") };
    obj.name.parent = obj;
    const seen = new WeakSet();
    const json = JSON.stringify(obj, (key, value) => {
        if (typeof value === "object" && value !== null) {
            if (seen.has(value)) {
                return "[Circular]";
            }
            seen.add(value);
        }
        return value;
    });
    return json;
}

export function testJsonValueOfOverride() {
    const str = new String("test");
    const originalValueOf = str.valueOf;
    str.valueOf = function() {
        return "modified: " + originalValueOf.call(this);
    };
    return JSON.stringify({ value: str });
}

export function testJsonValueOfObject() {
    const str = new String("test");
    str.valueOf = function() {
        return { custom: "object" };
    };
    return JSON.stringify({ value: str });
}

export function testJsonValueOfUndefined() {
    const str = new String("test");
    str.valueOf = function() {
        return undefined;
    };
    return JSON.stringify({ value: str });
}
