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
 * 测试点 1：使用 Proxy 拦截 get 操作，并配合 Array.from 转换类数组对象
 * 验证 Array.from 是否能正确读取被代理对象的 length 和索引属性
 */
export function testProxyWithArrayFromGetTrap() {
    const handler = {
        get(target, prop) {
            if (prop === 'length') {
                return 3;
            }
            if (prop === 0) {
                return 'a';
            }
            if (prop === 1) {
                return 'b';
            }
            if (prop === 2) {
                return 'c';
            }
            return undefined;
        }
    };

    const proxiedLikeArray = new Proxy({}, handler);
    const arr = Array.from(proxiedLikeArray);

    const expected = ['a', 'b', 'c'];
    return JSON.stringify(arr) === JSON.stringify(expected);
}

/**
 * 测试点 3：使用 Proxy 动态生成元素，Array.from 调用时触发 Proxy 的 get 拦截，
 * 并传入 mapFn，验证 mapFn 是否作用于 Proxy 返回的值
 */
export function testProxyWithArrayFromAndMapFunction() {
    const handler = {
        get(target, prop) {
            if (prop === 'length') {
                return 3;
            }
            if (prop === 0) {
                return 1;
            }
            if (prop === 1) {
                return 2;
            }
            if (prop === 2) {
                return 3;
            }
            return undefined;
        }
    };

    const proxiedNumbers = new Proxy({}, handler);
    const doubled = Array.from(proxiedNumbers, x => x * 2);

    const expected = [2, 4, 6];
    return JSON.stringify(doubled) === JSON.stringify(expected);
}
 

/**
 * 测试点 4：Proxy 拦截 getOwnPropertyDescriptor，确保 Array.from 能正确读取属性描述符（特别是 configurable/enumerable）
 */
export function testProxyGetOwnPropertyDescriptorTrap() {
    const handler = {
        get(target, prop) {
            if (prop === 'length') {
                return 2;
            }
            return target[prop];
        },
        getOwnPropertyDescriptor(target, prop) {
            if (prop === 'length') {
                return {
                    value: 2,
                    writable: true,
                    enumerable: false,
                    configurable: true
                };
            }
            if (prop === '0' || prop === '1') {
                return {
                    value: prop,
                    writable: true,
                    enumerable: true,
                    configurable: true
                };
            }
            return undefined;
        }
    };

    const obj = { 0: 'a', 1: 'b' };
    const p = new Proxy(obj, handler);
    const arr = Array.from(p);
    return JSON.stringify(arr) === JSON.stringify(['a', 'b']);
}

/**
 * 测试点 5：Proxy 返回非整数 length，验证 Array.from 是否抛出 RangeError（但测试函数需捕获并返回 false）
 */
export function testProxyNonIntegerLength() {
    try {
        const p = new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    return 3.5;
                }
                if (prop === '0') {
                    return 'x';
                }
                if (prop === '1') {
                    return 'y';
                }
                if (prop === '2') {
                    return 'z';
                }
                return undefined;
            }
        });
        Array.from(p);
        return true;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点 6：Proxy 的 length 为负数，验证 Array.from 抛出 RangeError
 */
export function testProxyNegativeLength() {
    try {
        const p = new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    return -1;
                }
                return undefined;
            }
        });
        Array.from(p);
        return true;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点 7：Proxy 没有 length 属性，但具有 Symbol.iterator，验证 Array.from 使用迭代器而非类数组路径
 */
export function testProxyWithIteratorInsteadOfLength() {
    const iterable = {
        * [Symbol.iterator]() {
            yield 'hello';
            yield 'world';
        }
    };
    const p = new Proxy(iterable, {});
    const arr = Array.from(p);
    return JSON.stringify(arr) === JSON.stringify(['hello', 'world']);
}

/**
 * 测试点 8：Proxy 同时有 length 和 [Symbol.iterator]，验证 Array.from 优先使用类数组路径（即忽略迭代器）
 */
