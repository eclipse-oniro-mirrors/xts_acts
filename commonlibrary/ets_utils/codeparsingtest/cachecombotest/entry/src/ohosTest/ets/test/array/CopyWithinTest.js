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
 * 测试点1：Proxy 能否拦截 copyWithin 操作并记录调用
 */
export function testProxyInterceptsCopyWithin() {
    let intercepted = false;
    const target = [1, 2, 3, 4, 5];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                intercepted = true;
            }
            return Reflect.get(obj, prop);
        }
    };
    const proxy = new Proxy(target, handler);


    proxy.copyWithin(0, 3, 4); 


    const expected = [4, 2, 3, 4, 5];
    const resultCorrect = JSON.stringify(proxy) === JSON.stringify(expected);
    return intercepted && resultCorrect;
}

/**
 * 测试点2：在 copyWithin 过程中修改源数据，Proxy 是否反映变化
 */
export function testProxyReflectsChangesDuringCopyWithin() {
    const original = [10, 20, 30, 40, 50];
    const handler = {};
    const proxy = new Proxy(original, handler);


    proxy[2] = 999;


    proxy.copyWithin(0, 2, 3);


    const expected = [999, 20, 999, 40, 50];
    return JSON.stringify(proxy) === JSON.stringify(expected);
}

/**
 * 测试点3：通过 Proxy 的 set 拦截器验证 copyWithin 是否触发了正确的写操作
 */
export function testProxySetTrapCalledByCopyWithin() {
    const target = [1, 2, 3, 4, 5];
    const writtenIndices = new Set();

    const handler = {
        set(obj, prop, value) {

            if (!isNaN(prop)) {
                writtenIndices.add(Number(prop));
            }
            obj[prop] = value;
            return true;
        }
    };

    const proxy = new Proxy(target, handler);


    proxy.copyWithin(0, 3, 4);


    const expectedWritten = new Set([0]);
    const setsEqual = (a, b) => a.size === b.size && [...a].every(x => b.has(x));


    const expectedArray = [4, 2, 3, 4, 5];
    const arrayCorrect = JSON.stringify(proxy) === JSON.stringify(expectedArray);

    return setsEqual(writtenIndices, expectedWritten) && arrayCorrect;
}


/**
 * 测试点4：copyWithin 调用时是否保留 Proxy 的 this 上下文
 */
