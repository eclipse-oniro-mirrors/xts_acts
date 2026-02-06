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

// ========== 前5个测试用例（已在前面提供，这里完整列出） ==========

export function test1_getterClearsArrayDuringMap() {

    const arr = [1, 2, 3, 4, 5];
    let getterCalled = false;

    Object.defineProperty(arr, 2, {
        get() {
            getterCalled = true;

            arr.length = 0;
            arr.push('x');
            return undefined;
        },
        configurable: true
    });

    try {
        const result = arr.map(x => {

            return x * 2;
        });

        return true;
    } catch (e) {

        return false;
    } finally {
        if (!getterCalled) {

        }
    }
}

export function test2_getterExtendsArrayDuringFilter() {

    const arr = [1, 2, 3];
    let iterationCount = 0;

    Object.defineProperty(arr, 1, {
        get() {

            if (iterationCount === 0) {
                arr.push(4, 5, 6);
                iterationCount++;
            }
            return 2;
        },
        configurable: true
    });

    try {
        const result = arr.filter(x => {

            return x > 2;
        });

        return true;
    } catch (e) {

        return false;
    }
}

export function test3_getterDeletesDuringReduce() {

    const arr = [1, 2, 3, 4, 5];
    let getterCallCount = 0;

    Object.defineProperty(arr, 2, {
        get() {
            getterCallCount++;

            if (getterCallCount === 1) {
                arr.splice(0, 1);
            }
            return 3;
        },
        configurable: true
    });

    try {
        const result = arr.reduce((sum, val, index) => {

            return sum + val;
        }, 0);

        return false;
    } catch (e) {

        return true;
    }
}

export function test4_setterModifiesArrayDuringAssignment() {

    const arr = [1, 2, 3, 4, 5];
    let setterCalled = false;

    Object.defineProperty(arr, '2', {
        set(value) {
            setterCalled = true;

            arr.length = 2;
            arr[0] = -1;
            arr[1] = -2;
        },
        get() {
            return 3;
        },
        configurable: true
    });

    try {

        arr[2] = 99;

        return setterCalled && arr.length === 2 && arr[0] === -1 && arr[1] === -2;
    } catch (e) {

        return false;
    }
}

export function test5_multipleGettersInToSpliced() {
    console.log("\nTest 5: 多个访问器互相影响 - toSpliced()方法");
    const arr = [1, 2, 3, 4, 5];
    let getter1Called = false;
    let getter3Called = false;

    Object.defineProperty(arr, 1, {
        get() {
            getter1Called = true;
            Object.defineProperty(arr, 3, {
                get() {
                    getter3Called = true;
                    arr.length = 1;
                    arr[0] = 999;
                    return undefined;
                },
                configurable: true
            });

            return 2;
        },
        configurable: true
    });

    try {
        let a = [...arr];
        const result = arr.toSpliced(0, 3);
        return getter1Called && getter3Called;
    } catch (e) {
        return false;
    }
}
// ========== 测试用例6-10：不同数组方法的测试 ==========

export function test6_getterInToSorted() {

    const arr = [5, 4, 3, 2, 1];
    let getterCallCount = 0;

    Object.defineProperty(arr, 2, {
        get() {
            getterCallCount++;

            if (getterCallCount === 1) {
                arr[0] = 100; // 修改正在排序的元素
                arr.length = 3; // 缩短数组
            }
            return 3;
        },
        configurable: true
    });

    try {
        const result = arr.toSorted((a, b) => a - b);

        return true;
    } catch (e) {

        return false;
    }
}

export function test7_getterInWithMethod() {

    const arr = [1, 2, 3, 4, 5];

    Object.defineProperty(arr, 1, {
        get() {

            arr[3] = 999; // 修改另一个元素
            return 2;
        },
        configurable: true
    });

    try {
        const result = arr.with(0, 100);

        return result[0] === 100 && result[3] === 999;
    } catch (e) {

        return false;
    }
}

export function test8_getterInFind() {

    const arr = [10, 20, 30, 40, 50];
    let getterCalled = false;

    Object.defineProperty(arr, 2, {
        get() {
            getterCalled = true;

            arr.length = 0;
            return 30;
        },
        configurable: true
    });

    try {
        const result = arr.find(x => {

            return x > 25;
        });

        return getterCalled;
    } catch (e) {

        return false;
    }
}

export function test9_getterInFindIndex() {

    const arr = [1, 2, 3, 4, 5];
    let callCount = 0;

    Object.defineProperty(arr, 3, {
        get() {
            callCount++;

            if (callCount === 1) {
                arr.splice(0, 2); // 删除前两个元素
            }
            return 4;
        },
        configurable: true
    });

    try {
        const result = arr.findIndex(x => {

            return x > 3;
        });

        return true;
    } catch (e) {

        return false;
    }
}

