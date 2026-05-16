/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

'use strict'

/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

/**
 * 测试点1：基础属性访问（目标对象直接有属性）
 * 说明：验证 Proxy 正确拦截并使用 Reflect.get 获取目标属性
 */
export function testBasicProperty() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点2：原型链属性访问（目标对象通过原型链继承属性）
 * 说明：验证 Reflect.get 正确处理原型链，而非仅限目标对象
 */
export function testPrototypeChain() {
    const proto = { a: 1 };
    const target = Object.create(proto);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点3：Symbol 属性访问（特殊键名场景）
 * 说明：验证 Symbol 属性也能被 Proxy 和 Reflect 正确处理
 */
export function testSymbolProperty() {
    const key = Symbol('test');
    const target = { [key]: 'value' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === 'value';
}

/**
 * 测试点4: 访问器属性（目标对象有 getter）
 * 说明：验证 Reflect.get 正确调用 getter
 */
export function testGetterProperty() {
    const target = {
        get a() {
            return 1;
        }
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点5: 不可枚举属性（目标对象有不可枚举属性）
 * 说明：验证 Reflect.get 能访问不可枚举属性
 */
export function testNonEnumerableProperty() {
    const target = {};
    Object.defineProperty(target, 'a', {
        value: 1,
        enumerable: false
    });
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点6: 不可配置属性（目标对象有不可配置属性）
 * 说明：验证 Reflect.get 能访问不可配置属性
 */
export function testNonConfigurableProperty() {
    const target = {};
    Object.defineProperty(target, 'a', {
        value: 1,
        configurable: false
    });
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点7: 数字字符串属性（属性名为 '123'）
 * 说明：验证数字字符串键名被正确处理
 */
export function testNumericStringProperty() {
    const target = { '123': 'value' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy['123'] === 'value';
}

/**
 * 测试点8: 特殊字符属性（属性名为 '@test'）
 * 说明：验证特殊字符键名被正确处理
 */
export function testSpecialCharProperty() {
    const target = { '@test': 'value' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy['@test'] === 'value';
}

/**
 * 测试点9: 不存在的属性（返回 undefined）
 * 说明：验证访问不存在属性返回 undefined
 */
export function testNonExistentProperty() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.b === undefined;
}

/**
 * 测试点10: 嵌套代理（二级代理）
 * 说明：验证代理链中 Reflect.get 正确传递
 */
export function testNestedProxy() {
    const target = { a: 1 };
    const proxy1 = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    const proxy2 = new Proxy(proxy1, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy2.a === 1;
}

/**
 * 测试点11: 目标对象有 getter（与测试点4重复但更复杂）
 * 说明：验证嵌套 getter 的正确调用
 */
export function testNestedGetter() {
    const target = {
        get a() {
            return 1;
        },
        get b() {
            return this.a;
        }
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.b === 1;
}

/**
 * 测试点12: 目标对象有 setter（访问属性不触发 setter）
 * 说明：验证 get 陷阱不触发 setter
 */
export function testSetterAccess() {
    let value = null;
    const target = {
        set a(val) {
            value = val;
        },
        get a() {
            return value;
        }
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === null;
}

/**
 * 测试点13: 数组 length 属性
 * 说明：验证数组特殊属性被正确处理
 */
export function testArrayLength() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.length === 3;
}

/**
 * 测试点14: constructor 属性（对象内置属性）
 * 说明：验证内置属性被正确获取
 */
export function testConstructorProperty() {
    const target = {};
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.constructor === Object;
}

/**
 * 测试点15: Reflect.get 非对象目标（应抛 TypeError）
 * 说明：验证错误处理（返回 true 表示抛错成功）
 */
export function testReflectNonObject() {
    try {
        Reflect.get(123, 'prop');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点16: 原型链上的 getter
 * 说明：验证原型链 getter 被正确调用
 */
export function testPrototypeGetter() {
    const proto = {
        get a() {
            return 1;
        }
    };
    const target = Object.create(proto);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点17: 目标对象属性与原型同名（优先目标属性）
 * 说明：验证目标对象属性覆盖原型
 */
export function testOverrideInTarget() {
    const proto = { a: 0 };
    const target = { a: 1, b: 2 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点18: 属性值为 undefined
 * 说明：验证 undefined 值被正确获取
 */
export function testUndefinedValue() {
    const target = { a: undefined };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === undefined;
}

/**
 * 测试点19: 属性值为 null
 * 说明：验证 null 值被正确获取
 */
export function testNullValue() {
    const target = { a: null };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === null;
}

/**
 * 测试点20: 代理 get 返回 undefined（显式覆盖）
 * 说明：验证代理陷阱可覆盖属性返回值
 */
export function testProxyOverride() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === 'a') {
                return undefined;
            }
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === undefined;
}

/**
 * 测试点21: Symbol.hasInstance 属性（验证内置Symbol属性的访问）
 * 说明：Reflect.get 正确处理 Symbol 静态属性
 */
export function testSymbolHasInstance() {
    const key = Symbol.hasInstance;
    const target = { [key]: (v) => v instanceof Array };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点22: Symbol.isConcatSpreadable 属性
 * 说明：验证数组扩展操作符的代理支持
 */
export function testSymbolIsConcatSpreadable() {
    const key = Symbol.isConcatSpreadable;
    const target = { [key]: true };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === true;
}

/**
 * 测试点23: Symbol.species 属性
 * 说明：验证类继承时的代理行为
 */
export function testSymbolSpecies() {
    const key = Symbol.species;
    const target = { [key]: Array };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === Array;
}

/**
 * 测试点24: Symbol.match 属性
 * 说明：验证正则表达式匹配的代理支持
 */
export function testSymbolMatch() {
    const key = Symbol.match;
    const target = { [key]: () => true };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点25: Symbol.replace 属性
 * 说明：验证字符串替换的代理支持
 */
export function testSymbolReplace() {
    const key = Symbol.replace;
    const target = { [key]: () => 'replaced' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点26: Symbol.search 属性
 * 说明：验证字符串搜索的代理支持
 */
export function testSymbolSearch() {
    const key = Symbol.search;
    const target = { [key]: () => 0 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点27: Symbol.split 属性
 * 说明：验证字符串分割的代理支持
 */
export function testSymbolSplit() {
    const key = Symbol.split;
    const target = { [key]: () => ['a', 'b'] };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点28: Symbol.asyncIterator 属性
 * 说明：验证异步迭代器的代理支持
 */
export function testSymbolAsyncIterator() {
    const key = Symbol.asyncIterator;
    const target = { [key]: () => ({ next: () => Promise.resolve({ value: 1, done: false }) }) };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点29: Symbol.toStringTag 属性
 * 说明：验证对象标签的代理支持
 */
export function testSymbolToStringTag() {
    const key = Symbol.toStringTag;
    const target = { [key]: 'MyObject' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === 'MyObject';
}

/**
 * 测试点30: 函数的 length 属性（验证内置方法属性）
 * 说明：Reflect.get 正确处理函数的 length
 */
export function testFunctionLength() {
    const target = function () {
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.length === 0;
}

/**
 * 测试点32: 类实例的 constructor 属性
 * 说明：验证类继承链的代理支持
 */
export function testClassInstance() {
    class MyClass {
    }

    const target = new MyClass();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.constructor === MyClass;
}

/**
 * 测试点33: 数组方法 push 的访问
 * 说明：代理正确获取数组方法
 */
export function testArrayMethodPush() {
    const target = [];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.push === 'function';
}

/**
 * 测试点34: Object.prototype.hasOwnProperty 方法
 * 说明：验证内置方法的代理支持
 */
export function testObjectMethodHasOwnProperty() {
    const target = {};
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.hasOwnProperty === 'function';
}

/**
 * 测试点35: Date.prototype.toString 方法
 * 说明：验证日期对象方法的代理支持
 */
export function testDatePrototype() {
    const target = new Date();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toString === 'function';
}

/**
 * 测试点36: RegExp.prototype.source 属性
 * 说明：验证正则表达式属性的代理支持
 */
export function testRegExpSource() {
    const target = /abc/;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.source === 'abc';
}

/**
 * 测试点37: Error.prototype.name 属性
 * 说明：验证错误对象属性的代理支持
 */
export function testErrorName() {
    const target = new Error('test');
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.name === 'Error';
}

/**
 * 测试点38: Map.prototype.size 属性
 * 说明：验证集合对象属性的代理支持
 */
export function testMapSize() {
    const target = new Map();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.size === 0;
}

/**
 * 测试点39: Set.prototype.size 属性
 * 说明：验证集合对象属性的代理支持
 */
export function testSetSize() {
    const target = new Set();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.size === 0;
}

/**
 * 测试点40: 代理陷阱中修改目标对象（关键陷阱行为）
 * 说明：get 陷阱修改目标后，后续访问生效
 */
export function testProxyModifyTarget() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === 'a') {
                target.a = 2;
            }
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 2;
}

/**
 * 测试点41: 三重嵌套代理（深度代理链）
 * 说明：验证多层代理链的 Reflect.get 传递
 */
export function testTripleNestedProxy() {
    const target = { a: 1 };
    const p1 = new Proxy(target, { get: (t, p) => Reflect.get(t, p) });
    const p2 = new Proxy(p1, { get: (t, p) => Reflect.get(t, p) });
    const p3 = new Proxy(p2, { get: (t, p) => Reflect.get(t, p) });
    return p3.a === 1;
}

/**
 * 测试点42: 代理访问 Array.prototype
 * 说明：验证代理正确获取原型链
 */
export function testProxyWithArrayPrototype() {
    const target = [];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === Array.prototype;
}

/**
 * 测试点43: 代理访问 Object.prototype
 * 说明：验证对象原型链的代理支持
 */
export function testProxyWithObjectPrototype() {
    const target = {};
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === Object.prototype;
}

/**
 * 测试点44: 代理访问 Function.prototype
 * 说明：验证函数原型的代理支持
 */
export function testProxyWithFunctionPrototype() {
    const target = function () {
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === Function.prototype;
}

/**
 * 测试点45: 代理访问 RegExp.prototype
 * 说明：验证正则表达式原型的代理支持
 */
export function testProxyWithRegExpPrototype() {
    const target = /a/;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === RegExp.prototype;
}

/**
 * 测试点46: 代理访问 Error.prototype
 * 说明：验证错误对象原型的代理支持
 */
export function testProxyWithErrorPrototype() {
    const target = new Error();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === Error.prototype;
}

/**
 * 测试点47: 代理访问 Map.prototype
 * 说明：验证集合对象原型的代理支持
 */
export function testProxyWithMapPrototype() {
    const target = new Map();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === Map.prototype;
}

/**
 * 测试点48: 代理访问 Set.prototype
 * 说明：验证集合对象原型的代理支持
 */
export function testProxyWithSetPrototype() {
    const target = new Set();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === Set.prototype;
}

/**
 * 测试点50: 代理访问 globalThis
 * 说明：验证全局对象的代理支持
 */
export function testProxyWithGlobalThis() {
    const target = globalThis;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.toString() === globalThis.toString();
}

/**
 * 测试点52: TypedArray 的 length 属性（如 Uint8Array）
 * 说明：验证数组视图对象的属性代理
 */
export function testTypedArrayLength() {
    const target = new Uint8Array(5);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.length === 5;
}

/**
 * 测试点53: Promise 的 then 方法（核心异步操作）
 * 说明：验证 Promise 对象方法的代理支持
 */
export function testPromiseThen() {
    const target = new Promise(() => {
    });
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.then === 'function';
}

/**
 * 测试点54: WeakRef 的 deref 方法（ES2021+）
 * 说明：验证弱引用对象的代理支持
 */
export function testWeakRefDeref() {
    const target = new WeakRef({});
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.deref === 'function';
}

/**
 * 测试点55: 代理代理自身（递归代理链）
 * 说明：验证代理对象作为目标对象的嵌套行为
 */
export function testRecursiveProxy() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    const recursiveProxy = new Proxy(proxy, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return recursiveProxy.a === 1;
}

/**
 * 测试点56: get 陷阱返回 NaN（数字特殊值）
 * 说明：验证代理能正确处理 NaN 值
 */
export function testNaNValue() {
    const target = { a: NaN };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return Number.isNaN(proxy.a);
}

/**
 * 测试点57: get 陷阱返回 Infinity（数字特殊值）
 * 说明：验证代理能正确处理 Infinity
 */
export function testInfinityValue() {
    const target = { a: Infinity };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === Infinity;
}

/**
 * 测试点58: Symbol.toPrimitive 属性（对象转换）
 * 说明：验证代理正确处理对象转换的 Symbol
 */
export function testSymbolToPrimitive() {
    const key = Symbol.toPrimitive;
    const target = { [key]: () => 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点59: valueOf 方法（对象转换）
 * 说明：验证代理正确获取 valueOf 方法
 */
export function testValueOfMethod() {
    const target = { valueOf: () => 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.valueOf === 'function';
}

/**
 * 测试点60: ArrayBuffer 的 byteLength 属性
 * 说明：验证二进制缓冲区对象的代理支持
 */
export function testArrayBufferByteLength() {
    const target = new ArrayBuffer(10);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.byteLength === 10;
}

/**
 * 测试点61: DataView 的 getUint8 方法
 * 说明：验证数据视图对象的代理支持
 */
export function testDataViewGetUint8() {
    const buffer = new ArrayBuffer(1);
    const target = new DataView(buffer);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.getUint8 === 'function';
}

/**
 * 测试点62: Intl.DateTimeFormat 的 format 方法
 * 说明：验证国际化 API 的代理支持
 */
export function testIntlDateTimeFormat() {
    const target = new Intl.DateTimeFormat();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.format === 'function';
}

/**
 * 测试点64: 访问 __proto__ 属性（原型链访问）
 * 说明：验证代理正确处理 __proto__ 属性
 */
export function testGetProtoProperty() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.__proto__ === Object.prototype;
}

/**
 * 测试点65: get 陷阱中修改目标对象的其他属性
 * 说明：验证代理陷阱中修改目标对象的副作用
 */
export function testProxyModifyTarget2() {
    const target = { a: 1, b: 2 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === 'a') {
                target.b = 3;
            }
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1 && target.b === 3;
}

/**
 * 测试点66: 获取目标对象的自有属性（不触发原型链）
 * 说明：验证代理正确区分自有属性和继承属性
 */
export function testProxyGetOwn() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return Object.prototype.hasOwnProperty.call(proxy, 'a') === true;
}

/**
 * 测试点67: 获取非自有属性（触发原型链）
 * 说明：验证代理正确处理原型链属性
 */
export function testProxyGetInherited() {
    const proto = { a: 1 };
    const target = Object.create(proto);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return Object.prototype.hasOwnProperty.call(proxy, 'a') === false;
}

/**
 * 测试点69: 类实例的方法调用（自定义类）
 * 说明：验证代理类实例的代理行为
 */
export function testClassInstanceMethod() {
    class MyClass {
        method() {
            return 1;
        }
    }

    const target = new MyClass();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.method() === 1;
}

/**
 * 测试点70: 日期对象的 toLocaleString 方法
 * 说明：验证代理日期对象的方法支持
 */
export function testDateInstanceLocaleString() {
    const target = new Date();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toLocaleString === 'function';
}

/**
 * 测试点71: 代理访问 Symbol.iterator（与测试点24重复？不，测试点24是 Symbol.match）
 * 说明：验证 Symbol.iterator 的代理支持（独立场景）
 */
export function testSymbolIterator() {
    const key = Symbol.iterator;
    const target = { [key]: () => ({ next: () => ({ value: 1, done: false }) }) };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点72: 代理访问 Proxy.revocable 的 revoke 方法
 * 说明：验证代理对 Proxy 本身的代理支持
 */
export function testProxyRevocableRevoke() {
    const { proxy, revoke } = Proxy.revocable({}, {});
    const proxyProxy = new Proxy(proxy, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxyProxy.revoke === 'undefined';
}

/**
 * 测试点76: get 陷阱中访问 Symbol.for 的结果
 * 说明：验证代理与 Symbol 全局注册的交互
 */
export function testSymbolForProxy() {
    const key = Symbol.for('test');
    const target = { [key]: 'value' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === 'value';
}

/**
 * 测试点77: 代理访问 Error.stack 属性
 * 说明：验证错误对象的代理支持
 */
export function testErrorStack() {
    const target = new Error('test');
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.stack === 'string';
}

/**
 * 测试点78: 代理访问 Array.prototype.filter 方法
 * 说明：验证数组方法的代理支持（非测试点33的 push）
 */
export function testArrayFilter() {
    const target = [];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.filter === 'function';
}

/**
 * 测试点79: 代理访问 Object.prototype.hasOwnProperty
 * 说明：验证内置方法的代理（独立于测试点34）
 */
export function testObjectHasOwnProperty() {
    const target = {};
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.hasOwnProperty === 'function';
}

/**
 * 测试点80: 代理访问 Promise.all 方法
 * 说明：验证 Promise 静态方法的代理支持
 */
export function testPromiseAll() {
    const target = Promise;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.all === 'function';
}

/**
 * 测试点81: Promise.any 方法（ES2021+）
 * 说明：验证 Promise 静态方法的代理支持
 */
export function testPromiseAny() {
    const target = Promise;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.any === 'function';
}

/**
 * 测试点82: Array.prototype.at 方法（ES2022+）
 * 说明：验证数组方法的代理支持（非测试点33的push）
 */
export function testArrayPrototypeAt() {
    const target = Array.prototype;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.at === 'function';
}

/**
 * 测试点83: BigInt.prototype.toLocaleString（ES2021+）
 * 说明：验证 BigInt 方法的代理支持
 */
export function testBigIntLocaleString() {
    const target = BigInt.prototype;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toLocaleString === 'function';
}

/**
 * 测试点85: Intl.RelativeTimeFormat（ES2023+）
 * 说明：验证国际化 API 的代理支持
 */
export function testIntlRelativeTimeFormat() {
    const target = Intl.RelativeTimeFormat;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy === 'function';
}

/**
 * 测试点86: Array.prototype.findLast（ES2023+）
 * 说明：验证数组方法的代理支持（新方法）
 */
export function testArrayFindLast() {
    const target = [];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.findLast === 'function';
}

/**
 * 测试点87: Array.prototype.findLastIndex（ES2023+）
 * 说明：验证数组方法的代理支持（新方法）
 */
export function testArrayFindLastIndex() {
    const target = [];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.findLastIndex === 'function';
}

/**
 * 测试点88: Array.prototype.toReversed（ES2023+）
 * 说明：验证数组方法的代理支持（新方法）
 */
export function testArrayToReversed() {
    const target = [1, 2];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toReversed === 'function';
}

/**
 * 测试点89: Array.prototype.toSorted（ES2023+）
 * 说明：验证数组方法的代理支持（新方法）
 */
export function testArrayToSorted() {
    const target = [3, 1, 2];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toSorted === 'function';
}

/**
 * 测试点90: Array.prototype.toSpliced（ES2023+）
 * 说明：验证数组方法的代理支持（新方法）
 */
export function testArrayToSpliced() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toSpliced === 'function';
}

/**
 * 测试点91: Object.hasOwn（ES2022+）
 * 说明：验证对象方法的代理支持（新静态方法）
 */
export function testObjectHasOwn() {
    const target = Object;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.hasOwn === 'function';
}

/**
 * 测试点98: Error.cause 静态属性（ES2022+）
 * 说明：验证错误对象的代理支持（新静态属性）
 */
export function testErrorCauseStatic() {
    const target = Error;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.cause === 'undefined';
}

/**
 * 测试点99: Error.prototype.cause（ES2022+）
 * 说明：验证错误实例的代理支持（新属性）
 */
export function testErrorCauseInstance() {
    const target = new Error('test');
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.cause === 'undefined';
}

/**
 * 测试点100: Promise.prototype.finally（ES2018）
 * 说明：验证 Promise 方法的代理支持（非测试点33的then）
 */
export function testPromiseFinally() {
    const target = new Promise(() => {
    });
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.finally === 'function';
}

/**
 * 测试点101: Date.prototype.toLocaleDateString（ES2022+）
 * 说明：验证日期方法的代理支持（新方法）
 */
export function testDateLocaleDateString() {
    const target = new Date();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toLocaleDateString === 'function';
}

/**
 * 测试点103: Array.prototype.flatMap（ES2019）
 * 说明：验证数组方法的代理支持（较新方法）
 */
export function testArrayFlatMap() {
    const target = [1, 2];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.flatMap === 'function';
}

/**
 * 测试点104: Array.prototype.reduceRight（ES2009）
 * 说明：验证数组方法的代理支持（经典方法）
 */
export function testArrayReduceRight() {
    const target = [1, 2];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.reduceRight === 'function';
}

/**
 * 测试点105: Object.prototype.toString（核心方法）
 * 说明：验证对象方法的代理支持（基础但关键）
 */
export function testObjectToString() {
    const target = {};
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toString === 'function';
}

/**
 * 测试点106: Map.prototype.clear（集合方法）
 * 说明：验证 Map 的代理支持（非测试点38的size）
 */
export function testMapClear() {
    const target = new Map();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.clear === 'function';
}

/**
 * 测试点107: Set.prototype.clear（集合方法）
 * 说明：验证 Set 的代理支持（非测试点39的size）
 */
export function testSetClear() {
    const target = new Set();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.clear === 'function';
}

/**
 * 测试点110: Promise.allSettled（ES2020）
 * 说明：验证 Promise 静态方法的代理支持
 */
export function testPromiseAllSettled() {
    const target = Promise;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.allSettled === 'function';
}