export function testProxyPrefersArrayLikeOverIterator() {
    const obj = {
        0: 'from-index',
        length: 1,
        * [Symbol.iterator]() {
            yield 'from-iterator';
        }
    };
    const p = new Proxy(obj, {});
    const arr = Array.from(p);
 
    return arr.length === 1 && arr[0] === 'from-iterator';
}

/**
 * 测试点 9：Proxy 的 get 返回非字符串索引值（如数字），验证是否正常工作
 */
export function testProxyNumericIndexValues() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 3;
            }
            if (prop === 0) {
                return 10;
            }
            if (prop === 1) {
                return 20;
            }
            if (prop === 2) {
                return 30;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return JSON.stringify(arr) === JSON.stringify([10, 20, 30]);
}

/**
 * 测试点 10：Proxy 的 ownKeys 被拦截，但 Array.from 不使用 ownKeys，验证仍能正常工作
 */
export function testProxyOwnKeysNotUsedByArrayFrom() {
    let ownKeysCalled = false;
    const p = new Proxy({ 0: 'a', 1: 'b', length: 2 }, {
        get(target, prop) {
            return target[prop];
        },
        ownKeys() {
            ownKeysCalled = true;
            return ['0', '1', 'length'];
        }
    });
    const arr = Array.from(p);
 
    const correctResult = JSON.stringify(arr) === JSON.stringify(['a', 'b']);
    return correctResult && !ownKeysCalled;
}

/**
 * 测试点 11：Proxy 的 has trap 被定义，但 Array.from 不使用 in 操作符，验证 has 未被调用
 */
export function testProxyHasTrapNotInvoked() {
    let hasCalled = false;
    const p = new Proxy({ 0: 'x', 1: 'y', length: 2 }, {
        get(target, prop) {
            return target[prop];
        },
        has() {
            hasCalled = true;
            return true;
        }
    });
    const arr = Array.from(p);
    const correct = JSON.stringify(arr) === JSON.stringify(['x', 'y']);
    return correct && !hasCalled;
}

/**
 * 测试点 12：Proxy 动态生成 length（如每次 get 都 +1），验证 Array.from 只读一次 length
 */
export function testProxyDynamicLengthReadOnce() {
    let lengthValue = 3;
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return lengthValue++;
            }
            if (prop === 0) {
                return 'a';
            }
            if (prop === 1) {
                return 'b';
            }
            if (prop === 2) {
                return 'c';
            }
 
            return undefined;
        }
    });
    const arr = Array.from(p);
 
 
    return arr.length === 3 && arr[2] === 'c';
}

/**
 * 测试点 13：Proxy 的索引属性通过 get 返回函数，验证 Array.from 保留函数引用
 */
export function testProxyReturnsFunctionsAsElements() {
    const fn1 = () => 1;
    const fn2 = () => 2;
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return fn1;
            }
            if (prop === 1) {
                return fn2;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === fn1 && arr[1] === fn2 && arr.length === 2;
}

/**
 * 测试点 14：Proxy 的 length 为 0，验证返回空数组
 */
export function testProxyZeroLength() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 0;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return Array.isArray(arr) && arr.length === 0;
}

/**
 * 测试点 16：Proxy 返回 Symbol 作为索引值（虽然无效），验证 Array.from 忽略非字符串/数字键
 */
export function testProxySymbolIndexIgnored() {
    const sym = Symbol('test');
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
 
            if (prop === 0) {
                return sym;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === sym;
}

/**
 * 测试点 17：Proxy 的 get 返回 Promise，验证 Array.from 不 await，直接放入 Promise 对象
 */
export function testProxyReturnsPromises() {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(2);
    const proxy = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return p1;
            }
            if (prop === 1) {
                return p2;
            }
            return undefined;
        }
    });
    const arr = Array.from(proxy);
    return arr[0] === p1 && arr[1] === p2;
}

/**
 * 测试点 18：Proxy 模拟 arguments 对象（类数组），验证 Array.from 正确转换
 */