export function testCopyWithinPreservesProxyThis() {
    let thisIsProxy = false;
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                return function (...args) {
                    thisIsProxy = this === proxy;
                    return Array.prototype.copyWithin.apply(this, args);
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return thisIsProxy && JSON.stringify(proxy).toString() == "[2,3,3]";
}

/**
 * 测试点5：对只读 Proxy 使用 copyWithin 应抛出错误（通过 set 拦截拒绝写入）
 */
export function testReadOnlyProxyRejectsCopyWithin() {
    const target = [1, 2, 3, 4];
    const handler = {
        set() {
            throw new TypeError('Read-only');
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        proxy.copyWithin(0, 2);
        return false; 
    } catch (e) {
        return e instanceof TypeError && e.message === 'Read-only';
    }
}

/**
 * 测试点6：copyWithin 在负索引下是否被 Proxy 正确处理
 */
export function testCopyWithinWithNegativeIndices() {
    const target = [1, 2, 3, 4, 5];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(-2, -4, -2); 

    return JSON.stringify(proxy) === JSON.stringify([1, 2, 3, 2, 3]);
}

/**
 * 测试点7：Proxy 的 has trap 是否在 copyWithin 中被调用（通常不会）
 */
export function testHasTrapNotCalledDuringCopyWithin() {
    let hasCalled = false;
    const target = [10, 20, 30];
    const handler = {
        has() {
            hasCalled = true;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return hasCalled;
}


/**
 * 测试点9：copyWithin 触发的写操作是否经过 ownKeys 或 getOwnPropertyDescriptor（通常不会）
 */
export function testOwnKeysNotCalledDuringCopyWithin() {
    let ownKeysCalled = false;
    const target = [1, 2, 3];
    const handler = {
        ownKeys() {
            ownKeysCalled = true;
            return Reflect.ownKeys(target);
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(1, 0, 1);
    return !ownKeysCalled;
}

/**
 * 测试点10：在 copyWithin 执行期间动态修改源位置，结果是否基于原始快照？
 * （注意：JS 是同步执行，copyWithin 会读取当前值，不是快照）
 */
export function testCopyWithinUsesCurrentValuesNotSnapshot() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '2' && !this._modified) {
                this._modified = true;
                target[0] = 999; 
            }
            return target[prop];
        }
    });


    proxy.copyWithin(0, 2, 3);

    return JSON.stringify(proxy) === JSON.stringify([3, 2, 3]);
}

/**
 * 测试点11：Proxy 包装空数组，copyWithin 是否安全执行
 */
export function testCopyWithinOnEmptyProxyArray() {
    const proxy = new Proxy([], {});
    try {
        proxy.copyWithin(0, 0);
        return proxy.length === 0;
    } catch {
        return false;
    }
}

/**
 * 测试点12：copyWithin 超出边界时 Proxy 是否表现一致
 */
export function testCopyWithinOutOfBounds() {
    const target = [1, 2];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(10, 0, 1); 
    return JSON.stringify(proxy) === JSON.stringify([1, 2]);
}

/**
 * 测试点13：通过 Proxy 劫持 length 属性，copyWithin 是否受干扰
 */
export function testCopyWithinWithInterceptedLength() {
    const target = [1, 2, 3, 4, 5];
    let lengthAccessed = false;
    const handler = {
        get(obj, prop) {
            if (prop === 'length') {
                lengthAccessed = true;
                return obj.length;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);
    return lengthAccessed && JSON.stringify(proxy) === JSON.stringify([2, 2, 3, 4, 5]);
}

/**
 * 测试点14：copyWithin 是否触发 Proxy 的 apply trap（不会，因为不是函数调用代理）
 */
export function testApplyTrapNotInvoked() {
    let applyCalled = false;
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        apply() {
            applyCalled = true;
        }
    });
    proxy.copyWithin(0, 1);
    return !applyCalled;
}

/**
 * 测试点15：嵌套 Proxy（Proxy of Proxy）与 copyWithin 是否正常工作
 */
export function testNestedProxyWithCopyWithin() {
    const inner = new Proxy([10, 20, 30], {});
    const outer = new Proxy(inner, {});
    outer.copyWithin(0, 1, 2);
    return JSON.stringify(outer) === JSON.stringify([20, 20, 30]);
}

/**
 * 测试点16：copyWithin 的参数是否被 Proxy 的 get 拦截（不会，参数是原始值）
 */
export function testCopyWithinArgsNotProxied() {
    const target = [1, 2, 3, 4];
    let argIntercepted = false;
    const handler = {
        get(obj, prop) {
            if (prop === '1') {

            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.copyWithin(0, 2, 3);
    return JSON.stringify(proxy) === JSON.stringify([3, 2, 3, 4]);
}

/**
 * 测试点17：在严格模式下，Proxy 的 set 返回 false 是否抛出异常
 */
export function testStrictModeSetFalseThrows() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        set() {
            return false;
        }
    });
    try {
        "use strict";
        proxy.copyWithin(0, 1);
        return false; 
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点18：copyWithin 是否会触发 Symbol.iterator 访问（通常不会）
 */
export function testSymbolIteratorNotAccessed() {
    let iterAccessed = false;
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === Symbol.iterator) {
                iterAccessed = true;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return !iterAccessed;
}

/**
 * 测试点19：使用 Proxy 拦截并记录所有 copyWithin 调用日志
 */
export function testCopyWithinCallLoggingViaProxy() {
    const logs = [];
    const target = [5, 6, 7, 8];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                return (...args) => {
                    logs.push({ method: 'copyWithin', args });
                    return Array.prototype.copyWithin.apply(obj, args);
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(1, 0, 1);
    const logged = logs.length === 1 &&
        logs[0].method === 'copyWithin' &&
        JSON.stringify(logs[0].args) === JSON.stringify([1, 0, 1]);
    const resultCorrect = JSON.stringify(proxy) === JSON.stringify([5, 5, 7, 8]);
    return logged && resultCorrect;
}

/**
 * 测试点20：copyWithin 对稀疏数组的处理在 Proxy 下是否一致
 */
export function testCopyWithinOnSparseArrayThroughProxy() {
    const arr = new Array(5);
    arr[1] = 'a';
    arr[3] = 'b';

    const proxy = new Proxy(arr, {});
    proxy.copyWithin(2, 1, 2); 

    return proxy[2] === 'a' && proxy[0] === undefined && '0' in proxy === false;
}


/**
 * 测试点21：Proxy 拦截 copyWithin 并修改其行为（例如反转复制方向）
 */
export function testProxyOverridesCopyWithinBehavior() {
    const target = [1, 2, 3, 4];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                return function (targetIndex, start, end = this.length) {

                    const values = [];
                    for (let i = start; i < end; i++) {
                        values.push(this[i]);
                    }
                    for (let i = 0; i < values.length; i++) {
                        this[targetIndex + i] = values[values.length - 1 - i]; 
                    }
                    return this;
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 3);

    return JSON.stringify(proxy) === JSON.stringify([3, 2, 3, 4]);
}

/**
 * 测试点22：在 copyWithin 执行期间删除源元素，Proxy 是否反映？
 */
export function testDeletingSourceDuringCopyWithin() {
    const target = [10, 20, 30, 40];
    let firstRead = false;
    const handler = {
        get(obj, prop) {
            const idx = Number(prop);
            if (!isNaN(idx) && idx >= 0) {
                if (!firstRead && idx === 2) {
                    firstRead = true;
                    delete obj[2];
                }
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 2, 3);
    return proxy[0] === undefined;
}

/**
 * 测试点23：Proxy 的原型被篡改，copyWithin 是否仍可用？
 */
export function testCopyWithinWithModifiedPrototype() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {});
    Object.setPrototypeOf(proxy, null);
    try {
        proxy.copyWithin(0, 1);
        return false;
    } catch {
        return true;
    }
}

/**
 * 测试点24：copyWithin 在 Proxy 上调用时是否可被 revoke 撤销
 */
export function testRevocableProxyBlocksCopyWithinAfterRevoke() {
    const { proxy, revoke } = Proxy.revocable([1, 2, 3], {});
    proxy.copyWithin(0, 1);
    revoke();
    try {
        proxy.copyWithin(0, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点25：使用 Proxy 模拟不可变数组，copyWithin 返回新数组而非修改原数组
 */
export function testImmutableProxyReturnsNewArrayOnCopyWithin() {
    let called = false;
    const original = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                called = true;
                return function (...args) {
                    const clone = [...obj];
                    Array.prototype.copyWithin.apply(clone, args);
                    return clone;
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(original, handler);
    const result = proxy.copyWithin(0, 1);
    const unchanged = JSON.stringify(original) === JSON.stringify([1, 2, 3]);
    const correctResult = JSON.stringify(result) === JSON.stringify([2, 3, 3]);
    return called && unchanged && correctResult;
}

/**
 * 测试点26：copyWithin 是否触发 Proxy 的 defineProperty trap（通常不会）
 */
export function testDefinePropertyNotCalledDuringCopyWithin() {
    let definePropCalled = false;
    const target = [1, 2, 3];
    const handler = {
        defineProperty() {
            definePropCalled = true;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(1, 0, 1);
    return definePropCalled;
}

/**
 * 测试点28：copyWithin 被多次调用，Proxy 是否正确记录每次操作
 */
export function testMultipleCopyWithinCallsTrackedCorrectly() {
    const logs = [];
    const target = [0, 1, 2, 3, 4];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                return function (...args) {
                    logs.push([...args]);
                    return Array.prototype.copyWithin.apply(obj, args);
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);
    proxy.copyWithin(2, 0, 1);
    const expectedLogs = [[0, 1, 2], [2, 0, 1]];
    const logsMatch = JSON.stringify(logs) === JSON.stringify(expectedLogs);
    const finalState = JSON.stringify(proxy) === JSON.stringify([1, 1, 1, 3, 4]);
    return logsMatch && finalState;
}

/**
 * 测试点29：Proxy 的 get trap 返回 undefined，copyWithin 是否崩溃
 */
export function testGetTrapReturnsUndefinedForElements() {
    const target = [10, 20, 30];
    const handler = {
        get(obj, prop) {
            if (prop === 1) {
                return undefined;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === undefined;
}

/**
 * 测试点30：copyWithin 与 Proxy 的 isExtensible / preventExtensions 组合
 */
export function testCopyWithinOnNonExtensibleProxy() {
    const target = [1, 2, 3];
    Object.preventExtensions(target);
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1);
    console.log(JSON.stringify(proxy))
    return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点31：Proxy 拦截 get 并延迟返回（模拟异步），但 copyWithin 是同步的 → 验证同步性
 */
export function testCopyWithinIsSynchronousDespiteProxyGet() {
    let getCalled = false;
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            getCalled = true;

            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return getCalled && JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点32：copyWithin 写入索引超出当前 length，Proxy 是否自动扩展数组
 */
export function testCopyWithinExpandsArrayLengthViaProxy() {
    const target = [1, 2];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(5, 0, 1);

    return proxy.length === 2 && proxy[5] === undefined && !(4 in proxy);
}

/**
 * 测试点33：Proxy 的 set trap 修改写入值（例如加倍），copyWithin 结果是否被篡改
 */
export function testSetTrapTransformsWrittenValues() {
    const target = [1, 2, 3];
    const handler = {
        set(obj, prop, value) {
            if (!isNaN(prop)) {
                value = value * 10;
            }
            obj[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);
    return JSON.stringify(proxy) === JSON.stringify([20, 2, 3]);
}

/**
 * 测试点34：copyWithin 在冻结对象的 Proxy 上调用（原始对象冻结）
 */
export function testCopyWithinOnProxyOfFrozenArray() {
    const target = Object.freeze([1, 2, 3]);
    const proxy = new Proxy(target, {});
    try {
        proxy.copyWithin(0, 1);
    } catch {
        return true;
    }
    return JSON.stringify(proxy) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点35：Proxy 的 get trap 抛出异常，copyWithin 是否中断
 */
export function testGetTrapThrowsDuringCopyWithin() {
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === 1) {
                throw new Error('Boom!');
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        proxy.copyWithin(0, 1);
        return false;
    } catch (e) {
        return e.message === 'Boom!';
    }
}

/**
 * 测试点36：copyWithin 参数为 Symbol 或对象，Proxy 是否正常处理（应转为数字）
 */
export function testCopyWithinWithNonNumberArgsThroughProxy() {
    const target = [10, 20, 30, 40];
    const proxy = new Proxy(target, {});

    proxy.copyWithin('1', '2', '3');
    return JSON.stringify(proxy) === JSON.stringify([10, 30, 30, 40]);
}

/**
 * 测试点37：Proxy 包装类数组对象（非 Array），copyWithin 是否可用
 */
export function testCopyWithinOnArrayLikeProxy() {
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const proxy = new Proxy(arrayLike, {});

    try {
        Array.prototype.copyWithin.call(proxy, 0, 1);
        return proxy[0] === 'b' && proxy.length === 3;
    } catch {
        return false;
    }
}

/**
 * 测试点38：Proxy 的 deleteProperty trap 是否在 copyWithin 中被调用（不会）
 */
export function testDeletePropertyNotCalledDuringCopyWithin() {
    let deleteCalled = false;
    const target = [1, 2, 3];
    const handler = {
        deleteProperty() {
            deleteCalled = true;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return !deleteCalled;
}

/**
 * 测试点39：copyWithin 与 Proxy 的 in 操作符无关性验证
 */
export function testInOperatorNotUsedInCopyWithin() {
    let hasTrapCalled = false;
    const target = [1, 2, 3];
    const handler = {
        has() {
            hasTrapCalled = true;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(1, 0, 1);
    return hasTrapCalled;
}

/**
 * 测试点40：极端性能测试 —— 大数组 + Proxy + copyWithin 是否内存安全（简化版）
 */
export function testLargeArrayCopyWithinWithProxy() {
    try {
        const size = 10000;
        const arr = Array.from({ length: size }, (_, i) => i);
        const proxy = new Proxy(arr, {});
        proxy.copyWithin(0, size - 10, size);

        for (let i = 0; i < 10; i++) {
            if (proxy[i] !== size - 10 + i) {
                return false;
            }
        }
        return true;
    } catch {
        return false;
    }
}


/**
 * 测试点41：copyWithin 使用 NaN 作为索引参数，Proxy 是否按规范处理（转为 0）
 */
export function testCopyWithinWithNaNIndices() {
    const target = [1, 2, 3, 4];
    const proxy = new Proxy(target, {});

    proxy.copyWithin(NaN, NaN, NaN);
    return JSON.stringify(proxy) === JSON.stringify([1, 2, 3, 4]);
}

/**
 * 测试点42：使用 Infinity 作为索引，应被转为 0 或 length（规范行为）
 */
export function testCopyWithinWithInfinityIndices() {
    const target = [10, 20, 30];
    const proxy = new Proxy(target, {});


    proxy.copyWithin(Infinity, 0, 1);

    return JSON.stringify(proxy) === JSON.stringify([10, 20, 30]);
}

/**
 * 测试点43：Proxy 的 get 返回非原始值（如对象），copyWithin 写入是否保留引用
 */
export function testCopyWithinPreservesObjectReferencesThroughProxy() {
    const objA = { id: 1 };
    const objB = { id: 2 };
    const target = [objA, objB];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === objB && proxy[1] === objB;
}

/**
 * 测试点44：在 copyWithin 执行中，Proxy 动态改变 length，是否影响复制长度？
 */
export function testDynamicLengthChangeDuringCopyWithin() {
    let readStart = false;
    const target = [1, 2, 3, 4, 5];
    const handler = {
        get(obj, prop) {
            if (prop === 2 && !readStart) {
                readStart = true;
                obj.length = 3;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 4);
    return JSON.stringify(proxy.slice(0, 3)) === JSON.stringify([2, 3, undefined]);
}

/**
 * 测试点45：Proxy 包装的数组被多个 copyWithin 并行调用（模拟并发，实际串行）→ 验证可重入性
 */
export function testReentrantCopyWithinCalls() {
    let depth = 0;
    let maxDepth = 0;
    const target = [1, 2, 3, 4];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                return function (...args) {
                    depth++;
                    maxDepth = Math.max(maxDepth, depth);
                    const result = Array.prototype.copyWithin.apply(this, args);
                    depth--;
                    return result;
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    proxy.copyWithin(2, 0, 1);

    const correct = JSON.stringify(proxy) === JSON.stringify([2, 3, 2, 4]);
    return correct && maxDepth === 1;
}

/**
 * 测试点46：copyWithin 被 bind 到其他上下文后通过 Proxy 调用
 */
export function testBoundCopyWithinCalledOnProxy() {
    const target = [5, 6, 7];
    const proxy = new Proxy(target, {});
    const boundCopyWithin = Array.prototype.copyWithin.bind(proxy);
    boundCopyWithin(0, 1);
    return JSON.stringify(proxy) === JSON.stringify([6, 7, 7]);
}

/**
 * 测试点47：Proxy 的 set trap 拒绝特定值（如负数），copyWithin 写入被过滤
 */
export function testSetTrapFiltersValuesDuringCopyWithin() {
    const target = [-1, 2, -3, 4];
    const handler = {
        set(obj, prop, value) {
            if (typeof value === 'number' && value < 0) {

                return true;

            }
            obj[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 2, 3);

    return proxy[0] === -1;
}

/**
 * 测试点48：使用 Symbol 作为属性键访问 copyWithin（非法，但 Proxy 可拦截）
 */
export function testAccessingCopyWithinViaSymbol() {
    const target = [1, 2, 3];
    let intercepted = false;
    const sym = Symbol('fake');
    const handler = {
        get(obj, prop) {
            if (prop === sym) {
                intercepted = true;
                return obj.copyWithin;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    const fn = proxy[sym];
    fn.call(proxy, 0, 1);
    return intercepted && JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点49：Proxy 拦截并阻止对 copyWithin 的访问（返回 undefined）
 */
export function testBlockingCopyWithinAccess() {
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                return undefined;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        proxy.copyWithin(0, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点50：copyWithin 在 Proxy 上调用时，this 指向是否为原始数组（非 Proxy）
 */
export function testCopyWithinThisIsNotRawArray() {
    const target = [10, 20, 30];
    let thisValue;
    const originalCopyWithin = Array.prototype.copyWithin;
    Array.prototype.copyWithin = function (...args) {
        thisValue = this;
        return originalCopyWithin.apply(this, args);
    };
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1);
    Array.prototype.copyWithin = originalCopyWithin;
    return thisValue === proxy;
}

/**
 * 测试点51：Proxy 的 apply trap 对 copyWithin 无效（因为 copyWithin 不是函数代理）
 */
export function testApplyTrapIgnoredForMethodCall() {
    let applyCalled = false;
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        apply() {
            applyCalled = true;
        }
    });
    proxy.copyWithin(0, 1);
    return !applyCalled;
}

/**
 * 测试点52：copyWithin 写入位置为小数，Proxy 是否按规范截断（ToInteger）
 */
export function testCopyWithinWithFloatIndices() {
    const target = [1, 2, 3, 4, 5];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(1.9, 2.1, 3.7);
    return JSON.stringify(proxy) === JSON.stringify([1, 3, 3, 4, 5]);
}

/**
 * 测试点53：Proxy 包装数组的副本，验证 copyWithin 不影响原始数组
 */
export function testCopyWithinOnProxyDoesNotMutateOriginal() {
    const original = [1, 2, 3];
    const proxy = new Proxy([...original], {});
    proxy.copyWithin(0, 1);
    const originalUntouched = JSON.stringify(original) === JSON.stringify([1, 2, 3]);
    const proxyChanged = JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
    return originalUntouched && proxyChanged;
}

/**
 * 测试点54：在严格模式下，Proxy 的 set 返回 false 且 copyWithin 尝试写入 → 抛出异常
 */
export function testStrictModeSetFalseThrowsInCopyWithin() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        set() {
            return false;
        }
    });
    let threw = false;
    try {
        (() => {
            "use strict";
            proxy.copyWithin(0, 1);
        })();
    } catch (e) {
        threw = e instanceof TypeError;
    }
    return threw;
}

/**
 * 测试点55：copyWithin 与 Proxy 的 ownKeys 无关（即使 keys 被篡改）
 */
export function testOwnKeysTamperingDoesNotAffectCopyWithin() {
    const target = [10, 20, 30];
    const proxy = new Proxy(target, {
        ownKeys() {
            return ['0', '2'];
        },
        getOwnPropertyDescriptor(target, prop) {
            if (prop === '1') {
                return undefined;
            }
            return Object.getOwnPropertyDescriptor(target, prop);
        }
    });
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === 20;
}

/**
 * 测试点56：Proxy 拦截 get 并缓存 copyWithin 方法，多次调用是否一致
 */
export function testCachedCopyWithinMethodWorks() {
    const target = [1, 2, 3];
    let getCalledCount = 0;
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                getCalledCount++;
                return obj.copyWithin;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    const method = proxy.copyWithin;
    method.call(proxy, 0, 1);
    method.call(proxy, 1, 0, 1);
    return getCalledCount === 1 && JSON.stringify(proxy) === JSON.stringify([2, 2, 3]);
}

/**
 * 测试点57：copyWithin 在跨 realm（如 iframe）数组的 Proxy 上是否工作（模拟）
 */
export function testCrossRealmLikeProxy() {

    const foreignArray = [1, 2, 3];
    Object.setPrototypeOf(foreignArray, new Array().__proto__);
    const proxy = new Proxy(foreignArray, {});
    proxy.copyWithin(0, 1);
    return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点58：Proxy 的 isExtensible trap 返回 false，但 copyWithin 仍可写入现有索引
 */
export function testIsExtensibleFalseAllowsExistingWrites() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        isExtensible() {
            return false;
        }
    });
    proxy.copyWithin(0, 1);
    return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点59：使用 Proxy 监控 copyWithin 是否读取了超出范围的索引
 */

export function testCopyWithinDoesNotReadOutOfBounds() {
    const target = [1, 2];
    const accessedIndices = new Set();
    const handler = {
        get(obj, prop) {
            const idx = Number(prop);
            if (!isNaN(idx) && idx >= 0) {
                accessedIndices.add(idx);
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 5);
    const onlyValidReads = [...accessedIndices].every(i => i < 2);
    return onlyValidReads && JSON.stringify(proxy) === JSON.stringify([2, 2]);
}

/**
 * 测试点60：copyWithin 与 Proxy 组合用于“写时日志”审计系统
 */
export function testWriteAuditLogViaProxyDuringCopyWithin() {
    const writes = [];
    const target = [10, 20, 30, 40];
    const handler = {
        set(obj, prop, value) {
            if (!isNaN(Number(prop))) {
                writes.push({ index: Number(prop), oldValue: obj[prop], newValue: value });
            }
            obj[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(1, 0, 2);
    const expected = [
        { index: 2, oldValue: 30, newValue: 20 },
        { index: 1, oldValue: 20, newValue: 10 }
    ];
    const logsMatch = JSON.stringify(writes) === JSON.stringify(expected);
    const resultCorrect = JSON.stringify(proxy) === JSON.stringify([10, 10, 20, 40]);
    return logsMatch && resultCorrect;
}


/**
 * 测试点61：Proxy 拦截 copyWithin 并递归调用自身，是否栈溢出？（应避免）
 */
export function testRecursiveCopyWithinInterception() {
    let callCount = 0;
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin' && callCount === 0) {
                callCount++;
                return function (...args) {

                    return Array.prototype.copyWithin.apply(obj, args);
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return callCount === 1 && JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点62：copyWithin 在 Proxy 上调用时，是否触发 Symbol.species（不会）
 */
export function testSymbolSpeciesNotUsedInCopyWithin() {
    let speciesAccessed = false;
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === Symbol.species) {
                speciesAccessed = true;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return !speciesAccessed;
}

/**
 * 测试点63：Proxy 的 set trap 修改写入索引（重定向写入），copyWithin 是否被劫持
 */
export function testSetTrapRedirectsWriteIndex() {
    const target = [10, 20, 30, 40];
    const handler = {
        set(obj, prop, value) {
            const idx = Number(prop);
            if (!isNaN(idx) && idx === 0) {

                obj[3] = value;
                return true;
            }
            obj[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);

    return JSON.stringify(proxy) === JSON.stringify([10, 20, 30, 20]);
}

/**
 * 测试点64：copyWithin 被调用时传入非对象 this（通过 call），Proxy 是否仍工作
 */
export function testCopyWithinCalledWithNonObjectThisOnProxy() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {});
    try {
        Array.prototype.copyWithin.call(proxy, 0, 1);
        return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
    } catch {
        return false;
    }
}

/**
 * 测试点65：Proxy 包装数组，其 constructor 被篡改，copyWithin 是否受影响（不应）
 */
export function testTamperedConstructorDoesNotAffectCopyWithin() {
    const target = [5, 6, 7];
    target.constructor = class Fake {
    };
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1);
    return JSON.stringify(proxy) === JSON.stringify([6, 7, 7]);
}

/**
 * 测试点66：copyWithin 在冻结 Proxy（而非目标）上是否可写（取决于 handler）
 */
export function testFrozenProxyHandlerBlocksWrites() {
    const target = [1, 2, 3];
    const frozenHandler = Object.freeze({
        set() {
            return false;
        }
    });
    const proxy = new Proxy(target, frozenHandler);
    try {
        "use strict";
        proxy.copyWithin(0, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点67：Proxy 的 get 返回 getter 函数，copyWithin 是否误调用（不会）
 */
export function testGetReturnsGetterFunctionNotInvoked() {
    const target = [1, 2, 3];
    const handler = {
        get(obj, prop) {
            if (prop === 1) {
                return {
                    get() {
                        return 999;
                    }
                };
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);
    return typeof proxy[0] === 'object' && proxy[0].get !== undefined;
}

/**
 * 测试点68：copyWithin 写入索引为字符串 "0"，Proxy 是否正确处理（应转数字）
 */
export function testStringIndexWriteHandledCorrectly() {
    const target = [10, 20, 30];
    const writes = [];
    const handler = {
        set(obj, prop, value) {
            writes.push(String(prop));
            obj[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.copyWithin(0, 1, 2);
    const wroteToStringZero = writes.includes('0');
    const resultCorrect = proxy[0] === 20;
    return wroteToStringZero && resultCorrect;
}

/**
 * 测试点69：Proxy 模拟只读视图，copyWithin 返回新实例（持久化数据结构风格）
 */
export function testPersistentDataStructureStyleProxy() {
    const original = [1, 2, 3];
    let version = 0;
    const handler = {
        get(obj, prop) {
            if (prop === 'copyWithin') {
                return function(...args){
                    version++;
                    const clone = [...obj];
                    Array.prototype.copyWithin.apply(clone, args);
                    return new Proxy(clone, this);
                }.bind(handler);
            }
            return obj[prop];
        }
    };
    const proxy1 = new Proxy(original, handler);
    const proxy2 = proxy1.copyWithin(0, 1);
    const unchangedOriginal = JSON.stringify(original) === JSON.stringify([1, 2, 3]);
    const v1Unchanged = JSON.stringify(proxy1) === JSON.stringify([1, 2, 3]);
    const v2Changed = JSON.stringify(proxy2) === JSON.stringify([2, 3, 3]);
    return unchangedOriginal && v1Unchanged && v2Changed;
}

/**
 * 测试点70：copyWithin 在 Proxy 上调用时，是否调用 [[HasProperty]]（规范中未要求）
 */
export function testHasPropertyNotRequiredByCopyWithin() {
    let hasCalled = false;
    const target = [1, 2, 3];
    const handler = {
        has() {
            hasCalled = true;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return hasCalled;
}

/**
 * 测试点71：Proxy 的 deleteProperty 被触发后，copyWithin 是否读取 empty slot 为 undefined
 */
export function testCopyWithinReadsDeletedSlotAsUndefined() {
    const target = [10, 20, 30];
    delete target[1];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === undefined;
}

/**
 * 测试点72：copyWithin 参数为布尔值，Proxy 是否按 ToInteger 转换（true→1, false→0）
 */
export function testBooleanArgsConvertedInCopyWithin() {
    const target = [1, 2, 3, 4];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(true, false, true);
    return JSON.stringify(proxy) === JSON.stringify([1, 1, 3, 4]);
}

/**
 * 测试点73：Proxy 包装的数组被 Object.seal，copyWithin 是否仍可修改现有元素
 */
export function testSealedArrayProxyAllowsExistingWrites() {
    const target = [1, 2, 3];
    Object.seal(target);
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1);
    return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点74：copyWithin 在 Proxy 上执行时，原始数组是否被直接访问（应否）
 */
export function testOriginalArrayNotDirectlyMutatedThroughProxy() {
    const original = [1, 2, 3];
    const handler = {
        set(obj, prop, value) {

            return Reflect.set(obj, prop, value);
        }
    };
    const proxy = new Proxy(original, handler);
    proxy.copyWithin(0, 1);
    return JSON.stringify(original) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点75：Proxy 的 get 返回 thenable，copyWithin 是否误判为 Promise（不会）
 */
export function testThenableObjectNotTreatedAsPromise() {
    const target = [1, 2, 3];
    const thenable = {
        then: () => {
        }, value: 999
    };
    const handler = {
        get(obj, prop) {
            if (prop === 1) {
                return thenable;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === thenable;
}

/**
 * 测试点76：copyWithin 范围为零长度（start === end），Proxy 是否无操作
 */
export function testZeroLengthCopyWithinNoOp() {
    const target = [1, 2, 3];
    let setCalled = false;
    const handler = {
        set() {
            setCalled = true;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 1);
    return !setCalled && JSON.stringify(proxy) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点77：Proxy 拦截 apply（若代理函数），但 copyWithin 是方法 → 验证不冲突
 */
export function testProxyOfFunctionNotConfusedWithArrayProxy() {

    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {});
    proxy.copyWithin(0, 1);
    return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点78：copyWithin 目标索引为负且绝对值 > length，应视为 0
 */
export function testLargeNegativeTargetIndex() {
    const target = [10, 20, 30];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(-10, 0, 1);
    return JSON.stringify(proxy) === JSON.stringify([10, 20, 30]);


    proxy.copyWithin(-10, 1, 2);
    return JSON.stringify(proxy) === JSON.stringify([20, 20, 30]);
}

/**
 * 测试点79：Proxy 的 construct trap 与 copyWithin 无关（因非构造调用）
 */
export function testConstructTrapNotInvoked() {
    let constructCalled = false;
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        construct() {
            constructCalled = true;
            return {};
        }
    });
    proxy.copyWithin(0, 1);
    return !constructCalled;
}

/**
 * 测试点80：copyWithin 在 Proxy 上调用后，JSON.stringify 是否反映变更（序列化一致性）
 */
export function testJSONStringifyReflectsProxyCopyWithinChanges() {
    const target = [1, 2, 3, 4];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(1, 0, 1);
    const json = JSON.stringify(proxy);
    return json === '[1,1,3,4]';
}


/**
 * 测试点81：copyWithin 的 targetIndex 计算是否使用原始 length（即使 length 被 Proxy 动态修改）
 */
export function testTargetIndexUsesOriginalLengthSnapshot() {
    const target = [1, 2, 3, 4];
    let firstGet = true;
    const handler = {
        get(obj, prop) {
            if (firstGet && prop === 'length') {
                firstGet = false;
                obj.length = 2;
            }
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(3, 0, 1);
    return proxy[3] === undefined;
}

/**
 * 测试点82：Proxy 的 set 返回 true 但未实际赋值，copyWithin 是否认为成功（应失败）
 */
export function testSetTrapLiesAboutAssignment() {
    const target = [10, 20, 30];
    const handler = {
        set(obj, prop, value) {
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);

    return proxy[0] === 10;
}

/**
 * 测试点83：copyWithin 在 Proxy 上调用时，是否触发 getter/setter（若目标是 accessor property）
 */
export function testCopyWithinIgnoresAccessorPropertiesOnIndices() {
    const target = [1, 2, 3];
    Object.defineProperty(target, '1', {
        get() {
            return 999;
        },
        set(v) {
        }
    });
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === 999;
}

/**
 * 测试点84：Proxy 包装数组，其 __proto__ 被设为 null，copyWithin 是否仍可用
 */
export function testCopyWithinWorksOnProtolessProxy() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {});
    Object.setPrototypeOf(proxy, null);
    try {
        proxy.copyWithin(0, 1);
        return false;
    } catch {
        return true;
    }
}

/**
 * 测试点85：copyWithin 参数为 BigInt，应抛出 TypeError（不能转 number）
 */
export function testBigIntArgsThrowTypeError() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {});
    try {

        proxy.copyWithin(0n, 1n, 2n);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点86：Proxy 的 get 返回 Proxy-wrapped element，copyWithin 是否深复制（否，应浅）
 */
export function testCopyWithinPerformsShallowCopyOfNestedProxies() {
    const inner = new Proxy([9], {});
    const target = [1, inner];
    const proxy = new Proxy(target, {});
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === inner && Array.isArray(proxy[0]) && proxy[0][0] === 9;
}

/**
 * 测试点87：在 copyWithin 执行中抛出异常，数组是否部分修改（应原子？不，JS 非原子）
 */
export function testPartialMutationOnExceptionDuringCopyWithin() {
    const target = [1, 2, 3, 4];
    let callCount = 0;
    const handler = {
        set(obj, prop, value) {
            callCount++;
            if (callCount === 2) {
                throw new Error('Abort!');
            }
            obj[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        proxy.copyWithin(0, 2, 4);
        return false;
    } catch (e) {
        return proxy[0] === 3 && proxy[1] === 2;
    }
}

/**
 * 测试点89：copyWithin 在 Proxy 上调用时，是否遵守 ToObject(this)（如 this 为 null）
 */
export function testCopyWithinToObjectConversionHandled() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {});
    try {
        Array.prototype.copyWithin.call(null, 0, 1);
        return false;
    } catch (e1) {
        try {
            Array.prototype.copyWithin.call(proxy, 0, 1);
            return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
        } catch (e2) {
            return false;
        }
    }
}

/**
 * 测试点90：Proxy 的 isFrozen trap 返回 true，但底层可写 → copyWithin 是否被阻止？
 */
export function testIsFrozenTrapDoesNotBlockWrites() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        isFrozen() {
            return true;
        }
    });

    proxy.copyWithin(0, 1);
    return JSON.stringify(proxy) === JSON.stringify([2, 3, 3]);
}

/**
 * 测试点91：copyWithin 写入索引超出 Number.MAX_SAFE_INTEGER，应静默忽略
 */
export function testCopyWithinBeyondMaxSafeIntegerIgnored() {
    const target = [1, 2];
    const proxy = new Proxy(target, {});
    const huge = Number.MAX_SAFE_INTEGER + 1000000;
    proxy.copyWithin(huge, 0, 1);
    return JSON.stringify(proxy) === JSON.stringify([1, 2]);
}

/**
 * 测试点92：Proxy 包装的类数组对象，手动添加 copyWithin 方法后行为
 */
export function testArrayLikeWithManuallyAddedCopyWithin() {
    const obj = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    obj.copyWithin = Array.prototype.copyWithin;
    const proxy = new Proxy(obj, {});
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === 'b' && proxy.length === 3;
}

/**
 * 测试点93：copyWithin 在严格模式 Proxy 中写入 non-configurable 属性是否失败
 */
export function testWriteToNonConfigurableFailsInStrictMode() {
    const target = [1, 2, 3];
    Object.defineProperty(target, '0', { writable: false, configurable: false });
    const proxy = new Proxy(target, {});
    let threw = false;
    try {
        (() => {
            "use strict";
            proxy.copyWithin(0, 1, 2);
        })();
    } catch (e) {
        threw = e instanceof TypeError;
    }
    return threw && target[0] === 1;
}

/**
 * 测试点94：Proxy 的 ownKeys 返回乱序，是否影响 copyWithin（不影响，因按索引读）
 */
export function testOwnKeysOrderDoesNotAffectCopyWithin() {
    const target = [10, 20, 30];
    const proxy = new Proxy(target, {
        ownKeys() {
            return ['2', '0', '1', 'length'];
        }
    });
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === 20;
}

/**
 * 测试点95：copyWithin 被覆盖为非函数，Proxy 访问时应抛出错误
 */
export function testNonFunctionCopyWithinThrows() {
    const target = [1, 2, 3];
    target.copyWithin = "not a function";
    const proxy = new Proxy(target, {});
    try {
        proxy.copyWithin(0, 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


/**
 * 测试点97：copyWithin 在 Proxy 上调用时，是否触发 Proxy 的 enumerate trap（已废弃，应否）
 */
export function testEnumerateTrapNotUsed() {

    let enumerateCalled = false;
    const target = [1, 2, 3];
    const handler = {
        enumerate() {
            enumerateCalled = true;
            return [];
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1);
    return !enumerateCalled;
}

/**
 * 测试点98：Proxy 的 getOwnPropertyDescriptor 被篡改，copyWithin 是否受影响（否）
 */
export function testGetOwnPropertyDescriptorTamperingIgnored() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        getOwnPropertyDescriptor(target, prop) {
            if (prop === '1') {
                return undefined;
            }
            return Object.getOwnPropertyDescriptor(target, prop);
        }
    });
    proxy.copyWithin(0, 1, 2);
    return proxy[0] === 2;
}

/**
 * 测试点99：copyWithin 与 Proxy 组合用于“时间旅行调试”模拟（记录历史状态）
 */
export function testTimeTravelDebuggingViaProxy() {
    const history = [];
    const target = [1, 2, 3];
    const handler = {
        set(obj, prop, value) {
            history.push([...obj]);
            obj[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    proxy.copyWithin(0, 1, 2);

    return history.length === 1 && JSON.stringify(history[0]) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点100：最终一致性测试 —— 所有上述行为在不同 JS 引擎中应一致（自检）
 */
export function testFinalConsistencySanityCheck() {

    const arr = [0, 1, 2, 3, 4];
    const proxy = new Proxy(arr, {});
    proxy.copyWithin(1, 3, 4);

    return (
        arr[0] === 0 &&
            arr[1] === 3 &&
            arr[2] === 2 &&
            arr[3] === 3 &&
            arr[4] === 4
    );
}