export function test10_getterInSomeEvery() {

    const arr = [1, 2, 3, 4, 5];
    let someResult = false;
    let everyResult = false;

    // 测试some()
    const arr1 = [...arr];
    Object.defineProperty(arr1, 2, {
        get() {

            arr1.push(6, 7, 8);
            return 3;
        },
        configurable: true
    });

    try {
        someResult = arr1.some(x => {

            return x > 5;
        });

    } catch (e) {

    }

    // 测试every()
    const arr2 = [...arr];
    Object.defineProperty(arr2, 1, {
        get() {

            arr2.length = 2;
            return 2;
        },
        configurable: true
    });

    try {
        everyResult = arr2.every(x => {

            return x < 10;
        });

        return true;
    } catch (e) {

        return false;
    }
}

// ========== 测试用例11-15：原型链和继承相关 ==========

export function test11_prototypeGetter() {

    const parent = [1, 2, 3];
    const child = Object.create(parent);
    child[3] = 4;
    child[4] = 5;
    child.length = 5;

    let parentGetterCalled = false;
    Object.defineProperty(parent, 1, {
        get() {
            parentGetterCalled = true;

            child.length = 2;
            return 2;
        },
        configurable: true
    });

    try {
        const result = Array.prototype.map.call(child, x => x * 2);

        return parentGetterCalled;
    } catch (e) {

        return false;
    }
}

export function test12_arraySubclassGetter() {

    class CustomArray extends Array {
        constructor(...args) {
            super(...args);
        }
    }

    const arr = new CustomArray(1, 2, 3, 4, 5);
    let getterCalled = false;

    Object.defineProperty(arr, 2, {
        get() {
            getterCalled = true;

            this.length = 10; // 使用this
            for (let i = 5; i < 10; i++) {
                this[i] = i * 10;
            }
            return 3;
        },
        configurable: true
    });

    try {
        const result = arr.filter(x => x > 20);

        return getterCalled;
    } catch (e) {

        return false;
    }
}

// js为true，xts false
export function test13_proxyArrayGetter() {

    const target = [1, 2, 3, 4, 5];
    let getCallCount = 0;

    const proxy = new Proxy(target, {
        get(target, prop, receiver) {
            if (prop == '2') {
                getCallCount++;

                target.length = 0;
                target.push('proxy');
                return 'intercepted';
            }
            return Reflect.get(target, prop, receiver);
        }
    });

    try {
        const result = proxy.map(x => {

            return String(x);
        });

        return getCallCount > 0;
    } catch (e) {

        return false;
    }
}

export function test14_arrayPrototypeModification() {

    const originalPush = Array.prototype.push;
    let pushCalled = false;

    // 临时修改push方法
    Array.prototype.push = function(...args) {
        pushCalled = true;

        if (this.length === 3) {

            this.length = 0;
        }
        return originalPush.apply(this, args);
    };

    const arr = [1, 2, 3];
    Object.defineProperty(arr, 1, {
        get() {

            arr.push(4, 5);
            return 2;
        },
        configurable: true
    });

    try {
        const result = arr.slice();

        return pushCalled;
    } catch (e) {

        return false;
    } finally {
        // 恢复原状
        Array.prototype.push = originalPush;
    }
}

// xts和js执行逻辑不一样，输出内容不一样
export function test15_inheritedSetter() {

    const proto = {};
    let setterCalled = false;

    Object.defineProperty(proto, '2', {
        set(value) {
            setterCalled = true;

            // this指向子对象
            if (Array.isArray(this)) {
                this.length = 1;
                this[0] = -999;
            }
        },
        get() {
            return 'proto';
        },
        configurable: true
    });

    const arr = Object.create(proto);
    arr[0] = 1;
    arr[1] = 2;
    arr[2] = 3; // 这会调用原型的setter
    arr.length = 3;

    try {

        arr[2] = 100; // 再次赋值

        return setterCalled && arr.length === 1 && arr[0] === -999;
    } catch (e) {

        return false;
    }
}

// ========== 测试用例16-20：并发修改场景 ==========
// js和xts结果不一致
export function test16_recursiveGetters() {

    const arr = [1, 2, 3, 4, 5];
    let depth = 0;
    const maxDepth = 3;

    Object.defineProperty(arr, 1, {
        get() {
            depth++;

            if (depth < maxDepth) {
                // 触发自身的getter（通过其他方式）

                arr[1] = arr[1]; // 这会再次触发getter
            } else {

                arr.length = 2;
            }
            return 2;
        },
        configurable: true
    });

    try {
        const result = arr.concat([6, 7]);

        return depth >= maxDepth;
    } catch (e) {

        return false;
    }
}

