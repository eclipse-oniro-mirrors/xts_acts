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

export function testProxyGetTrap1() {
    // 定义处理器：未定义属性返回 42
    const handler = {
        get(target, prop) {
            return prop in target ? target[prop] : 42;
        }
    };
    const target = { a: 1 };
    const proxy = new Proxy(target, handler);

    // 验证已定义属性和未定义属性的返回值
    console.log(proxy.a === 1, "测试点1.1：已定义属性应返回目标值");
    console.log(proxy.b === 42, "测试点1.2：未定义属性应返回默认值42");
    console.log(proxy.c === 42, "测试点1.3：其他未定义属性同样适用");
    return proxy.a === 1 && proxy.b === 42 && proxy.c === 42;
}


export function testProxySetTrap2() {
    let flag = 0;
    // 定义处理器：仅允许赋值数字类型
    const handler = {
        set(target, prop, value) {
            if (typeof value !== "number") {
                throw new TypeError("属性值必须是数字");
            }
            target[prop] = value; // 合法则赋值
            return true; // 非严格模式下需返回true表示成功
        }
    };
    const target = {};
    const proxy = new Proxy(target, handler);

    // 验证合法赋值
    proxy.age = 25;
    console.log(target.age === 25, "测试点2.1：合法数字赋值成功");
    flag = flag + 1;
    // 验证非法赋值拦截
    try {
        proxy.age = "25"; // 字符串类型
        console.error("测试点2.2：未拦截非法赋值（不符合预期）");
        flag = flag + 1;
    } catch (e) {
        flag = flag + 2;
        console.log(e instanceof TypeError, "测试点2.2：非法赋值应抛出TypeError");
    } finally {
        return flag;
    }

}

export function testProxyHasTrap3() {
    // 目标对象：包含不可配置属性
    const target = {};
    Object.defineProperty(target, "id", {
        value: 100,
        configurable: false, // 不可配置
        enumerable: true
    });

    // 处理器：隐藏普通属性，但必须暴露不可配置属性
    const handler = {
        has(target, prop) {
            // 若属性不可配置，必须返回true（不变式）
            const desc = Object.getOwnPropertyDescriptor(target, prop);
            if (desc && !desc.configurable) {
                return true;
            }
            // 普通属性隐藏
            return false;
        }
    };
    const proxy = new Proxy(target, handler);

    // 验证不可配置属性必须被in检测到（不变式）
    console.log("id" in proxy === true, "测试点3.1：不可配置属性必须被in检测到");

    // 验证普通属性可被隐藏
    target.name = "test";
    console.log("name" in proxy === false, "测试点3.2：普通属性可被has陷阱隐藏");
    return ("id" in proxy === true) && ("name" in proxy === false);
}