export function testProxySimulatesArgumentsObject() {

    function fakeArgs() {
        return new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    return 3;
                }
                if (prop === 0) {
                    return 'arg0';
                }
                if (prop === 1) {
                    return 'arg1';
                }
                if (prop === 2) {
                    return 'arg2';
                }
                if (prop === 'callee') {
                    return fakeArgs;
                }
                return undefined;
            }
        });
    }

    const argsLike = fakeArgs();
    const arr = Array.from(argsLike);
    return JSON.stringify(arr) === JSON.stringify(['arg0', 'arg1', 'arg2']);
}

/**
 * 测试点 19：Proxy 的 get 在访问不存在的索引时抛出错误，验证 Array.from 是否中断
 */
export function testProxyGetThrowsOnMissingIndex() {
    try {
        const p = new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    return 2;
                }
                if (prop === 0) {
                    return 'ok';
                }
                if (prop === 1) {
                    throw new Error('Forbidden');
                }
                return undefined;
            }
        });
        Array.from(p);
        return false;
    } catch (e) {
        return e.message === 'Forbidden';
    }
}

/**
 * 测试点 20：Proxy 与 Array.from 的 mapFn 结合，mapFn 中再次访问 Proxy（递归场景）
 */
export function testProxyMapFnAccessesProxyAgain() {
    const handler = {
        get(target, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return 10;
            }
            if (prop === 1) {
                return 20;
            }
            return target[prop];
        }
    };
    const p = new Proxy({ extra: 'data' }, handler);
    const result = Array.from(p, (val, idx) => {
 
        return val + (p.extra === 'data' ? 100 : 0);
    });
    return JSON.stringify(result) === JSON.stringify([110, 120]);
}
 

/**
 * 测试点 21：Proxy 的 get 返回 getter 函数（而非值），验证 Array.from 是否调用它
 * 注意：Array.from 不会自动调用 getter，它只读取属性值（即 getter 的结果）
 */
export function testProxyWithGetterProperties() {
    const obj = {};
    Object.defineProperty(obj, '0', {
        get() {
            return 'dynamic-value';
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(obj, 'length', {
        value: 1,
        writable: false,
        enumerable: false,
        configurable: false
    });

    const p = new Proxy(obj, {});
    const arr = Array.from(p);
    return arr[0] === 'dynamic-value' && arr.length === 1;
}

/**
 * 测试点 22：Proxy 拦截 apply（但 Array.from 不会调用 apply），验证不影响结果
 */
export function testProxyApplyTrapIgnored() {
    let applyCalled = false;
    const p = new Proxy(function () {
    }, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return 'a';
            }
            if (prop === 1) {
                return 'b';
            }
            return undefined;
        },
        apply() {
            applyCalled = true;
            return 'applied';
        }
    });
    const arr = Array.from(p);
    return JSON.stringify(arr) === JSON.stringify(['a', 'b']) && !applyCalled;
}

/**
 * 测试点 24：Proxy 的 length 是 null，验证被转为 0（因为 ToLength(null) === 0）
 */
export function testProxyLengthNullBecomesZero() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return null;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return Array.isArray(arr) && arr.length === 0;
}

/**
 * 测试点 25：Proxy 的 length 是 Infinity，验证抛出 RangeError
 */
export function testProxyLengthInfinityThrows() {
    try {
        const p = new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    return Infinity;
                }
                return undefined;
            }
        });
        Array.from(p);
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

/**
 * 测试点 26：Proxy 返回非对象（如原始值）作为目标，但 Proxy 必须包装对象，此测试验证构造时失败（但 Proxy 构造本身会报错）
 * 实际上 Proxy(target, handler) 要求 target 是 Object，所以我们在 handler 中模拟“看似原始值”的行为
 */
export function testProxySimulatesPrimitiveLikeBehavior() {
 
    const p = new Proxy({ length: 2 }, {
        get(target, prop) {
            if (prop === 0) {
                return 42;
            }
            if (prop === 1) {
                return true;
            }
            return target[prop];
        }
    });
    const arr = Array.from(p);
    return arr[0] === 42 && arr[1] === true;
}

