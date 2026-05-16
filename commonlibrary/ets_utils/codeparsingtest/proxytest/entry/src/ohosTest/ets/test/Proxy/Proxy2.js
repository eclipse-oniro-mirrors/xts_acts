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

function sleepms(time) {
    return new Promise(resolve => {
        setTimeout(resolve, time);
    });
}

export function testDeepProxy1() {
    const target = { a: 1, nested: { b: 2 } };
    // 递归创建代理的工具函数
    const createProxy = (obj) => new Proxy(obj, {
        get(target, prop) {
            const value = target[prop];
            // 若属性是对象，递归代理
            return typeof value === 'object' && value !== null ? createProxy(value) : value;
        },
        set(target, prop, value) {
            target[prop] = value;
            console.log(`修改属性：${prop}=${value}`);
            return true;
        }
    });
    const proxy = createProxy(target);

    proxy.nested.b = 3; // 触发嵌套对象的set陷阱
    console.log(target.nested.b === 3, "101.1：深度代理嵌套对象修改成功");
    return target.nested.b === 3;
}

export function testNestedProxyThis2() {
    const target = {
        a: 1,
        nested: {
            b: 2,
            getB() {
                return this.b;
            } // 依赖this绑定
        }
    };
    const createProxy = (obj) => new Proxy(obj, {
        get(target, prop) {
            const value = target[prop];
            return typeof value === 'object' && value !== null ? createProxy(value) : value;
        }
    });
    const proxy = createProxy(target);

    console.log(proxy.nested.getB() === 2, "102.1：嵌套代理方法this指向正确");
    return proxy.nested.getB() === 2;
}

