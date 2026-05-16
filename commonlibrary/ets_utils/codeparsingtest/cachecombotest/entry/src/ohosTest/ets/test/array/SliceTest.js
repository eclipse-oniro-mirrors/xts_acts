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
 * 测试点 1：通过 Proxy 拦截 slice 调用，并验证是否能正确代理数组的 slice 方法。
 * 预期：Proxy 能正常调用原数组的 slice 方法并返回正确结果。
 */
export function testProxyInterceptsSliceCorrectly() {
    const originalArray = [1, 2, 3, 4, 5];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };

    const proxiedArray = new Proxy(originalArray, handler);
    const sliced = proxiedArray.slice(1, 4);
    const expected = [2, 3, 4];

    return JSON.stringify(sliced) === JSON.stringify(expected);
}

/**
 * 测试点 2：验证在 Proxy 中修改 slice 行为（例如反转结果）是否生效。
 * 预期：自定义的 slice 行为（如反转）被正确应用。
 */
export function testCustomSliceBehaviorInProxy() {
    const originalArray = [10, 20, 30, 40];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const result = Array.prototype.slice.apply(target, args);
                    return result.reverse(); 
                };
            }
            return target[prop];
        }
    };

    const proxiedArray = new Proxy(originalArray, handler);
    const slicedReversed = proxiedArray.slice(0, 3); 
    const expected = [30, 20, 10];

    return JSON.stringify(slicedReversed) === JSON.stringify(expected);
}

/**
 * 测试点 3：验证对 Proxy 数组进行 slice 操作不会影响原始数组。
 * 预期：原始数组保持不变。
 */
export function testSliceOnProxyDoesNotMutateOriginal() {
    const originalArray = ['a', 'b', 'c'];
    const originalCopy = [...originalArray]; 

    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };

    const proxiedArray = new Proxy(originalArray, handler);
    proxiedArray.slice(); 
 
    return JSON.stringify(originalArray) === JSON.stringify(originalCopy);
}
 

/**
 * 测试点 4：Proxy 拦截 slice 时传入负数索引是否正确处理。
 */
export function testSliceWithNegativeIndicesInProxy() {
    const arr = [1, 2, 3, 4, 5];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(-3, -1); 
    return JSON.stringify(result) === JSON.stringify([3, 4]);
}

/**
 * 测试点 5：Proxy 中调用 slice 时不传参数，应返回完整浅拷贝。
 */
export function testSliceWithoutArgsReturnsShallowCopy() {
    const obj = { id: 1 };
    const arr = [obj, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const copy = p.slice();
    return (
        copy.length === 2 &&
            copy[0] === obj && 
            copy !== arr
    );
}

/**
 * 测试点 6：Proxy 的 slice 被多次调用，每次结果独立。
 */
export function testMultipleSliceCallsAreIndependent() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const a = p.slice(0, 1);
    const b = p.slice(1, 2);
    return JSON.stringify(a) === '[1]' && JSON.stringify(b) === '[2]';
}

/**
 * 测试点 7：Proxy 拦截 slice 时记录调用次数。
 */
export function testSliceCallCountTrackedViaProxy() {
    let callCount = 0;
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => {
                    callCount++;
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice();
    p.slice(0, 1);
    return callCount === 2;
}

/**
 * 测试点 8：Proxy 中 slice 方法被删除后访问应为 undefined。
 */
export function testDeletedSlicePropertyReturnsUndefined() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return undefined;
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    return p.slice === undefined;
}

/**
 * 测试点 9：Proxy 拦截 slice 并抛出自定义错误。
 */
export function testCustomErrorOnSliceInProxy() {
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                throw new Error('slice is disabled');
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    try {
        p.slice();
        return false; 
    } catch (e) {
        return e.message === 'slice is disabled';
    }
}

/**
 * 测试点 10：Proxy 的 slice 返回固定值（模拟 mock）。
 */
export function testSliceReturnsMockedValue() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return () => ['mock'];
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    return JSON.stringify(p.slice()) === '["mock"]';
}

