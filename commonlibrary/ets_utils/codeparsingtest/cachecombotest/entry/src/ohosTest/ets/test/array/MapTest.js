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
 * 测试点 1: 使用 Proxy 拦截数组的读取操作，在 map 中触发 get 陷阱
 * 验证：map 调用时是否能通过 Proxy 的 get 陷阱访问元素
 */
export function testProxyMapGetTrap() {
    let accessedIndices = [];
    const originalArray = [1, 2, 3];
    const proxyArray = new Proxy(originalArray, {
        get(target, prop, receiver) {
            if (typeof prop === 'string' && !isNaN(prop)) {
                accessedIndices.push(Number(prop));
            }
            return Reflect.get(target, prop, receiver);
        }
    });

    const mapped = proxyArray.map(x => x * 2);
 
    const indicesCorrect = accessedIndices.length === 3 &&
        accessedIndices[0] === 0 &&
        accessedIndices[1] === 1 &&
        accessedIndices[2] === 2;
    const resultCorrect = JSON.stringify(mapped) === JSON.stringify([2, 4, 6]);

    return indicesCorrect && resultCorrect;
}

/**
 * 测试点 2: 使用 Proxy 拦截数组的 length 属性，在 map 中是否读取 length
 * 验证：map 是否依赖 Proxy 的 length 属性来确定迭代次数
 */
export function testProxyMapLengthTrap() {
    let lengthAccessed = false;
    const originalArray = [10, 20];
    const proxyArray = new Proxy(originalArray, {
        get(target, prop, receiver) {
            if (prop === 'length') {
                lengthAccessed = true;
            }
            return Reflect.get(target, prop, receiver);
        }
    });

    const mapped = proxyArray.map(x => x + 1);

    const resultCorrect = JSON.stringify(mapped) === JSON.stringify([11, 21]);
    return lengthAccessed && resultCorrect;
}

/**
 * 测试点 3: 使用 Proxy 动态修改数组元素值，在 map 执行期间改变源数据是否影响结果
 * 验证：map 是否在开始前就“快照”了数组内容（实际不会，会实时读取）
 */
export function testProxyMapDynamicModification() {
    const data = [1, 2, 3];
    const proxyArray = new Proxy(data, {
        get(target, prop, receiver) {
            const value = Reflect.get(target, prop, receiver);
 
            if (prop === 1) {
                target[2] = 999;
            }
            return value;
        }
    });

    const result = proxyArray.map((x, i) => {
 
        return x;
    });
 
    return JSON.stringify(result) === JSON.stringify([1, 2, 999]);
}
 

/**
 * 测试点 4: map 是否会触发 Proxy 的 has 陷阱（用于 in 操作符）？
 * 实际上，map 不使用 'in'，所以 should NOT trigger 'has'
 */
export function testProxyMapDoesNotTriggerHasTrap() {
    let hasCalled = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        has(target, prop) {
            hasCalled = true;
            return Reflect.has(target, prop);
        },
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return hasCalled;
}

/**
 * 测试点 5: map 是否会触发 ownKeys 陷阱？
 * 规范中 map 不依赖 Object.keys 或 for-in，因此不应触发 ownKeys
 */
export function testProxyMapDoesNotTriggerOwnKeysTrap() {
    let ownKeysCalled = false;
    const arr = [10, 20];
    const proxy = new Proxy(arr, {
        ownKeys(target) {
            ownKeysCalled = true;
            return Reflect.ownKeys(target);
        },
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);

    return !ownKeysCalled;
}

/**
 * 测试点 6: 在 map 回调中修改原数组（通过 proxy），是否影响当前 map 过程？
 * 注意：map 使用 length + 索引访问，不会重新读取 length 中途变化（除非被 Proxy 劫持）
 */
export function testProxyMapIgnoresLengthChangeDuringIteration() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return 3;
            } 
            if (prop === '1') {
                target.push(99); 
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map((x, i) => x);
 
    return result.length === 3 && result[2] === 3;
}

/**
 * 测试点 8: Proxy 的 get 陷阱中抛出错误，map 是否中断并抛出异常？
 * 验证错误传播
 */
export function testProxyMapPropagatesGetTrapError() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 1) {
                throw new Error('Boom');
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.map(x => x);
        return false;
    } catch (e) {
        return e.message === 'Boom';
    }
}

/**
 * 测试点 9: 使用 Proxy 拦截 Symbol.iterator，map 是否使用它？
 * 答案：否。map 不使用迭代器协议，而是基于 length + 索引
 */
export function testProxyMapDoesNotUseSymbolIterator() {
    let iteratorCalled = false;
    const arr = [7, 8];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === Symbol.iterator) {
                iteratorCalled = true;
                return function* () {
                };
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return !iteratorCalled;
}

/**
 * 测试点 10: 如果 Proxy 返回一个虚假的 length（比如字符串 '2'），map 能否正确处理？
 * 规范：ToLength(length)，会转为数字
 */
export function testProxyMapHandlesStringLength() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return '2';
            } 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 2 && result[1] === 2;
}