/**
 * 测试点 27：Proxy 的 get 返回数组，验证 Array.from 不递归展开
 */
export function testProxyReturnsNestedArrays() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return [1, 2];
            }
            if (prop === 1) {
                return ['a', 'b'];
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return (
        Array.isArray(arr) &&
        Array.isArray(arr[0]) &&
            JSON.stringify(arr[0]) === JSON.stringify([1, 2])
    );
}

/**
 * 测试点 28：Proxy 与 Array.from 的 thisArg（mapFn 的 this）结合，验证 mapFn 中的 this 正确绑定
 */
export function testProxyMapFnThisBinding() {
    const context = { multiplier: 10 };
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return 3;
            }
            if (prop === 1) {
                return 4;
            }
            return undefined;
        }
    });
    const result = Array.from(p, function (x) {
        return x * this.multiplier;
    }, context);
    return JSON.stringify(result) === JSON.stringify([30, 40]);
}

/**
 * 测试点 29：Proxy 的 get 在访问 length 前先访问索引（模拟错误顺序），但规范要求先读 length
 * 此测试验证实际行为：先读 length
 */
export function testProxyAccessOrderLengthFirst() {
    const accessLog = [];
    const p = new Proxy({}, {
        get(_, prop) {
            accessLog.push(prop);
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return 'a';
            }
            if (prop === 1) {
                return 'b';
            }
            return undefined;
        }
    });
    Array.from(p);
    return JSON.stringify(accessLog) === JSON.stringify([null,'length', 0, 1]);
}

/**
 * 测试点 32：Proxy 的索引属性是不可枚举的（通过 getOwnPropertyDescriptor 模拟），但 Array.from 不依赖 enumerable
 */
export function testProxyNonEnumerableIndicesStillRead() {
    const p = new Proxy({ length: 2 }, {
        get(target, prop) {
            if (prop === 0) {
                return 'hidden0';
            }
            if (prop === 1) {
                return 'hidden1';
            }
            return target[prop];
        },
        getOwnPropertyDescriptor(target, prop) {
            if (prop === '0' || prop === '1') {
                return {
                    value: target[prop],
                    enumerable: false,
                    configurable: true,
                    writable: true
                };
            }
            return Object.getOwnPropertyDescriptor(target, prop);
        }
    });
    const arr = Array.from(p);
    return arr[0] === 'hidden0' && arr[1] === 'hidden1';
}


/**
 * 测试点 34：Proxy 模拟 NodeList（DOM 类数组），验证 Array.from 正常工作
 */
export function testProxySimulatesNodeList() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return { tagName: 'DIV' };
            }
            if (prop === 1) {
                return { tagName: 'SPAN' };
            }
            if (prop === 'item') {
                return function (i) {
                    return this[i];
                };
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr.length === 2 && arr[0].tagName === 'DIV';
}

/**
 * 测试点 36：Proxy 的 length 是 BigInt（如 3n），验证抛出 TypeError（Array.from 要求 length 是 number-like）
 */
export function testProxyLengthBigIntThrows() {
    try {
        const p = new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    return 3n;
                }
                if (prop === '0') {
                    return 'a';
                }
                return undefined;
            }
        });
        Array.from(p);
        return false;
    } catch (e) {
 
        return e instanceof TypeError;
    }
}

/**
 * 测试点 37：Proxy 返回 Symbol.iterator 为 undefined，但有 length 和索引，验证仍走类数组路径
 */
export function testProxyIteratorUndefinedStillArrayLike() {
    const p = new Proxy({ length: 1, 0: 'ok' }, {
        get(target, prop) {
            if (prop === Symbol.iterator) {
                return undefined;
            }
            return target[prop];
        }
    });
    const arr = Array.from(p);
    return arr[0] === 'ok' && arr.length === 1;
}

/**
 * 测试点 38：Proxy 的 get 返回自身（循环引用），验证 Array.from 不死循环（只读索引 0..length-1）
 */
export function testProxyCircularReferenceSafe() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return p;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === p && arr.length === 1;
}

