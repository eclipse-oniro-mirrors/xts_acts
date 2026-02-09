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
 * 测试点1: 普通函数调用（无代理陷阱，直接调用）
 * 说明：目标函数原生调用，代理不拦截
 */
export function testApplyBasic() {
    const target = (...args) => args.reduce((a, b) => a + b, 0);
    const handler = { apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 6;
}

/**
 * 测试点2: 修改thisArg（代理中修改this指向）
 * 说明：将this指向新对象 { value: 10 }
 */
export function testApplyThisArg() {
    const target = function (...args) {
        return this.value + args.reduce((a, b) => a + b, 0);
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, { value: 10 }, args)
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 16;
}

/**
 * 测试点3: 修改参数列表（添加额外参数）
 * 说明：在参数列表末尾添加 10
 */
export function testApplyArgsAppend() {
    const target = (...args) => args.reduce((a, b) => a + b, 0);
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, [...args, 10])
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 16;
}

/**
 * 测试点4: 修改参数列表（移除第一个参数）
 * 说明：移除第一个参数，只保留剩余参数
 */
export function testApplyArgsRemoveFirst() {
    const target = (...args) => args.reduce((a, b) => a + b, 0);
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.slice(1))
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 5;
}

/**
 * 测试点5: 覆盖返回值（固定返回100）
 * 说明：代理直接返回固定值100，忽略原函数
 */
export function testApplyReturnValueOverride() {
    const target = (...args) => args.reduce((a, b) => a + b, 0);
    const handler = {
        apply: (obj, thisArg, args) => 100
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 100;
}

/**
 * 测试点6: 修改参数（第一个参数乘以2）
 * 说明：将第一个参数乘以2后调用原函数
 */
export function testApplyArgsModifyFirst() {
    const target = (...args) => args.reduce((a, b) => a + b, 0);
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, [args[0] * 2, ...args.slice(1)])
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 7;
}

/**
 * 测试点7: 修改thisArg并覆盖返回值
 * 说明：this指向{ value: 20 }，返回固定值100
 */
export function testApplyThisAndReturnValue() {
    const target = function (...args) {
        return this.value + args.reduce((a, b) => a + b, 0);
    };
    const handler = {
        apply: (obj, thisArg, args) => 100
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 100;
}

/**
 * 测试点8: 重置参数列表（替换为固定参数）
 * 说明：参数列表替换为 [1, 2, 3]
 */
export function testApplyArgsReset() {
    const target = (...args) => args.reduce((a, b) => a + b, 0);
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, [1, 2, 3])
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 6;
}

/**
 * 测试点9: 修改返回值（原返回值+10）
 * 说明：调用原函数后，返回值+10
 */
export function testApplyReturnValueModify() {
    const target = (...args) => args.reduce((a, b) => a + b, 0);
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) + 10
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 16;
}

/**
 * 测试点10: 同时修改thisArg和参数（深度组合）
 * 说明：this指向{ value: 30 }，参数乘以2
 */
export function testApplyThisAndArgsModify() {
    const target = function (...args) {
        return this.value + args.reduce((a, b) => a + b, 0);
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, { value: 30 }, args.map(x => x * 2))
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 42;
}

/**
 * 测试点12: 代理Array.prototype.push（覆盖返回值为固定值）
 * 说明：push返回新长度，代理覆盖为100
 */
export function testApplyArrayPushReturnValueOverride() {
    const target = Array.prototype.push;
    const handler = { apply: (obj, thisArg, args) => 100 };
    const proxy = new Proxy(target, handler);
    const arr = [1, 2];
    const result = proxy(arr, 3);
    return result === 100 && arr.length === 2;
}

/**
 * 测试点13: 代理Math.max（参数乘以2）
 * 说明：Math.max(1,2,3) → 代理后参数[2,4,6] → max=6
 */
export function testApplyMathMaxMultiply() {
    const target = Math.max;
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.map(x => x * 2))
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 6;
}

/**
 * 测试点14: 代理Math.max（过滤负数参数）
 * 说明：Math.max(-1,2,3) → 代理过滤后[2,3] → max=3
 */