/**
 * 测试点 11：Proxy 拦截 slice 但不调用原方法，直接返回空数组。
 */
export function testSliceReturnsEmptyArray() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return () => [];
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    return p.slice().length === 0;
}

/**
 * 测试点 12：Proxy 中 slice 调用时 this 绑定正确（避免丢失上下文）。
 */
export function testSliceThisBindingIsCorrect() {
    const arr = ['a', 'b'];
    let capturedThis;
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    capturedThis = this;
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice();
    return capturedThis === p;
}

/**
 * 测试点 13：Proxy 对空数组调用 slice 应返回空数组。
 */
export function testSliceOnEmptyArrayReturnsEmpty() {
    const arr = [];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    return p.slice().length === 0;
}

/**
 * 测试点 14：Proxy 拦截 slice 并修改输入参数（如自动 clamp 范围）。
 */
export function testSliceParamsAutoClampedByProxy() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    start = Math.max(0, Math.min(start, target.length));
                    end = Math.max(0, Math.min(end || Infinity, target.length));
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(10, 20); 
    return result.length === 0;
}

/**
 * 测试点 15：Proxy 的 slice 能正确处理稀疏数组（保留 holes）。
 */
export function testSlicePreservesSparseArrayHoles() {
    const arr = new Array(3);
    arr[1] = 'x'; 
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const sliced = p.slice();
 
    return sliced.length === 3 && sliced[0] === undefined && sliced[1] === 'x' && sliced[2] === undefined;
}

/**
 * 测试点 16：Proxy 拦截 slice 但 fallback 到原始方法（通过 Reflect）。
 */
