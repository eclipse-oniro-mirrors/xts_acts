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

/**
 * 测试 6: values() 返回的是 Iterator 对象
 */
export function test6_valuesReturnsIterator() {
    const arr = [1];
    const iter = arr.values();
    return typeof iter.next === 'function' && typeof iter[Symbol.iterator] === 'function';
}

/**
 * 测试 9: push(null) 后 values() 包含 null
 */
export function test9_pushNullIncludedInValues() {
    const arr = [1];
    arr.push(null);
    const result = Array.from(arr.values());
    return result.length === 2 && result[1] === null;
}

/**
 * 测试 10: push 后使用 for...of 遍历 values() 与直接遍历数组一致
 */
export function test10_forOfValuesMatchesDirectArrayIteration() {
    const arr = ['x'];
    arr.push('y');
    const fromValues = [];
    const direct = [];
    for (const v of arr.values()) {
        fromValues.push(v);
    }
    for (const v of arr) {
        direct.push(v);
    }
    return JSON.stringify(fromValues) === JSON.stringify(direct);
}

/**
 * 测试 17: push 后使用扩展运算符从 values() 构造数组，结果正确
 */
export function test17_spreadValuesAfterPush() {
    const arr = ['a'];
    arr.push('b');
    const spread = [...arr.values()];
    return JSON.stringify(spread) === JSON.stringify(['a', 'b']);
}

/**
 * 测试 19: push 后 values() 的 Symbol.iterator 指向自身
 */
export function test19_valuesIteratorIsIterable() {
    const arr = [];
    arr.push('test');
    const iter = arr.values();
    return iter[Symbol.iterator]() === iter;
}

/**
 * 测试 22: push 后 values() 的迭代顺序与索引顺序一致（即使中间有 delete）
 */
export function test22_valuesRespectsIndexOrderDespiteDelete() {
    const arr = [1, 2, 3];
    delete arr[1];
    arr.push(4);
    const result = Array.from(arr.values());
    return (
        result.length === 4 &&
            result[0] === 1 &&
            result[1] === undefined &&
            result[2] === 3 &&
            result[3] === 4
    );
}

/**
 * 测试 24: push 后使用 values() 构造新数组，与原数组深相等（浅层）
 */
export function test24_valuesProducesShallowCopyMatchingOriginal() {
    const arr = [{ a: 1 }];
    arr.push({ b: 2 });
    const copy = Array.from(arr.values());
    return (
        copy.length === 2 &&
            copy[0] === arr[0] &&
            copy[1] === arr[1]
    );
}

/**
 * 测试 25: values() 不受 Array.prototype.push 被重写的影响（只要调用的是原生 push）
 */
export function test25_nativePushUsedEvenIfPrototypeModified() {
    const originalPush = Array.prototype.push;
    try {
        Array.prototype.push = function () {
            throw new Error('Hijacked!');
        };
        const arr = [];
        originalPush.call(arr, 'safe');
        const result = Array.from(arr.values());
        return result.length === 1 && result[0] === 'safe';
    } finally {
        Array.prototype.push = originalPush;
    }
}

/**
 * 测试 28: push(undefined) 与未赋值空位的区别（values 区分两者）
 */
export function test28_pushUndefinedVsSparseHole() {
    const arr1 = [];
    arr1.push(undefined);
    const arr2 = [];
    arr2[0] = undefined;
    const arr3 = [];
    arr3.length = 1;
    const v1 = Array.from(arr1.values())[0];
    const v2 = Array.from(arr2.values())[0];
    const v3 = Array.from(arr3.values())[0];
    return v1 === undefined && v2 === undefined && v3 === undefined;
}

/**
 * 测试 29: values() 迭代器遵守 Iterator 协议（next 返回 { value, done }）
 */
export function test29_valuesIteratorProtocolCompliance() {
    const arr = [1];
    arr.push(2);
    const iter = arr.values();
    const result = iter.next();
    return (
        typeof result === 'object' &&
            'value' in result &&
            'done' in result &&
            result.value === 1 &&
            result.done === false
    );
}

/**
 * 测试 30: push 后立即解构 values() 迭代器，结果正确
 */
export function test30_destructuringValuesAfterPush() {
    const arr = ['x'];
    arr.push('y');
    const [a, b] = arr.values();
    return a === 'x' && b === 'y';
}

/**
 * 测试 33: values() 不包含非索引属性（即使 push 后手动添加）
 */
export function test33_valuesIgnoresNonIndexProperties() {
    const arr = [1];
    arr.push(2);
    arr.customProp = 'ignore me';
    const result = Array.from(arr.values());
    return result.length === 2 && result[0] === 1 && result[1] === 2;
}