export function test17_iteratorGetter() {

    const arr = [1, 2, 3, 4, 5];
    let iterationCount = 0;

    Object.defineProperty(arr, Symbol.iterator, {
        get() {

            arr.length = 2;
            arr[0] = 'iterator';
            // 返回默认迭代器
            return Array.prototype[Symbol.iterator].bind(arr);
        },
        configurable: true
    });

    try {
        const result = [];
        for (const item of arr) {
            iterationCount++;

            result.push(item);
            if (iterationCount > 10) break; // 防止无限循环
        }

        return iterationCount > 0;
    } catch (e) {

        return false;
    }
}

export function test18_asyncModification() {

    const arr = [1, 2, 3, 4, 5];
    let asyncModificationDone = false;

    Object.defineProperty(arr, 2, {
        async get() {

            // 模拟异步操作
            await new Promise(resolve => setTimeout(resolve, 10));

            arr.length = 0;
            arr.push('async');
            asyncModificationDone = true;
            return 3;
        },
        configurable: true
    });

    try {
        // 注意：这个测试可能在某些环境中表现不同
        const result = arr.map(x => {

            return x * 2;
        });

        return true; // 这里主要测试是否崩溃
    } catch (e) {

        return false;
    }
}

export function test19_concurrentGetters() {

    const arr = [1, 2, 3, 4, 5];
    let getter1Calls = 0;
    let getter3Calls = 0;

    Object.defineProperty(arr, 1, {
        get() {
            getter1Calls++;

            if (getter1Calls === 1) {
                arr[3] = 999; // 触发索引3的getter
            }
            return 2;
        },
        configurable: true
    });

    Object.defineProperty(arr, 3, {
        get() {
            getter3Calls++;

            if (getter3Calls === 1) {
                arr.splice(1, 1); // 删除索引1（正在访问的）
            }
            return 4;
        },
        configurable: true
    });

    try {
        const result = arr.toReversed();

        return false;
    } catch (e) {

        return true;
    }
}

export function test20_lengthGetterInteraction() {

    const arr = [1, 2, 3, 4, 5];
    let lengthGetterCalled = false;

    Object.defineProperty(arr, 'length', {
        get() {
            lengthGetterCalled = true;

            arr[0] = -1;
            arr[2] = -3;
            return 5;
        },
        set(value) {

            // 使用defineProperty设置实际值
            Object.defineProperty(this, 'length', {
                value: value,
                writable: true,
                enumerable: false,
                configurable: false
            });
            return true;
        },
        configurable: true
    });

    try {

        const result = arr.concat([6, 7]);

        return lengthGetterCalled;
    } catch (e) {

        return false;
    }
}

// ========== 测试用例21-25：边界条件测试 ==========

export function test21_negativeIndexGetter() {

    const arr = [1, 2, 3, 4, 5];

    // 使用Proxy处理负索引
    const proxy = new Proxy(arr, {
        get(target, prop, receiver) {
            const index = Number(prop);
            if (!isNaN(index) && index < 0) {

                target.length = Math.abs(index);
                for (let i = 0; i < target.length; i++) {
                    target[i] = i * 100;
                }
                return `负索引${prop}`;
            }
            return Reflect.get(target, prop, receiver);
        }
    });

    try {
        // 注意：普通数组方法不会访问负索引
        // 这里测试at()方法
        const result = proxy.at(-2);

        return true;
    } catch (e) {

        return false;
    }
}

// xts 和 js结果不一致
export function test22_sparseArrayGetter() {

    const arr = [];
    arr[0] = 1;
    arr[2] = 3; // 索引1是空洞
    arr[4] = 5;
    arr.length = 5;

    // 在空洞上定义getter
    Object.defineProperty(arr, 1, {
        get() {

            arr[1] = 'filled';
            arr[3] = 'also filled';
            return 'from getter';
        },
        configurable: true
    });

    Object.defineProperty(arr, 3, {
        get() {

            arr.length = 2;
            return 'should not be reached';
        },
        configurable: true
    });

    try {
        const result = arr.flat();

        return true;
    } catch (e) {

        return false;
    }
}