/**
 * 测试点 11: 如果 Proxy 的 length 是负数，map 应该视为 0
 */
export function testProxyMapTreatsNegativeLengthAsZero() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return -5;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => {
        throw new Error('Should not run');
    });
    return Array.isArray(result) && result.length === 0;
}

/**
 * 测试点 12: Proxy 的 get 对稀疏数组返回 undefined，map 是否跳过空槽？
 * 注意：map 会遍历所有索引 [0, length)，即使为空槽也会调用回调
 */
export function testProxyMapCallsCallbackOnSparseSlots() {
    let callCount = 0;
    const arr = new Array(3);
    arr[1] = 42;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    proxy.map(() => {
        callCount++;
    });
 
    return callCount === 1;
}

/**
 * 测试点 13: 在 Proxy 的 get 中动态改变 length，map 是否中途停止？
 * 示例：读取 index=1 时将 length 改为 2（原本是 3），是否还读 index=2？
 * 答案：map 在开始前就获取了 length（一次），不会中途重新读
 */
export function testProxyMapUsesInitialLengthOnly() {
    let lengthReadCount = 0;
    let finalLength = 3;
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                lengthReadCount++;
                return finalLength;
            }
            if (prop === '1') {
                finalLength = 2; 
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
 
    return result.length === 3 && lengthReadCount >= 1;
}

/**
 * 测试点 14: Proxy 的 deleteProperty 被调用，map 是否受影响？
 * （本测试不直接调用 delete，但验证如果某个索引被删除，map 是否看到 undefined）
 */
export function testProxyMapSeesDeletedIndicesAsUndefined() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
 
    delete proxy[1];
    const result = proxy.map(x => x === undefined ? 'MISSING' : x);
    return result[0] === 1 && result[1] === undefined && result[2] === 3;
}

/**
 * 测试点 15: map 回调中的 this 指向是否受 Proxy 影响？
 * 答案：不影响。this 由 map 第二个参数或默认 undefined 决定
 */
export function testProxyMapCallbackThisUnaffectedByProxy() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    let callbackThis;
    proxy.map(function () {
        callbackThis = this;
    }, 'CUSTOM_THIS');

    return callbackThis === 'CUSTOM_THIS';
}

/**
 * 测试点 16: 如果 Proxy 的 get 返回非原始值（如对象），map 能否正常处理？
 */
export function testProxyMapHandlesObjectElements() {
    const obj = { val: 100 };
    const arr = [obj];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x.val);
    return result[0] === 100;
}

/**
 * 测试点 17: Proxy 嵌套：map 作用于 Proxy(Proxy(array)) 是否正常？
 */
export function testProxyMapNestedProxies() {
    const arr = [5];
    const inner = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    const outer = new Proxy(inner, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = outer.map(x => x * 2);
    return result[0] === 10;
}

/**
 * 测试点 18: 如果 Proxy 的 get 陷阱对 length 返回非数值（如 {}），map 是否视为 0？
 * ToLength(undefined/NaN/object) => 0
 */
export function testProxyMapInvalidLengthBecomesZero() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return {};
            } 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => {
        throw new Error('should not run');
    });
    return result.length === 0;
}

/**
 * 测试点 19: map 是否会访问 constructor 属性？（某些 polyfill 可能会，但标准不会）
 * 验证标准行为下不访问 constructor
 */
export function testProxyMapDoesNotAccessConstructor() {
    let constructorAccessed = false;
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'constructor') {
                constructorAccessed = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return constructorAccessed;
}

/**
 * 测试点 20: Proxy 的 get 陷阱中修改当前元素，map 是否使用新值？
 * 注意：map 在读取每个索引时实时调用 get，所以可以动态注入
 */
export function testProxyMapUsesDynamicallyModifiedValueInGet() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 0) {
                return 999;
            } 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 999 && result[1] === 2;
}
 

/**
 * 测试点 21: Proxy 拦截 get 并返回 getter 函数，map 是否调用它？
 * 注意：map 读取的是属性值，如果值是函数，不会自动调用
 */
export function testProxyMapDoesNotInvokeGetterFunctions() {
    const obj = { _x: 10 };
    Object.defineProperty(obj, 'x', {
        get() {
            return this._x * 2;
        }
    });
    const arr = [obj];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(item => item.x); 
    return result[0] === 20;
}

/**
 * 测试点 22: 如果 Proxy 的 target 不是数组，但有 length 和索引，map 能否工作？
 * 验证类数组对象通过 Proxy 被 map 处理
 */
