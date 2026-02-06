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


export function testProxyRegExpExec4() {
    const regex = /foo(\d+)/;
    const handler = {
        get(target, prop) {
            if (prop === 'exec') {
                return (str) => {
                    const result = target.exec(str);
                    if (result) {
                        result[1] = `num:${result[1]}`;
                    } // 修改捕获组
                    return result;
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(regex, handler);

    const result = proxy.exec('foo123');
    console.log(result[1] === 'num:123', "204.1：RegExp.exec捕获组被修改");
    return result[1] === 'num:123';
}

export function testProxyPreventProtoPollution5() {
    const target = {};
    let flag = 0;
    const handler = {
        set(target, prop, value) {
            if (prop === '__proto__') {
                throw new Error("禁止修改原型"); // 阻止原型赋值
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.__proto__ = { pollute: true };
        console.error("205.1：未阻止原型污染");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("禁止修改"), "205.1：原型污染被拦截");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyFilterDangerousProps6() {
    const target = {};
    let flag = 0;
    const handler = {
        get(target, prop) {
            if (prop === 'constructor') {
                return () => {
                    throw new Error("禁止访问构造函数");
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.constructor();
        console.error("206.1：未拦截constructor访问");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("禁止访问"), "206.1：危险属性访问被拦截");
        flag = flag + 1;
    }
    return flag;
}

export async function testProxyAsyncGenerator7() {

    async function* asyncGenerator() {
        yield 1;
        yield 2;
    }

    let flag = 0
    const gen = asyncGenerator();
    const handler = {
        get(target, prop) {
            if (prop === 'next') {
                return async () => {
                    const result = await target.next();
                    return result.done ? result : { ...result, value: result.value * 2 };
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(gen, handler);

    (async () => {
        const result1 = await proxy.next();
        console.log(result1.value === 2, "207.1：异步生成器值被加倍");
        if (result1.value === 2) {
            flag = flag + 1;
        }
    })();
    await sleepms(1000);
    return flag
}

export async function testProxyAsyncGeneratorReturn8() {

    async function* asyncGenerator() {
        yield 1;
        yield 2;
    }

    let flag = 0;
    const gen = asyncGenerator();
    let returnCalled = false;
    const handler = {
        get(target, prop) {
            if (prop === 'return') {
                return (value) => {
                    returnCalled = true;
                    return target.return(`closed:${value}`);
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(gen, handler);

    (async () => {
        await proxy.return('done');
        console.log(returnCalled && (await proxy.next()).value === 'closed:done', "208.1：return方法被拦截修改");
        if (returnCalled && (await proxy.next()).value === 'closed:done') {
            flag++;
        }
    })();
    await sleepms(1000);
    return flag;
}

export function testProxyImportMeta9() {
    const importMeta = { url: 'file:///dev/module.js' };
    const handler = {
        get(target, prop) {
            if (prop === 'url' && target.url.includes('/dev/')) {
                return target.url.replace('/dev/', '/prod/'); // 替换环境路径
            }
            return target[prop];
        }
    };
    const proxyMeta = new Proxy(importMeta, handler);

    console.log(proxyMeta.url === 'file:///prod/module.js', "209.1：import.meta.url被修改");
    return proxyMeta.url === 'file:///prod/module.js';
}

export function testProxyComputedCache11() {
    const target = {
        // 模拟计算密集型属性
        get heavy() {
            return [1, 2, 3].reduce((a, b) => a + b, 0);
        }
    };
    const cache = new Map();
    const handler = {
        get(target, prop) {
            if (prop === 'heavy' && !cache.has(prop)) {
                cache.set(prop, target[prop]); // 缓存结果
            }
            return cache.get(prop);
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.heavy; // 首次计算
    const result = proxy.heavy; // 缓存读取
    console.log(result === 6 && cache.size === 1, "211.1：计算属性缓存生效");
    return result === 6 && cache.size === 1;
}

export function testProxyLazyModuleLoad12() {
    let largeModuleLoaded = false;
    const target = {
        get largeModule() {
            largeModuleLoaded = true;
            return { size: '10MB' }; // 模拟大型模块
        }
    };
    const handler = {
        get(target, prop) {
            if (prop === 'largeModule' && !largeModuleLoaded) {
                console.log("开始加载大型模块...");
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(!largeModuleLoaded, "212.1：初始未加载");
    let res1 = !largeModuleLoaded;
    proxy.largeModule;
    console.log(largeModuleLoaded, "212.2：首次访问触发加载");
    return largeModuleLoaded && res1;
}

export function testProxyArrayFindLast13() {
    const arr = [1, 2, 3, 4];
    const handler = {
        get(target, prop) {
            if (prop === 'findLast') {
                return (predicate) => {
                    const value = target.findLast(predicate);
                    return value ? value * 10 : value; // 结果乘10
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    const result = proxy.findLast(x => x % 2 === 0); // 找最后一个偶数4
    console.log(result === 40, "213.1：findLast方法被拦截修改");
    return result === 40;
}

export function testProxyErrorCauseChain14() {
    const handler = {
        construct(target, args) {
            const [message, options] = args;
            // 包装原始原因
            const cause = options?.cause ? `包装原因：${options.cause.message}` : undefined;
            return new target(message, { ...options, cause });
        }
    };
    const ProxyError = new Proxy(Error, handler);

    const innerErr = new Error("内部错误");
    const err = new ProxyError("外部错误", { cause: innerErr });
    console.log(err.cause === "包装原因：内部错误", "214.1：错误原因链被修改");
    return err.cause === "包装原因：内部错误";
}

export function testProxyStatePattern15() {
    const target = { state: 'off' };
    let flag = 0;
    // 状态转换规则：off → on → pause → off
    const validTransitions = { off: ['on'], on: ['pause'], pause: ['off'] };
    const handler = {
        set(target, prop, value) {
            if (prop === 'state' && !validTransitions[target.state].includes(value)) {
                throw new Error(`无效状态转换：${target.state} → ${value}`);
            }
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.state = 'on'; // 合法
    try {
        proxy.state = 'off'; // 从on直接到off无效（应先到pause）
        console.error("215.1：未拦截无效状态转换");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("无效状态转换"), "215.1：状态转换被拦截");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyStrategyPattern16() {
    const strategies = {
        add: (a, b) => a + b,
        multiply: (a, b) => a * b
    };
    const target = { strategy: 'add' };
    const handler = {
        get(target, prop) {
            if (prop === 'calculate') {
                return (a, b) => strategies[target.strategy](a, b);
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.calculate(2, 3) === 5, "216.1：加法策略生效");
    let res = proxy.calculate(2, 3) === 5;
    proxy.strategy = 'multiply';
    console.log(proxy.calculate(2, 3) === 6, "216.2：动态切换乘法策略生效");
    return proxy.calculate(2, 3) === 6 && res;
}

export function testProxyToJSON17() {
    const target = { name: 'Alice', age: 30, secret: 'hidden' };
    const handler = {
        get(target, prop) {
            if (prop === 'toJSON') {
                return () => {
                    // 序列化时过滤secret
                    const { secret, ...publicData } = target;
                    return publicData;
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    const json = JSON.stringify(proxy);
    console.log(json.includes('"name":"Alice"') && !json.includes('secret'), "217.1：toJSON拦截过滤敏感数据");
    return json.includes('"name":"Alice"') && !json.includes('secret');
}

export function testProxyCallStackTrace19() {
    const target = {
        funcA: () => target.funcB(),
        funcB: () => console.log("执行B")
    };
    const callStack = [];
    const handler = {
        get(target, prop) {
            if (typeof target[prop] === 'function') {
                return function (...args) {
                    callStack.push(prop); // 记录调用栈
                    const result = target[prop](...args);
                    callStack.pop();
                    return result;
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.funcA();
    console.log(callStack.join(',') === '', "219.1：调用栈完整记录并清理");
    return callStack.join(',') === '';
}

export function testProxyPropertyBreakpoint20() {
    const target = { config: 'default' };
    let flag = 0;
    const handler = {
        set(target, prop, value) {
            if (prop === 'config' && value === 'danger') {
                debugger; // 触发断点（实际调试中生效）
                throw new Error("检测到危险配置");
            }
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.config = 'danger';
        console.error("220.1：未触发危险配置断点");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("危险配置"), "220.1：属性修改断点生效");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyMapClear21() {
    const map = new Map([['a', 1], ['b', 2]]);
    const handler = {
        get(target, prop) {
            if (prop === 'clear') {
                return () => {
                    if (target.size > 0 && !confirm("确定清空Map？")) {
                        return false; // 模拟用户取消
                    }
                    return target.clear();
                };
            }
            return Reflect.get(target, prop);
        }
    };
    // 模拟confirm始终取消
    globalThis.confirm = () => false;
    const proxy = new Proxy(map, handler);

    proxy.clear(); // 被取消
    console.log(proxy.size === 2, "221.1：Map清空被阻止");
    return proxy.size === 2;
}

export function testProxySetForEach22() {
    const set = new Set([1, 2, 3]);
    const handler = {
        get(target, prop) {
            if (prop === 'forEach') {
                return (callback) => {
                    // 迭代时值加倍
                    target.forEach(value => callback(value * 2));
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(set, handler);

    const result = [];
    proxy.forEach(v => result.push(v));
    console.log(result.join(',') === '2,4,6', "222.1：Set.forEach值被修改");
    return result.join(',') === '2,4,6';
}

export function testProxyFunctionBind23() {
    const func = function () {
        return this.value;
    };
    const handler = {
        get(target, prop) {
            if (prop === 'bind') {
                return (thisArg) => {
                    // 绑定到包装对象，添加前缀
                    const wrappedThis = { value: `bound_${thisArg.value}` };
                    return target.bind(wrappedThis);
                };
            }
            return target[prop];
        }
    };
    const proxyFunc = new Proxy(func, handler);
    const bound = proxyFunc.bind({ value: 'test' });
    console.log(bound() === 'bound_test', "223.1：函数bind上下文被修改");
    return bound() === 'bound_test';
}

export function testProxyFunctionCall24() {
    const sum = (a, b) => a + b;
    const handler = {
        get(target, prop) {
            if (prop === 'call') {
                return (thisArg, ...args) => {
                    // 参数加倍后调用
                    const doubled = args.map(v => v * 2);
                    return target.call(thisArg, ...doubled);
                };
            }
            return target[prop];
        }
    };
    const proxySum = new Proxy(sum, handler);

    console.log(proxySum.call(null, 1, 2) === 6, "224.1：函数call参数被修改");
    return proxySum.call(null, 1, 2) === 6;
}

export function testProxyDateYear25() {
    const date = new Date('2023-01-01');
    const handler = {
        get(target, prop) {
            if (prop === 'getFullYear') {
                return () => target.getFullYear() + 10; // 年份加10
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(date, handler);

    console.log(proxy.getFullYear() === 2033, "225.1：日期年份被拦截修改");
    return proxy.getFullYear() === 2033;
}

export function testProxyIntlTimezone26() {
    const formatter = new Intl.DateTimeFormat('en-US', { timeZone: 'UTC' });
    const handler = {
        get(target, prop) {
            if (prop === 'format') {
                return (date) => {
                    // 强制使用北京时区
                    return new Intl.DateTimeFormat('en-US', { timeZone: 'Asia/Shanghai' }).format(date);
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(formatter, handler);

    const date = new Date('2023-01-01T00:00:00Z'); // UTC零点
    // 北京时区为UTC+8，应显示08:00
    console.log(proxy.format(date).includes('01/01/2023, 08:00:00 AM'), "226.1：时区被强制修改");
    return proxy.format(date).includes('01/01/2023, 08:00:00 AM');
}

export function testProxyArrayFlatMap27() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'flatMap') {
                return (callback) => {
                    // 先映射再加倍
                    return target.flatMap(v => [callback(v) * 2]);
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    const result = proxy.flatMap(v => v + 1); // 原映射: [2,3,4] → 加倍: [4,6,8]
    console.log(result.join(',') === '4,6,8', "227.1：flatMap结果被修改");
    return result.join(',') === '4,6,8';
}

export function testProxyArrayWith28() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'with') {
                return (index, value) => {
                    const newArr = target.with(index, value);
                    return newArr.map(v => v * 2); // 新数组元素加倍
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    const newArr = proxy.with(1, 5); // 原新数组: [1,5,3] → 加倍: [2,10,6]
    console.log(newArr.join(',') === '2,10,6', "228.1：数组with方法被拦截");
    return newArr.join(',') === '2,10,6';
}

export function testProxyError29() {
    let flag = 0;
    const target = {
        risky: () => {
            throw new TypeError("类型错误");
        },
        critical: () => {
            throw new Error("严重错误");
        }
    };
    const handler = {
        get(target, prop) {
            if (typeof target[prop] === 'function') {
                return function (...args) {
                    try {
                        return target[prop](...args);
                    } catch (e) {
                        if (e instanceof TypeError) {
                            console.warn("忽略类型错误:", e.message);
                            return null; // 忽略类型错误
                        } else {
                            throw e; // 重新抛出严重错误
                        }
                    }
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    if (proxy.risky() === null) {
        flag = flag + 1;
    }
    console.log(proxy.risky() === null, "229.1：类型错误被忽略");
    try {
        proxy.critical();
        console.error("229.2：未抛出严重错误");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message === "严重错误", "229.2：严重错误被重新抛出");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyNumberIsInteger31() {
    const handler = {
        get(target, prop) {
            if (prop === 'isInteger') {
                return (value) => {
                    // 原始检测 + 排除Infinity
                    return target.isInteger(value) && value !== Infinity;
                };
            }
            return target[prop];
        }
    };
    const ProxyNumber = new Proxy(Number, handler);

    console.log(ProxyNumber.isInteger(5) === true, "231.1：正常整数检测通过");
    console.log(ProxyNumber.isInteger(Infinity) === false, "231.2：Infinity被排除");
    return (ProxyNumber.isInteger(5) === true) && (ProxyNumber.isInteger(Infinity) === false);
}


export function testProxyMathRandom32() {
    let seed = 1;
    const handler = {
        get(target, prop) {
            if (prop === 'random') {
                return () => {
                    // 简单线性同余生成器
                    seed = (seed * 9301 + 49297) % 233280;
                    return seed / 233280;
                };
            }
            return target[prop];
        }
    };
    const ProxyMath = new Proxy(Math, handler);

    const first = ProxyMath.random();
    const second = ProxyMath.random();
    console.log(!(first === ProxyMath.random() && second === ProxyMath.random()), "232.1：种子随机数可预测");
    return !(first === ProxyMath.random() && second === ProxyMath.random());
}

export async function testProxyPromiseFinally34() {
    let flag = 0;
    const handler = {
        get(target, prop) {
            if (prop === 'finally') {
                return (callback) => {
                    // 包装finally，确保回调执行
                    return target.finally(() => {
                        const result = callback();
                        if (result instanceof Promise) {
                            return result.catch(e => console.error("finally错误:", e));
                        }
                        return result;
                    });
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const promise = Promise.resolve(1);
    const proxy = new Proxy(promise, handler);
    let finallyCalled = false;

    proxy.finally(() => {
        finallyCalled = true;
    });
    setTimeout(() => {
        console.log(finallyCalled, "234.1：finally回调被确保执行");
        flag = flag + 1;
    }, 0);
    await sleepms(1000);
    return flag;
}


export function testProxyBatchObserver37() {
    const target = { a: 1, b: 2 };
    const observers = new Set();
    let batch = false;
    const pendingChanges = [];
    // 批量更新开关
    const startBatch = () => {
        batch = true;
    };
    const endBatch = () => {
        batch = false;
        observers.forEach(cb => cb([...pendingChanges]));
        pendingChanges.length = 0;
    };
    const handler = {
        set(target, prop, value) {
            const oldValue = target[prop];
            target[prop] = value;
            if (batch) {
                pendingChanges.push({ prop, oldValue, value });
            } else {
                observers.forEach(cb => cb([{ prop, oldValue, value }]));
            }
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    let changes;
    observers.add(chs => {
        changes = chs;
    });
    startBatch();
    proxy.a = 2;
    proxy.b = 3;
    endBatch();
    console.log(changes.length === 2, "237.1：批量更新通知成功");
    return changes.length === 2;
}

export function testProxyCompositeDecorator38() {
    const target = {
        multiply: (a, b) => a * b // 目标方法
    };
    const cache = new Map();
    const handler = {
        get(target, prop) {
            if (prop === 'multiply') {
                return function (a, b) {
                    // 参数验证
                    if (typeof a !== 'number' || typeof b !== 'number') {
                        throw new TypeError("参数必须为数字");
                    }
                    // 缓存键
                    const key = `${a},${b}`;
                    if (cache.has(key)) {
                        return cache.get(key);
                    }
                    // 执行并缓存
                    const result = target.multiply(a, b);
                    cache.set(key, result);
                    return result;
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.multiply(2, 3) === 6, "238.1：装饰器组合生效");
    console.log(proxy.multiply(2, 3) === 6 && cache.size === 1, "238.2：缓存生效");
    return proxy.multiply(2, 3) === 6 && cache.size === 1;
}


export function testProxyArguments39() {

    function testFunc(a, b) {
        const handler = {
            get(target, prop) {
                const value = target[prop];
                // 参数值加倍
                return typeof value === 'number' ? value * 2 : value;
            }
        };
        const proxyArgs = new Proxy(arguments, handler);
        return proxyArgs[0] + proxyArgs[1];
    }

    console.log(testFunc(1, 2) === 6, "239.1：arguments对象被代理修改");
    return testFunc(1, 2) === 6;
}

export function testProxyThisContext40() {
    const obj = { value: 10 };

    function func() {
        return this.value;
    }

    const handler = {
        apply(target, thisArg, args) {
            // 修改this为代理对象，值加倍
            const proxyThis = new Proxy(thisArg, {
                get: (t, p) => p === 'value' ? t[p] * 2 : t[p]
            });
            return target.apply(proxyThis, args);
        }
    };
    const proxyFunc = new Proxy(func, handler);

    console.log(proxyFunc.call(obj) === 20, "240.1：函数this上下文被代理修改");
    return proxyFunc.call(obj) === 20;
}

export function testProxyRegExpTestIgnoreCase45() {
    const regex = /foo/;
    const handler = {
        get(target, prop) {
            if (prop === 'test') {
                return (str) => {
                    // 强制转为小写后测试
                    return target.test(str.toLowerCase());
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(regex, handler);

    console.log(proxy.test('FOO') === true, "245.1：正则测试被强制忽略大小写");
    return proxy.test('FOO') === true;
}

export function testProxyFunctionCurry47() {
    const sum = (a, b, c) => a + b + c;
    const handler = {
        apply(target, thisArg, args) {
            // 若参数不足，返回柯里化函数
            if (args.length < target.length) {
                return new Proxy(target, {
                    apply: (t, a, newArgs) => handler.apply(t, a, [...args, ...newArgs])
                });
            }
            return target.apply(thisArg, args);
        }
    };
    const curriedSum = new Proxy(sum, handler);

    console.log(curriedSum(1)(2)(3) === 6, "247.1：函数被自动柯里化");
    console.log(curriedSum(1, 2)(3) === 6, "247.2：部分参数柯里化生效");
    return curriedSum(1)(2)(3) === 6 && curriedSum(1, 2)(3) === 6;
}

export function testProxyFunctionPipe48() {
    const add = x => x + 1;
    const multiply = x => x * 2;
    // 管道代理：将函数数组组合为f(g(x))
    const pipe = (...fns) => new Proxy((x) => x, {
        apply(target, thisArg, args) {
            return fns.reduce((acc, fn) => fn(acc), ...args);
        }
    });
    const pipeline = pipe(add, multiply); // x → add(x) → multiply(result)

    console.log(pipeline(3) === 8, "248.1：函数管道组合生效（3+1=4 → 4*2=8）");
    return pipeline(3) === 8;
}

export function testProxyRateLimit49() {
    let flag = 0;
    const target = { apiCall: () => "响应" };
    const calls = [];
    const RATE_LIMIT = 2; // 2次/秒
    const handler = {
        get(target, prop) {
            if (prop === 'apiCall') {
                return function (...args) {
                    const now = Date.now();
                    // 清理1秒前的调用记录
                    calls.push(now);
                    calls.splice(0, calls.findIndex(t => t > now - 1000));
                    if (calls.length > RATE_LIMIT) {
                        throw new Error("超过调用频率限制");
                    }
                    return target.apiCall(...args);
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.apiCall();
    proxy.apiCall();
    try {
        proxy.apiCall(); // 第三次调用超出限制
        console.error("249.1：未拦截超出频率的调用");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("频率限制"), "249.1：调用频率被限制");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyParamValidation50() {
    let flag = 0;
    const target = {
        query: (sql) => `执行:${sql}`
    };
    // 参数签名：sql必须为字符串且不含危险关键字
    const validate = (sql) => {
        if (typeof sql !== 'string') {
            return false;
        }
        const dangerous = ['DROP', 'DELETE', 'TRUNCATE'];
        return !dangerous.some(key => sql.toUpperCase().includes(key));
    };
    const handler = {
        get(target, prop) {
            if (prop === 'query') {
                return (sql) => {
                    if (!validate(sql)) {
                        throw new Error("无效SQL查询");
                    }
                    return target.query(sql);
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.query("SELECT * FROM users"); // 合法
    try {
        proxy.query("DROP TABLE users"); // 危险操作
        console.error("250.1：未拦截危险参数");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes("无效SQL"), "250.1：危险参数被拦截");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyFinalizationRegistry55() {
    if (typeof FinalizationRegistry === 'undefined') {
        return;
    }
    const log = [];
    const handler = {
        construct(target, args) {
            const [callback] = args;
            // 包装清理回调添加日志
            const wrappedCallback = (heldValue) => {
                log.push(`对象${heldValue}被回收`);
                callback(heldValue);
            };
            return new target(wrappedCallback);
        }
    };
    const ProxyRegistry = new Proxy(FinalizationRegistry, handler);
    const registry = new ProxyRegistry(() => {
    });
    const obj = {};

    registry.register(obj, 'testObj');
    // 触发垃圾回收（模拟）
    console.log(log.length === 0, "255.1：初始未回收");
    return log.length === 0;
}

export function testProxyWeakRef56() {
    if (typeof WeakRef === 'undefined') {
        return;
    }
    const handler = {
        construct(target, args) {
            const ref = new target(...args);
            return new Proxy(ref, {
                get: (t, prop) => {
                    if (prop === 'deref') {
                        return () => {
                            const obj = t.deref();
                            if (!obj) {
                                console.log("对象已被回收");
                            }
                            return obj;
                        };
                    }
                    return t[prop];
                }
            });
        }
    };
    const ProxyWeakRef = new Proxy(WeakRef, handler);
    const obj = {};
    const ref = new ProxyWeakRef(obj);

    console.log(ref.deref() === obj, "256.1：弱引用正常访问");
    // 触发回收后deref()将返回undefined并日志
    return ref.deref() === obj;
}

export function testProxyMathPow57() {
    let flag = 0;
    const handler = {
        get(target, prop) {
            if (prop === 'pow') {
                return (base, exponent) => {
                    const result = target.pow(base, exponent);
                    if (result > 1e100) {
                        throw new RangeError("结果过大");
                    }
                    return result;
                };
            }
            return target[prop];
        }
    };
    const ProxyMath = new Proxy(Math, handler);

    console.log(ProxyMath.pow(2, 10) === 1024, "257.1：正常幂运算成功");
    try {
        ProxyMath.pow(10, 200); // 结果1e200超出限制
        console.error("257.2：未拦截过大幂运算结果");
        flag = flag + 0.1;

    } catch (e) {
        flag = flag + 1;
        console.log(e instanceof RangeError, "257.2：过大结果被拦截");
    }
    return flag;
}

export function testProxyBigIntOperations58() {
    let flag = 0;
    const handler = {
        get(target, prop) {
            if (prop === 'asIntN') {
                return (bits, bigint) => {
                    // 确保结果在安全范围内
                    const max = (1n << BigInt(bits - 1)) - 1n;
                    if (bigint > max) {
                        throw new RangeError(`超出${bits}位有符号整数范围`);
                    }
                    return target.asIntN(bits, bigint);
                };
            }
            return target[prop];
        }
    };
    const ProxyBigInt = new Proxy(BigInt, handler);

    const safe = 127n;
    ProxyBigInt.asIntN(8, safe); // 合法（8位最大127）
    try {
        ProxyBigInt.asIntN(8, 128n); // 超出范围
        console.error("258.1：未拦截BigInt溢出");
        flag = flag + 0.1;
    } catch (e) {
        flag = flag + 1;
        console.log(e.message.includes("范围"), "258.1：BigInt溢出被拦截");
    }
    return flag;
}

export function testProxyStateMachine59() {
    const target = { state: 'idle' };
    // 状态配置：状态→事件→目标状态+动作
    const config = {
        idle: {
            start: { to: 'running', action: () => console.log("开始运行") }
        },
        running: {
            pause: { to: 'paused', action: () => console.log("暂停") },
            stop: { to: 'idle', action: () => console.log("停止") }
        },
        paused: {
            resume: { to: 'running', action: () => console.log("恢复") }
        }
    };
    const handler = {
        get(target, prop) {
            if (config[target.state][prop]) {
                // 事件触发状态转换
                return () => {
                    const transition = config[target.state][prop];
                    transition.action();
                    target.state = transition.to;
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.start(); // idle → running
    console.log(proxy.state === 'running', "259.1：状态转换成功");
    let res = (proxy.state === 'running');
    proxy.pause(); // running → paused
    console.log(proxy.state === 'paused', "259.2：状态机逻辑生效");
    return (res && proxy.state === 'paused');
}