export function test23_largeIndexGetter() {

    const arr = [];
    arr[0] = 1;
    arr[1] = 2;
    arr[1000000] = 3; // 大索引

    let largeIndexAccessed = false;
    Object.defineProperty(arr, 1000000, {
        get() {
            largeIndexAccessed = true;

            for (let i = 0; i < 100; i++) {
                arr[i * 10000] = i;
            }
            return 3;
        },
        configurable: true
    });

    try {
        // 使用不会遍历所有元素的方法
        const result = arr.includes(3);

        return largeIndexAccessed;
    } catch (e) {

        return false;
    }
}

export function test24_symbolPropertyGetter() {
    const arr = [1, 2, 3];
    const sym = Symbol('test');
    arr[sym] = 'symbol value';

    let symbolGetterCalled = false;
    Object.defineProperty(arr, sym, {
        get() {
            symbolGetterCalled = true;
            arr.length = 1;
            arr[0] = 'symbol modified';
            return 'intercepted';
        },
        configurable: true
    });

    try {
        // 普通数组方法不会访问Symbol属性
        let a = arr[sym]
        const result = arr.map(x => x * 2);
        return symbolGetterCalled;
    } catch (e) {
        return false;
    }
}

export function test25_nonNumericPropertyGetter() {

    const arr = [1, 2, 3];
    arr.prop = 'property';

    Object.defineProperty(arr, 'prop', {
        get() {

            arr.length = 0;
            arr.push('from', 'getter');
            return 'intercepted';
        },
        configurable: true
    });

    try {
        // 某些数组方法会访问所有可枚举属性
        const result = Object.keys(arr);


        // 测试数组方法
        arr.map(x => x * 2);
        return true;
    } catch (e) {

        return false;
    }
}

// ========== 测试用例26-30：特殊方法组合 ==========

export function test26_flatMapGetter() {

    const arr = [1, 2, [3, 4]];

    Object.defineProperty(arr, 1, {
        get() {

            arr.length = 1;
            arr[0] = [100, 200]; // 改为嵌套数组
            return 2;
        },
        configurable: true
    });

    try {
        const result = arr.flatMap(x => {

            return Array.isArray(x) ? x : [x * 10];
        });

        return true;
    } catch (e) {

        return false;
    }
}

export function test27_reduceRightGetter() {

    const arr = [1, 2, 3, 4, 5];
    let callOrder = [];

    Object.defineProperty(arr, 3, {
        get() {
            callOrder.push('get[3]');

            arr.pop(); // 从末尾删除
            return 4;
        },
        configurable: true
    });

    Object.defineProperty(arr, 1, {
        get() {
            callOrder.push('get[1]');

            arr.push(6); // 添加到末尾
            return 2;
        },
        configurable: true
    });

    try {
        const result = arr.reduceRight((acc, val, idx) => {
            callOrder.push(`reduce[${idx}]`);

            return acc + val;
        }, 0);


        return callOrder.length > 0;
    } catch (e) {

        return false;
    }
}

export function test28_copyWithinGetter() {

    const arr = [1, 2, 3, 4, 5];

    Object.defineProperty(arr, 2, {
        get() {

            arr.copyWithin(0, 3); // 将索引3-4复制到0-1
            return 3;
        },
        configurable: true
    });

    try {

        arr.copyWithin(1, 2); // 这会访问索引2

        return false;
    } catch (e) {

        return true;
    }
}

export function test29_sortComparatorGetter() {

    const arr = [5, 4, 3, 2, 1];
    let comparatorCalls = 0;

    Object.defineProperty(arr, 2, {
        get() {

            if (comparatorCalls === 1) {

                arr.length = 0;
                arr.push('sorted');
            }
            return 3;
        },
        configurable: true
    });

    try {
        const result = arr.sort((a, b) => {
            comparatorCalls++;

            // 在比较函数中访问数组元素
            const mid = arr[2];

            return a - b;
        });

        return comparatorCalls > 0;
    } catch (e) {

        return false;
    }
}

export function test30_typedArrayGetter() {

    try {
        const buffer = new ArrayBuffer(16);
        const int32Array = new Int32Array(buffer);
        int32Array.set([1, 2, 3, 4]);

        // 注意：类型化数组的索引属性通常不可配置
        // 这里测试通过普通对象模拟
        const fakeTypedArray = {
            0: 1,
            1: 2,
            2: 3,
            3: 4,
            length: 4,
            [Symbol.iterator]: Array.prototype[Symbol.iterator]
        };

        Object.defineProperty(fakeTypedArray, 1, {
            get() {

                this.length = 2;
                this[0] = -1;
                return 2;
            },
            configurable: true
        });

        // 使用call调用数组方法
        const result = Array.prototype.map.call(fakeTypedArray, x => x * 2);

        return true
    } catch (e) {

        return false;
    }
}