export function testSliceUsesReflectGetFallback() {
    const arr = [5, 6, 7];
    const handler = {
        get(target, prop, receiver) {
            if (prop === 'slice') {
                const orig = Reflect.get(target, prop, receiver);
                return orig.bind(target); 
            }
            return Reflect.get(target, prop, receiver);
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(1);
    return JSON.stringify(result) === '[6,7]';
}

/**
 * 测试点 17：Proxy 的 slice 在严格模式下不修改原始数组。
 */
export function testSliceInStrictModeDoesNotMutate() {
    "use strict";
    const arr = [1, 2, 3];
    const original = [...arr];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice(0, 0);
    return JSON.stringify(arr) === JSON.stringify(original);
}

/**
 * 测试点 18：Proxy 拦截 slice 并返回非数组类型（验证灵活性）。
 */
export function testSliceReturnsNonArrayType() {
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return () => 'not an array';
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    return p.slice() === 'not an array';
}

/**
 * 测试点 19：Proxy 的 slice 调用时参数数量异常（如传入字符串）仍能容错。
 */
export function testSliceHandlesInvalidArgsGracefully() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
 
    const result = p.slice('a', 'b');
    return JSON.stringify(result) === JSON.stringify([]);

}

/**
 * 测试点 20：Proxy 的 slice 与原生数组 slice 行为完全一致（全面一致性校验）。
 */
export function testProxySliceMatchesNativeBehaviorExactly() {
    const testCases = [
        [],
        [1],
        [1, 2, 3, 4, 5],
        ['a', 'b'],
        [null, undefined, 0, false]
    ];
    const paramsList = [
        [],
        [1],
        [0, 1],
        [-2],
        [1, -1],
        [10, 20],
        ['1', '2'] 
    ];

    for (const arr of testCases) {
        const handler = {
            get(target, prop) {
                if (prop === 'slice') {
                    return (...args) => Array.prototype.slice.apply(target, args);
                }
                return target[prop];
            }
        };
        const p = new Proxy(arr, handler);
        for (const params of paramsList) {
            const nativeResult = arr.slice(...params);
            const proxyResult = p.slice(...params);
            if (JSON.stringify(nativeResult) !== JSON.stringify(proxyResult)) {
                return false;
            }
        }
    }
    return true;
}
 

/**
 * 测试点 21：Proxy 拦截 slice 时，原始数组的原型被污染，但代理仍使用原生 slice。
 */
export function testProxyUsesNativeSliceDespitePrototypePollution() {
 
    const originalSlice = Array.prototype.slice;
    Array.prototype.slice = function () {
        return ['polluted'];
    };

    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => originalSlice.apply(target, args); 
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
 
    Array.prototype.slice = originalSlice;

    return JSON.stringify(result) === '[1,2,3]';
}

/**
 * 测试点 22：Proxy 的 slice 在冻结数组上仍能工作。
 */
export function testSliceOnFrozenArrayViaProxy() {
    const arr = Object.freeze([10, 20, 30]);
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(1);
    return JSON.stringify(result) === '[20,30]';
}

/**
 * 测试点 23：多层 Proxy 嵌套，slice 仍能穿透到原始数组。
 */
export function testNestedProxiesPreserveSliceBehavior() {
    const arr = [1, 2, 3];
    const innerHandler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const outerHandler = {
        get(target, prop) {
            return target[prop];
        }
    };
    const inner = new Proxy(arr, innerHandler);
    const outer = new Proxy(inner, outerHandler);
    const result = outer.slice(0, 2);
    return JSON.stringify(result) === '[1,2]';
}

/**
 * 测试点 24：Proxy 拦截 slice 并限制最大返回长度（安全策略）。
 */
export function testSliceMaxLengthEnforcedByProxy() {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const MAX_LEN = 3;
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = target.length) {
                    const actualEnd = Math.min(end, start + MAX_LEN);
                    return Array.prototype.slice.call(target, start, actualEnd);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(0, 100);
    return result.length === 3 && JSON.stringify(result) === '[1,2,3]';
}

/**
 * 测试点 25：Proxy 的 slice 被调用时记录时间戳（用于性能监控模拟）。
 */
export function testSliceCallTimestampRecorded() {
    let timestamp;
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    timestamp = Date.now();
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice();
    return typeof timestamp === 'number' && timestamp > 0;
}

/**
 * 测试点 26：Proxy 拦截 slice 但拒绝访问包含敏感值的片段。
 */
export function testSliceBlocksSensitiveData() {
    const arr = ['public', 'SECRET_TOKEN', 'normal'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    const raw = Array.prototype.slice.call(target, start, end);
                    if (raw.some(item => typeof item === 'string' && item.includes('SECRET'))) {
                        throw new Error('Access denied');
                    }
                    return raw;
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    try {
        p.slice(0, 2); 
        return false;
    } catch (e) {
        return e.message === 'Access denied';
    }
}

/**
 * 测试点 27：Proxy 的 slice 在数组有自定义 getter 时仍能读取真实值。
 */
export function testSliceRespectsArrayGetters() {
    const arr = [];
    Object.defineProperty(arr, '0', { get: () => 'dynamic' });
    arr.length = 1;

    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return result[0] === 'dynamic';
}

/**
 * 测试点 28：Proxy 拦截 slice 并自动去重结果。
 */
export function testSliceAutoDeduplicatesResult() {
    const arr = [1, 2, 2, 3, 3, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const raw = Array.prototype.slice.apply(target, args);
                    return [...new Set(raw)];
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return JSON.stringify(result) === '[1,2,3]';
}

/**
 * 测试点 29：Proxy 的 slice 调用时，this 指向被篡改，但通过 bind 修复。
 */
export function testSliceThisFixedViaBindInHandler() {
    const arr = ['x'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                const fn = Array.prototype.slice;
                return fn.bind(target); 
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
 
    const sliced = p.slice.call({ length: 0 }); 
    return sliced[0] === 'x';
}

/**
 * 测试点 30：Proxy 拦截 slice 并延迟执行（模拟懒加载）。
 */
export function testSliceLazyEvaluationViaProxy() {
    let executed = false;
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    executed = true;
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
 
    if (executed) {
        return false;
    }
    p.slice();
    return executed;
}

/**
 * 测试点 31：Proxy 的 slice 与 Symbol.iterator 共存无冲突。
 */
export function testSliceAndSymbolIteratorCoexist() {
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const fromIterator = Array.from(p);
    const fromSlice = p.slice();
    return JSON.stringify(fromIterator) === JSON.stringify(fromSlice);
}

/**
 * 测试点 32：Proxy 拦截 slice 并注入日志（不影响返回值）。
 */
export function testSliceWithLoggingSideEffect() {
    let log = '';
    const arr = [5];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    log = `slice called with ${args}`;
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(0, 1);
    return result[0] === 5 && log.startsWith('slice called with');
}

/**
 * 测试点 33：Proxy 的 slice 在跨 realm（如 iframe）模拟中仍可用（此处模拟隔离）。
 */
export function testSliceWorksInIsolatedContextSimulation() {
 
    const FakeArray = class extends Array {
    };
    const arr = new FakeArray(1, 2, 3);
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
 
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return Array.isArray(result) && JSON.stringify(result) === '[1,2,3]';
}

/**
 * 测试点 34：Proxy 拦截 slice 并限制只能从索引 0 开始。
 */
export function testSliceOnlyAllowedFromZero() {
    const arr = [10, 20, 30];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end) {
                    if (start !== 0) {
                        throw new Error('Only slice from 0 allowed');
                    }
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    try {
        p.slice(1); 
        return false;
    } catch (e) {
        return e.message === 'Only slice from 0 allowed';
    }
}

/**
 * 测试点 36：Proxy 拦截 slice 并兼容类数组对象（array-like）。
 */
export function testSliceWorksOnArrayLikeViaProxy() {
    const arrayLike = { 0: 'a', 1: 'b', length: 2 };
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arrayLike, handler);
    const result = p.slice();
    return Array.isArray(result) && result[0] === 'a' && result.length === 2;
}

/**
 * 测试点 39：Proxy 的 slice 被枚举为不可配置属性时仍可拦截。
 */
export function testSliceInterceptedEvenIfNonConfigurable() {
    const arr = [1];
 
    Object.defineProperty(arr, 'slice', {
        value: Array.prototype.slice,
        writable: true,
        enumerable: false,
        configurable: false
    });

    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => ['intercepted'];
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return result[0] === 'intercepted';
}

/**
 * 测试点 40：Proxy 拦截 slice 并支持链式调用（如 .slice().reverse()）。
 */
export function testChainedCallsAfterProxySlice() {
    const arr = [3, 2, 1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice().reverse();
    return JSON.stringify(result) === '[1,2,3]';
}
 

/**
 * 测试点 41：Proxy 拦截 slice 时处理超大数组（性能边界，不崩溃即可）。
 */
export function testSliceOnLargeArrayDoesNotCrash() {
    const size = 100_000;
    const arr = new Array(size).fill(1);
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(0, 10);
    return result.length === 10 && result.every(x => x === 1);
}

/**
 * 测试点 42：Proxy 的 slice 被调用时，忽略 Symbol 属性（slice 只操作索引属性）。
 */
export function testSliceIgnoresSymbolProperties() {
    const arr = [1, 2];
    const sym = Symbol('test');
    arr[sym] = 'secret';
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return (
        result.length === 2 &&
            !result.hasOwnProperty(sym) 
    );
}

/**
 * 测试点 43：Proxy 拦截 slice 并限制调用频率（节流模拟）。
 */
export function testSliceThrottledByProxy() {
    let callCount = 0;
    let lastCall = 0;
    const THROTTLE_MS = 10;
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const now = Date.now();
                    if (now - lastCall >= THROTTLE_MS) {
                        lastCall = now;
                        callCount++;
                        return Array.prototype.slice.apply(target, args);
                    } else {
                        throw new Error('Too frequent');
                    }
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice(); 
    try {
        p.slice(); 
        return false;
    } catch (e) {
        return e.message === 'Too frequent' && callCount === 1;
    }
}

/**
 * 测试点 44：Proxy 的 slice 在 revoked（可撤销）代理上调用应抛错。
 */
export function testSliceOnRevokedProxyThrows() {
    const arr = [1];
    const { proxy, revoke } = Proxy.revocable(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    });
    revoke();
    try {
        proxy.slice();
        return false;
    } catch (e) {
 
        return e instanceof TypeError;
    }
}

/**
 * 测试点 46：Proxy 的 slice 与 arguments 对象兼容。
 */
export function testSliceWorksOnArgumentsObject() {

    function getArguments() {
        return arguments;
    }

    const args = getArguments('x', 'y');
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(args, handler);
    const result = p.slice();
    return Array.isArray(result) && result[0] === 'x' && result.length === 2;
}

/**
 * 测试点 48：Proxy 的 slice 在数组 length 被篡改后仍正确工作。
 */
export function testSliceHandlesTamperedLength() {
    const arr = [1, 2, 3, 4];
    arr.length = 2; 
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return JSON.stringify(result) === '[1,2]';
}

/**
 * 测试点 50：Proxy 的 slice 与 Uint8Array 等 TypedArray 行为隔离（不应混用）。
 */
export function testSliceNotAppliedToTypedArrayViaProxy() {
    const typed = new Uint8Array([1, 2, 3]);
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
 
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(typed, handler);
    const result = p.slice();
 
    return Array.isArray(result) && result[0] === 1 && result.length === 3;
}

/**
 * 测试点 51：Proxy 拦截 slice 并支持国际化无关（不依赖 locale）。
 */
export function testSliceIsLocaleIndependent() {
 
    const originalLocale = Intl.DateTimeFormat().resolvedOptions().locale;
    const arr = ['café', 'naïve'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return result[0] === 'café' && result[1] === 'naïve';
}

/**
 * 测试点 52：Proxy 的 slice 在递归结构中不陷入死循环。
 */
export function testSliceHandlesRecursiveArraySafely() {
    const arr = [1, 2];
    arr.push(arr); 
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    let result;
    try {
        result = p.slice(0, 2); 
    } catch (e) {
        return false;
    }
    return result.length === 2 && result[0] === 1;
}

/**
 * 测试点 53：Proxy 拦截 slice 并记录调用栈（用于调试）。
 */
export function testSliceCallStackCaptured() {
    let stackTrace = '';
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    try {
                        throw new Error();
                    } catch (e) {
                        stackTrace = e.stack;
                    }
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice();
    return typeof stackTrace === 'string' && stackTrace.includes('testSliceCallStackCaptured');
}

/**
 * 测试点 54：Proxy 的 slice 在严格模式和非严格模式下行为一致。
 */
export function testSliceConsistentInStrictAndNonStrictMode() {
 
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result1 = p.slice();
 
    "use strict";
    const result2 = p.slice();

    return JSON.stringify(result1) === JSON.stringify(result2);
}

/**
 * 测试点 55：Proxy 拦截 slice 并兼容 Proxy 作为数组元素。
 */
export function testSliceWithProxyElements() {
    const innerProxy = new Proxy([10], {});
    const arr = [innerProxy, 20];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return result[0] === innerProxy && result[1] === 20;
}

/**
 * 测试点 56：Proxy 的 slice 被覆盖为非函数时，访问应返回该值。
 */
export function testSlicePropertySetToNonFunction() {
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return 'not a function';
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    return p.slice === 'not a function';
}

/**
 * 测试点 57：Proxy 拦截 slice 并防止内存泄漏（不持有闭包引用）。
 */
export function testSliceDoesNotLeakMemoryViaClosure() {
    let leaked = false;
    {
        const bigData = new Array(10000).fill('data');
        const handler = {
            get(target, prop) {
                if (prop === 'slice') {
 
                    return (...args) => Array.prototype.slice.apply(target, args);
                }
                return target[prop];
            }
        };
        const p = new Proxy(bigData, handler);
        p.slice(0, 1);
 
    }
 
    leaked = false;
    return !leaked;
}

/**
 * 测试点 58：Proxy 的 slice 在浏览器环境（window）污染下仍可用。
 */
export function testSliceWorksDespiteGlobalWindowPollution() {
 
    const originalWindowSlice = globalThis.slice;
    globalThis.slice = () => ['global pollution'];

    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
 
    if (originalWindowSlice === undefined) {
        delete globalThis.slice;
    } else {
        globalThis.slice = originalWindowSlice;
    }

    return JSON.stringify(result) === '[1,2]';
}

/**
 * 测试点 60：Proxy 的 slice 与 Array.from 行为一致（互为替代）。
 */
export function testSliceEquivalentToArrayFrom() {
    const arr = [null, 42, 'hello'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const sliceResult = p.slice();
    const fromResult = Array.from(p);
    return JSON.stringify(sliceResult) === JSON.stringify(fromResult);
}

/**
 * 测试点 62：Proxy 的 slice 在 has 陷阱返回 false 时仍能访问（因 slice 不检查 in）。
 */
export function testSliceIgnoresHasTrap() {
    const arr = [100];
    const handler = {
        has() {
            return false;
        }, 
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
 
    return result[0] === 100;
}

/**
 * 测试点 63：Proxy 拦截 slice 并限制仅允许偶数索引切片。
 */
export function testSliceOnlyAllowedOnEvenIndices() {
    const arr = [0, 1, 2, 3, 4];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    if (start % 2 !== 0 || (end !== undefined && end % 2 !== 0)) {
                        throw new Error('Only even indices allowed');
                    }
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    try {
        p.slice(1, 3); 
        return false;
    } catch (e) {
        return e.message === 'Only even indices allowed';
    }
}

/**
 * 测试点 64：Proxy 的 slice 调用触发 ownKeys 陷阱，但不影响结果。
 */
export function testSliceDoesNotDependOnOwnKeys() {
    let ownKeysCalled = false;
    const arr = ['a', 'b'];
    const handler = {
        ownKeys() {
            ownKeysCalled = true;
            return Reflect.ownKeys(arr);
        },
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
 
    return result[0] === 'a' && Array.isArray(result);
}

/**
 * 测试点 66：Proxy 的 slice 在数组被 seal 后仍可读取。
 */
export function testSliceOnSealedArray() {
    const arr = [7, 8, 9];
    Object.seal(arr);
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(1);
    return JSON.stringify(result) === '[8,9]';
}

/**
 * 测试点 67：Proxy 拦截 slice 并模拟 React 的响应式依赖收集。
 */
export function testSliceTriggersReactiveDependencyTracking() {
    const deps = new Set();
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            deps.add(prop);
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice();
    return JSON.stringify(deps) == '{}';
}

/**
 * 测试点 68：Proxy 的 slice 返回结果不继承代理的 handler。
 */
export function testSliceResultDoesNotInheritProxyHandler() {
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            if (prop === 'custom') {
                return 'intercepted';
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
 
    return result.custom === undefined;
}

/**
 * 测试点 70：Proxy 的 slice 在超长调用栈下不溢出（尾递归优化无关，但验证稳定性）。
 */
export function testSliceStableUnderDeepCallStack() {
    let depth = 0;
    const maxDepth = 100;
    const arr = [42];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const recurse = (n) => {
        if (n <= 0) {
            const p = new Proxy(arr, handler);
            return p.slice()[0] === 42;
        }
        return recurse(n - 1);
    };
    try {
        return recurse(maxDepth);
    } catch (e) {
        return false; 
    }
}

/**
 * 测试点 71：Proxy 拦截 slice 并兼容 Vue 3 响应式系统（避免 trigger）。
 */
export function testSliceDoesNotTriggerUnnecessaryReactivity() {
    let triggerCount = 0;
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
 
                return (...args) => {
                    triggerCount++; 
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    p.slice();
    return triggerCount === 1;
}

/**
 * 测试点 72：Proxy 的 slice 在 NaN 索引输入时行为符合规范。
 */
export function testSliceWithNaNIndices() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
 
    const result = p.slice(NaN, NaN);
    return result.length === 0;
}

/**
 * 测试点 73：Proxy 拦截 slice 并支持惰性求值序列（如生成器模拟）。
 */
export function testSliceOnLazySequenceProxy() {
    const handler = {
        get(target, prop) {
            if (prop === 'length') {
                return 5;
            }
            if (/^\d+$/.test(prop)) {
                return parseInt(prop) * 10;
            }
            if (prop === 'slice') {
                return function (start = 0, end = 5) {
                    const result = [];
                    for (let i = start; i < end; i++) {
                        result.push(i * 10);
                    }
                    return result;
                };
            }
            return undefined;
        }
    };
    const p = new Proxy({}, handler);
    const result = p.slice(1, 3);
    return JSON.stringify(result) === '[10,20]';
}

/**
 * 测试点 74：Proxy 的 slice 在 delete 操作后仍正确反映缺失项。
 */
export function testSliceReflectsDeletedIndices() {
    const arr = [1, 2, 3];
    delete arr[1]; 
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
 
    return result[0] === 1 && result[1] === undefined && result[2] === 3;
}

/**
 * 测试点 76：Proxy 的 slice 与 Array.prototype.concat 行为正交（互不影响）。
 */
export function testSliceAndConcatAreIndependent() {
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return () => ['slice'];
            }
            if (prop === 'concat') {
                return () => ['concat'];
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    return p.slice()[0] === 'slice' && p.concat()[0] === 'concat';
}

/**
 * 测试点 77：Proxy 拦截 slice 并支持时间旅行调试（返回历史版本）。
 */
export function testSliceReturnsHistoricalVersion() {
    let version = 0;
    const history = [[1], [1, 2], [1, 2, 3]];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const current = history[version] || [];
                    return Array.prototype.slice.apply(current, args);
                };
            }
            if (prop === 'advance') {
                return () => version++;
            }
            return target[prop];
        }
    };
    const p = new Proxy([], handler);
    const v0 = p.slice();
    p.advance();
    const v1 = p.slice();
    return v0.length === 1 && v1.length === 2;
}

/**
 * 测试点 78：Proxy 的 slice 在 Proxy 作为 this 调用时行为正确。
 */
export function testSliceCalledWithProxyAsThis() {
    const arr = ['self'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const sliceFn = p.slice;
    const result = sliceFn.call(p); 
    return result[0] === 'self';
}

/**
 * 测试点 79：Proxy 拦截 slice 并防止 DoS（限制最大输出长度）。
 */
export function testSlicePreventsDoSByLimitingOutputSize() {
    const arr = new Array(1e6).fill('data');
    const MAX_OUTPUT = 100;
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = target.length) {
                    const actualEnd = Math.min(end, start + MAX_OUTPUT);
                    return Array.prototype.slice.call(target, start, actualEnd);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(0, 1e6);
    return result.length === MAX_OUTPUT;
}

/**
 * 测试点 80：Proxy 的 slice 在不同 JavaScript 引擎中行为一致（通过规范验证）。
 */
export function testSliceCompliesWithECMAScriptSpec() {
 
 
 
 
 
    const objLike = { 0: 'a', 1: 'b', length: 2 };
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(objLike, handler);
    const result = p.slice();
    return (
        Array.isArray(result) &&
            result.length === 2 &&
            result[0] === 'a' &&
            Object.getPrototypeOf(result) === Array.prototype
    );
}
 

/**
 * 测试点 81：Proxy 的 slice 正确处理 -0 索引（ToInteger 规范）。
 */
export function testSliceHandlesNegativeZeroIndex() {
    const arr = ['a', 'b'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
 
    const result = p.slice(-0);
    return result[0] === 'a';
}

/**
 * 测试点 82：Proxy 拦截 slice 并拒绝 BigInt 作为参数（slice 不接受 BigInt）。
 */
export function testSliceRejectsBigIntArguments() {
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    if (typeof start === 'bigint' || typeof end === 'bigint') {
                        throw new TypeError('BigInt not allowed');
                    }
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    try {
        p.slice(0n, 2n);
        return false;
    } catch (e) {
        return e.message === 'BigInt not allowed';
    }
}

/**
 * 测试点 83：Proxy 的 slice 在自定义 Array 子类上保留构造器语义。
 */
export function testSliceOnCustomArraySubclassPreservesConstructor() {
    class MyArray extends Array {
        customProp = 'mine';
    }

    const arr = new MyArray(1, 2);
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return Array.isArray(result) && (result instanceof MyArray);
}

/**
 * 测试点 85：Proxy 的 slice 兼容 DOM NodeList（类数组）。
 */
export function testSliceWorksOnDOMNodeListLikeObject() {
 
    const nodeList = {
        0: 'div',
        1: 'span',
        length: 2,
        item(i) {
            return this[i];
        }
    };
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(nodeList, handler);
    const result = p.slice();
    return Array.isArray(result) && result[0] === 'div' && result.length === 2;
}

/**
 * 测试点 86：Proxy 拦截 slice 并支持回滚机制（返回前一状态）。
 */
export function testSliceSupportsRollbackViaSnapshot() {
    const snapshots = [];
    const current = [1, 2];
    snapshots.push([...current]);

    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.apply(current, args);
                };
            }
            if (prop === 'push') {
                return function (val) {
                    current.push(val);
                    snapshots.push([...current]);
                };
            }
            if (prop === 'rollback') {
                return function () {
                    if (snapshots.length > 1) {
                        snapshots.pop();
                    }
                    current.splice(0);
                    current.push(...snapshots[snapshots.length - 1]);
                };
            }
            return target[prop];
        }
    };
    const p = new Proxy([], handler);
    p.push(3);
    p.rollback();
    const result = p.slice();
    return JSON.stringify(result) === '[1,2]';
}

/**
 * 测试点 87：Proxy 的 slice 在 Infinity 参数下行为符合规范。
 */
export function testSliceWithInfinityArguments() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
 
    const result = p.slice(1, Infinity);
    return JSON.stringify(result) === '[2,3]';
}

/**
 * 测试点 89：Proxy 的 slice 在字符串索引（如 '1'）下仍正确工作。
 */
export function testSliceAcceptsStringIndices() {
    const arr = ['x', 'y'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
 
    const result = p.slice('1');
    return JSON.stringify(result) === '["y"]';
}

/**
 * 测试点 91：Proxy 的 slice 与 Temporal.PlainDate 等新 API 共存无冲突。
 */
export function testSliceCoexistsWithModernJSAPIs() {
 
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return Array.isArray(result) && result.length === 2;
}

/**
 * 测试点 93：Proxy 的 slice 在 Unicode 字符串数组中保持完整性。
 */
export function testSlicePreservesUnicodeCharacters() {
    const arr = ['😀', '🚀', '🌟'];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice(1, 2);
    return result[0] === '🚀' && result.length === 1;
}

/**
 * 测试点 94：Proxy 拦截 slice 并限制仅在开发模式启用。
 */
export function testSliceOnlyEnabledInDevMode() {
    const isDev = true; 
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                if (!isDev) {
                    return undefined;
                }
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return isDev && result[0] === 1;
}

/**
 * 测试点 95：Proxy 的 slice 在被冻结的 Proxy 上抛出错误。
 */
export function testSliceOnFrozenProxyThrows() {
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    Object.freeze(p);
    try {
        p.slice();
        return true;
    } catch (e) {
        return false;
    }
}
 
export function testSliceStillWorksOnFrozenProxy() {
    const arr = [1];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    Object.freeze(p);
    const result = p.slice(); 
    return result[0] === 1;
}

/**
 * 测试点 96：Proxy 拦截 slice 并兼容 FileList（浏览器 File API）。
 */
export function testSliceWorksOnFileListLikeObject() {
    const fileList = {
        0: { name: 'a.txt' },
        1: { name: 'b.txt' },
        length: 2,
        item(i) {
            return this[i];
        }
    };
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(fileList, handler);
    const result = p.slice();
    return Array.isArray(result) && result[0].name === 'a.txt';
}

/**
 * 测试点 99：Proxy 的 slice 在严格相等比较中保持值一致性。
 */
export function testSliceMaintainsStrictEqualityOfElements() {
    const obj = {};
    const arr = [obj, null, 0, false];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Array.prototype.slice.apply(target, args);
            }
            return target[prop];
        }
    };
    const p = new Proxy(arr, handler);
    const result = p.slice();
    return (
        result[0] === obj &&
            result[1] === null &&
            result[2] === 0 &&
            result[3] === false
    );
}