export function testProxyDeleteProperty4() {
    // 目标对象：包含不可配置属性
    const target = { a: 1 };
    Object.defineProperty(target, "b", {
        value: 2,
        configurable: false // 不可配置
    });

    // 处理器：尝试删除属性
    const handler = {
        deleteProperty(target, prop) {
            delete target[prop];
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    // 验证可配置属性可删除
    delete proxy.a;
    console.log("a" in target === false, "测试点4.1：可配置属性可被删除");
    // 验证不可配置属性无法删除（不变式）
    try {
        delete proxy.b;
        console.error("测试点4.2：未阻止删除不可配置属性（不符合预期）");
    } catch (e) {
        console.log(e instanceof TypeError, "测试点4.2：删除不可配置属性应抛出TypeError");
    }
    console.log("b" in target === true, "测试点4.3：不可配置属性未被删除");
    return ("b" in target === true) && ("a" in target === false);
}

export function testProxyApplyTrap5() {
    // 目标函数：计算和
    const targetFunc = (a, b) => a + b;
    // 处理器：拦截函数调用，参数加倍后计算
    const handler = {
        apply(target, thisArg, args) {
            const doubledArgs = args.map(arg => arg * 2); // 参数加倍
            return target.apply(thisArg, doubledArgs); // 调用原函数
        }
    };
    const proxyFunc = new Proxy(targetFunc, handler);
    // 验证拦截效果
    const result = proxyFunc(1, 2); // 实际计算 2 + 4 = 6
    console.log(result === 6, "测试点5.1：apply陷阱成功修改参数并调用函数");
    return result === 6;
}

export function testProxyConstructTrap6() {

    // 目标构造函数
    class Target {
        constructor(name) {
            this.name = name;
        }
    }

    // 处理器：拦截new操作，添加前缀
    const handler = {
        construct(target, args, newTarget) {
            const [name] = args;
            return new target(`前缀_${name}`); // 实例化时添加前缀
        }
    };
    const ProxyClass = new Proxy(Target, handler);
    // 验证拦截效果
    const instance = new ProxyClass("test");
    console.log(instance.name === "前缀_test", "测试点6.1：construct陷阱成功修改实例化参数");
    console.log(instance instanceof Target, "测试点6.2：返回值仍为目标类实例");
    return (instance.name === "前缀_test") && (instance instanceof Target);
}

export function testRevocableProxy7() {
    let flag = 0;
    // 创建可撤销代理
    const revocable = Proxy.revocable(
        { a: 1 },
        {
            get(target, prop) {
                return target[prop];
            }
        }
    );
    const proxy = revocable.proxy;

    // 撤销前验证正常访问
    console.log(proxy.a === 1, "测试点7.1：撤销前代理可正常访问");
    if (proxy.a === 1) {
        flag = flag + 1;
    }

    // 执行撤销
    revocable.revoke();

    // 验证撤销后操作抛出错误
    try {
        console.log(proxy.a);
        flag = flag + 0.1;
        console.error("测试点7.2：撤销后get操作未抛出错误（不符合预期）");
    } catch (e) {
        console.log(e instanceof TypeError, "测试点7.2：撤销后get操作应抛出TypeError");
        flag = flag + 1;
    }

    try {
        proxy.a = 2;
        console.error("测试点7.3：撤销后set操作未抛出错误（不符合预期）");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "测试点7.3：撤销后set操作应抛出TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testReflectForwarding8() {
    const target = { a: 1, b: 2 };
    const handler = {
        // 使用Reflect.get转发默认属性访问
        get(target, prop) {
            console.log(`访问属性${prop}`); // 日志记录
            return Reflect.get(target, prop); // 转发默认操作
        },
        // 使用Reflect.has转发in操作
        has(target, prop) {
            console.log(`检测属性${prop}是否存在`);
            return Reflect.has(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    // 验证get转发
    console.log(proxy.a === 1, "测试点8.1：Reflect.get成功转发属性访问");
    // 验证has转发
    console.log("b" in proxy === true, "测试点8.2：Reflect.has成功转发in操作");
    return (proxy.a === 1) && ("b" in proxy === true);
}

export function testReflectDefineProperty9() {
    const target = {};
    let flag = 0;
    // 使用Reflect.defineProperty（返回布尔值）
    const success1 = Reflect.defineProperty(target, "name", { value: "test" });
    console.log(success1 === true, "测试点9.1：合法定义属性返回true");
    if (success1 === true) {
        flag = flag + 1;
    }
    // 尝试定义不可配置属性（已存在）
    Object.defineProperty(target, "id", { value: 1, configurable: false });
    const success2 = Reflect.defineProperty(target, "id", { value: 2 }); // 非法操作
    console.log(success2 === false, "测试点9.2：非法定义属性返回false");
    if (success2 === false) {
        flag = flag + 1;
    }
    // 对比Object.defineProperty（抛出错误）
    try {
        Object.defineProperty(target, "id", { value: 2 });
        console.error("测试点9.3：Object.defineProperty未抛出错误（不符合预期）");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "测试点9.3：Object.defineProperty非法操作抛出TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testOwnKeysInvariant10() {
    let flag = 0;
    const target = { a: 1, b: 2 };
    Object.preventExtensions(target); // 使目标不可扩展

    // 处理器：返回不完整的键列表（违反不变式）
    const handler = {
        ownKeys(target) {
            return ["a"]; // 遗漏了"b"
        }
    };
    const proxy = new Proxy(target, handler);

    // 验证获取自有键时是否抛出错误
    try {
        Object.keys(proxy); // 触发ownKeys陷阱
        console.error("测试点10.1：未检测到ownKeys不变式违反（不符合预期）");
        flag = flag + 0.1;
    } catch (e) {
        flag = flag + 1
        console.log(e instanceof TypeError, "测试点10.1：ownKeys返回不完整键列表应抛出TypeError");
    }
    return flag;
}

export function testGetPrototypeOfTrap11() {
    const target = {};
    const proto = { foo: 'proto' };
    const handler = {
        getPrototypeOf(target) {
            return proto; // 自定义原型
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(Object.getPrototypeOf(proxy) === proto, "11.1：拦截Object.getPrototypeOf");
    console.log(proxy.__proto__ === proto, "11.2：拦截__proto__访问");
    return (Object.getPrototypeOf(proxy) === proto) && (proxy.__proto__ === proto);
}

export function testGetPrototypeOfInvariant12() {
    const target = {};
    let flag = 0;
    const originalProto = Object.getPrototypeOf(target);
    Object.preventExtensions(target); // 目标不可扩展

    const handler = {
        getPrototypeOf(target) {
            return { invalid: true }; // 尝试返回错误原型
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.getPrototypeOf(proxy);
        flag = flag + 0.1;
        console.error("12.1：未检测到不可扩展目标原型错误");
    } catch (e) {
        console.log(e instanceof TypeError, "12.1：不可扩展目标原型错误应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testSetPrototypeOfTrap13() {
    const target = {};
    const newProto = { bar: 'new' };
    let setCalled = false;
    const handler = {
        setPrototypeOf(target, proto) {
            setCalled = true;
            return Reflect.setPrototypeOf(target, proto); // 转发操作
        }
    };
    const proxy = new Proxy(target, handler);

    Object.setPrototypeOf(proxy, newProto);
    console.log(setCalled, "13.1：setPrototypeOf陷阱被调用");
    console.log(Object.getPrototypeOf(target) === newProto, "13.2：原型设置成功");
    return setCalled && (Object.getPrototypeOf(target) === newProto);
}


export function testSetPrototypeOfInvariant14() {
    let flag = 0;
    const target = {};
    Object.preventExtensions(target); // 目标不可扩展
    const newProto = {};

    const handler = {
        setPrototypeOf(target, proto) {
            return true; // 尝试强行允许
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.setPrototypeOf(proxy, newProto);
        flag = flag + 0.1;
        console.error("14.1：未阻止不可扩展目标原型修改");

    } catch (e) {
        flag = flag + 1;
        console.log(e instanceof TypeError, "14.1：不可扩展目标原型修改应抛TypeError");
    }
    return flag;
}

export function testIsExtensibleInvariant16() {
    let flag = 0;
    const target = {};
    Object.preventExtensions(target); // 目标不可扩展

    const handler = {
        isExtensible(target) {
            return true; // 尝试返回错误值
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.isExtensible(proxy);
        flag = flag + 0.1;
        console.error("16.1：未检测到isExtensible返回值错误");
    } catch (e) {
        console.log(e instanceof TypeError, "16.1：isExtensible返回值错误应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testPreventExtensionsTrap17() {
    const target = {};
    let preventCalled = false;
    const handler = {
        preventExtensions(target) {
            preventCalled = true;
            return Reflect.preventExtensions(target);
        }
    };
    const proxy = new Proxy(target, handler);

    Object.preventExtensions(proxy);
    console.log(preventCalled, "17.1：preventExtensions陷阱被调用");
    console.log(Object.isExtensible(target) === false, "17.2：目标被成功阻止扩展");
    return preventCalled && (Object.isExtensible(target) === false);
}


export function testGetOwnPropertyDescriptorTrap18() {
    const target = { a: 1 };
    const handler = {
        getOwnPropertyDescriptor(target, prop) {
            const desc = Reflect.getOwnPropertyDescriptor(target, prop);
            if (desc) {
                desc.writable = false;
            } // 强制设为不可写
            return desc;
        }
    };
    const proxy = new Proxy(target, handler);

    const desc = Object.getOwnPropertyDescriptor(proxy, 'a');
    console.log(desc.writable === false, "18.1：描述符被成功修改");
    console.log(target.a === 1, "18.2：目标属性未受影响");
    return (desc.writable === false) && (target.a === 1);
}

export function testGetOwnPropertyDescriptorInvariant19() {
    const target = {};
    let flag = 0;
    Object.defineProperty(target, 'b', { value: 2, configurable: false }); // 不可配置

    const handler = {
        getOwnPropertyDescriptor(target, prop) {
            if (prop === 'b') {
                return undefined;
            } // 尝试隐藏不可配置属性
            return Reflect.getOwnPropertyDescriptor(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.getOwnPropertyDescriptor(proxy, 'b');
        flag = flag + 0.1;
        console.error("19.1：未检测到隐藏不可配置属性错误");
    } catch (e) {
        console.log(e instanceof TypeError, "19.1：隐藏不可配置属性应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testDefinePropertyInvariant21() {
    let flag = 0;
    const target = { a: 1 };
    Object.preventExtensions(target); // 目标不可扩展

    const handler = {
        defineProperty(target, prop, desc) {
            return true; // 尝试强行允许添加
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.defineProperty(proxy, 'b', { value: 2 }); // 新增属性
        console.error("21.1：未阻止不可扩展目标添加属性");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "21.1：不可扩展目标添加属性应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testOwnKeysInvariant23() {
    const target = { a: 1, b: 2 };
    let flag = 0;
    Object.preventExtensions(target); // 不可扩展

    const handler = {
        ownKeys(target) {
            return ['a']; // 遗漏'b'
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.keys(proxy);
        console.error("23.1：未检测到ownKeys遗漏键错误");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "23.1：ownKeys遗漏键应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testGetInheritedProperty24() {
    const handler = {
        get(target, prop) {
            return `inherited_${prop}`;
        }
    };
    const proxy = new Proxy({}, handler);
    const obj = Object.create(proxy); // 继承自proxy

    console.log(obj.foo === 'inherited_foo', "24.1：继承属性访问触发get陷阱");
    return obj.foo === 'inherited_foo';
}

export function testGetInvariant25() {
    const target = {};
    let flag = 0;
    Object.defineProperty(target, 'x', {
        value: 10,
        writable: false,
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
        console.error("25.1：未检测到get返回值错误");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "25.1：get返回值错误应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testSetInheritedProperty26() {
    let setCalled = false;
    const handler = {
        set(target, prop, value) {
            setCalled = true;
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy({}, handler);
    const obj = Object.create(proxy);

    obj.foo = 'bar';
    console.log(setCalled, "26.1：继承属性赋值触发set陷阱");
    console.log(proxy.foo === 'bar', "26.2：值被正确设置到目标");
    return setCalled && proxy.foo === 'bar';
}

export function testSetStrictMode27() {
    let flag = 0;
    'use strict'; // 严格模式
    const handler = {
        set(target, prop, value) {
            return false; // 返回false
        }
    };
    const proxy = new Proxy({}, handler);

    try {
        proxy.a = 1;
        console.error("27.1：严格模式set返回false未报错");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "27.1：严格模式set返回false应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testApplyInterceptCall28() {
    const target = (a, b) => a + b;
    const handler = {
        apply(target, thisArg, args) {
            return target(...args) * 2; // 结果加倍
        }
    };
    const proxy = new Proxy(target, handler);

    const result1 = proxy.call(null, 1, 2); // 3*2=6
    const result2 = proxy.apply(null, [3, 4]); //7*2=14
    console.log(result1 === 6 && result2 === 14, "28.1：call/apply被拦截");
    return result1 === 6 && result2 === 14;
}


export function testConstructReturnNonObject29() {
    let flag = 0;
    const target = function () {
    };
    const handler = {
        construct(target, args) {
            return "not an object"; // 返回非对象
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        new proxy();
        flag = flag + 0.1;
        console.error("29.1：construct返回非对象未报错");
    } catch (e) {
        flag = flag + 1;
        console.log(e instanceof TypeError, "29.1：construct返回非对象应抛TypeError");
    }
    return flag;
}

export function testReflectApply30() {
    const obj = { base: 10 };
    const func = function (a, b) {
        return this.base + a + b;
    };

    const result = Reflect.apply(func, obj, [5, 3]); // 10+5+3=18
    console.log(result === 18, "30.1：Reflect.apply正确传递this和参数");
    return result === 18;
}

export function testReflectConstruct31() {
    class Person {
        constructor(name) {
            this.name = name;
        }
    }

    const instance = Reflect.construct(Person, ['Alice']);
    console.log(instance instanceof Person, "31.1：实例正确创建");
    console.log(instance.name === 'Alice', "31.2：参数正确传递");
    return instance instanceof Person && instance.name === 'Alice';
}


export function testReflectHas32() {
    const obj = { a: 1 };
    Object.setPrototypeOf(obj, { b: 2 }); // 继承属性

    console.log(Reflect.has(obj, 'a') === true, "32.1：检测自有属性");
    console.log(Reflect.has(obj, 'b') === true, "32.2：检测继承属性");
    console.log(Reflect.has(obj, 'c') === false, "32.3：检测不存在属性");
    return (Reflect.has(obj, 'a') === true) && (Reflect.has(obj, 'b') === true) && (Reflect.has(obj, 'c') === false);
}

export function testReflectDelete33() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'b', { configurable: false }); // 不可配置

    const success1 = Reflect.deleteProperty(obj, 'a');
    console.log(success1 && !('a' in obj), "33.1：删除可配置属性成功");

    const success2 = Reflect.deleteProperty(obj, 'b');
    console.log(!success2 && 'b' in obj, "33.2：删除不可配置属性失败");
    return (success1 && !('a' in obj)) && (!success2 && 'b' in obj);
}

export function testReflectGetDesc34() {
    const obj = { a: 1 };
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'a');

    console.log(desc.value === 1 && desc.writable === true, "34.1：描述符正确获取");
    console.log(Reflect.getOwnPropertyDescriptor(obj, 'b') === undefined, "34.2：不存在属性返回undefined");
    return (desc.value === 1 && desc.writable === true) && (Reflect.getOwnPropertyDescriptor(obj, 'b') === undefined);
}

export function testRevokedProxyApply35() {
    let flag = 0;
    const revocable = Proxy.revocable(() => 1, { apply: () => 2 });
    revocable.revoke();

    try {
        revocable.proxy();
        console.error("35.1：撤销后apply未报错");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "35.1：撤销后apply应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}


export function testRevokedProxyConstruct36() {
    let flag = 0;
    const revocable = Proxy.revocable(function () {
    }, { construct: () => ({}) });
    revocable.revoke();

    try {
        new revocable.proxy();
        console.error("36.1：撤销后construct未报错");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "36.1：撤销后construct应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testNestedProxy37() {
    const target = { a: 1 };
    const handler1 = { get: (t, p) => `proxy1_${t[p]}` };
    const proxy1 = new Proxy(target, handler1);
    const handler2 = { get: (t, p) => `proxy2_${t[p]}` };
    const proxy2 = new Proxy(proxy1, handler2);

    console.log(proxy2.a === 'proxy2_proxy1_1', "37.1：嵌套代理陷阱逐层触发");
    return proxy2.a === 'proxy2_proxy1_1';
}

export function testArrayProxyLength38() {
    const arr = [1, 2, 3];
    const handler = {
        get(target, prop) {
            if (prop === 'length') {
                return target.length * 2;
            } // 加倍length
            return target[prop];
        }
    };
    const proxy = new Proxy(arr, handler);

    console.log(proxy.length === 6, "38.1：length属性被拦截修改");
    console.log(proxy[0] === 1, "38.2：数组元素访问正常");
    return proxy.length === 6 && proxy[0] === 1;
}

export function testOwnKeysFilterSymbols39() {
    const sym1 = Symbol('s1');
    const sym2 = Symbol('s2');
    const target = { a: 1, [sym1]: 2, [sym2]: 3 };
    const handler = {
        ownKeys(target) {
            return Reflect.ownKeys(target).filter(k => typeof k !== 'symbol'); // 过滤符号
        }
    };
    const proxy = new Proxy(target, handler);

    const keys = Object.getOwnPropertyNames(proxy);
    const symbols = Object.getOwnPropertySymbols(proxy);
    console.log(keys.includes('a'), "39.1：保留字符串键");
    console.log(symbols.length === 0, "39.2：过滤所有符号键");
    return keys.includes('a') && symbols.length === 0;
}

export function testGetThisBinding40() {
    const target = { a: 1 };
    const handler = {
        get(target, prop) {
            return this === proxy; // 验证this是否为proxy
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.a === false, "40.1：get陷阱中this指向代理");
    return proxy.a === false;
}


export function testGetArrayIndex41() {
    const arr = [10, 20, 30];
    const handler = {
        get(target, prop) {
            // 转换索引为数字，返回值加倍
            const index = Number(prop);
            return isNaN(index) ? target[prop] : target[prop] * 2;
        }
    };
    const proxy = new Proxy(arr, handler);

    console.log(proxy[0] === 20, "41.1：数组索引0访问触发get并加倍");
    console.log(proxy.length === 3, "41.2：length属性访问正常");
    return proxy[0] === 20 && proxy.length === 3;
}


export function testGetSymbolProperty42() {
    const sym = Symbol('test');
    const target = { [sym]: 'value' };
    const handler = {
        get(target, prop) {
            return prop === sym ? `intercepted_${target[prop]}` : target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy[sym] === 'intercepted_value', "42.1：Symbol属性访问被拦截");
    return proxy[sym] === 'intercepted_value';
}

export function testSetArrayIndex44() {
    const arr = [];
    let setCount = 0;
    const handler = {
        set(target, prop, value) {
            const index = Number(prop);
            if (!isNaN(index)) {
                target[prop] = value * 2; // 赋值时加倍
                setCount++;
                return true;
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(arr, handler);

    proxy[0] = 5;
    console.log(arr[0] === 10 && setCount === 1, "44.1：数组索引赋值触发set并加倍");
    return arr[0] === 10 && setCount === 1;
}

export function testSetAccessorInvariant46() {
    let flag = 0;
    const target = {};
    Object.defineProperty(target, 'x', {
        get: () => 10,
        set: undefined, // 无setter
        configurable: false
    });

    const handler = {
        set(target, prop, value) {
            return true; // 尝试强行允许
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.x = 20;
        console.error("46.1：未阻止不可配置无setter属性赋值");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "46.1：不可配置无setter属性赋值应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testHasInheritedProperty47() {
    const proto = { inherited: true };
    const target = Object.create(proto);
    const handler = {
        has(target, prop) {
            return prop === 'inherited' ? false : Reflect.has(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(!('inherited' in proxy), "47.1：继承属性in检测被has陷阱拦截");
    return !('inherited' in proxy);
}

export function testHasInvariantExtensible48() {
    let flag = 0;
    const target = { a: 1 };
    Object.preventExtensions(target); // 不可扩展

    const handler = {
        has(target, prop) {
            return prop !== 'a'; // 尝试隐藏自有属性
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        'a' in proxy;
        flag = flag + 0.1;
        console.error("48.1：未检测到has隐藏不可扩展目标自有属性错误");
    } catch (e) {
        console.log(e instanceof TypeError, "48.1：has隐藏错误应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testOwnKeysFilterNonEnumerable49() {
    const target = { a: 1 };
    Object.defineProperty(target, 'b', { value: 2, enumerable: false }); // 不可枚举

    const handler = {
        ownKeys(target) {
            return Reflect.ownKeys(target).filter(prop => prop === 'b'); // 只返回b
        }
    };
    const proxy = new Proxy(target, handler);

    const keys = Object.getOwnPropertyNames(proxy);
    console.log(keys.length === 1 && keys[0] === 'b', "49.1：ownKeys过滤出不可枚举属性");
    return keys.length === 1 && keys[0] === 'b';
}

export function testOwnKeysSymbolInvariant50() {
    let flag = 0;
    const sym = Symbol('nonConfig');
    const target = {};
    Object.defineProperty(target, sym, { value: 1, configurable: false }); // 不可配置Symbol

    const handler = {
        ownKeys(target) {
            return []; // 尝试忽略不可配置Symbol键
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        Object.getOwnPropertySymbols(proxy);
        console.error("50.1：检测ownKeys遗漏不可配置Symbol键错误");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "50.1：遗漏错误应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testDefinePropertyConfigInvariant52() {
    let flag = 0;
    const target = { a: 1 }; // a默认可配置
    const handler = {
        defineProperty(target, prop, desc) {
            return Reflect.defineProperty(target, prop, desc);
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        // 尝试将可配置属性改为不可配置
        Object.defineProperty(proxy, 'a', { configurable: false });
        console.error("52.1：阻止可配置属性改为不可配置");
        flag = flag + 1;
    } catch (e) {
        console.log(e instanceof TypeError, "52.1：修改不应抛TypeError");
        flag = flag + 0.1;
    }
    return flag;
}

export function testReflectSetPrototype53() {
    const obj = {};
    const proto1 = {};
    const proto2 = {};

    const success1 = Reflect.setPrototypeOf(obj, proto1);
    console.log(success1 && Object.getPrototypeOf(obj) === proto1, "53.1：首次修改原型成功");

    Object.preventExtensions(obj); // 设为不可扩展
    const success2 = Reflect.setPrototypeOf(obj, proto2); // 尝试再次修改
    console.log(!success2 && Object.getPrototypeOf(obj) === proto1, "53.2：不可扩展时修改失败");
    return (success1 && Object.getPrototypeOf(obj) === proto1) && (!success2 && Object.getPrototypeOf(obj) === proto1);
}

export function testReflectIsExtensible54() {
    const obj1 = {};
    const obj2 = {};
    Object.preventExtensions(obj2);

    console.log(Reflect.isExtensible(obj1) === true, "54.1：可扩展对象返回true");
    console.log(Reflect.isExtensible(obj2) === false, "54.2：不可扩展对象返回false");
    return (Reflect.isExtensible(obj1) === true) && (Reflect.isExtensible(obj2) === false);
}

export function testReflectGetInherited55() {
    const proto = { b: 2 };
    const obj = Object.create(proto);
    obj.a = 1;

    console.log(Reflect.get(obj, 'a') === 1, "55.1：获取自有属性");
    console.log(Reflect.get(obj, 'b') === 2, "55.2：获取继承属性");
    console.log(Reflect.get(obj, 'c') === undefined, "55.3：获取不存在属性");
    return (Reflect.get(obj, 'a') === 1) && (Reflect.get(obj, 'b') === 2) && (Reflect.get(obj, 'c') === undefined);
}

export function testReflectApplyNoArgs56() {
    const func = () => 'no args';
    const result = Reflect.apply(func, null, []);
    console.log(result === 'no args', "56.1：无参数函数调用成功");
    return result === 'no args';
}

export function testRevokedProxyHas57() {
    let flag = 0;
    const revocable = Proxy.revocable({ a: 1 }, { has: () => true });
    revocable.revoke();

    try {
        'a' in revocable.proxy;
        console.error("57.1：撤销后has操作未报错");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "57.1：撤销后has应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testRevokedProxyOwnKeys58() {
    let flag = 0;
    const revocable = Proxy.revocable({ a: 1 }, { ownKeys: () => ['a'] });
    revocable.revoke();

    try {
        Object.keys(revocable.proxy);
        console.error("58.1：撤销后ownKeys操作未报错");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "58.1：撤销后ownKeys应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testProxyFunctionPrototype59() {

    function Target() {
    }

    Target.prototype.foo = 'bar';

    const handler = {
        get(target, prop) {
            if (prop === 'prototype') {
                return { ...target.prototype, baz: 'qux' }; // 扩展原型
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(Target, handler);

    const instance = new proxy();
    console.log(instance.foo === 'bar' && instance.baz === 'qux', "59.1：原型扩展生效");
    return instance.foo === 'bar' && instance.baz === 'qux';
}

export function testProxyDateObject60() {
    const date = new Date('2023-01-01');
    const handler = {
        get(target, prop) {
            if (prop === 'getDate') {
                // 拦截getDate，返回值+1
                return () => target.getDate() + 1;
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(date, handler);

    console.log(proxy.getDate() === 2, "60.1：日期方法getDate被拦截修改");
    return proxy.getDate() === 2;
}

export function testProxyMapGet61() {
    const map = new Map();
    map.set('key', 'value');
    const handler = {
        get(target, prop) {
            if (prop === 'get') {
                // 拦截Map.get，返回值加前缀
                return (k) => `map_${target.get(k)}`;
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(map, handler);

    console.log(proxy.get('key') === 'map_value', "61.1：Map.get被拦截修改");
    return proxy.get('key') === 'map_value';
}

export function testProxyAsPrototype62() {
    const protoProxy = new Proxy({}, {
        get(target, prop) {
            return `proto_${prop}`;
        }
    });
    const obj = Object.create(protoProxy); // obj原型是代理

    console.log(obj.foo === 'proto_foo', "62.1：原型代理的get陷阱触发");
    return obj.foo === 'proto_foo';
}

export function testMultiLevelProxyPrototype63() {
    const level1 = new Proxy({}, { get: (t, p) => `level1_${p}` });
    const level2 = new Proxy(Object.create(level1), { get: (t, p) => `level2_${t[p]}` });
    const obj = Object.create(level2);

    console.log(obj.foo === 'level2_level1_foo', "63.1：多层原型代理陷阱依次触发");
    return obj.foo === 'level2_level1_foo';
}

export function testGetRecursion64() {
    const target = { a: 1 };
    const handler = {
        get(target, prop) {
            if (prop === 'b') {
                return proxy.a + 1; // 访问代理的a属性
            }
            return target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.b === 2, "64.1：get陷阱递归访问代理属性成功");
    return proxy.b === 2;
}

export function testSetModifyOtherProperty65() {
    const target = { a: 1, b: 2 };
    const handler = {
        set(target, prop, value) {
            if (prop === 'a') {
                target.b = value * 2; // 修改b属性
            }
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.a = 3;
    console.log(target.a === 3 && target.b === 6, "65.1：set陷阱修改其他属性成功");
    return target.a === 3 && target.b === 6;
}

export function testApplyReturnNonFunction66() {
    const target = () => 1;
    const handler = {
        apply(target, thisArg, args) {
            return 'apply_result'; // 返回字符串
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy() === 'apply_result', "66.1：apply陷阱返回非函数类型成功");
    return proxy() === 'apply_result';
}

export function testDeleteNonExistentProperty68() {
    const target = { a: 1 };
    const handler = {
        deleteProperty(target, prop) {
            return Reflect.deleteProperty(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    const result = delete proxy.b; // 删除不存在的b
    console.log(result === true, "68.1：删除不存在属性返回true");
    return result === true;
}

export function testGetDescCustom69() {
    const target = { a: 1 };
    const handler = {
        getOwnPropertyDescriptor(target, prop) {
            const desc = Reflect.getOwnPropertyDescriptor(target, prop);
            if (desc) {
                desc.enumerable = false;
            } // 强制设为不可枚举
            return desc;
        }
    };
    const proxy = new Proxy(target, handler);

    const desc = Object.getOwnPropertyDescriptor(proxy, 'a');
    console.log(desc.enumerable === false, "69.1：自定义描述符生效");
    return desc.enumerable === false;
}

export function testProxyRegExpTest71() {
    const regex = /foo/;
    const handler = {
        get(target, prop) {
            if (prop === 'test') {
                // 拦截test方法，返回反转结果
                return (str) => !target.test(str);
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(regex, handler);

    console.log(proxy.test('foo') === false, "71.1：RegExp.test被拦截反转结果");
    return proxy.test('foo') === false;
}

export function testProxyArrayBuffer72() {
    const buffer = new ArrayBuffer(8);
    const handler = {
        get(target, prop) {
            if (prop === 'byteLength') {
                return target.byteLength * 2; // 加倍字节长度
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(buffer, handler);

    console.log(proxy.byteLength === 16, "72.1：ArrayBuffer.byteLength被拦截修改");
    return proxy.byteLength === 16;
}

export function testGetUndefinedProperty73() {
    const target = { a: undefined };
    const handler = {
        get(target, prop) {
            return target[prop] === undefined ? 'default' : target[prop];
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.a === 'default', "73.1：目标属性undefined时返回自定义值");
    return proxy.a === 'default';
}

export function testSetValueRange74() {
    const target = { age: 0 };
    let flag = 0;
    const handler = {
        set(target, prop, value) {
            if (prop === 'age' && (value < 0 || value > 120)) {
                throw new RangeError("年龄必须在0-120之间");
            }
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.age = 30;
    console.log(target.age === 30, "74.1：合法年龄赋值成功");
    if (target.age === 30) {
        flag = flag + 1;
    }
    try {
        proxy.age = 150;
        console.error("74.2：未拦截超出范围的年龄值");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof RangeError, "74.2：超出范围应抛RangeError");
        flag = flag + 1;
    }
    return flag;
}

export function testSetSymbolProperty75() {
    const sym = Symbol('count');
    const target = { [sym]: 0 };
    const handler = {
        set(target, prop, value) {
            if (prop === sym) {
                target[prop] = value * 2; // 赋值时加倍
                return true;
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(target, handler);

    proxy[sym] = 5;
    console.log(target[sym] === 10, "75.1：Symbol属性赋值被拦截加倍");
    return target[sym] === 10;
}

export function testHasHideEnumerable77() {
    const target = { a: 1, b: 2 };
    const handler = {
        has(target, prop) {
            return prop !== 'a'; // 隐藏a属性
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(!('a' in proxy) && 'b' in proxy, "77.1：has陷阱成功隐藏可枚举属性");
    return !('a' in proxy) && 'b' in proxy;
}

export function testHasSymbolIterator78() {
    const target = [1, 2];
    const handler = {
        has(target, prop) {
            return prop !== Symbol.iterator; // 隐藏迭代器
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(!(Symbol.iterator in proxy), "78.1：has陷阱隐藏Symbol.iterator");
    return !(Symbol.iterator in proxy);
}

export function testOwnKeysOnlySymbols79() {
    const sym1 = Symbol('s1');
    const sym2 = Symbol('s2');
    const target = { a: 1, [sym1]: 2, [sym2]: 3 };
    const handler = {
        ownKeys(target) {
            return Reflect.ownKeys(target).filter(k => typeof k === 'symbol');
        }
    };
    const proxy = new Proxy(target, handler);

    const keys = Object.getOwnPropertyNames(proxy);
    const symbols = Object.getOwnPropertySymbols(proxy);
    console.log(keys.length === 0 && symbols.length === 2, "79.1：ownKeys仅返回Symbol键");
    return keys.length === 0 && symbols.length === 2;
}

export function testApplyModifyThis81() {
    const target = function () {
        return this.value;
    };
    const handler = {
        apply(target, thisArg, args) {
            // 修改this为自定义对象
            return target.apply({ value: 100 }, args);
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.call({ value: 10 }) === 100, "81.1：apply陷阱修改this生效");
    return proxy.call({ value: 10 }) === 100;
}

export function testConstructReturnDerived82() {
    class Base {
        constructor(name) {
            this.name = name;
        }
    }

    class Derived extends Base {
        get type() {
            return 'derived';
        }
    }

    const handler = {
        construct(target, args) {
            return new Derived(...args); // 返回派生类实例
        }
    };
    const ProxyBase = new Proxy(Base, handler);

    const instance = new ProxyBase('test');
    console.log(instance instanceof Derived && instance.type === 'derived', "82.1：返回派生类实例成功");
    return instance instanceof Derived && instance.type === 'derived';
}

export function testReflectConstructNewTarget83() {
    class Parent {
    }

    class Child extends Parent {
    }

    const handler = {
        construct(target, args, newTarget) {
            return Reflect.construct(target, args, newTarget); // 传递newTarget
        }
    };
    const ProxyParent = new Proxy(Parent, handler);

    const instance = new ProxyParent();
    console.log(instance instanceof Parent, "83.1：Reflect.construct正确创建实例");

    const childInstance = Reflect.construct(ProxyParent, [], Child);
    console.log(childInstance instanceof Child, "83.2：newTarget正确传递");
    return (instance instanceof Parent) && (childInstance instanceof Child);
}

export function testReflectGetReceiver84() {
    const obj = {
        a: 1,
        get b() {
            return this.a;
        }
    };
    const receiver = { a: 2 }; // 修改this为receiver

    const result = Reflect.get(obj, 'b', receiver);
    console.log(result === 2, "84.1：Reflect.get receiver修改this生效");
    return result === 2;
}

export function testReflectSetAccessor85() {
    let value = 0;
    const obj = {
        set a(v) {
            value = v * 2;
        } // set方法加倍值
    };

    const success = Reflect.set(obj, 'a', 5);
    console.log(success && value === 10, "85.1：Reflect.set调用访问器set方法");
    return success && value === 10;
}

export function testReflectDeleteArray86() {
    const arr = [1, 2, 3];
    const success = Reflect.deleteProperty(arr, 1); // 删除索引1的元素

    console.log(success && arr.length === 3 && arr[1] === undefined, "86.1：数组元素删除成功");
    return success && arr.length === 3 && arr[1] === undefined;
}

export function testRevokedGetDesc87() {
    const revocable = Proxy.revocable({ a: 1 }, { getOwnPropertyDescriptor: () => ({ value: 1 }) });
    let flag = 0;
    revocable.revoke();

    try {
        Object.getOwnPropertyDescriptor(revocable.proxy, 'a');
        console.error("87.1：撤销后getOwnPropertyDescriptor未报错");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "87.1：撤销后操作应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}

export function testRevokedSetPrototype88() {
    let flag = 0;
    const revocable = Proxy.revocable({}, { setPrototypeOf: () => true });
    revocable.revoke();

    try {
        Object.setPrototypeOf(revocable.proxy, {});
        console.error("88.1：撤销后setPrototypeOf未报错");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e instanceof TypeError, "88.1：撤销后操作应抛TypeError");
        flag = flag + 1;
    }
    return flag;
}


export function testProxyClassStaticMethod89() {
    class MyClass {
        static staticMethod() {
            return 'original';
        }
    }

    const handler = {
        get(target, prop) {
            if (prop === 'staticMethod') {
                return () => 'intercepted'; // 拦截静态方法
            }
            return Reflect.get(target, prop);
        }
    };
    const ProxyClass = new Proxy(MyClass, handler);

    console.log(ProxyClass.staticMethod() === 'intercepted', "89.1：静态方法被拦截修改");
    return ProxyClass.staticMethod() === 'intercepted';
}

export function testProxyClassInstanceMethod90() {
    class MyClass {
        instanceMethod() {
            return 'original';
        }
    }

    const handler = {
        get(target, prop) {
            if (prop === 'instanceMethod') {
                return function () {
                    return 'intercepted';
                }; // 拦截实例方法
            }
            return Reflect.get(target, prop);
        }
    };
    const instance = new Proxy(new MyClass(), handler);

    console.log(instance.instanceMethod() === 'intercepted', "90.1：实例方法被拦截修改");
    return instance.instanceMethod() === 'intercepted';
}

export function testGetTrapError91() {
    const target = {};
    let flag = 0;
    const handler = {
        get(target, prop) {
            throw new Error(`属性${prop}不存在`);
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        proxy.unknown;
        console.error("91.1：未捕获get陷阱抛出的错误");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes('不存在'), "91.1：成功捕获get陷阱错误");
        flag = flag + 1;
    }
    return flag;
}

export function testSetAndDefine92() {
    const target = {};
    let setCalled = false;
    let defineCalled = false;
    const handler = {
        set(target, prop, value) {
            setCalled = true;
            return Reflect.set(target, prop, value);
        },
        defineProperty(target, prop, desc) {
            defineCalled = true;
            return Reflect.defineProperty(target, prop, desc);
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.a = 1; // 触发set
    Object.defineProperty(proxy, 'b', { value: 2 }); // 触发defineProperty
    console.log(setCalled && defineCalled, "92.1：set与defineProperty陷阱协作生效");
    return setCalled && defineCalled;
}

export function testDeleteThrowError93() {
    const target = { a: 1 };
    let flag = 0;
    const handler = {
        deleteProperty(target, prop) {
            if (prop === 'a') {
                throw new Error("禁止删除a属性");
            }
            return Reflect.deleteProperty(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    try {
        delete proxy.a;
        console.error("93.1：未捕获delete陷阱错误");
        flag = flag + 0.1;
    } catch (e) {
        console.log(e.message.includes('禁止删除'), "93.1：成功捕获delete陷阱错误");
        flag = flag + 1;
    }
    return flag;
}

export function testPropertyAccessLog95() {
    const target = { a: 1, b: 2 };
    const log = [];
    const handler = {
        get(target, prop) {
            log.push(`访问属性：${prop}`);
            return target[prop];
        },
        set(target, prop, value) {
            log.push(`修改属性${prop}：${value}`);
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);

    proxy.a;
    proxy.b = 3;
    console.log(log.length === 2 && log[0] === '访问属性：a' && log[1] === '修改属性b：3', "95.1：访问日志记录成功");
    return log.length === 2 && log[0] === '访问属性：a' && log[1] === '修改属性b：3';
}

export function testPropertyAlias96() {
    const target = { realName: 'John' };
    const handler = {
        get(target, prop) {
            // 别名映射：name -> realName
            if (prop === 'name') {
                return target.realName;
            }
            return target[prop];
        },
        set(target, prop, value) {
            if (prop === 'name') {
                target.realName = value;
                return true;
            }
            return Reflect.set(target, prop, value);
        }
    };
    const proxy = new Proxy(target, handler);

    console.log(proxy.name === 'John', "96.1：通过别名访问属性");
    proxy.name = 'Alice';
    console.log(target.realName === 'Alice', "96.2：通过别名修改属性");
    return proxy.name === 'John' && target.realName === 'Alice';
}

export function testHasVirtualProperty97() {
    const target = { a: 1 };
    const handler = {
        has(target, prop) {
            // 虚拟属性virtual总是存在
            return prop === 'virtual' || Reflect.has(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);

    console.log('virtual' in proxy, "97.1：has陷阱模拟虚拟属性存在");
    return 'virtual' in proxy;
}

export function testOwnKeysDynamicKeys98() {
    const target = { a: 1 };
    const handler = {
        ownKeys(target) {
            return [...Reflect.ownKeys(target), 'dynamicKey']; // 添加动态键
        }
    };
    const proxy = new Proxy(target, handler);

    const keys = Object.getOwnPropertyNames(proxy);
    console.log(keys.includes('dynamicKey'), "98.1：ownKeys返回动态键成功");
    return keys.includes('dynamicKey');
}

export async function testProxyPromiseThen99() {
    const promise = Promise.resolve(10);
    let flag = 0;
    const handler = {
        get(target, prop) {
            if (prop === 'then') {
                // 拦截then，修改回调参数
                return (onFulfilled) => {
                    return target.then(value => onFulfilled(value * 2));
                };
            }
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(promise, handler);
    await proxy.then(value => {
        console.log(value === 20, "99.1：Promise.then被拦截修改值");
        flag = flag + 1;
    });
    await sleepms(2000);
    return flag;
}

export function testMultiLayerProxy100() {
    const target = { value: 1 };
    // 第一层代理：值+1
    const proxy1 = new Proxy(target, {
        get(t, p) {
            return p === 'value' ? t[p] + 1 : t[p];
        }
    });
    // 第二层代理：值*2
    const proxy2 = new Proxy(proxy1, {
        get(t, p) {
            return p === 'value' ? t[p] * 2 : t[p];
        }
    });

    console.log(proxy2.value === 4, "100.1：多层代理陷阱叠加生效（1+1=2 → 2*2=4）");
    return proxy2.value === 4;
}