export function testApplyMathMaxFilterNegative() {
    const target = Math.max;
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.filter(x => x > 0))
    };
    const proxy = new Proxy(target, handler);
    return proxy(-1, 2, 3) === 3;
}

/**
 * 测试点15: 代理函数（thisArg为null）
 * 说明：目标函数依赖this，代理强制this=null
 */
export function testApplyThisArgNull() {
    const target = function () {
        return this ? this.value : 'null';
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, null, args)
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'null';
}

/**
 * 测试点16: 代理函数（参数为undefined处理）
 * 说明：参数为undefined时转为0
 */
export function testApplyArgsUndefinedToZero() {
    const target = function (a, b) {
        return a + (b || 0);
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.map(x => x === undefined ? 0 : x))
    };
    const proxy = new Proxy(target, handler);
    return proxy(undefined, 5) === 5;
}

/**
 * 测试点17: 代理函数（thisArg为undefined）
 * 说明：目标函数处理this，代理强制this=undefined
 */
export function testApplyThisArgUndefined() {
    const target = function () {
        return this ? this.value : 'undefined';
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, undefined, args)
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'undefined';
}

/**
 * 测试点20: 代理函数（返回值转字符串）
 * 说明：函数返回数字，代理转为字符串
 */
export function testApplyReturnValueToString() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => String(Reflect.apply(obj, thisArg, args))
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2) === '3';
}

/**
 * 测试点21: 代理函数（参数转数字）
 * 说明：参数为字符串，代理转为数字
 */
export function testApplyArgsToNumber() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.map(x => Number(x)))
    };
    const proxy = new Proxy(target, handler);
    return proxy('1', '2') === 3;
}

/**
 * 测试点22: 代理函数（参数数量不足补默认值）
 * 说明：函数需2参数，传1个时补0
 */
export function testApplyArgsDefault() {
    const target = function (a, b = 0) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args.length < 2) {
                args = [...args, 0];
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(1) === 1;
}

/**
 * 测试点23: 代理函数（参数数量过多截断）
 * 说明：函数需2参数，传3个时只取前2
 */
export function testApplyArgsTruncate() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.slice(0, 2))
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 3;
}

/**
 * 测试点24: 代理函数（返回值+10）
 * 说明：原返回值+10
 */
export function testApplyReturnValueAddTen() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) + 10
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2) === 13;
}

/**
 * 测试点25: 代理函数（含特定参数覆盖返回值）
 * 说明：当参数含3时返回100
 */
export function testApplyReturnValueOverrideIfContains3() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args.includes(3)) {
                return 100;
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 3) === 100 && proxy(1, 2) === 3;
}

/**
 * 测试点26: 代理函数（thisArg为Proxy对象）
 * 说明：thisArg是代理对象
 */
export function testApplyThisArgProxy() {
    const target = function () {
        return this.value;
    };
    const innerHandler = { get: (obj, prop) => prop === 'value' ? 10 : undefined };
    const innerProxy = new Proxy({}, innerHandler);
    const handler = { apply: (obj, thisArg, args) => Reflect.apply(obj, innerProxy, args) };
    const proxy = new Proxy(target, handler);
    return proxy() === 10;
}

/**
 * 测试点28: 代理函数（递归调用自身）
 * 说明：递归调用代理自身
 */
export function testApplyRecursiveSelfCall() {
    const target = function (a) {
        return a * 2;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args[0] > 1) {
                return Reflect.apply(obj, thisArg, [args[0] - 1]);
            }
            return 1;
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(3) === 4;
}

/**
 * 测试点29: 代理函数（错误安全处理）
 * 说明：参数<0时返回0，避免错误
 */