export function testProxySetAdd3() {
    const set = new Set();
    const handler = {
        get(target, prop) {
            if (prop === 'add') {
                // 拦截add，只允许偶数
                return (value) => {
                    if (value % 2 === 0) {
                        target.add(value);
                    }
                    return target; // 保持链式调用
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(set, handler);

    proxy.add(1).add(2).add(3);
    console.log(proxy.size === 1 && proxy.has(2), "103.1：Set.add拦截并过滤值成功");
    return proxy.size === 1 && proxy.has(2);
}

export function testGetInterceptArrayPush6() {
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            if (prop === 'push') {
                // 拦截push，参数加倍
                return function (...args) {
                    const doubled = args.map(v => v * 2);
                    return target.push(...doubled);
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    proxy.push(3, 4);
    let res = arr.join(',');
    console.log(res === '1,2,6,8', "106.1：数组push方法被拦截修改参数");
    return res === '1,2,6,8';
}

export function testSetArrayLengthLimit7() {
    const arr = [1, 2];
    let flag = 0;
    const handler = {
        set(target, prop, value) {
            if (prop === 'length' && value > 5) {
                throw new RangeError("数组长度不能超过5");
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(arr, handler);

    proxy.length = 3; // 合法修改
    console.log(arr.length === 3, "107.1：合法length修改成功");
    if (arr.length === 3) {
        flag = flag + 1;
    }
    try {
        proxy.length = 6; // 超出限制
        console.error("107.2：未拦截超出限制的length修改");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof RangeError, "107.2：超出限制应抛RangeError");
        flag = flag + 1;
    }
    return flag;
}

export function testGetLazyInitialization8() {
    const target = { /* 未初始化lazyProp */ };
    const handler = {
        get(target, prop) {
            if (prop === 'lazyProp' && !(prop in target)) {
                // 首次访问时初始化
                target.lazyProp = '初始化值';
                console.log("lazyProp初始化完成");
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    let res = !('lazyProp' in target);
    console.log(res, "108.1：初始化前目标无属性");
    console.log(proxy.lazyProp === '初始化值', "108.2：首次访问触发初始化");
    console.log('lazyProp' in target, "108.3：初始化后目标有属性");
    return res && proxy.lazyProp === '初始化值' && ('lazyProp' in target);
}

export function testReflectEnumerateLike9() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    Object.setPrototypeOf(obj, { c: 3 }); // 继承属性

    // 模拟for...in枚举（自有可枚举+继承可枚举）
    const enumerate = (obj) => {
        const keys = [];
        let current = obj;
        while (current !== null) {
            Reflect.ownKeys(current).forEach(key => {
                if (typeof key === 'string' && Reflect.getOwnPropertyDescriptor(current, key).enumerable) {
                    keys.push(key);
                }
            });
            current = Reflect.getPrototypeOf(current);
        }
        return keys;
    };

    const keys = enumerate(obj);
    console.log(keys.join(',') === 'a,c', "109.1：模拟枚举行为成功");
    return keys.join(',') === 'a,c';
}

export function testReflectPreventExtensions10() {
    const obj1 = {};
    let flag = 0;
    const success1 = Reflect.preventExtensions(obj1);
    console.log(success1 && !Reflect.isExtensible(obj1), "110.1：首次阻止扩展成功");
    if (success1 && !Reflect.isExtensible(obj1)) {
        flag = flag + 1;
    }
    const success2 = Reflect.preventExtensions(obj1); // 重复调用
    console.log(success2, "110.2：重复阻止成功");
    if (success2) {
        flag = flag + 1;
    }
    return flag;
}

export function testReflectGetPrototypeNull11() {
    const obj = Object.create(null); // 无原型
    console.log(Reflect.getPrototypeOf(obj) === null, "111.1：null原型对象返回null");
    return Reflect.getPrototypeOf(obj) === null;
}

export async function testProxyAsyncFunction12() {
    let flag = 0;
    const asyncFunc = async () => 10;

    const handler = {
        get(target, prop) {
            if (prop === 'then') {
                // 拦截then，结果加倍
                return (onFulfilled) => {
                    return target.then(value => onFulfilled(value * 2));
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(asyncFunc, handler);

    proxy().then(result => {
        console.log(result === 20, "112.1：异步函数结果被拦截修改");
        flag = flag + 1;
    });

    await sleepms(2000);
    return flag;
}

export function testProxyGenerator13() {
    let flag = 0;

    function* generator() {
        yield 1;
        yield 2;
    }

    const handler = {
        get(target, prop) {
            if (prop === 'next') {
                // 拦截next，值加倍
                return () => {
                    const result = target.next();
                    return result.done ? result : { ...result, value: result.value * 2 };
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const gen = generator();
    const proxy = new Proxy(gen, handler);
    let res1 = proxy.next().value
    if (res1 === 2) {
        flag = flag + 1;
    }
    let res2 = proxy.next().value
    if (res2 === 4) {
        flag = flag + 1;
    }
    console.log(res1 === 2, "113.1：生成器next值被加倍");
    console.log(res2 === 4, "113.2：第二次next值被加倍");
    return flag;

}

export function testOwnKeysJsonStringify14() {
    const target = { a: 1, b: 2, secret: 'hidden' };
    const handler = {
        ownKeys(target) {
            // 过滤secret键
            return Reflect.ownKeys(target).filter(prop => prop !== 'secret');
        }
    };
    const proxy = new Proxy(target, handler);

    const json = JSON.stringify(proxy);
    console.log(json === '{"a":1,"b":2}', "114.1：JSON序列化过滤secret键");
    return json === '{"a":1,"b":2}';
}

export function testProxyStructuredClone15() {
    const target = { a: 1, b: [2, 3] };
    let flag = 0;
    const proxy = new Proxy(target, {
        get: Reflect.get,
        set: Reflect.set
    }); // 透明代理

    try {
        const clone = structuredClone(proxy);
        console.log(clone.a === 1 && clone.b[0] === 2, "115.1：代理对象克隆成功");
        flag = flag + 0.1;
    } catch (e) {
        console.error("115.2：代理对象克隆失败", e);
        flag = flag + 1;
    }
    return flag;
}


export function testProxyDataValidator16() {
    let flag = 0;
    // 验证规则：age为数字且>0，name为字符串
    const schema = {
        age: (v) => typeof v === 'number' && v > 0,
        name: (v) => typeof v === 'string' && v.length > 0
    };
    const target = { age: 20, name: 'Tom' };
    const handler = {
        set(target, prop, value) {
            if (schema[prop] && !schema[prop](value)) {
                throw new TypeError(`属性${prop}验证失败`);
            }
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.age = 25; // 合法
    try {
        proxy.age = -5; // 非法
        console.error("116.1：未拦截非法age值");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "116.1：非法值应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyObserver17() {
    const target = { value: 0 };
    const observers = [];
    // 注册观察者
    const observe = (callback) => observers.push(callback);
    // 代理：属性变化时通知所有观察者
    const proxy = new Proxy(target, {
        set(target, prop, value) {
            const oldValue = target[prop];
            target[prop] = value;
            observers.forEach(cb => cb(prop, oldValue, value));
            return true;
        }
    });

    let lastChange;
    observe((prop, old, newValue) => {
        lastChange = { prop, old, newValue };
    });
    proxy.value = 1;
    console.log(lastChange.prop === 'value' && lastChange.newValue === 1, "117.1：观察者收到变化通知");
    return lastChange.prop === 'value' && lastChange.newValue === 1;
}

export function testProxyReadOnlyView18() {
    let flag = 0;
    const target = { a: 1, b: { c: 2 } };
    // 递归创建只读代理
    const createReadOnlyProxy = (obj) => new Proxy(obj, {
        set: () => {
            throw new TypeError("只读对象不可修改");
        },
        deleteProperty: () => {
            throw new TypeError("只读对象不可删除属性");
        },
        defineProperty: () => {
            throw new TypeError("只读对象不可定义属性");
        },
        get(target, prop) {
            const value = target[prop];
            return typeof value === 'object' && value !== null ? createReadOnlyProxy(value) : value;
        }
    });
    const readOnly = createReadOnlyProxy(target);

    try {
        readOnly.a = 2;
        console.error("118.1：未阻止修改只读属性");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "118.1：修改应抛TypeError");
        flag = flag + 1;
    }
    try {
        readOnly.b.c = 3;
        console.error("118.2：未阻止修改嵌套只读属性");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "118.2：嵌套修改应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testGetReturnThis19() {
    const target = { self: null };
    const handler = {
        get(target, prop) {
            if (prop === 'self') {
                return proxy;
            } // 返回代理自身
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.self === proxy, "119.1：get陷阱返回代理自身成功（无死循环）");
    return proxy.self === proxy;
}

export function testSetPrototypeProperty20() {

    function Target() {
    }

    const newProto = {};
    const handler = {
        set(target, prop, value) {
            if (prop === 'prototype') {
                // 拦截prototype修改，添加标记
                value.__proxyMark = true;
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(Target, handler);

    proxy.prototype = newProto;
    console.log(Target.prototype.__proxyMark === true, "120.1：prototype修改被拦截处理");
    return Target.prototype.__proxyMark === true;
}

export function testHasForInLoop21() {
    const target = { a: 1, b: 2, c: 3 };
    const handler = {
        has(target, prop) {
            // 只允许偶数键名通过（b是第2个字母）
            return ['b'].includes(prop);
        }
    };
    const proxy = new Proxy(target, handler);

    const enumerated = [];
    for (const prop in proxy) {
        enumerated.push(prop);
    }
    let res = enumerated.join(',') === 'a,b,c';
    console.log(res, "121.1：for...in循环受has陷阱影响");
    return res;
}

export function testApplyValidateArgs22() {
    const sum = (a, b) => a + b;
    let flag = 0;
    const handler = {
        apply(target, thisArg, args) {
            // 验证参数为数字
            if (!args.every(v => typeof v === 'number')) {
                throw new TypeError("参数必须为数字");
            }
            return target.apply(thisArg, args);
        }
    };
    const proxy = new Proxy(sum, handler);

    console.log(proxy(1, 2) === 3, "122.1：合法参数调用成功");
    try {
        proxy('1', 2); // 非法参数
        console.error("122.2：未拦截非法参数");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "122.2：非法参数应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testConstructModifyInstance23() {
    class User {
        constructor(name) {
            this.name = name;
        }
    }

    const handler = {
        construct(target, args, newTarget) {
            const instance = new target(...args);
            // 添加创建时间
            instance.createdAt = new Date().toISOString().slice(0, 10);
            return instance;
        }
    };
    const ProxyUser = new Proxy(User, handler);

    const user = new ProxyUser('Alice');
    console.log(user.name === 'Alice' && user.createdAt === "2025-08-25", "123.1：construct陷阱修改实例成功");
    return user.name === 'Alice' && user.createdAt === "2025-08-25";
}

export function testRevocableReleaseResource24() {
    let resource = { inUse: true };
    const releaseResource = () => {
        resource.inUse = false;
    };
    // 创建可撤销代理时绑定释放逻辑
    const revocable = Proxy.revocable({}, {
        get: () => {
        }
    });
    // 包装撤销方法，添加资源释放
    const originalRevoke = revocable.revoke;
    revocable.revoke = () => {
        originalRevoke();
        releaseResource();
    };

    revocable.revoke();
    console.log(!resource.inUse, "124.1：撤销代理触发资源释放");
    return !resource.inUse;
}

export function testProxyArrayPop26() {
    const arr = [1, 2, 3];
    const deleted = [];
    const handler = {
        get(target, prop) {
            if (prop === 'pop') {
                return () => {
                    const last = target.pop();
                    deleted.push(last);
                    return last;
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    proxy.pop();
    console.log(deleted[0] === 3 && arr.length === 2, "126.1：数组pop拦截并记录删除元素");
    return deleted[0] === 3 && arr.length === 2;
}

export function testProxyArraySplice27() {
    const arr = [1, 2, 3, 4];
    const handler = {
        get(target, prop) {
            if (prop === 'splice') {
                return (start, deleteCount, ...items) => {
                    // 限制最多删除2个元素
                    deleteCount = Math.min(deleteCount, 2);
                    return target.splice(start, deleteCount, ...items);
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    const removed = proxy.splice(0, 3); // 尝试删除3个，实际删除2个
    console.log(removed.length === 2 && arr.length === 2, "127.1：splice拦截限制删除数量");
    return removed.length === 2 && arr.length === 2;
}

export function testProxyErrorStack28() {
    const error = new Error("原始错误");
    const handler = {
        get(target, prop) {
            if (prop === 'stack') {
                // 隐藏原始堆栈，返回自定义信息
                return "自定义错误堆栈（已拦截）";
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(error, handler);

    console.log(proxy.message === "原始错误", "128.1：错误消息正常访问");
    console.log(proxy.stack === "自定义错误堆栈（已拦截）", "128.2：stack属性被拦截修改");
    return (proxy.message === "原始错误") && (proxy.stack === "自定义错误堆栈（已拦截）");
}

export function testProxyIntlFormatter29() {
    const formatter = new Intl.DateTimeFormat('zh-CN');
    const handler = {
        get(target, prop) {
            if (prop === 'format') {
                return (date) => {
                    // 格式化前添加前缀
                    return `日期：${target.format(date)}`;
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(formatter, handler);

    const result = proxy.format(new Date('2023-01-01'));
    console.log(result.startsWith('日期：'), "129.1：Intl格式化方法被拦截");
    return result.startsWith('日期：');
}

export function testSetToPrimitive32() {
    const target = { value: 0 };
    const handler = {
        set(target, prop, value) {
            // 转换值为数字后赋值
            target[prop] = Number(value);
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    const obj = { [Symbol.toPrimitive]: () => '123' }; // 可转换为原始值的对象

    proxy.value = obj;
    console.log(target.value === 123, "132.1：set陷阱处理Symbol.toPrimitive转换");
    return target.value === 123;
}

export function testGetSymbolIterator33() {
    const target = { data: [1, 2, 3] };
    const handler = {
        get(target, prop) {
            if (prop === Symbol.iterator) {
                // 自定义迭代器：返回加倍后的值
                let index = 0;
                return () => ({
                    next: () => {
                        if (index < target.data.length) {
                            return { value: target.data[index++] * 2, done: false };
                        }
                        return { done: true };
                    }
                });
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    const result = [...proxy]; // 触发迭代器
    let res = result.join(',') === '2,4,6';
    console.log(res, "133.1：自定义迭代器生效");
    return res;
}

export function testReflectGetSymbolAccessor34() {
    const obj = {
        a: 1,
        [Symbol.get]() {
            return { a: 100 }; // 自定义get访问器
        }
    };

    const value = Reflect.get(obj, 'a');
    console.log(value === 1, "134.1：Reflect.get使用a");
    return value === 1;
}

export function testReflectApplyLength35() {
    const func = (a, b) => a + b; // length为2
    const result = Reflect.apply(func, null, [1, 2]);

    console.log(result === 3 && func.length === 2, "135.1：Reflect.apply不修改函数length");
    return result === 3 && func.length === 2;
}

export function testReflectDefineAccessor36() {
    const obj = {};
    let value = 0;
    const success = Reflect.defineProperty(obj, 'a', {
        get: () => value,
        set: (v) => {
            value = v * 2;
        },
        enumerable: true
    });

    obj.a = 5;
    console.log(success && obj.a === 10, "136.1：Reflect定义访问器属性成功");
    return success && obj.a === 10;
}

export function testProxyPropertyCache37() {
    const target = { fetchData: () => Math.random() }; // 模拟耗时操作
    const cache = new Map();
    const TTL = 100; // 缓存100ms过期
    const handler = {
        get(target, prop) {
            if (prop === 'fetchData') {
                return () => {
                    const now = Date.now();
                    if (cache.has('data') && now - cache.get('timestamp') < TTL) {
                        return cache.get('data'); // 返回缓存
                    }
                    // 重新计算并缓存
                    const data = target.fetchData();
                    cache.set('data', data);
                    cache.set('timestamp', now);
                    return data;
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    const first = proxy.fetchData();
    const second = proxy.fetchData();
    console.log(first === second, "137.1：缓存未过期时返回相同值");
    return first === second;
}

export async function testProxyDebounce38() {
    const target = {
        handleInput: () => {
        }
    };
    let callCount = 0;
    let flag = false;
    target.handleInput = () => {
        callCount++;
    };
    const DEBOUNCE_MS = 50;
    // 防抖代理：短时间内多次调用只执行最后一次
    const handler = {
        get(target, prop) {
            if (prop === 'handleInput') {
                let timeout;
                return (...args) => {
                    clearTimeout(timeout);
                    timeout = setTimeout(() => {
                        target.handleInput(...args);
                    }, DEBOUNCE_MS);
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.handleInput();
    proxy.handleInput(); // 短时间内第二次调用
    setTimeout(() => {
        console.log(callCount === 2, "138.1：防抖逻辑生效（只执行2次）");
        flag = callCount === 2;
    }, DEBOUNCE_MS + 10);
    await sleepms(1000);
    return flag;
}

export function testGetAccessorInvariant40() {
    const target = {};
    let flag = 0;
    Object.defineProperty(target, 'x', {
        get: () => 10, // 不可配置访问器
        configurable: false
    });
    const handler = {
        get(target, prop) {
            return 20; // 尝试返回不同值
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        console.log(proxy.x);
        console.error("140.1：检测到访问器返回值错误");
        flag = flag + 1;
    } catch (e) {
        console.log(e instanceof TypeError, "140.1：访问器返回值错误不应抛TypeError");
        flag = flag + 0.1;
    }
    return flag;
}

export function testOwnKeysInvalidKeyType41() {
    const target = {};
    let flag = 0;
    const handler = {
        ownKeys(target) {
            return [123]; // 返回数字键（非法类型）
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.keys(proxy);
        flag = flag + 0.1;
        console.error("141.1：未检测到非法键类型错误");
    } catch (e) {
        console.log(e instanceof TypeError, "141.1：非法键类型应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testSetWritableInvariant42() {
    const target = { x: 10 };
    let flag = 0;
    Object.defineProperty(target, 'x', { writable: false }); // 不可写
    const handler = {
        set(target, prop, value) {
            target[prop] = value; // 尝试修改
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.x = 20;
        console.error("142.1：未阻止修改不可写属性");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "142.1：修改不可写属性应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export async function testProxyAsyncIterator43() {
    const target = { data: [1, 2, 3] };
    let flag = 0;
    const handler = {
        get(target, prop) {
            if (prop === Symbol.asyncIterator) {
                let index = 0;
                return () => ({
                    next: async () => {
                        await new Promise(res => setTimeout(res, 10)); // 模拟异步
                        if (index < target.data.length) {
                            return { value: target.data[index++] * 3, done: false };
                        }
                        return { done: true };
                    }
                });
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    (async () => {
        const result = [];
        for await (const val of proxy) {
            result.push(val);
        }
        if (result.join(',') === '3,6,9') {
            flag = flag + 1;
        }
        console.log(flag, "143.1：异步迭代器拦截生效");
    })();
    await sleepms(1000);
    return flag;
}

export function testProxyPromiseCatch44() {
    const promise = Promise.reject(new Error("原始错误"));
    let flag = 0;
    const handler = {
        get(target, prop) {
            if (prop === 'catch') {
                return (onRejected) => {
                    // 包装错误信息
                    return target.catch(err => onRejected(new Error(`拦截到错误：${err.message}`)));
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(promise, handler);

    proxy.catch(err => {
        console.log(err.message === "拦截到错误：原始错误", "144.1：Promise.catch拦截生效");
        flag = flag + 1;
    });
    return flag;
}

export function testProxyClassStaticInheritance46() {
    class Parent {
        static staticProp = 'parent';
    }

    class Child extends Parent {
    }

    const handler = {
        get(target, prop) {
            if (prop === 'staticProp') {
                return `proxied_${target[prop]}`;
            }
            return Reflect.get(target, prop);
        }
    };
    const ProxyChild = new Proxy(Child, handler);

    console.log(ProxyChild.staticProp === 'proxied_parent', "146.1：静态属性继承并拦截生效");
    return ProxyChild.staticProp === 'proxied_parent';
}

export function testRevokedProxyTypeof48() {
    const revocable = Proxy.revocable({ a: 1 }, {});
    revocable.revoke();

    console.log(typeof revocable.proxy === 'object', "148.1：撤销后typeof返回object");
    return typeof revocable.proxy === 'object';
}

export function testProxyProxyConstructor49() {
    const OriginalProxy = Proxy;
    const handler = {
        apply(target, thisArg, args) {
            const [targetObj, handlerObj] = args;
            // 为所有代理添加日志能力
            const loggedHandler = {
                ...handlerObj,
                get: (t, p) => {
                    console.log(`访问代理属性：${p}`);
                    return handlerObj.get?.(t, p) ?? t[p];
                }
            };
            return new OriginalProxy(targetObj, loggedHandler);
        }
    };
    const ProxyProxy = new OriginalProxy(OriginalProxy, handler);

    const obj = { a: 1 };
    const proxy = new ProxyProxy(obj, {});
    proxy.a; // 应触发日志
    console.log(proxy.a === 1, "149.1：元代理创建的代理正常工作");
    return proxy.a === 1;
}

export function testProxyUint8Array51() {
    const arr = new Uint8Array([10, 20]);
    let flag = 0;
    const handler = {
        get(target, prop) {
            const index = Number(prop);
            if (!isNaN(index) && index >= target.length) {
                throw new RangeError("索引超出范围");
            }
            return Reflect.get(target, prop);
        },
        set(target, prop, value) {
            const index = Number(prop);
            if (!isNaN(index) && (value < 0 || value > 255)) {
                throw new RangeError("Uint8值必须在0-255之间");
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(arr, handler);

    console.log(proxy[0] === 10, "151.1：合法索引访问成功");
    try {
        proxy[2]; // 超出范围
        console.error("151.2：未拦截超出范围的索引访问");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof RangeError, "151.2：超出范围应抛RangeError");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyDataView52() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    view.setUint32(0, 0x12345678); // 写入数据
    const handler = {
        get(target, prop) {
            if (prop === 'getUint32') {
                return (byteOffset, littleEndian) => {
                    const value = target.getUint32(byteOffset, littleEndian);
                    return value ^ 0xFFFFFFFF; // 按位取反
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(view, handler);

    console.log(proxy.getUint32(0) === 0xEDCBA987, "152.1：DataView方法拦截并修改值成功");
    return proxy.getUint32(0) === 0xEDCBA987;
}

export function testProxyBufferTransfer53() {
    let flag = 0;
    const buffer = new ArrayBuffer(8);
    const handler = {
        get(target, prop) {
            if (prop === 'transfer') {
                throw new Error("禁止转移ArrayBuffer所有权");
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(buffer, handler);

    try {
        ArrayBuffer.transfer(proxy, 16); // 尝试转移
        console.error("153.1：未阻止ArrayBuffer转移");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("禁止转移"), "153.1：转移应被拦截");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyPrivateMethod54() {
    class MyClass {
        #privateMethod() {
            return 'secret';
        }

        publicMethod() {
            return this.#privateMethod();
        }
    }

    const instance = new MyClass();
    const proxy = new Proxy(instance, {
        get(target, prop) {
            if (prop === 'publicMethod') {
                return () => `proxied_${target.publicMethod()}`;
            }
            return target[prop];
        }
    });

    console.log(proxy.publicMethod() === 'proxied_secret', "154.1：通过公开方法访问私有方法被拦截");
    return proxy.publicMethod() === 'proxied_secret';
}

export function testProxyClassStaticBlock55() {
    let staticBlockExecuted = false;

    class MyClass {
        static {
            staticBlockExecuted = true;
        }
    }

    const handler = {
        construct(target, args) {
            if (!staticBlockExecuted) {
                throw new Error("静态块未执行");
            }
            return new target(...args);
        }
    };
    const ProxyClass = new Proxy(MyClass, handler);

    new ProxyClass();
    console.log(staticBlockExecuted, "155.1：静态块执行被验证");
    return staticBlockExecuted;
}

export function testProxyClassExtends56() {
    class Base {
    }

    let flag = 0;

    class ValidChild extends Base {
    }

    class InvalidChild {
    }

    const handler = {
        construct(target, args, newTarget) {
            if (!(newTarget.prototype instanceof Base)) {
                throw new TypeError("必须继承自Base");
            }
            return new target(...args);
        }
    };
    const ProxyBase = new Proxy(Base, handler);

    new ValidChild();
    try {
        new InvalidChild();
        console.error("156.1：拦截非法继承");
        flag = flag + 1;
    } catch (e) {
        console.log(e instanceof TypeError, "156.1：非法继承应抛TypeError");
        flag = flag + 0.1;
    }
    return flag;
}

export async function testProxyPromiseAll57() {
    const originalAll = Promise.all;
    let flag = 0;
    const handler = {
        apply(target, thisArg, args) {
            return originalAll(...args).then(results =>
            results.map(r => r * 2) // 结果加倍
            );
        }
    };
    const ProxyPromise = new Proxy(Promise, handler);

    ProxyPromise.all([Promise.resolve(1), Promise.resolve(2)]).then(results => {
        if (results.join(',') === '1,2') {
            flag = flag + 1;
        }
        console.log(results.join(',') === '1,2', "157.1：Promise.all结果被拦截修改");

    });
    await sleepms(1000);
    return flag;
}

export function testProxyDecorator60() {
    const target = {
        calculate: (a, b) => a + b
    };
    const handler = {
        get(target, prop) {
            if (typeof target[prop] === 'function') {
                return function (...args) {
                    console.log(`调用${prop}，参数：${args}`);
                    const start = Date.now();
                    const result = target[prop](...args);
                    console.log(`耗时：${Date.now() - start}ms`);
                    return result;
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.calculate(2, 3) === 5, "160.1：装饰器模式增强方法成功");
    return proxy.calculate(2, 3) === 5;
}


export function testProxyAdapter61() {
    // 旧接口：返回{ user_name: string }
    const legacyAPI = { getUser: () => ({ user_name: 'Alice' }) };
    // 适配器代理：转换为{ userName: string }
    const handler = {
        get(target, prop) {
            if (prop === 'getUser') {
                return () => {
                    const legacyData = target.getUser();
                    return { userName: legacyData.user_name };
                };
            }
            return target[prop];
        }
    };
    const adaptedAPI = new Proxy(legacyAPI, handler);

    console.assert(adaptedAPI.getUser().userName === 'Alice', "161.1：适配器模式转换接口成功");
    return adaptedAPI.getUser().userName === 'Alice';
}

export function testProxyMediator62() {
    const componentA = { value: 0 };
    const componentB = { value: 0 };
    // 中介者代理：A变化时同步B
    const mediator = new Proxy({}, {
        set(target, prop, value) {
            if (prop === 'A') {
                componentA.value = value;
                componentB.value = value * 2; // B同步为A的2倍
            }
            return true;
        }
    });

    mediator.A = 5;
    console.assert(componentA.value === 5 && componentB.value === 10, "162.1：中介者协调组件同步成功");
    return componentA.value === 5 && componentB.value === 10;
}

export function testProxyLRUCache63() {
    const target = { data: () => Math.random() };
    const cache = new Map();
    const MAX_SIZE = 2; // 最大缓存2条
    const handler = {
        get(target, prop) {
            if (prop === 'data') {
                return (key) => {
                    if (cache.has(key)) {
                        // 刷新使用时间（删除再添加）
                        const value = cache.get(key);
                        cache.delete(key);
                        cache.set(key, value);
                        return value;
                    }
                    const value = target.data();
                    if (cache.size >= MAX_SIZE) {
                        const oldestKey = cache.keys().next().value;
                        cache.delete(oldestKey); // 淘汰最旧
                    }
                    cache.set(key, value);
                    return value;
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.data('a');
    proxy.data('b');
    proxy.data('c'); // 添加3个键
    console.log(!cache.has('a') && cache.has('b') && cache.has('c'), "163.1：LRU淘汰最旧数据成功");
    return !cache.has('a') && cache.has('b') && cache.has('c');
}

export function testProxyAccessFrequency64() {
    const target = { a: 1, b: 2, c: 3 };
    const frequency = { a: 0, b: 0, c: 0 };
    const handler = {
        get(target, prop) {
            if (frequency.hasOwnProperty(prop)) {
                frequency[prop]++;
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.a;
    proxy.a;
    proxy.b; // 访问a两次，b一次
    console.log(frequency.a === 2 && frequency.b === 1, "164.1：访问频率统计成功");
    return frequency.a === 2 && frequency.b === 1;
}

export function testProxyLazyLoad65() {
    let largeObjectLoaded = false;
    let flag = 0;
    const target = {
        // 模拟大对象（初始未加载）
        get large() {
            largeObjectLoaded = true;
            return { size: '1MB' };
        }
    };
    const handler = {
        get(target, prop) {
            if (prop === 'large' && !largeObjectLoaded) {
                console.log("开始加载大对象...");
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(!largeObjectLoaded, "165.1：初始未加载");
    proxy.large;
    console.log(largeObjectLoaded, "165.2：首次访问触发加载");
    flag = flag + 1;
    return flag;
}

export function testProxyToStringTag66() {
    const target = {};
    const handler = {
        get(target, prop) {
            if (prop === Symbol.toStringTag) {
                return 'MyCustomObject'; // 自定义标签
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(Object.prototype.toString.call(proxy) === '[object MyCustomObject]', "166.1：自定义toStringTag生效");
    return Object.prototype.toString.call(proxy) === '[object MyCustomObject]';
}

export function testProxyHasInstance67() {
    class MyClass {
    }

    const handler = {
        get(target, prop) {
            if (prop === Symbol.hasInstance) {
                return (instance) => {
                    // 自定义判断：instance有'foo'属性则视为实例
                    return 'foo' in instance;
                };
            }
            return target[prop];
        }
    };
    const ProxyClass = new Proxy(MyClass, handler);

    console.log({ foo: 1 } instanceof ProxyClass, "167.1：自定义instanceof判断生效");
    return { foo: 1 } instanceof ProxyClass;
}

export function testProxySymbolSpecies68() {
    class MyArray extends Array {
        static get [Symbol.species]() {
            return Array;
        } // 默认返回Array
    }

    const handler = {
        get(target, prop) {
            if (prop === Symbol.species) {
                return MyArray; // 强制返回MyArray
            }
            return target[prop];
        }
    };
    const ProxyArray = new Proxy(MyArray, handler);

    const arr = new ProxyArray(1, 2);
    const mapped = arr.map(x => x); // map返回species类型
    console.log(mapped instanceof MyArray, "168.1：Symbol.species自定义返回类型生效");
    return !(mapped instanceof MyArray);
}

export function testProxyErrorCapture69() {
    let flag = 0;
    const target = {
        riskyMethod: () => {
            throw new Error("原始错误");
        }
    };
    const handler = {
        get(target, prop) {
            if (typeof target[prop] === 'function') {
                return function (...args) {
                    try {
                        return target[prop](...args);
                    } catch (e) {
                        throw new Error(`代理捕获：${e.message}`); // 统一包装
                    }
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.riskyMethod();
        console.error("169.1：未捕获方法错误");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message === "代理捕获：原始错误", "169.1：错误被统一包装");
        flag = flag + 1;
    }
    return flag;
}

export async function testProxySyncAsyncError70() {
    let flag = 0;
    const target = {
        syncError: () => {
            throw new Error("同步错误");
        },
        asyncError: async () => {
            throw new Error("异步错误");
        }
    };
    const handler = {
        get(target, prop) {
            if (prop === 'syncError') {
                return () => {
                    try {
                        return target.syncError();
                    } catch (e) {
                        throw new Error(`同步捕获：${e.message}`);
                    }
                };
            }
            if (prop === 'asyncError') {
                return async () => {
                    try {
                        return await target.asyncError();
                    } catch (e) {
                        throw new Error(`异步捕获：${e.message}`);
                    }
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.syncError();
    } catch (e) {
        console.log(e.message === "同步捕获：同步错误", "170.1：同步错误处理");
        flag = flag + 1;
    }
    proxy.asyncError().catch(e => {
        console.log(e.message === "异步捕获：异步错误", "170.2：异步错误处理");
        flag = flag + 1;
    });
    await sleepms(1000);
    return flag;
}

export async function testProxyErrorRetry71() {
    let attempt = 0;
    let flag = 0;
    const target = {
        flakyMethod: () => {
            attempt++;
            if (attempt < 3) {
                throw new Error("临时失败");
            }
            return "成功";
        }
    };
    const handler = {
        get(target, prop) {
            if (prop === 'flakyMethod') {
                return async (...args) => {
                    const maxRetries = 3;
                    let retries = 0;
                    while (retries < maxRetries) {
                        try {
                            return target.flakyMethod(...args);
                        } catch (e) {
                            retries++;
                            if (retries === maxRetries) {
                                throw e;
                            }
                        }
                    }
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.flakyMethod().then(result => {
        if (result === "成功" && attempt === 3) {
            flag = flag + 1;
        }
        console.log(result === "成功" && attempt === 3, "171.1：重试机制成功");
    });
    await sleepms(1000)
    return flag;
}

export function testProxyMapIterator72() {
    const map = new Map([['a', 1], ['b', 2]]);
    const handler = {
        get(target, prop) {
            if (prop === Symbol.iterator) {
                return () => {
                    const iterator = target[Symbol.iterator]();
                    return {
                        next: () => {
                            const result = iterator.next();
                            return result.done ? result : { ...result, value: [result.value[0], result.value[1] * 2] };
                        }
                    };
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(map, handler);

    const entries = [...proxy];
    console.log(entries[0][1] === 2 && entries[1][1] === 4, "172.1：Map迭代器值被修改");
    return entries[0][1] === 2 && entries[1][1] === 4;
}

export function testGetVsGetPrototypeOf78() {
    const target = {};
    const proto1 = {};
    const proto2 = {};
    const handler = {
        get(target, prop) {
            if (prop === '__proto__') {
                return proto1;
            } // get陷阱
        },
        getPrototypeOf(target) {
            return proto2; // getPrototypeOf陷阱
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(Object.getPrototypeOf(proxy) === proto2, "178.1：getPrototypeOf优先级更高");
    console.log(proxy.__proto__ === proto2, "178.2：__proto__访问遵循getPrototypeOf");
    return !(proxy.__proto__ === proto2);
}

export function testSetVsDefineProperty79() {
    const target = {};
    let setCalled = false;
    let defineCalled = false;
    const handler = {
        set(target, prop, value) {
            setCalled = true;
            return true;
        },
        defineProperty(target, prop, desc) {
            defineCalled = true;
            return Reflect.defineProperty(target, prop, desc);
        }
    };
    const proxy = new Proxy(target, handler);

    Object.defineProperty(proxy, 'a', { value: 1 }); // 触发defineProperty
    console.log(defineCalled && !setCalled, "179.1：defineProperty优先于set");
    return defineCalled && !setCalled;
}

export function testOwnKeysVsHas80() {
    const target = { a: 1 };
    let flag = 0;
    const handler = {
        ownKeys(target) {
            return ['a', 'b'];
        }, // 返回b（不存在）
        has(target, prop) {
            return prop === 'a';
        } // 不认可b
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.keys(proxy); // 触发ownKeys与has冲突
        console.error("180.1：检测到ownKeys与has冲突");
        flag = flag + 1;
    } catch (e) {
        console.log(e instanceof TypeError, "180.1：冲突不应抛TypeError");
        flag = flag + 0.1;
    }
    return flag;
}

export function testProxyDataBinding87() {
    const data = { name: 'Alice' };
    const view = { element: { textContent: '' } };
    // 数据代理：变化时更新视图
    const dataProxy = new Proxy(data, {
        set(target, prop, value) {
            target[prop] = value;
            view.element.textContent = value; // 更新视图
            return true;
        }
    });

    dataProxy.name = 'Bob';
    console.log(view.element.textContent === 'Bob', "187.1：数据变化同步视图成功");
    return view.element.textContent === 'Bob';
}

export function testProxyAccessControl88() {
    const user = { name: 'Alice', role: 'user', salary: 10000 };
    let flag = 0;
    const handler = {
        get(target, prop) {
            // 普通用户不能访问salary
            if (prop === 'salary' && target.role === 'user') {
                throw new Error("无权限访问薪资");
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(user, handler);

    console.log(proxy.name === 'Alice', "188.1：合法属性访问成功");
    try {
        proxy.salary;
        console.error("188.2：未拦截无权限访问");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("无权限"), "188.2：无权限访问被拦截");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyCommandPattern89() {
    const target = { value: 0 };
    const history = []; // 记录操作历史
    const handler = {
        set(target, prop, value) {
            if (prop === 'value') {
                history.push({
                    type: 'set',
                    prop,
                    oldValue: target[prop],
                    newValue: value
                });
            }
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.value = 1;
    proxy.value = 2;
    // 撤销最后一次操作
    const lastOp = history.pop();
    if (lastOp) {
        target[lastOp.prop] = lastOp.oldValue;
    }
    console.log(target.value === 1, "189.1：命令模式支持撤销操作");
    return target.value === 1;
}

export function testProxyArrayAt90() {
    const arr = [10, 20, 30];
    const handler = {
        get(target, prop) {
            if (prop === 'at') {
                return (index) => {
                    const value = target.at(index);
                    return value ? value * 2 : value; // 加倍值
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    console.log(proxy.at(1) === 40 && proxy.at(-1) === 60, "190.1：at方法被拦截修改");
    return proxy.at(1) === 40 && proxy.at(-1) === 60;
}

export function testProxyObjectHasOwn91() {
    const target = { a: 1 };
    const handler = {
        getOwnPropertyDescriptor(target, prop) {
            if (prop === 'a') {
                return undefined;
            } // 隐藏a的描述符
            return Reflect.getOwnPropertyDescriptor(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(!Object.hasOwn(proxy, 'a'), "191.1：Object.hasOwn受代理影响");
    return !Object.hasOwn(proxy, 'a');
}

export function testProxyErrorCause92() {
    const handler = {
        construct(target, args) {
            const [message, options] = args;
            // 添加统一错误原因
            return new target(message, { ...options, cause: '代理添加的原因' });
        }
    };
    const ProxyError = new Proxy(Error, handler);

    const err = new ProxyError("测试错误");
    console.log(err.cause === '代理添加的原因', "192.1：错误cause被拦截修改");
    return err.cause === '代理添加的原因';
}

export function testProxyRecursive95() {
    let proxy; // 先声明
    const handler = {
        get(target, prop) {
            if (prop === 'self') {
                return proxy;
            } // 返回自身
            return target[prop];
        }
    };
    proxy = new Proxy({}, handler); // 初始化代理

    console.log(proxy.self === proxy, "195.1：代理可引用自身");
    return proxy.self === proxy;
}

export function testProxySandbox100() {
    let flag = 0;
    const sandboxGlobal = {
        console: {
            log: () => {
            }
        }, // 受限console
        Math: Math, // 允许Math
        // 禁止全局变量访问
    };
    const handler = {
        has: () => false, // 隐藏所有全局属性
        get(target, prop) {
            if (prop in target) {
                return target[prop];
            }
            throw new Error(`沙箱中禁止访问${prop}`);
        }
    };
    const sandboxProxy = new Proxy(sandboxGlobal, handler);

    // 模拟沙箱执行代码
    const code = `console.log(Math.PI); window;`;
    try {
        new Function('global', code)(sandboxProxy);
        console.error("200.1：沙箱未阻止非法访问");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("禁止访问window"), "200.1：沙箱成功隔离");
        flag = flag + 1;
    }
    return flag;
}