export function testProxyMapWorksOnArrayLikeObject() {
    const arrayLike = { 0: 'a', 1: 'b', length: 2 };
    const proxy = new Proxy(arrayLike, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
 
    const result = Array.prototype.map.call(proxy, x => x.toUpperCase());
    return result[0] === 'A' && result[1] === 'B';
}

/**
 * 测试点 23: 在 Proxy 的 get 中修改回调函数参数，map 是否受影响？
 * （本测试验证 map 传递的参数是否可被 Proxy 劫持影响）
 */
export function testProxyMapIndexAndArrayArgsUnaffectedByProxy() {
    const arr = [100];
    let receivedIndex = -1;
    let receivedArray;

    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    proxy.map((value, index, array) => {
        receivedIndex = index;
        receivedArray = array;
    });

    return receivedIndex === 0 && receivedArray === proxy;
}

/**
 * 测试点 24: Proxy 的 get 陷阱中抛出异常，但仅对非索引属性，map 是否仍成功？
 */
export function testProxyMapIgnoresErrorsOnNonIndexProperties() {
    const arr = [42];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'someWeirdProp') {
                throw new Error('Should not be accessed');
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        const result = proxy.map(x => x);
        return result[0] === 42;
    } catch {
        return false;
    }
}

/**
 * 测试点 25: 如果 Proxy 的 length 是 Infinity，map 应该抛出 RangeError
 */
export function testProxyMapThrowsOnInfiniteLength() {
    const arr = [];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return Infinity;
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.map(x => x);
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

/**
 * 测试点 26: Proxy 的 get 返回一个 thenable 对象，map 是否误判为 Promise？
 * 答案：不会，map 是同步的，不处理异步
 */
export function testProxyMapTreatsThenablesAsPlainObjects() {
    const thenable = {
        then: () => {
        }, value: 777
    };
    const arr = [thenable];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x.value);
    return result[0] === 777;
}

/**
 * 测试点 27: 使用 Proxy 拦截 apply（如果 target 是函数），但这里 target 是数组，map 是否安全？
 * 验证即使 Proxy handler 有 apply，也不会被 map 触发
 */
export function testProxyMapIgnoresApplyTrapForArray() {
    let applyCalled = false;
    const arr = [1];
    const proxy = new Proxy(arr, {
        apply() {
            applyCalled = true;
        },
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x + 1);
    return !applyCalled && result[0] === 2;
}

/**
 * 测试点 28: Proxy 的 get 陷阱中返回不同类型的值（如 string vs number），map 是否正确映射？
 */
export function testProxyMapHandlesHeterogeneousTypes() {
    const arr = [1, '2', true, null];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => typeof x);
    return (
        result[0] === 'number' &&
            result[1] === 'string' &&
            result[2] === 'boolean' &&
            result[3] === 'object'
    );
}

/**
 * 测试点 29: 如果 Proxy 的 target 是冻结数组，map 是否仍能读取？
 */
export function testProxyMapWorksOnFrozenArray() {
    const arr = Object.freeze([5, 6]);
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x * 2);
    return result[0] === 10 && result[1] === 12;
}

/**
 * 测试点 30: Proxy 的 get 陷阱中访问 this，是否指向 proxy 本身？
 */
export function testProxyGetTrapThisIsProxy() {
    let thisIsProxy = false;
    const arr = [1];
    const handler = {
        get(target, prop, receiver) {
            if (prop === 0) {
                thisIsProxy = (receiver === proxy);
            }
            return Reflect.get(target, prop, receiver);
        }
    };
    const proxy = new Proxy(arr, handler);

    proxy.map(x => x);
    return thisIsProxy;
}

/**
 * 测试点 31: map 回调中再次调用 map（递归），Proxy 是否保持一致性？
 */
export function testProxyMapRecursiveMap() {
    const arr = [[1], [2]];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(innerArr =>
    innerArr.map(x => x * 10)
    );

    return result[0][0] === 10 && result[1][0] === 20;
}

/**
 * 测试点 32: Proxy 的 get 陷阱中修改全局状态，map 是否按顺序执行？
 */
export function testProxyMapExecutesInOrder() {
    const order = [];
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (!isNaN(prop)) {
                order.push(Number(prop));
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return JSON.stringify(order) === JSON.stringify([0, 1, 2]);
}

/**
 * 测试点 33: 如果 Proxy 的 length 是小数，map 是否使用 floor 值？
 * ToLength(3.9) => 3
 */
export function testProxyMapTruncatesFloatLength() {
    const arr = [1, 2, 3, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return 2.9;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 2 && result[1] === 2;
}

/**
 * 测试点 34: Proxy 的 get 陷阱返回 undefined 对有效索引，map 是否传递 undefined？
 */
export function testProxyMapPassesExplicitUndefined() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 1) {
                return undefined;
            }
            return Reflect.get(target, prop);
        }
    });

    const calledWith = [];
    proxy.map(x => calledWith.push(x));
    return calledWith[0] === 1 && calledWith[1] === undefined;
}

/**
 * 测试点 35: 如果 Proxy 的 target 是 Proxy，且内部 Proxy 抛错，外层是否传播？
 */