export function testApplyErrorHandling() {
    const target = function (a) {
        return a * 2;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args[0] < 0) {
                return 0;
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(-1) === 0 && proxy(1) === 2;
}

/**
 * 测试点35: 代理Object.keys（参数过滤）
 * 说明：只返回字符串键
 */
export function testApplyObjectKeysFilterString() {
    const target = Object.keys;
    const handler = {
        apply: (obj, thisArg, args) => {
            const keys = Reflect.apply(obj, thisArg, args);
            return keys.filter(key => typeof key === 'string');
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy({ a: 1, 2: 2 }).length === 2;
}

/**
 * 测试点37: 代理Date.now（覆盖返回值）
 * 说明：固定返回1000000000000
 */
export function testApplyDateNowOverride() {
    const target = Date.now;
    const handler = { apply: (obj, thisArg, args) => 1000000000000 };
    const proxy = new Proxy(target, handler);
    return proxy() === 1000000000000;
}

/**
 * 测试点39: 代理Object.defineProperty（参数增强）
 * 说明：强制属性可写
 */
export function testApplyObjectDefinePropertyEnhance() {
    const target = Object.defineProperty;
    const handler = {
        apply: (obj, thisArg, args) => {
            const desc = args[2] || {};
            desc.writable = true;
            return Reflect.apply(obj, thisArg, [args[0], args[1], desc]);
        }
    };
    const proxy = new Proxy(target, handler);
    const obj = {};
    proxy(obj, 'prop', { value: 10 });
    obj.prop = 20;
    return obj.prop === 20;
}

/**
 * 测试点41: 代理异步函数（Promise结果修改）
 * 说明：确保返回Promise，且结果乘以2
 */
export function testApplyAsyncFunction() {
    const target = async function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args).then(res => res * 2)
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2).then(res => res === 6);
}

/**
 * 测试点42: 代理函数（参数必须为数字）
 * 说明：非数字参数抛出错误，数字参数正常调用
 */
export function testApplyArgsMustBeNumber() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args.some(arg => typeof arg !== 'number')) {
                throw new Error('Arguments must be numbers');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2) === 3;
}

/**
 * 测试点43: 代理函数（调用计数记录）
 * 说明：记录函数调用次数，验证为1次
 */
export function testApplyCallCount() {
    let count = 0;
    const target = function () {
        return 1;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            count++;
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    proxy();
    return count === 1;
}

/**
 * 测试点44: 代理函数（参数升序排序）
 * 说明：参数按升序排序后再调用
 */
export function testApplyArgsSortAscending() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const sorted = [...args].sort((a, b) => a - b);
            return Reflect.apply(obj, thisArg, sorted);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(3, 1) === 4;
}

/**
 * 测试点45: 代理函数（thisArg为数组）
 * 说明：thisArg是数组，函数使用this[0]
 */
export function testApplyThisArgArray() {
    const target = function () {
        return this[0];
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, [1, 2, 3], args)
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 1;
}

/**
 * 测试点46: 代理函数（参数必须为对象）
 * 说明：非对象参数抛出错误，对象参数正常调用
 */
export function testApplyArgsMustBeObject() {
    const target = function (obj) {
        return obj.value;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (typeof args[0] !== 'object' || args[0] === null) {
                throw new Error('Argument must be an object');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy({ value: 10 }) === 10;
}

/**
 * 测试点47: 代理函数（参数缓存机制）
 * 说明：相同参数返回缓存结果
 */
export function testApplyArgsCache() {
    const cache = new Map();
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const key = JSON.stringify(args);
            if (cache.has(key)) {
                return cache.get(key);
            }
            const result = Reflect.apply(obj, thisArg, args);
            cache.set(key, result);
            return result;
        }
    };
    const proxy = new Proxy(target, handler);
    const res1 = proxy(1, 2);
    const res2 = proxy(1, 2);
    return res1 === res2 && res1 === 3;
}

/**
 * 测试点48: 代理函数（错误重试机制）
 * 说明：首次调用抛错，二次调用成功
 */