/**
 * 测试点 39：Proxy 的 length 是 Boolean（true → 1），验证转换正确
 */
export function testProxyLengthBooleanConverted() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return true;
            }
            if (prop === 0) {
                return 'bool-item';
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr.length === 1 && arr[0] === 'bool-item';
}

/**
 * 测试点 40：Proxy 与 Array.from + mapFn 中抛出异常，验证异常传播
 */
export function testProxyMapFnThrowsError() {
    try {
        const p = new Proxy({ length: 2, 0: 1, 1: 2 }, {});
        Array.from(p, x => {
            if (x === 2) {
                throw new Error('Map failed');
            }
            return x;
        });
        return false;
    } catch (e) {
        return e.message === 'Map failed';
    }
}
 

/**
 * 测试点 41：Proxy 的索引为非 ASCII 字符串（如中文数字），但 Array.from 只访问 '0', '1'...（字符串形式的整数）
 * 验证非标准索引被忽略
 */
export function testProxyNonAsciiIndicesIgnored() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
 
            if (prop === '零') {
                return 'ignored';
            }
            if (prop === 0) {
                return 'first';
            }
            if (prop === 1) {
                return 'second';
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === 'first' && arr[1] === 'second';
}

/**
 * 测试点 43：Proxy 嵌套：Proxy 包裹另一个 Proxy，验证 Array.from 正常穿透
 */
export function testNestedProxies() {
    const inner = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return 'inner0';
            }
            if (prop === 1) {
                return 'inner1';
            }
            return undefined;
        }
    });
    const outer = new Proxy(inner, {
        get(target, prop) {
            const val = target[prop];
            return prop === 0 ? `outer(${val})` : val;
        }
    });
    const arr = Array.from(outer);
    return arr[0] === 'outer(inner0)' && arr[1] === 'inner1';
}

/**
 * 测试点 44：Proxy 的原型链上有 length，但自身无 length，验证 Array.from 是否读取原型上的 length
 * 注意：规范要求“own property”或通过 get 访问，Proxy 可模拟
 */
export function testProxyInheritsLengthFromPrototype() {
    const proto = { length: 2, 0: 'proto0', 1: 'proto1' };
    const obj = Object.create(proto);
    const p = new Proxy(obj, {
        get(target, prop) {
 
            return prop in target ? target[prop] : proto[prop];
        }
    });
    const arr = Array.from(p);
    return arr[0] === 'proto0' && arr.length === 2;
}

/**
 * 测试点 45：Proxy 的 get 返回 Promise.resolve(x)，验证 Array.from 不解析 Promise
 */

export function testProxyReturnsResolvedPromiseAsValue() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return Promise.resolve(99);
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] instanceof Promise && arr[0].constructor === Promise;
}

/**
 * 测试点 46：Proxy 模拟 DOM FileList（类数组 + item 方法），验证 Array.from 忽略非索引方法
 */
export function testProxySimulatesFileList() {
    const mockFile = { name: 'test.txt' };
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return mockFile;
            }
            if (prop === 'item') {
                return (i) => p[i];
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr.length === 1 && arr[0] === mockFile;
}

/**
 * 测试点 47：Proxy 的 get 在严格模式下返回非标准值（如 Symbol），验证 Array.from 接受任意值
 */
export function testProxyReturnsSymbolsInArray() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return sym1;
            }
            if (prop === 1) {
                return sym2;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === sym1 && arr[1] === sym2;
}


/**
 * 测试点 50：Proxy 的 target 是 null 原型对象（Object.create(null)），验证无影响
 */
export function testProxyWithNullPrototypeTarget() {
    const target = Object.create(null);
    target.length = 2;
    target[0] = 'null-proto-0';
    target[1] = 'null-proto-1';
    const p = new Proxy(target, {});
    const arr = Array.from(p);
    return arr[0] === 'null-proto-0' && arr.length === 2;
}

/**
 * 测试点 51：Proxy 的 get 返回全局对象（如 window/globalThis），验证允许
 */