export function testProxyMapPropagatesNestedProxyError() {
    const arr = [1];
    const inner = new Proxy(arr, {
        get() {
            throw new Error('Inner error');
        }
    });
    const outer = new Proxy(inner, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    try {
        outer.map(x => x);
        return false;
    } catch (e) {
        return e.message === 'Inner error';
    }
}

/**
 * 测试点 36: Proxy 的 get 陷阱中使用 Symbol 属性，map 是否忽略？
 */
export function testProxyMapIgnoresSymbolProperties() {
    const sym = Symbol('test');
    const arr = [10];
    arr[sym] = 'secret';
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 1 && result[0] === 10;
}

/**
 * 测试点 37: 如果 Proxy 的 length 被定义为不可写，map 是否仍能读取？
 * （Proxy 不关心 target 的属性描述符，只通过 get）
 */
export function testProxyMapReadsLengthRegardlessOfWritable() {
    const arr = [1, 2];
    Object.defineProperty(arr, 'length', { writable: false });
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 2;
}

/**
 * 测试点 38: Proxy 的 get 陷阱返回数组自身（循环引用），map 是否栈溢出？
 * 实际：map 只读索引，不会递归展开
 */
export function testProxyMapHandlesCircularReferenceSafely() {
    const arr = [];
    arr[0] = 'ok';
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'self') {
                return proxy;
            }
            return Reflect.get(target, prop);
        }
    });
 
    const result = proxy.map(x => x);
    return result[0] === 'ok';
}

/**
 * 测试点 39: 在严格模式下，Proxy 的 get 未返回值（即 undefined），map 是否正常？
 * （非严格模式也一样，因为 get 默认返回 undefined）
 */
export function testProxyMapHandlesImplicitUndefinedInGet() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
 
            if (prop === '0') {
 
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
 
 
 
    const proxy2 = new Proxy([5], {
        get(target, prop) {
            return Reflect.get(target, prop); 
        }
    });
    const r = proxy2.map(x => x);
    return r[0] === 5;
}

/**
 * 测试点 40: Proxy 的 get 陷阱中调用原生 map，是否导致无限递归？
 * 示例：get 中触发 map，而 map 又触发 get...
 * 本测试确保在合理使用下不会无限递归
 */
export function testProxyMapDoesNotCauseRecursionInNormalUse() {
    const arr = [1, 2];
    let getCount = 0;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            getCount++;
 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x * 2);
 
    return result.length === 2 && getCount >= 3;
}
 

/**
 * 测试点 41: Proxy 的 get 被调用时，prop 是字符串 '0' 而非数字 0
 */
export function testProxyMapGetTrapReceivesStringIndex() {
    let indexTypeCorrect = true;
    const arr = [10];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '0') {
                indexTypeCorrect = typeof prop === 'string';
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return indexTypeCorrect;
}

/**
 * 测试点 42: 如果数组原型上的 map 被覆盖，Proxy 是否仍使用原始 map？
 * 注意：这里测试的是通过 Proxy 访问 map 方法时的行为
 */
export function testProxyMapUsesOriginalMapEvenIfPrototypeModified() {
    const originalMap = Array.prototype.map;
    Array.prototype.map = function () {
        throw new Error('Should not be called');
    };

    try {
        const arr = [1];
        const proxy = new Proxy(arr, {
            get(target, prop) {
 
                return Reflect.get(target, prop);
            }
        });
 
        const result = originalMap.call(proxy, x => x * 2);
        return result[0] === 2;
    } finally {
        Array.prototype.map = originalMap;
    }
}

/**
 * 测试点 43: Proxy 的 target 是 null 或 undefined？—— 应在创建时就报错，但测试安全边界
 */
export function testProxyMapCannotBeCalledOnNullTarget() {
    try {
 
        const safeArr = [1];
        const proxy = new Proxy(safeArr, {
            get(target, prop) {
                return Reflect.get(target, prop);
            }
        });
        const result = proxy.map(x => x);
        return result.length === 1;
    } catch {
        return false;
    }
}

/**
 * 测试点 44: 使用可撤销 Proxy（revocable），在 map 执行前撤销，是否抛错？
 */