export function testApplyRetryOnError() {
    let callCount = 0;
    const target = function () {
        callCount++;
        if (callCount === 1) {
            throw new Error('Retry');
        }
        return 1;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            try {
                return Reflect.apply(obj, thisArg, args);
            } catch (e) {
                return Reflect.apply(obj, thisArg, args);
            }
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 1;
}

/**
 * 测试点50: 代理函数（返回值解构提取）
 * 说明：返回对象，代理后提取value属性
 */
export function testApplyReturnValueDestructure() {
    const target = function () {
        return { value: 10 };
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return result.value;
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 10;
}

/**
 * 测试点54: 代理函数（参数数量验证）
 * 说明：参数不足2个时抛出错误
 */
export function testApplyArgsCountValidation() {
    const target = function (a, b) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args.length < 2) {
                throw new Error('Need at least 2 arguments');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2) === 3;
}

/**
 * 测试点55: 代理函数（返回值添加后缀）
 * 说明：返回值添加" - PROXY"后缀
 */
export function testApplyReturnValueAddSuffix() {
    const target = function () {
        return 'result';
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) + ' - PROXY'
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'result - PROXY';
}

/**
 * 测试点56: 代理函数（错误转换为字符串）
 * 说明：捕获错误并返回错误消息
 */
export function testApplyErrorToString() {
    const target = function () {
        throw new Error('Original');
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            try {
                return Reflect.apply(obj, thisArg, args);
            } catch (e) {
                return 'Error: ' + e.message;
            }
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'Error: Original';
}

/**
 * 测试点57: 代理函数（参数转大写）
 * 说明：字符串参数转为大写
 */
export function testApplyArgsToUpperCase() {
    const target = function (s) {
        return s;
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.map(x => x.toUpperCase()))
    };
    const proxy = new Proxy(target, handler);
    return proxy('aBc') === 'ABC';
}

/**
 * 测试点58: 代理Math.min（参数乘以2）
 * 说明：Math.min(1,2,3) → 代理后min(2,4,6)=2
 */
export function testApplyMathMinMultiply() {
    const target = Math.min;
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args.map(x => x * 2))
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2, 3) === 2;
}

/**
 * 测试点59: 代理Object.getOwnPropertyNames（过滤键名）
 * 说明：过滤掉'length'键
 */
export function testApplyObjectGetOwnPropertyNames() {
    const target = Object.getOwnPropertyNames;
    const handler = {
        apply: (obj, thisArg, args) => {
            const keys = Reflect.apply(obj, thisArg, args);
            return keys.filter(key => key !== 'length');
        }
    };
    const proxy = new Proxy(target, handler);
    const obj = { a: 1, b: 2 };
    return proxy(obj).length === 2;
}

/**
 * 测试点62: 代理函数（返回值为Symbol）
 * 说明：返回值强制转为Symbol字符串
 */