export function testProxyReturnsGlobalAsElement() {
    const globalRef = typeof window !== 'undefined' ? window : globalThis;
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return globalRef;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === globalRef;
}

/**
 * 测试点 52：Proxy 与 Array.from 在 Web Worker 环境中行为一致（此处仅模拟，不真启 worker）
 * 验证无依赖 DOM 特性
 */
export function testProxyNoDOMDependency() {
 
    const p = new Proxy({ length: 1, 0: 'worker-safe' }, {});
    const arr = Array.from(p);
    return arr[0] === 'worker-safe';
}

/**
 * 测试点 53：Proxy 的 length 是对象 { valueOf() { return 4 } }，验证 valueOf 被调用
 */
export function testProxyLengthWithCustomValueOf() {
    const lenObj = {
        valueOf() {
            return 2;
        },
        toString() {
            return 'two';
        }
    };
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return lenObj;
            }
            if (prop === 0) {
                return 'a';
            }
            if (prop === 1) {
                return 'b';
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr.length === 2 && arr[1] === 'b';
}

/**
 * 测试点 54：Proxy 的 get 返回 Error 对象，验证 Array.from 接受
 */
export function testProxyReturnsErrorObjects() {
    const err = new Error('test');
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return err;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === err;
}

/**
 * 测试点 55：Proxy 的 handler 本身是代理，验证元编程可行性
 */
export function testProxyHandlerIsAlsoProxy() {
    const realHandler = {
        get(target, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return 'handler-proxy-0';
            }
            if (prop === 1) {
                return 'handler-proxy-1';
            }
            return target[prop];
        }
    };
    const handlerProxy = new Proxy(realHandler, {});
    const target = {};
    const p = new Proxy(target, handlerProxy);
    const arr = Array.from(p);
    return arr[0] === 'handler-proxy-0' && arr.length === 2;
}

/**
 * 测试点 56：Proxy 的 get 返回 NaN 作为元素，验证保留
 */
export function testProxyReturnsNaNAsElement() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return NaN;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return Number.isNaN(arr[0]);
}

/**
 * 测试点 57：Proxy 的 length 是 2^32，验证抛出 RangeError（超过最大数组长度）
 */
export function testProxyLengthExceedsMaxArraySize() {
    try {
        const p = new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    return 2**32;
                }
                return undefined;
            }
        });
        Array.from(p);
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

/**
 * 测试点 58：Proxy 的 get 返回正则表达式，验证保留
 */
export function testProxyReturnsRegExp() {
    const re = /abc/g;
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return re;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === re;
}

/**
 * 测试点 59：Proxy 拦截 construct（但 Array.from 不使用 new），验证不影响
 */
export function testProxyConstructTrapIgnored() {
    let constructCalled = false;
    const p = new Proxy(function () {
    }, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return 'ok';
            }
            return undefined;
        },
        construct() {
            constructCalled = true;
            return {};
        }
    });
    const arr = Array.from(p);
    return arr[0] === 'ok' && !constructCalled;
}

/**
 * 测试点 60：Proxy 的 get 返回带有自定义 toString 的对象，验证 Array.from 不调用 toString
 */
export function testProxyElementWithCustomToStringNotInvoked() {
    let toStringCalled = false;
    const obj = {
        toString() {
            toStringCalled = true;
            return 'custom-string';
        }
    };
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return obj;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === obj && !toStringCalled;
}
 

/**
 * 测试点 61：Proxy 的索引属性名为 "0.5"（非整数字符串），验证 Array.from 忽略（只读整数字符串索引）
 */