export function testProxyMapFailsOnRevokedProxy() {
    const { proxy, revoke } = Proxy.revocable([1, 2], {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    revoke(); 

    try {
        proxy.map(x => x);
        return false;
    } catch (e) {
 
        return e instanceof TypeError;
    }
}

/**
 * 测试点 45: Proxy 的 get 陷阱中访问 process（Node.js）或 window（浏览器），map 是否受影响？
 * 验证副作用自由性（仅观察是否能安全访问全局）
 */
export function testProxyMapAllowsGlobalAccessInGetTrap() {
    const arr = [1];
    let globalAccessOK = false;
    const proxy = new Proxy(arr, {
        get(target, prop) {
 
            if (typeof globalThis !== 'undefined') {
                globalAccessOK = !!globalThis;
            } else if (typeof window !== 'undefined') {
                globalAccessOK = !!window;
            } else if (typeof global !== 'undefined') {
                globalAccessOK = !!global;
            } else {
                globalAccessOK = true; 
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return globalAccessOK && result[0] === 1;
}

/**
 * 测试点 46: 如果 Proxy 的 length 是一个 getter，map 是否只读一次？
 */
export function testProxyMapReadsLengthGetterOnlyOnce() {
    let lengthReadCount = 0;
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                lengthReadCount++;
                return 3;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return lengthReadCount === 1;
}

/**
 * 测试点 47: 索引为 '-0' 时，Proxy 的 get 是否被调用？（规范中 ToUint32('-0') === 0）
 * map 不会访问 '-0'，只访问 '0'
 */
export function testProxyMapDoesNotAccessNegativeZeroIndex() {
    let accessedNegZero = false;
    const arr = [99];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '-0') {
                accessedNegZero = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return !accessedNegZero;
}

/**
 * 测试点 48: 如果 Proxy 的 get 对 'constructor' 返回恶意值，map 是否受影响？
 * 答案：不影响，map 不依赖 constructor
 */
export function testProxyMapIgnoresMaliciousConstructor() {
    const arr = [5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'constructor') {
                return { prototype: {} };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x * 2);
    return result[0] === 10;
}

/**
 * 测试点 49: Proxy 的 get 陷阱中修改回调函数，map 是否使用新函数？
 * （不能，因为回调在 map 外部传入）
 */
export function testProxyMapCallbackIsNotAffectedByProxy() {
    let multiplier = 2;
    const arr = [3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
 
            multiplier = 100;
            return Reflect.get(target, prop);
        }
    });
 
    const result = proxy.map(x => x * multiplier);
 
 
 
    return result[0] === 300; 
}

/**
 * 测试点 50: 使用 Object.setPrototypeOf(proxy, null)，map 是否仍工作？
 */
export function testProxyMapWorksWhenPrototypeIsNull() {
    const arr = [7];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    Object.setPrototypeOf(proxy, null);
 
    const result = Array.prototype.map.call(proxy, x => x + 1);
    return result[0] === 8;
}

/**
 * 测试点 51: Proxy 的 get 陷阱返回一个具有自定义 toString 的对象，map 是否正常？
 */
export function testProxyMapHandlesCustomToStringObjects() {
    const obj = { value: 42 };
    obj.toString = () => 'CUSTOM';
    const arr = [obj];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x.value);
    return result[0] === 42;
}

/**
 * 测试点 52: 如果 Proxy 的 length 是 BigInt（如 2n），map 是否视为无效（转为 0）？
 */
export function testProxyMapTreatsBigIntLengthAsZero() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return 2n;
            } 
            return Reflect.get(target, prop);
        }
    });

    try {
        const result = proxy.map(x => x);
 
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 55: Proxy 的 get 陷阱返回 Promise，map 是否等待？（答案：否，同步处理）
 */
export function testProxyMapDoesNotAwaitPromises() {
    const prom = Promise.resolve(999);
    const arr = [prom];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x === prom ? 'PROMISE' : 'OTHER');
    return result[0] === 'PROMISE';
}

/**
 * 测试点 56: 在 Proxy 的 get 中调用 console.log，map 是否正常执行？
 * （验证副作用不影响控制流）
 */
export function testProxyMapAllowsConsoleLogInGet() {
    const arr = [1];
    let logged = false;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (typeof console !== 'undefined' && console.log) {
                console.log = () => {
                    logged = true;
                };
            }
            console?.log?.('test');
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 1; 
}

/**
 * 测试点 57: 如果 Proxy 的 target 是 arguments 对象，map 是否工作？
 */
export function testProxyMapWorksOnArgumentsObject() {

    function getArguments() {
        return arguments;
    }

    const args = getArguments(5, 6);
    const proxy = new Proxy(args, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = Array.prototype.map.call(proxy, x => x * 2);
    return result[0] === 10 && result[1] === 12;
}

/**
 * 测试点 58: Proxy 的 get 陷阱中抛出非 Error 对象（如字符串），map 是否传播？
 */
export function testProxyMapPropagatesNonErrorThrow() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get() {
            throw 'String error'; 
        }
    });

    try {
        proxy.map(x => x);
        return false;
    } catch (e) {
        return e === 'String error';
    }
}


/**
 * 测试点 60: Proxy 的 get 陷阱中修改 Array.prototype.map，是否影响当前调用？
 * （不会，因为 map 函数已在调用栈中）
 */
export function testProxyMapUnaffectedByRuntimeMapModification() {
    const originalMap = Array.prototype.map;
    const arr = [3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '0') {
 
                Array.prototype.map = () => {
                    throw new Error('Hijacked!');
                };
            }
            return Reflect.get(target, prop);
        }
    });
 
    const result = originalMap.call(proxy, x => x * 2);
    return result[0] === 6;
}
 

/**
 * 测试点 61: 当 Proxy 的 length 为 2**32 时，map 应抛出 RangeError（超出最大数组长度）
 */
export function testProxyMapThrowsOnMaxLengthPlusOne() {
    const arr = [];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return 2**32;
            } 
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.map(x => x);
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

/**
 * 测试点 62: 如果索引是 Unicode 数字（如 '⁰' U+2070），map 是否将其视为有效索引？
 * 答案：否。只有十进制字符串数字（如 '0', '123'）被 ToUint32 处理
 */
export function testProxyMapIgnoresUnicodeDigitIndices() {
    let accessedSuperscriptZero = false;
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '\u2070') { 
                accessedSuperscriptZero = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.map(x => x);
    return !accessedSuperscriptZero;
}