export function testApplyReturnValueSymbol() {
    const target = function () {
        return Symbol('test');
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return result.toString();
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'Symbol(test)';
}

/**
 * 测试点63: 代理函数（参数为函数）
 * 说明：参数必须是函数类型
 */
export function testApplyArgsFunction() {
    const target = function (fn) {
        return fn();
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (typeof args[0] !== 'function') {
                throw new Error('Argument must be a function');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(() => 10) === 10;
}

/**
 * 测试点64: 代理函数（返回值为函数）
 * 说明：返回值强制执行
 */
export function testApplyReturnValueFunction() {
    const target = function () {
        return () => 10;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return result();
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 10;
}

/**
 * 测试点65: 代理函数（thisArg为字符串）
 * 说明：thisArg是字符串，调用toUpperCase
 */
export function testApplyThisArgString() {
    const target = function () {
        return this.toUpperCase();
    };
    const handler = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, 'hello', args)
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'HELLO';
}

/**
 * 测试点66: 代理函数（参数为布尔值）
 * 说明：参数必须是布尔类型
 */
export function testApplyArgsBoolean() {
    const target = function (bool) {
        return bool ? 'true' : 'false';
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (typeof args[0] !== 'boolean') {
                throw new Error('Argument must be boolean');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(true) === 'true';
}

/**
 * 测试点67: 代理函数（参数为null）
 * 说明：参数必须为null
 */
export function testApplyArgsNull() {
    const target = function (arg) {
        return arg === null;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args[0] !== null) {
                throw new Error('Argument must be null');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(null) === true;
}

/**
 * 测试点68: 代理函数（返回值为null）
 * 说明：返回值强制为null
 */
export function testApplyReturnValueNull() {
    const target = function () {
        return null;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return result;
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === null;
}

/**
 * 测试点69: 代理函数（错误特定处理）
 * 说明：仅处理特定错误消息
 */
export function testApplyErrorSpecific() {
    const target = function () {
        throw new Error('Test');
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            try {
                return Reflect.apply(obj, thisArg, args);
            } catch (e) {
                if (e.message === 'Test') {
                    return 'Handled';
                }
                throw e;
            }
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'Handled';
}

/**
 * 测试点70: 代理函数（参数为正则表达式）
 * 说明：参数必须是RegExp类型
 */
export function testApplyArgsRegExp() {
    const target = function (reg) {
        return reg.test('test');
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof RegExp)) {
                throw new Error('Argument must be a RegExp');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(/test/) === true;
}

/**
 * 测试点72: 代理函数（处理默认参数）
 * 说明：默认参数被代理修改为固定值
 */
export function testApplyDefaultParams() {
    const target = function (a = 10, b = 20) {
        return a + b;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const [a, b] = args.length === 0 ? [5, 15] : args;
            return Reflect.apply(obj, thisArg, [a, b]);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 20;
}

/**
 * 测试点73: 代理函数（参数为Date对象）
 * 说明：参数必须是Date实例
 */
export function testApplyArgsDate() {
    const target = function (date) {
        return date.getFullYear();
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof Date)) {
                throw new Error('Argument must be Date');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(new Date(2025, 0, 1)) === 2025;
}

/**
 * 测试点74: 代理函数（返回值为Date对象）
 * 说明：返回值强制转为Date
 */
export function testApplyReturnValueDate() {
    const target = function () {
        return 2025;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return new Date(result, 0, 1);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy().getFullYear() === 2025;
}

/**
 * 测试点75: 代理函数（参数为Error对象）
 * 说明：参数必须是Error实例
 */
export function testApplyArgsError() {
    const target = function (err) {
        return err.message;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof Error)) {
                throw new Error('Argument must be Error');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(new Error('Test')) === 'Test';
}

/**
 * 测试点76: 代理函数（错误类型检查）
 * 说明：仅处理特定Error类型
 */
export function testApplyErrorType() {
    const target = function () {
        throw new TypeError('Invalid');
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            try {
                return Reflect.apply(obj, thisArg, args);
            } catch (e) {
                if (e instanceof TypeError) {
                    return 'TypeError Handled';
                }
                throw e;
            }
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'TypeError Handled';
}

/**
 * 测试点77: 代理函数（多层代理：代理的代理）
 * 说明：代理函数本身又被代理
 */
export function testApplyNestedProxy() {
    const target = function () {
        return 1;
    };
    const handler1 = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) * 2
    };
    const handler2 = {
        apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) + 1
    };
    const proxy1 = new Proxy(target, handler1);
    const proxy2 = new Proxy(proxy1, handler2);
    return proxy2() === 3;
}

/**
 * 测试点79: 代理Date.now（返回固定值）
 * 说明：Date.now代理返回固定时间戳
 */
export function testApplyDateNowFixed() {
    const target = Date.now;
    const handler = {
        apply: (obj, thisArg, args) => 1735689600000
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 1735689600000;
}

/**
 * 测试点80: 代理setTimeout（参数时间单位转换）
 * 说明：参数从秒转为毫秒
 */
export async function testApplySetTimeoutUnit() {
    let called = false;
    const target = setTimeout;
    const handler = {
        apply: (obj, thisArg, args) => {
            const [fn, ms] = args;
            return Reflect.apply(obj, thisArg, [fn, ms * 1000]);
        }
    };
    const proxy = new Proxy(target, handler);
    proxy(() => {
        called = true;
    }, 1);
    await new Promise(resolve => setTimeout(() => resolve(called), 1500));
    return called;
}

/**
 * 测试点81: 代理JSON.parse（参数字符串处理）
 * 说明：字符串自动添加引号
 */
export function testApplyJSONParseFix() {
    const target = JSON.parse;
    const handler = {
        apply: (obj, thisArg, args) => {
            const [str] = args;
            return Reflect.apply(obj, thisArg, [`"${str}"`]);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy('test') === 'test';
}

/**
 * 测试点82: 代理Object.create（参数处理）
 * 说明：代理Object.create，强制原型为null
 */
export function testApplyObjectCreate() {
    const target = Object.create;
    const handler = {
        apply: (obj, thisArg, args) => {
            const [proto] = args;
            return Reflect.apply(obj, thisArg, [proto === null ? null : null]);
        }
    };
    const proxy = new Proxy(target, handler);
    const obj = proxy(null);
    return Object.getPrototypeOf(obj) === null;
}

/**
 * 测试点84: 代理函数（参数必须为数组）
 * 说明：参数必须是数组实例
 */
export function testApplyArgsArray() {
    const target = function (arr) {
        return arr.length;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!Array.isArray(args[0])) {
                throw new Error('Argument must be Array');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy([1, 2, 3]) === 3;
}

/**
 * 测试点85: 代理函数（返回值必须为数组）
 * 说明：返回值强制转为数组
 */
export function testApplyReturnValueArray() {
    const target = function () {
        return 10;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return [result];
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy().length === 1 && proxy()[0] === 10;
}

/**
 * 测试点86: 代理函数（参数为Set对象）
 * 说明：参数必须是Set实例
 */
export function testApplyArgsSet() {
    const target = function (set) {
        return set.size;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof Set)) {
                throw new Error('Argument must be Set');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(new Set([1, 2, 3])) === 3;
}

/**
 * 测试点87: 代理函数（返回值为Map对象）
 * 说明：返回值强制转为Map
 */
export function testApplyReturnValueMap() {
    const target = function () {
        return { a: 1 };
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return new Map(Object.entries(result));
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy().get('a') === 1;
}

/**
 * 测试点88: 代理函数（参数为WeakMap）
 * 说明：参数必须是WeakMap实例
 */
export function testApplyArgsWeakMap() {
    const target = function (map) {
        return map.size;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof WeakMap)) {
                throw new Error('Argument must be WeakMap');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(new WeakMap()) === undefined;
}

/**
 * 测试点89: 代理函数（错误堆栈跟踪）
 * 说明：错误堆栈附加代理信息
 */
export function testApplyErrorStack() {
    const target = function () {
        throw new Error('Original');
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            try {
                return Reflect.apply(obj, thisArg, args);
            } catch (e) {
                e.stack += '\n[Proxy Applied]';
                throw e;
            }
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        proxy();
    } catch (e) {
        return e.stack.includes('[Proxy Applied]');
    }
    return false;
}

/**
 * 测试点90: 代理函数（参数为BigInt）
 * 说明：参数必须是BigInt
 */
export function testApplyArgsBigInt() {
    const target = function (big) {
        return big + 1n;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (typeof args[0] !== 'bigint') {
                throw new Error('Argument must be BigInt');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(10n) === 11n;
}

/**
 * 测试点91: 代理函数（返回值为BigInt）
 * 说明：返回值强制转为BigInt
 */
export function testApplyReturnValueBigInt() {
    const target = function () {
        return 10;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return BigInt(result);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 10n;
}

/**
 * 测试点92: 代理函数（参数为Symbol.iterator）
 * 说明：参数必须是Symbol.iterator
 */
export function testApplyArgsSymbolIterator() {
    const target = function (iter) {
        return Array.from(iter);
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (args[0][Symbol.iterator] !== Array.prototype[Symbol.iterator]) {
                throw new Error('Argument must have Symbol.iterator');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy([1, 2, 3]).join(',') === '1,2,3';
}

/**
 * 测试点93: 代理函数（返回值为Generator）
 * 说明：返回值强制为Generator
 */
export function testApplyReturnValueGenerator() {
    const target = function () {
        return function* () {
            yield 1;
        };
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return result();
        }
    };
    const proxy = new Proxy(target, handler);
    const gen = proxy();
    return gen.next().value === 1;
}

/**
 * 测试点96: 代理函数（参数为正则表达式标志）
 * 说明：参数必须包含'g'标志
 */
export function testApplyArgsRegExpFlags() {
    const target = function (reg) {
        return reg.flags;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!args[0].flags.includes('g')) {
                throw new Error('RegExp must have "g" flag');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(/test/g) === 'g';
}

/**
 * 测试点99: 代理函数（参数为ArrayBuffer）
 * 说明：参数必须是ArrayBuffer实例
 */
export function testApplyArgsArrayBuffer() {
    const target = function (buf) {
        return buf.byteLength;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof ArrayBuffer)) {
                throw new Error('Argument must be ArrayBuffer');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(new ArrayBuffer(10)) === 10;
}

/**
 * 测试点100: 代理函数（返回值为DataView）
 * 说明：返回值强制转为DataView
 */
export function testApplyReturnValueDataView() {
    const target = function () {
        return new ArrayBuffer(4);
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return new DataView(result);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy().getUint8(0) === 0;
}

/**
 * 测试点101: 代理函数（参数为TypedArray）
 * 说明：确保参数是Uint8Array实例
 */
export function testApplyArgsTypedArray() {
    const target = function (ta) {
        return ta.length;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof Uint8Array)) {
                throw new Error('Argument must be Uint8Array');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(new Uint8Array([1, 2, 3])) === 3;
}

/**
 * 测试点102: 代理函数（返回值为Promise）
 * 说明：返回值强制转为Promise
 */
export function testApplyReturnValuePromise() {
    const target = function () {
        return 10;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return Promise.resolve(result);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy().then(value => value === 10);
}

/**
 * 测试点103: 代理函数（参数为WeakSet）
 * 说明：确保参数是WeakSet实例
 */
export function testApplyArgsWeakSet() {
    const target = function (ws) {
        return 0;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (!(args[0] instanceof WeakSet)) {
                throw new Error('Argument must be WeakSet');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    const ws = new WeakSet();
    return proxy(ws) === 0;
}

/**
 * 测试点104: 代理函数（处理arguments对象）
 * 说明：在apply中修改arguments参数
 */
export function testApplyArguments() {
    const target = function () {
        return arguments.length;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const newArgs = [...args, 10];
            return Reflect.apply(obj, thisArg, newArgs);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(1, 2) === 3;
}

/**
 * 测试点105: 代理函数（参数为Function）
 * 说明：确保参数是函数实例
 */
export function testApplyArgsFunction2() {
    const target = function (fn) {
        return fn();
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (typeof args[0] !== 'function') {
                throw new Error('Argument must be Function');
            }
            return Reflect.apply(obj, thisArg, args);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy(() => 10) === 10;
}

/**
 * 测试点106: 代理函数（返回值为Function）
 * 说明：返回值强制转为函数
 */
export function testApplyReturnValueFunction2() {
    const target = function () {
        return 10;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            const result = Reflect.apply(obj, thisArg, args);
            return function () {
                return result;
            };
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy()() === 10;
}

/**
 * 测试点107: 代理函数（错误处理：RangeError）
 * 说明：仅处理RangeError类型
 */
export function testApplyRangeError() {
    const target = function () {
        throw new RangeError('Out of range');
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            try {
                return Reflect.apply(obj, thisArg, args);
            } catch (e) {
                if (e instanceof RangeError) {
                    return 'RangeError Handled';
                }
                throw e;
            }
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy() === 'RangeError Handled';
}

/**
 * 测试点108: 代理函数（多层代理：三层代理）
 * 说明：三层嵌套代理链（proxy1 → proxy2 → proxy3）
 */
export function testApplyThreeLayerProxy() {
    const target = function () {
        return 1;
    };
    const handler1 = { apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) * 2 };
    const handler2 = { apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) + 1 };
    const handler3 = { apply: (obj, thisArg, args) => Reflect.apply(obj, thisArg, args) * 3 };
    const proxy1 = new Proxy(target, handler1);
    const proxy2 = new Proxy(proxy1, handler2);
    const proxy3 = new Proxy(proxy2, handler3);
    return proxy3() === 9;
}

/**
 * 测试点109: 代理函数（参数为Generator）
 * 说明：确保参数是Generator实例
 */
export function testApplyArgsGenerator() {
    const target = function (gen) {
        return gen.next().value;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            if (typeof args[0].next === 'function') {
                return Reflect.apply(obj, thisArg, args);
            }
            throw new Error('Argument must be Generator');
        }
    };
    const proxy = new Proxy(target, handler);
    const gen = function*(){
        yield 1;
    }();
    return proxy(gen) === 1;
}

/**
 * 测试点110: 代理函数（处理async函数）
 * 说明：代理async函数并修改返回值
 */
export function testApplyAsyncFunction2() {
    const target = async function () {
        return 10;
    };
    const handler = {
        apply: (obj, thisArg, args) => {
            return Reflect.apply(obj, thisArg, args).then(result => result * 2);
        }
    };
    const proxy = new Proxy(target, handler);
    return proxy().then(value => value === 20);
}