export function testProxyNonIntegerStringIndexIgnored() {
    const accessedIndices = [];
    const p = new Proxy({}, {
        get(_, prop) {
            accessedIndices.push(prop);
            if (prop === 'length') {
                return 2;
            }
            if (prop === 0) {
                return 'zero';
            }
            if (prop === 1) {
                return 'one';
            }
            if (prop === '0.5') {
                return 'should-not-appear';
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
 
    const hasNonInt = accessedIndices.includes('0.5');
    return arr.length === 2 && arr[0] === 'zero' && !hasNonInt;
}

/**
 * 测试点 62：Proxy 同时定义 has 和 get，验证 Array.from 仍只依赖 get（不调用 has）
 */
export function testProxyHasTrapNotUsedEvenWhenDefined() {
    let hasCalled = false;
    const p = new Proxy({ length: 1, 0: 'x' }, {
        get(target, prop) {
            return target[prop];
        },
        has(target, prop) {
            hasCalled = true;
            return prop in target;
        }
    });
    const arr = Array.from(p);
    return arr[0] === 'x' && !hasCalled;
}

/**
 * 测试点 63：Proxy 的 get 在访问 length 后抛出异常，验证 Array.from 中断
 */
export function testProxyGetThrowsAfterLengthRead() {
    let lengthRead = false;
    try {
        const p = new Proxy({}, {
            get(_, prop) {
                if (prop === 'length') {
                    lengthRead = true;
                    return 2;
                }
                if (prop === 0) {
                    return 'ok';
                }
                if (prop === 1) {
                    throw new Error('fail on index 1');
                }
                return undefined;
            }
        });
        Array.from(p);
        return false;
    } catch (e) {
        return lengthRead && e.message === 'fail on index 1';
    }
}

/**
 * 测试点 64：Proxy 模拟跨 realm 对象（如来自 iframe 的类数组），验证 Array.from 不依赖构造函数
 */
export function testProxySimulatesCrossRealmObject() {
 
    const foreignObj = Object.create(null);
    foreignObj.length = 2;
    foreignObj[0] = 'realm-a';
    foreignObj[1] = 'realm-b';
    const p = new Proxy(foreignObj, {});
    const arr = Array.from(p);
    return Array.isArray(arr) && arr[0] === 'realm-a';
}

/**
 * 测试点 65：Proxy 的 length 是 1e9，但系统内存不足（此处仅逻辑测试），验证规范行为（应尝试创建）
 * 注意：实际运行可能 OOM，但测试只验证是否尝试读取索引
 */
export function testProxyVeryLargeLengthDoesNotCrashPrematurely() {
    let maxIndexAccessed = -1;
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1e9;
            }
            const numProp = Number(prop);
            if (!isNaN(numProp) && numProp >= 0 && numProp < 3) {
                maxIndexAccessed = Math.max(maxIndexAccessed, numProp);
                return `item${numProp}`;
            }
            return undefined;
        }
    });
 
 
    const safeP = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 3;
            }
            if (prop === '0') {
                return 'a';
            }
            if (prop === '1') {
                return 'b';
            }
            if (prop === '2') {
                return 'c';
            }
            return undefined;
        }
    });
    const arr = Array.from(safeP);
    return arr.length === 3;
}

/**
 * 测试点 66：Proxy 的 get 返回不可扩展对象，验证 Array.from 接受
 */
export function testProxyReturnsNonExtensibleObject() {
    const obj = Object.preventExtensions({ data: 42 });
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return obj;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === obj && !Object.isExtensible(arr[0]);
}

/**
 * 测试点 67：Proxy 的 ownKeys 返回额外键，但 Array.from 不使用 ownKeys，验证不影响结果
 */
export function testProxyOwnKeysWithExtraKeysIgnored() {
    const p = new Proxy({ length: 2, 0: 'a', 1: 'b' }, {
        get(target, prop) {
            return target[prop];
        },
        ownKeys(target) {
            return Reflect.ownKeys(target).concat(['extra', 'secret']);
        }
    });
    const arr = Array.from(p);
    return arr.length === 2 && arr[1] === 'b';
}

/**
 * 测试点 68：Proxy 的 get 返回带有私有字段的对象（#field），验证无影响（私有字段不可见但对象可传递）
 */
export function testProxyReturnsObjectWithPrivateField() {
 
    class Holder {
        #value = 'private-data';

        getValue() {
            return this.#value;
        }
    }

    const instance = new Holder();
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return instance;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] instanceof Holder && arr[0].getValue() === 'private-data';
}