/**
 * 测试点 63: Proxy 的 get 陷阱中调用 map 递归，深度 100 层是否栈溢出？
 * （本测试只做浅层验证，避免真实崩溃）
 */
export function testProxyMapShallowRecursiveIsSafe() {
    let depth = 0;
    const maxDepth = 3;
    const createProxy = (level) => {
        if (level > maxDepth) {
            return [1];
        }
        const arr = [1];
        return new Proxy(arr, {
            get(target, prop) {
                if (prop === '0' && level === 0) {
 
                    const inner = createProxy(level + 1);
                    Array.prototype.map.call(inner, x => x);
                }
                return Reflect.get(target, prop);
            }
        });
    };

    try {
        const p = createProxy(0);
        const result = p.map(x => x);
        return result[0] === 1;
    } catch {
        return false; 
    }
}

/**
 * 测试点 64: 如果 Proxy 的 target 是 Proxy.revocable().proxy，且内部 handler 抛错，是否传播？
 */
export function testProxyMapPropagatesHandlerErrorInNestedRevocable() {
    const { proxy: inner } = Proxy.revocable([5], {
        get() {
            throw new Error('Handler error');
        }
    });
    const outer = new Proxy(inner, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    try {
        outer.map(x => x);
        return false;
    } catch (e) {
        return e.message === 'Handler error';
    }
}

/**
 * 测试点 65: Proxy 的 get 返回一个具有 Symbol.toPrimitive 的对象，map 是否转换它？
 * （不会，map 不对元素做类型转换）
 */
export function testProxyMapDoesNotInvokeToPrimitive() {
    let toPrimitiveCalled = false;
    const obj = {
        [Symbol.toPrimitive]() {
            toPrimitiveCalled = true;
            return 999;
        },
        value: 42
    };
    const arr = [obj];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x.value);
    return result[0] === 42 && !toPrimitiveCalled;
}

/**
 * 测试点 66: 如果 Proxy 的 length 是 '-0' 字符串，ToLength 应转为 0
 */
export function testProxyMapTreatsStringNegativeZeroLengthAsZero() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return '-0';
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => {
        throw new Error('Should not run');
    });
    return result.length === 0;
}

/**
 * 测试点 67: 在严格模式下，Proxy 的 get 未返回值，map 是否收到 undefined？
 * （与非严格模式行为一致）
 */
export function testProxyMapReceivesUndefinedWhenGetReturnsNothing() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
 
            if (prop === 0) {
 
            } else {
                return Reflect.get(target, prop);
            }
        }
    });

    const values = [];
    proxy.map(x => values.push(x));
    return values[0] === undefined;
}

/**
 * 测试点 68: Proxy 的 get 陷阱中修改回调的闭包变量，map 是否使用新值？
 * （是，因为 JS 是动态作用域引用）
 */
export function testProxyMapUsesUpdatedClosureVariable() {
    let factor = 2;
    const arr = [3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            factor = 10; 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x * factor);
 
    return result[0] === 30;
}

/**
 * 测试点 69: 如果 Proxy 的 target 是 Int8Array 等 TypedArray，map 是否工作？
 * （需通过 call，且 Proxy 必须暴露 length 和索引）
 */
export function testProxyMapWorksOnTypedArrayViaCall() {
    const typed = new Int8Array([10, 20]);
    const proxy = new Proxy(typed, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = Array.prototype.map.call(proxy, x => x + 1);
    return result[0] === 11 && result[1] === 21;
}

/**
 * 测试点 70: Proxy 的 get 对 'length' 返回一个带有 valueOf 的对象，map 是否转换？
 * 示例：{ valueOf() { return 2; } }
 */
export function testProxyMapConvertsLengthObjectWithValueOf() {
    const arr = [1, 2, 3];
    const lenObj = {
        valueOf() {
            return 2;
        }
    };
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return lenObj;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 2;
}

/**
 * 测试点 72: Proxy 的 get 陷阱中访问 arguments.callee（旧语法），map 是否报错？
 * （在严格模式下会报错，但测试在非严格下是否允许）
 */
export function testProxyMapAllowsArgumentsCalleeInNonStrictMode() {
 
 
    const arr = [1];
    let safe = true;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            try {
 
                (function () {
 
                })();
            } catch {
 
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 1;
}

/**
 * 测试点 73: 如果 Proxy 的 length 是 NaN，map 应视为 0
 */
export function testProxyMapTreatsNaNLengthAsZero() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return NaN;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => {
        throw new Error('Should not run');
    });
    return result.length === 0;
}

/**
 * 测试点 74: Proxy 的 get 陷阱中删除自身属性，map 是否看到变化？
 * （map 按索引顺序读取，若在读 index=0 时删 index=1，则 index=1 为 undefined）
 */
export function testProxyMapSeesMidIterationDeletion() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 0) {
                delete target[1]; 
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 1 && result[1] === undefined && result[2] === 3;
}

/**
 * 测试点 75: 如果 Proxy 的 target 是 window（浏览器）或 global（Node），map 是否拒绝？
 * （技术上可行，但 length 通常无意义）
 */