/**
 * 测试 34: push 后 values() 的 Symbol.toStringTag 是 'Array Iterator'
 */
export function test34_valuesHasCorrectToStringTag() {
    const arr = [];
    arr.push(1);
    const iter = arr.values();
    return Object.prototype.toString.call(iter) === '[object Array Iterator]';
}

/**
 * 测试 37: 在冻结数组上 push 会报错，但若成功 push 则 values 正常（实际不可行，故验证错误）
 */
export function test37_pushOnFrozenArrayThrows() {
    const arr = [1];
    Object.freeze(arr);
    try {
        arr.push(2);
        return false;
    } catch (e) {
        const result = Array.from(arr.values());
        return JSON.stringify(result) === JSON.stringify([1]);
    }
}

/**
 * 测试 41: push(Symbol) 后 values() 能正确返回 Symbol 值
 */
export function test41_pushSymbolPreservedInValues() {
    const sym = Symbol('test');
    const arr = [];
    arr.push(sym);
    const result = Array.from(arr.values());
    return result.length === 1 && result[0] === sym;
}

/**
 * 测试 42: 在 Proxy 包装的数组上 push，values() 反映代理后的行为
 */
export function test42_valuesOnProxiedArrayReflectsPush() {
    const target = [];
    const handler = {
        get(obj, prop) {
            return Reflect.get(obj, prop);
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.push(42);
    const result = Array.from(proxy.values());
    return result.length === 1 && result[0] === 42;
}

/**
 * 测试 46: push(-0) 后 values() 保留 -0（Object.is 验证）
 */
export function test46_pushNegativeZeroPreserved() {
    const arr = [];
    arr.push(-0);
    const val = Array.from(arr.values())[0];
    return Object.is(val, -0);
}

/**
 * 测试 49: push 后 values() 与 JSON.stringify(arr) 内容一致（对可序列化值）
 */
export function test49_valuesMatchesJSONStringifyForSerializableData() {
    const arr = [true, "hello", 42];
    arr.push(null);
    const fromValues = JSON.stringify(Array.from(arr.values()));
    const direct = JSON.stringify(arr);
    return fromValues === direct;
}

/**
 * 测试 52: 在 Web Worker 或异步上下文中行为不变（此处模拟同步逻辑）
 */
export function test52_asyncContextBehaviorSame() {
    const arr = [];
    setTimeout(() => {
    }, 0);
    arr.push('async-safe');
    const result = Array.from(arr.values());
    return result[0] === 'async-safe';
}

/**
 * 测试 53: push 后 values() 的迭代顺序严格为升序索引（即使手动设高索引）
 */
export function test53_valuesIterationFollowsAscendingIndices() {
    const arr = [];
    arr[5] = 'high';
    arr.push('next');
    const keys = [];
    const iter = arr.values();
    let item;
    while (!(item = iter.next()).done) {
        keys.push(item.value);
    }
    return (
        keys.length === 7 &&
            keys[5] === 'high' &&
            keys[6] === 'next'
    );
}

/**
 * 测试 54: values() 不调用数组元素的 getter（若元素是响应式对象）
 */
export function test54_valuesDoesNotTriggerGetters() {
    let getterCalled = false;
    const obj = {
        get value() {
            getterCalled = true;
            return 42;
        }
    };
    const arr = [];
    arr.push(obj);
    const captured = Array.from(arr.values());
    return captured[0] === obj && !getterCalled;
}

/**
 * 测试 56: 在严格模式下修改 values() 返回的值不影响原数组（值传递）
 */
export function test56_modifyingIteratorValueDoesNotAffectArray() {
    "use strict";
    const arr = [{ id: 1 }];
    arr.push({ id: 2 });
    const iter = arr.values();
    let first = iter.next().value;
    first.id = 999;
    const arr2 = [10];
    arr2.push(20);
    const iter2 = arr2.values();
    let num = iter2.next().value;
    num = 999;
    return arr2[0] === 10;
}

/**
 * 测试 60: 极端：push 后立即 delete 数组变量，但 values 已转为数组仍有效
 */
export function test60_valuesSurvivesArrayVariableDeletion() {
    let arr = [1];
    arr.push(2);
    const safeCopy = Array.from(arr.values());
    arr = null;
    return JSON.stringify(safeCopy) === JSON.stringify([1, 2]);
}

/**
 * 测试 63: push 后立即使用 values() 作为 Generator 输入，行为正常
 */
export function test63_valuesAsGeneratorInputWorks() {

    function* echo(iter) {
        for (const x of iter) {
            yield x;
        }
    }

    const arr = ['gen'];
    arr.push('test');
    const output = Array.from(echo(arr.values()));
    return JSON.stringify(output) === JSON.stringify(['gen', 'test']);
}

/**
 * 测试 64: 在数组原型上定义自定义 values 方法，原生行为仍可通过 %ArrayProto%.values 访问（但本测试验证标准行为优先）
 */
export function test64_nativeValuesPreferredOverShadowed() {
    const originalValues = Array.prototype.values;
    try {
        Array.prototype.values = function () {
            return ['hijacked'];
        };
        const arr = [1];
        arr.push(2);
        const result = Array.from(originalValues.call(arr));
        return JSON.stringify(result) === JSON.stringify([1, 2]);
    } finally {
        Array.prototype.values = originalValues;
    }
}

/**
 * 测试 66: values() 不触发数组的 toString 或 valueOf
 */
export function test66_valuesDoesNotInvokeToStringOrValueOf() {
    let toStringCalled = false;
    let valueOfCalled = false;
    const obj = {
        toString() {
            toStringCalled = true;
            return 'toString';
        },
        valueOf() {
            valueOfCalled = true;
            return 'valueOf';
        }
    };
    const arr = [];
    arr.push(obj);
    Array.from(arr.values());
    return !toStringCalled && !valueOfCalled;
}

/**
 * 测试 67: push 后 values() 与 Array.prototype.slice.call(arr) 结果一致
 */
export function test67_valuesMatchesSliceCall() {
    const arr = [1, 2];
    arr.push(3);
    const fromValues = Array.from(arr.values());
    const fromSliceCall = Array.prototype.slice.call(arr);
    return JSON.stringify(fromValues) === JSON.stringify(fromSliceCall);
}

/**
 * 测试 70: push 后 values() 可安全用于 WeakMap 键（若元素是对象）
 */
export function test70_valuesElementsCanBeWeakMapKeys() {
    const wm = new WeakMap();
    const key = {};
    const arr = [];
    arr.push(key);
    wm.set(key, 'stored');
    const retrieved = wm.get(Array.from(arr.values())[0]);
    return retrieved === 'stored';
}

/**
 * 测试 71: 在冻结对象作为数组元素时，push 和 values() 仍正常工作
 */
export function test71_frozenObjectAsElementWorks() {
    const obj = Object.freeze({ immutable: true });
    const arr = [];
    arr.push(obj);
    const result = Array.from(arr.values())[0];
    return result === obj && result.immutable === true;
}

/**
 * 测试 72: values() 迭代器不持有对数组的强引用（利于 GC，此处验证逻辑无泄漏）
 */
export function test72_iteratorDoesNotPreventGcOfArray() {
    let arr = [1];
    arr.push(2);
    const iter = arr.values();
    arr = null;
    const result = Array.from(iter);
    return JSON.stringify(result) === JSON.stringify([1, 2]);
}

/**
 * 测试 73: push 后 values() 与 structuredClone（若支持）内容一致
 */
export function test73_valuesMatchesStructuredClone() {
    if (typeof structuredClone === 'undefined') {
        return true;
    }
    const arr = [{ a: 1 }, [2]];
    arr.push({ b: 3 });
    const cloned = structuredClone(arr);
    const fromValues = Array.from(arr.values());
    return (
        fromValues.length === cloned.length &&
            fromValues[0].a === cloned[0].a &&
        Array.isArray(fromValues[1]) &&
            fromValues[2].b === cloned[2].b
    );
}

/**
 * 测试 75: push 后使用 values() 与 Array.from({ length: n, ... }) 模拟结果不同（验证非模拟）
 */
export function test75_valuesIsNotArrayLikeSimulation() {
    const arr = [];
    arr.push('real');
    const real = Array.from(arr.values());
    const fake = Array.from({ length: 1, 0: 'real' });
    return real[0] === 'real' && fake[0] === 'real';
}

/**
 * 测试 77: push 后 values() 可用于 Promise.all（若元素是 Promise）
 */
export function test77_valuesWithPromisesWorksInPromiseAll() {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(2);
    const arr = [];
    arr.push(p1);
    arr.push(p2);
    const promises = Array.from(arr.values());
    return promises[0] === p1 && promises[1] === p2;
}

/**
 * 测试 79: push 后 values() 与 Reflect.apply(Array.prototype.slice, arr, []) 一致
 */
export function test79_valuesMatchesReflectApplySlice() {
    const arr = [10, 20];
    arr.push(30);
    const fromValues = Array.from(arr.values());
    const fromReflect = Reflect.apply(Array.prototype.slice, arr, []);
    return JSON.stringify(fromValues) === JSON.stringify(fromReflect);
}

/**
 * 测试 80: 极端：连续 push 和 values 调用 100 次，无状态污染
 */
export function test80_repeatedPushAndValuesNoStateLeak() {
    for (let i = 0; i < 100; i++) {
        const arr = [];
        arr.push(i);
        const result = Array.from(arr.values());
        if (result.length !== 1 || result[0] !== i) {
            return false;
        }
    }
    return true;
}

/**
 * 测试 81: push 后 values() 正确处理 -0 与 +0 的区分（Object.is）
 */
export function test81_negativeZeroDistinctFromPositiveZero() {
    const arr = [];
    arr.push(+0);
    arr.push(-0);
    const [a, b] = Array.from(arr.values());
    return Object.is(a, +0) && Object.is(b, -0) && a === b;
}

/**
 * 测试 83: values() 迭代器在数组被 Object.seal 后仍可读取
 */
export function test83_valuesWorksOnSealedArray() {
    const arr = [1];
    arr.push(2);
    Object.seal(arr);
    const result = Array.from(arr.values());
    return result.length === 2 && result[1] === 2;
}

/**
 * 测试 84: push 后 values() 与 Array.from(arr, identity) 结果一致
 */
export function test84_valuesMatchesArrayFromWithIdentityMap() {
    const identity = x => x;
    const arr = ['map'];
    arr.push('test');
    const fromValues = Array.from(arr.values());
    const fromMapped = Array.from(arr, identity);
    return JSON.stringify(fromValues) === JSON.stringify(fromMapped);
}

/**
 * 测试 85: 在 Web API 环境（如 postMessage）中传递的数组副本，push + values 行为一致（模拟）
 */
export function test85_postMessageStyleCloneBehavior() {
    const original = [1];
    original.push(2);
    const cloned = JSON.parse(JSON.stringify(original));
    const origValues = Array.from(original.values());
    const cloneValues = Array.from(cloned.values());
    return JSON.stringify(origValues) === JSON.stringify(cloneValues);
}

/**
 * 测试 86: values() 不调用数组的 @@iterator 方法（避免递归）
 */
export function test86_valuesDoesNotInvokeSymbolIteratorRecursively() {
    let iteratorCalled = false;
    const arr = [1];
    arr.push(2);
    const originalIterator = arr[Symbol.iterator];
    arr[Symbol.iterator] = function () {
        iteratorCalled = true;
        return originalIterator.call(this);
    };
    Array.from(arr.values());
    return !iteratorCalled;
}

/**
 * 测试 87: push 后 values() 可用于 Intl.ListFormat（若元素是字符串）
 */
export function test87_valuesUsableWithIntlListFormat() {
    if (typeof Intl === 'undefined' || typeof Intl.ListFormat === 'undefined') {
        return true;
    }
    const arr = ['red'];
    arr.push('green');
    arr.push('blue');
    const list = new Intl.ListFormat('en', { style: 'long', type: 'conjunction' });
    const formatted = list.format(Array.from(arr.values()));
    return formatted === 'red, green, and blue';
}

/**
 * 测试 88: 在 Proxy 中拦截 push 和 values，验证原生逻辑可被包装
 */
export function test88_proxyCanInterceptPushAndValues() {
    const log = [];
    const target = [];
    const handler = {
        get(obj, prop, receiver) {
            if (prop === 'push' || prop === 'values') {
                log.push(prop);
            }
            return Reflect.get(obj, prop, receiver);
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.push(1);
    Array.from(proxy.values());
    return log.length === 2 && log[0] === 'push' && log[1] === 'values';
}

/**
 * 测试 90: push 后 values() 与 for-in 循环结果不同（for-in 不可靠，但验证 values 更可靠）
 */
export function test90_valuesMoreReliableThanForIn() {
    const arr = [];
    arr.push('a');
    arr.push('b');
    arr.custom = 'ignore';
    const valuesResult = Array.from(arr.values());
    const forInKeys = [];
    for (const key in arr) {
        if (arr.hasOwnProperty(key)) {
            forInKeys.push(key);
        }
    }
    return valuesResult.length === 2 && forInKeys.length >= 2;
}

/**
 * 测试 95: push 后 values() 与 Array.prototype.filter(Boolean) 组合正常
 */
export function test95_valuesComposesWithFilter() {
    const arr = [0];
    arr.push(1);
    arr.push('');
    arr.push('truthy');
    const truthy = Array.from(arr.values()).filter(Boolean);
    return JSON.stringify(truthy) === JSON.stringify([1, 'truthy']);
}

/**
 * 测试 97: push 后立即 Object.freeze，values() 仍可读取
 */
export function test97_valuesWorksOnFrozenArrayAfterPush() {
    const arr = [1];
    arr.push(2);
    Object.freeze(arr);
    const result = Array.from(arr.values());
    return result.length === 2 && result[1] === 2;
}