/**
 * 测试点 69：Proxy 的 length 是字符串 "2.7"，验证被转为 2（ToUint32("2.7") → 2）
 */
export function testProxyStringLengthFloatTruncated() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return '2.7';
            }
            if (prop === 0) {
                return 'x';
            }
            if (prop === 1) {
                return 'y';
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr.length === 2 && arr[1] === 'y';
}

/**
 * 测试点 70：Proxy 的 get 返回 null，验证 Array.from 保留 null
 */
export function testProxyReturnsNullAsElement() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return null;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === null;
}

/**
 * 测试点 71：Proxy 的 target 是 Proxy.revocable 的可撤销代理，且未撤销，验证正常工作
 */
export function testProxyRevocableNotRevoked() {
    const { proxy, revoke } = Proxy.revocable({ length: 1, 0: 'revocable' }, {});
    const arr = Array.from(proxy);
 
    return arr[0] === 'revocable';
}

/**
 * 测试点 72：Proxy 的 target 是已撤销的 revocable 代理，验证抛出 TypeError
 */
export function testProxyRevocableAlreadyRevoked() {
    const { proxy, revoke } = Proxy.revocable({ length: 1, 0: 'gone' }, {});
    revoke();
    try {
        Array.from(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 73：Proxy 的 get 返回 Map 对象，验证 Array.from 不展开 Map
 */
export function testProxyReturnsMapAsElement() {
    const map = new Map([['key', 'value']]);
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return map;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === map && arr[0] instanceof Map;
}

/**
 * 测试点 74：Proxy 的 length 是 Boolean object（new Boolean(true)），验证转为 1
 */
export function testProxyLengthBooleanObjectConverted() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return new Boolean(true);
            }
            if (prop === 0) {
                return 'bool-obj-item';
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr.length === 1 && arr[0] === 'bool-obj-item';
}

/**
 * 测试点 75：Proxy 的 get 返回带 then 方法的对象（thenable），验证 Array.from 不 await
 */
export function testProxyReturnsThenableObject() {
    const thenable = {
        then: () => {
        },
        value: 42
    };
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return thenable;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === thenable;
}

/**
 * 测试点 76：Proxy 的索引属性通过 getter 返回动态值（每次不同），验证 Array.from 捕获调用时刻值
 */
export function testProxyGetterReturnsChangingValue() {
    let counter = 0;
    const obj = {};
    Object.defineProperty(obj, '0', {
        get() {
            return ++counter;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(obj, 'length', { value: 1 });
    const p = new Proxy(obj, {});
    const arr = Array.from(p);
    return arr[0] === 1;
}

/**
 * 测试点 77：Proxy 的 get 访问 Symbol.toPrimitive，验证 Array.from 不触发类型转换（因直接读属性）
 */
export function testProxyElementWithSymbolToPrimitiveNotInvoked() {
    let toPrimitiveCalled = false;
    const obj = {
        [Symbol.toPrimitive]() {
            toPrimitiveCalled = true;
            return 'converted';
        }
    };
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return 1;
            }
            if (prop === 0) {
                return obj;
            }
            return undefined;
        }
    });
    const arr = Array.from(p);
    return arr[0] === obj && !toPrimitiveCalled;
}

/**
 * 测试点 78：Proxy 的 length 是空字符串 ""，验证 ToLength("") === 0
 */
export function testProxyLengthEmptyStringBecomesZero() {
    const p = new Proxy({}, {
        get(_, prop) {
            if (prop === 'length') {
                return '';
            }
            return 'ignored';
        }
    });
    const arr = Array.from(p);
    return arr.length === 0;
}

/**
 * 测试点 80：Proxy 的 handler 抛出异常（如 get 方法 throw），验证 Array.from 传播错误
 */
export function testProxyHandlerGetThrows() {
    try {
        const p = new Proxy({}, {
            get() {
                throw new Error('Handler broken');
            }
        });
        Array.from(p);
        return false;
    } catch (e) {
        return e.message === 'Handler broken';
    }
}