export function testProxyMapOnGlobalObjectReturnsEmpty() {
    let target;
    if (typeof window !== 'undefined') {
        target = window;
    } else if (typeof globalThis !== 'undefined') {
        target = globalThis;
    } else {
        target = {}; 
    }

    const proxy = new Proxy(target, {
        get(t, prop) {
            if (prop === 'length') {
                return 0;
            }
            return Reflect.get(t, prop);
        }
    });

    const result = Array.prototype.map.call(proxy, x => x);
    return Array.isArray(result) && result.length === 0;
}

/**
 * 测试点 76: Proxy 的 get 陷阱返回一个 getter 属性描述符？—— 不会，get 应返回值
 * 本测试验证：若错误返回 descriptor，map 会将其作为普通对象
 */
export function testProxyMapTreatsDescriptorAsPlainObject() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 0) {
                return {
                    get() {
                        return 888;
                    }
                }; 
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => typeof x);
    return result[0] === 'object';
}

/**
 * 测试点 77: 如果 Proxy 的 length 是 '2e0'，map 是否解析为 2？
 * ToLength('2e0') → ToNumber('2e0') → 2 → ToUint32 → 2
 */
export function testProxyMapParsesScientificNotationLength() {
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return '2e0';
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 2 && result[1] === 20;
}

/**
 * 测试点 78: Proxy 的 get 陷阱中使用 with 语句（非严格模式），map 是否允许？
 */
export function testProxyMapAllowsWithStatementInGetTrap() {
    const arr = [1];
    let withWorked = false;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            try {
 
                const obj = { worked: true };
                eval('with (obj) { withWorked = worked; }');
            } catch {
                withWorked = false;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 1; 
}

/**
 * 测试点 79: 如果 Proxy 的 target 是数组子类实例，map 是否保留构造函数？
 * （map 使用 SpeciesConstructor，若 Proxy 不劫持 constructor，则可能失效）
 */
export function testProxyMapRespectsArraySpecies() {
    class MyArray extends Array {
    }

    const arr = new MyArray(1, 2);
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
 
 
    return Array.isArray(result) && result.length === 2;
}

/**
 * 测试点 80: Proxy 的 get 陷阱中触发 GC（理论上），map 是否中断？
 * （无法直接触发 GC，但可模拟长时间运行）
 * 改为：验证即使 get 很慢，map 仍完成
 */
export function testProxyMapCompletesDespiteSlowGetTrap() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
 
            const start = Date.now();
            while (Date.now() - start < 1) {
            } 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x * 10);
    return result[0] === 10 && result[1] === 20;
}
 

/**
 * 测试点 81: Proxy 的 get 陷阱被 Object.freeze(handler) 冻结后，map 是否仍工作？
 */
export function testProxyMapWorksWithFrozenHandler() {
    const arr = [5];
    const handler = {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    };
    Object.freeze(handler);
    const proxy = new Proxy(arr, handler);
    const result = proxy.map(x => x * 2);
    return result[0] === 10;
}

/**
 * 测试点 82: 如果 Proxy 的 target 是 Proxy，且两者 handler 相同，map 是否栈溢出？
 * （不会，因为 get 调用是线性的）
 */
export function testProxyMapHandlesDoubleWrappedProxy() {
    const arr = [1];
    const handler = {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    };
    const p1 = new Proxy(arr, handler);
    const p2 = new Proxy(p1, handler);
    const result = p2.map(x => x + 10);
    return result[0] === 11;
}

/**
 * 测试点 83: Proxy 的 get 陷阱中访问未声明变量（如 window.xxx），map 是否报错？
 * （在严格模式下会 ReferenceError，但 trap 内部错误应传播）
 */
export function testProxyMapPropagatesReferenceErrorFromGetTrap() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get() {
 
            return undeclaredVariableThatDoesNotExist;
        }
    });

    try {
        proxy.map(x => x);
        return false;
    } catch (e) {
        return e instanceof ReferenceError;
    }
}

/**
 * 测试点 84: 如果 Proxy 的 length 是 '0x10'（十六进制字符串），ToLength 应转为 16？
 * 实际：ToNumber('0x10') → 16 → ToLength(16) = 16
 */
export function testProxyMapParsesHexadecimalLengthString() {
    const arr = Array(20).fill(7);
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return '0x10';
            } 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 16 && result[15] === 7;
}

/**
 * 测试点 85: Proxy 的 get 陷阱返回一个 Proxy，map 是否递归展开？（否，视为普通对象）
 */
export function testProxyMapTreatsNestedProxyAsValue() {
    const inner = new Proxy({ value: 99 }, {});
    const arr = [inner];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x.value);
    return result[0] === 99;
}

/**
 * 测试点 86: 在 CSP（内容安全策略）禁止 eval 的环境中，Proxy 的 get 含 eval 是否静默失败？
 * （本测试无法真实模拟 CSP，但验证 eval 抛错是否被捕获）
 */
