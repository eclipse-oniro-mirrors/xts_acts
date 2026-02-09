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

export function testProxyNumberFormat1() {
    const formatter = new Intl.NumberFormat('en-US', { maximumFractionDigits: 2 });
    const handler = {
        get(target, prop) {
            if (prop === 'format') {
                return (num) => {
                    // 强制保留2位小数
                    return target.format(Number(num.toFixed(2)));
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(formatter, handler);

    console.log(proxy.format(1.234) === '1.23', "301.1：数字格式化精度被强制");
    return proxy.format(1.234) === '1.23';
}

export function testProxyDateTimeTimezone2() {
    const formatter = new Intl.DateTimeFormat('zh-CN', { timeZone: 'UTC' });
    const handler = {
        get(target, prop) {
            if (prop === 'format') {
                return (date) => {
                    // 动态切换到纽约时区（UTC-4/UTC-5）
                    const nyFormatter = new Intl.DateTimeFormat('en-US', {
                        timeZone: 'America/New_York',
                        hour: 'numeric',
                        minute: 'numeric'
                    });
                    return `纽约时间：${nyFormatter.format(date)}`;
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(formatter, handler);

    const date = new Date('2023-01-01T12:00:00Z'); // UTC 12:00
    console.log(proxy.format(date).includes('7:00 AM'), "302.1：时区转换生效（UTC→纽约）");
    return proxy.format(date).includes('7:00 AM');
}

export function testProxyXssProtection9() {
    const target = { html: '' };
    const escapeHtml = (str) => str
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;');
    const handler = {
        set(target, prop, value) {
            if (prop === 'html') {
                target[prop] = escapeHtml(value); // 自动转义
                return true;
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.html = '<script>alert("xss")</script>';
    console.log(proxy.html.includes('&lt;script&gt;'), "309.1：XSS内容被转义");
    return proxy.html.includes('&lt;script&gt;');
}

export function testProxyBatchUpdate12() {
    const target = { a: 1, b: 2 };
    let updateCount = 0;
    const flushUpdates = () => {
        updateCount++;
    }; // 模拟DOM更新
    let isBatching = false;
    const pendingUpdates = [];
    const handler = {
        set(target, prop, value) {
            target[prop] = value;
            if (isBatching) {
                pendingUpdates.push(prop);
            } else {
                flushUpdates();
            }
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    // 批量更新模式
    isBatching = true;
    proxy.a = 3;
    proxy.b = 4;
    isBatching = false;
    flushUpdates(); // 手动触发一次更新
    console.log(updateCount === 1, "312.1：批量更新减少重绘次数");
    return updateCount === 1;
}

export async function testProxyMapExpire15() {
    let flag = 0;
    const map = new Map();
    const expiry = new Map(); // 存储过期时间
    const TTL = 100; // 100ms过期
    const handler = {
        get(target, prop) {
            if (prop === 'get') {
                return (key) => {
                    if (expiry.has(key) && Date.now() > expiry.get(key)) {
                        target.delete(key);
                        expiry.delete(key);
                        return undefined;
                    }
                    return target.get(key);
                };
            }
            if (prop === 'set') {
                return (key, value) => {
                    expiry.set(key, Date.now() + TTL);
                    return target.set(key, value);
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(map, handler);

    proxy.set('temp', 'value');
    setTimeout(() => {
        console.log(proxy.get('temp') === undefined, "315.1：过期键被自动删除");
        if (proxy.get('temp') === undefined) {
            flag = flag + 1;
        }
    }, TTL + 10);
    await sleepms(1000);
    return flag;
}

export function testProxySetUniqueness16() {
    const set = new Set();
    // 自定义唯一性：字符串忽略大小写
    const handler = {
        get(target, prop) {
            if (prop === 'add') {
                return (value) => {
                    const normalized = typeof value === 'string' ? value.toLowerCase() : value;
                    // 检查是否已存在归一化值
                    const exists = [...target].some(v =>
                    typeof v === 'string' ? v.toLowerCase() === normalized : v === normalized
                    );
                    if (!exists) {
                        target.add(value);
                    }
                    return target;
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(set, handler);

    proxy.add('Hello');
    proxy.add('hello'); // 被视为重复
    console.log(proxy.size === 1, "316.1：自定义唯一性规则生效");
    return proxy.size === 1;
}

export function testProxyErrorReporting19() {
    const target = {
        risky: () => {
            throw new Error("操作失败");
        }
    };
    const reports = [];
    const reportError = (error) => {
        reports.push({
            message: error.message,
            stack: error.stack,
            time: new Date().toISOString()
        });
    };
    const handler = {
        get(target, prop) {
            if (typeof target[prop] === 'function') {
                return function (...args) {
                    try {
                        return target[prop](...args);
                    } catch (e) {
                        reportError(e); // 自动上报
                        throw e;
                    }
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.risky();
    } catch (e) {
    }
    console.log(reports.length === 1 && reports[0].message === "操作失败", "319.1：错误被自动上报");
    return reports.length === 1 && reports[0].message === "操作失败";
}


export function testProxyFunctionMemoization25() {
    const fib = (n) => n <= 1 ? n : fib(n - 1) + fib(n - 2);
    const cache = new Map();
    const handler = {
        apply(target, thisArg, args) {
            const key = JSON.stringify(args);
            if (!cache.has(key)) {
                cache.set(key, target.apply(thisArg, args));
            }
            return cache.get(key);
        }
    };
    const memoizedFib = new Proxy(fib, handler);

    console.log(memoizedFib(10) === 55, "325.1：函数记忆化生效");
    console.log(cache.size <= 1, "325.2：计算结果被缓存");
    return memoizedFib(10) === 55 && cache.size <= 1;
}

export async function testProxyFunctionThrottle26() {
    const target = { log: () => console.log("执行") };
    let flag =0;
    let lastExec = 0;
    const THROTTLE_MS = 100;
    const handler = {
        get(target, prop) {
            if (prop === 'log') {
                return function(...args) {
                    const now = Date.now();
                    if (now - lastExec >= THROTTLE_MS) {
                        lastExec = now;
                        return target.log(...args);
                    }
                };
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.log();
    proxy.log(); // 100ms内被节流
    setTimeout(() => {
        console.log(true, "326.1：函数节流生效");
        flag =flag+1;
    }, THROTTLE_MS);
    await sleepms(1000);
    return flag;

}

export function testProxyArrayReverseIterator28() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === Symbol.iterator) {
                return () => {
                    let index = target.length - 1;
                    return {
                        next: () => {
                            if (index >= 0) {
                                return { value: target[index--], done: false };
                            }
                            return { done: true };
                        }
                    };
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);

    const reversed = [...proxy];
    console.log(reversed.join(',') === '3,2,1', "328.1：数组迭代顺序被反转");
    return reversed.join(',') === '3,2,1';
}