export function testProxyMapSurvivesEvalErrorInGetTrap() {
    const arr = [1];
    let evalFailed = false;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            try {
 
                eval('1+1');
            } catch {
                evalFailed = true;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 1; 
}

/**
 * 测试点 88: Proxy 的 get 陷阱中修改 Array.prototype，map 是否受影响？
 * （不影响当前执行，因 map 已绑定）
 */
export function testProxyMapUnaffectedByPrototypeMutationDuringExecution() {
    const originalJoin = Array.prototype.join;
    const arr = [2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '0') {
                Array.prototype.join = () => 'hijacked';
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x * 3);
    Array.prototype.join = originalJoin;
    return result[0] === 6;
}

/**
 * 测试点 89: 如果 Proxy 的 length 是一个 getter 抛出异常，map 是否立即失败？
 */
export function testProxyMapFailsImmediatelyOnLengthGetterThrow() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get() {
            throw new Error('Length access denied');
        }
    });

    try {
        proxy.map(x => x);
        return false;
    } catch (e) {
        return e.message === 'Length access denied';
    }
}

/**
 * 测试点 90: Proxy 的 get 陷阱返回非标准属性（如 __defineGetter__），map 是否忽略？
 */
export function testProxyMapIgnoresLegacyNonStandardProperties() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '__defineGetter__') {
                return () => {
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 1;
}

/**
 * 测试点 91: 如果 Proxy 的 target 是 arguments 对象且 strict mode，map 是否正常？
 */
export function testProxyMapWorksOnStrictModeArguments() {
    "use strict";

    function f() {
        const proxy = new Proxy(arguments, {
            get(target, prop) {
                return Reflect.get(target, prop);
            }
        });
        return Array.prototype.map.call(proxy, x => x * 2);
    }

    const result = f(3, 4);
    return result[0] === 6 && result[1] === 8;
}


/**
 * 测试点 93: 如果 Proxy 的 length 是 -1，ToLength 应转为 0
 */
export function testProxyMapTreatsNegativeLengthAsZero1() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return -1;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => {
        throw new Error('Should not run');
    });
    return result.length === 0;
}

/**
 * 测试点 94: Proxy 的 get 陷阱返回一个具有 enumerable: false 的属性值？—— 不相关
 * 改为：验证 map 不关心属性是否可枚举（因为它按索引访问）
 */
export function testProxyMapIgnoresEnumerableAttribute() {
    const obj = {};
    Object.defineProperty(obj, '0', { value: 42, enumerable: false });
    Object.defineProperty(obj, 'length', { value: 1 });
    const proxy = new Proxy(obj, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = Array.prototype.map.call(proxy, x => x);
    return result[0] === 42;
}

/**
 * 测试点 95: 如果 Proxy 的 target 是冻结的类数组，map 是否只读？
 */
export function testProxyMapReadsFrozenArrayLikeObject() {
    const obj = { 0: 100, length: 1 };
    Object.freeze(obj);
    const proxy = new Proxy(obj, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = Array.prototype.map.call(proxy, x => x + 1);
    return result[0] === 101;
}

/**
 * 测试点 96: Proxy 的 get 陷阱中触发 console.assert(false)，map 是否中断？
 * （不会，console.assert 不抛错，除非配置）
 */
export function testProxyMapContinuesDespiteConsoleAssertFailure() {
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (typeof console !== 'undefined' && console.assert) {
                console.assert(false, 'This is fine');
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result[0] === 1;
}

/**
 * 测试点 97: 如果 Proxy 的 length 是 Boolean(true)，ToLength → 1
 */
export function testProxyMapConvertsBooleanLengthToNumber() {
    const arr = [99, 88];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return true;
            } 
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x);
    return result.length === 1 && result[0] === 99;
}

/**
 * 测试点 98: Proxy 的 get 陷阱返回一个跨 realm 的数组（如 iframe.contentWindow.Array），map 是否处理？
 * （无法真实创建跨 realm，但可模拟：返回一个具有不同 constructor 的数组）
 */
export function testProxyMapHandlesCrossRealmLikeArray() {
    const foreignArray = (function () {
 
        const arr = [777];
        arr.constructor = { name: 'ForeignArray' };
        return arr;
    })();
    const arr = [foreignArray];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => Array.isArray(x) ? x[0] : null);
    return result[0] === 777;
}

/**
 * 测试点 99: 如果 Proxy 的 get 陷阱是箭头函数（无 this），map 是否正常？
 */
export function testProxyMapWorksWhenGetTrapIsArrowFunction() {
    const arr = [5];
    const handler = {
        get: (target, prop) => Reflect.get(target, prop)
    };
    const proxy = new Proxy(arr, handler);
    const result = proxy.map(x => x + 1);
    return result[0] === 6;
}

/**
 * 测试点 100: 最终验证 —— 所有之前行为在 Symbol.iterator 存在时是否改变？
 * （map 不使用迭代器，所以应无影响）
 */
export function testProxyMapIgnoresCustomSymbolIterator() {
    const arr = [10];
    arr[Symbol.iterator] = null; 
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.map(x => x * 2);
    return result[0] === 20;
}

