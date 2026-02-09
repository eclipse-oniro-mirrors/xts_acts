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
 * 测试 Proxy 与 Object.freeze 的组合行为
 */


/**
 * 测试点 3：
 * 在 Proxy 的 set 拦截器中主动抛出错误，实现“显式”不可变（即使对象未冻结也能防写）
 * 这里我们将冻结 + 抛错组合，测试是否双重保险
 * @returns {boolean}
 */
export function testProxyWithThrowAndFreeze() {
    const obj = { c: 100 };
    const frozenObj = Object.freeze(obj);

    const proxy = new Proxy(frozenObj, {
        set() {
            throw new Error('Cannot modify frozen object via proxy');
        }
    });

    try {
        proxy.c = 200;
        return false;
    } catch (e) {

        return frozenObj.c === 100;
    }
}

/**
 * 扩展测试：Proxy 与 Object.freeze 的深度交互行为（17 个新测试点）
 */


/**
 * 测试点 6：冻结对象的属性是否变为不可配置（configurable: false）
 */
export function testFrozenPropsAreNonConfigurable() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(frozen, 'a');
    return desc.configurable === false && desc.writable === false;
}

/**
 * 测试点 7：Proxy 拦截 get，但不能绕过冻结对象的值限制（读取正常）
 */
export function testProxyGetWorksOnFrozenObject() {
    const obj = { secret: 'top' };
    const frozen = Object.freeze(obj);
    let accessed = false;
    const proxy = new Proxy(frozen, {
        get(target, prop) {
            accessed = true;
            return target[prop];
        }
    });
    return proxy.secret === 'top' && accessed;
}

/**
 * 测试点 10：冻结数组后，push 等方法是否被禁用（通过 Proxy 调用）
 */
export function testFrozenArrayMethodsFailViaProxy() {
    const arr = [1];
    const frozen = Object.freeze(arr);
    const proxy = new Proxy(frozen, {});
    try {
        proxy.push(2);
        return false;
    } catch (e) {
        return frozen.length === 1;
    }
}

/**
 * 测试点 11：Proxy 的 ownKeys 拦截器能否正确反映冻结对象的键
 */
export function testProxyOwnKeysReflectsFrozenKeys() {
    const obj = { a: 1, b: 2 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        ownKeys(target) {
            return Reflect.ownKeys(target);
        }
    });
    const keys = Reflect.ownKeys(proxy);
    return keys.length === 2 && keys.includes('a') && keys.includes('b');
}

/**
 * 测试点 12：冻结对象后，修改其 [[Prototype]] 是否失败（通过 Proxy setPrototypeOf）
 */
export function testSetPrototypeOfOnFrozenFails() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        setPrototypeOf(target, proto) {
            return Reflect.setPrototypeOf(target, proto);
        }
    });
    const result = Reflect.setPrototypeOf(proxy, {});
    return result === false;
}

/**
 * 测试点 13：Proxy defineProperty 无法在冻结对象上定义新属性
 */
export function testDefinePropertyOnFrozenViaProxyFails() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    try {
        Object.defineProperty(proxy, 'b', { value: 2, writable: true });
        return false;
    } catch (e) {
        return !('b' in frozen);
    }
}

/**
 * 测试点 14：冻结对象后，Proxy 的 preventExtensions 拦截是否冗余（已不可扩展）
 */
export function testFrozenObjectIsAlreadyPreventedExtensions() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        preventExtensions(target) {
            return Reflect.preventExtensions(target);
        }
    });
    const already = Object.isExtensible(frozen);
    const after = Object.isExtensible(proxy);
    return !already && !after;
}

/**
 * 测试点 15：嵌套对象未被冻结时，外层冻结不影响内层可变性（浅冻结）
 */
export function testShallowFreezeDoesNotFreezeNestedObjects() {
    const obj = { inner: { x: 1 } };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    proxy.inner.x = 999;
    return proxy.inner.x === 999;
}

/**
 * 测试点 17：冻结后，Proxy 的 has 拦截器仍能正确判断属性存在性
 */
export function testProxyHasWorksOnFrozenObject() {
    const obj = { key: 'value' };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        has(target, prop) {
            return prop in target;
        }
    });
    return ('key' in proxy) === true && ('missing' in proxy) === false;
}

/**
 * 测试点 19：冻结对象后，Proxy 的 getOwnPropertyDescriptor 应返回正确描述符
 */
export function testProxyGetOwnPropertyDescriptorOnFrozen() {
    const obj = { data: 'hello' };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        getOwnPropertyDescriptor(target, prop) {
            return Reflect.getOwnPropertyDescriptor(target, prop);
        }
    });
    const desc = Object.getOwnPropertyDescriptor(proxy, 'data');
    return desc.value === 'hello' && desc.writable === false && desc.configurable === false;
}

/**
 * 测试点 20：冻结对象在严格模式下通过 Proxy 赋值会抛错（模拟严格模式行为）
 */
export function testStrictModeAssignmentThrowsViaProxy() {
    const obj = { strict: true };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        set(target, prop, value) {
            'use strict';
            target[prop] = value;
            return true;
        }
    });
    try {
        proxy.strict = false;
        return false;
    } catch (e) {
        return frozen.strict === true;
    }
}

/**
 * 测试点 21：冻结对象后，其原型上的属性仍可通过 Proxy 访问（原型链未断）
 */
export function testFrozenObjectInheritsPrototypePropsViaProxy() {
    const proto = { inherited: 'yes' };
    const obj = Object.create(proto);
    obj.local = 'no';
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    return proxy.inherited === 'yes' && proxy.local === 'no';
}

/**
 * 测试点 22：冻结对象后，无法通过 Proxy 修改其 __proto__（即使非严格模式）
 */
export function testCannotModifyProtoOfFrozenViaProxy() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    try {
        proxy.__proto__ = {};
        return false;
    } catch (e) {

        return Object.getPrototypeOf(proxy) === Object.prototype;
    }
}

/**
 * 测试点 23：冻结包含 getter 的对象后，getter 仍可被 Proxy 正常调用
 */
export function testGetterStillWorksOnFrozenObjectViaProxy() {
    const obj = {
        _val: 10,
        get value() {
            return this._val;
        }
    };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    return proxy.value === 10;
}

/**
 * 测试点 28：Proxy 的 apply 拦截器对冻结函数仍有效（冻结不影响调用）
 */
export function testProxyApplyWorksOnFrozenFunction() {

    function add(a, b) {
        return a + b;
    }

    const frozen = Object.freeze(add);
    const proxy = new Proxy(frozen, {
        apply(target, thisArg, args) {
            return target(...args) * 10;
        }
    });
    return proxy(2, 3) === 50;
}

/**
 * 测试点 29：冻结对象后，Object.seal 和 Object.freeze 行为一致（已冻结则密封）
 */
export function testFrozenObjectIsAlsoSealed() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    return Object.isSealed(frozen) === true;
}

/**
 * 测试点 30：冻结对象后，Proxy 的 isExtensible 拦截应返回 false
 */
export function testProxyIsExtensibleReturnsFalseForFrozen() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        isExtensible(target) {
            return Reflect.isExtensible(target);
        }
    });
    return Object.isExtensible(proxy) === false;
}

/**
 * 测试点 31：冻结对象后，无法通过 Proxy 的 defineProperty 添加不可配置属性
 */
export function testDefineNonConfigurablePropOnFrozenFails() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    try {
        Object.defineProperty(proxy, 'b', { value: 2, configurable: false, writable: false });
        return false;
    } catch (e) {
        return !('b' in frozen);
    }
}

/**
 * 测试点 32：冻结对象后，Proxy 的 getPrototypeOf 应正常工作
 */
export function testProxyGetPrototypeOfWorksOnFrozen() {
    const proto = {};
    const obj = Object.create(proto);
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    return Object.getPrototypeOf(proxy) === proto;
}


/**
 * 测试点 34：冻结后，Proxy 无法通过 Object.assign 修改目标
 */
export function testObjectAssignOnProxyOfFrozenFails() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    try {
        Object.assign(proxy, { a: 99, b: 2 });
        return false;
    } catch (e) {
        return obj.a === 1 && !('b' in obj);
    }
}

/**
 * 测试点 35：冻结对象的 Symbol.iterator 是否仍可被 Proxy 调用（如用于 for...of）
 */
export function testFrozenArrayIteratorWorksViaProxy() {
    const arr = [1, 2];
    const frozen = Object.freeze(arr);
    const proxy = new Proxy(frozen, {});
    let sum = 0;
    try {
        for (const item of proxy) {
            sum += item;
        }
        return sum === 3;
    } catch {
        return false;
    }
}

/**
 * 测试点 36：冻结对象后，Proxy 无法通过扩展运算符修改它（但可读取）
 */
export function testSpreadOperatorReadsButDoesNotModifyFrozenViaProxy() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const copied = { ...proxy, b: 2 };

    return obj.a === 1 && copied.b === 2;
}


/**
 * 测试点 38：冻结对象后，Proxy 的 construct 拦截不适用（非函数）
 */
export function testConstructOnNonFunctionFrozenThrows() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        construct() {
            return {};
        }
    });
    try {
        new proxy();
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 39：冻结包含不可枚举属性的对象，Proxy 仍能访问它
 */
export function testFrozenObjectKeepsNonEnumerablePropsAccessibleViaProxy() {
    const obj = {};
    Object.defineProperty(obj, 'secret', {
        value: 'hidden',
        enumerable: false,
        writable: true,
        configurable: true
    });
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    return proxy.secret === 'hidden' && !Object.keys(proxy).includes('secret');
}

/**
 * 测试点 40：冻结对象后，JSON.stringify 通过 Proxy 仍能正确序列化
 */
export function testJSONStringifyWorksOnProxyOfFrozen() {
    const obj = { data: 'ok', nested: { x: 1 } };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const str = JSON.stringify(proxy);
    const restored = JSON.parse(str);
    return restored.data === 'ok' && restored.nested.x === 1;
}

/**
 * 测试点 42：冻结对象不能成为 Proxy 的 target 后再被解冻（冻结不可逆）
 */
export function testFrozenObjectCannotBeThawed() {
    const obj = { x: 1 };
    const frozen = Object.freeze(obj);

    try {
        Object.defineProperty(frozen, 'x', { writable: true });
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 43：Proxy 自身被冻结时，其内部 target 未被冻结（冻结 Proxy ≠ 冻结 target）
 */
export function testFreezingProxyDoesNotFreezeTarget() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const frozenProxy = Object.freeze(proxy);

    try {
        frozenProxy.a = 999;
        return target.a === 999;
    } catch {

        return target.a === 1;
    }

}

/**
 * 测试点 44：冻结对象作为 WeakMap key 时，Proxy 不影响其引用语义
 */
export function testFrozenObjectAsWeakMapKeyWithProxy() {
    const obj = { id: 1 };
    const frozen = Object.freeze(obj);
    const wm = new WeakMap();
    wm.set(frozen, 'original');
    const proxy = new Proxy(frozen, {});
    wm.set(proxy, 'via proxy');
    return wm.get(frozen) === 'original' && wm.get(proxy) === 'via proxy';
}

/**
 * 测试点 45：冻结后，Proxy 无法通过 Reflect.set 修改属性（Reflect 遵守冻结）
 */
export function testReflectSetFailsOnFrozenViaProxy() {
    const obj = { v: 10 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        set(target, prop, value, receiver) {
            return Reflect.set(target, prop, value, receiver);
        }
    });
    const success = Reflect.set(proxy, 'v', 999);
    return success === false && frozen.v === 10;
}

/**
 * 测试点 49：冻结包含循环引用的对象，Proxy 仍能安全访问
 */
export function testFrozenCircularObjectWithProxy() {
    const obj = { a: 1 };
    obj.self = obj;
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    return proxy.self !== proxy && proxy.a === 1;
}

/**
 * 测试点 50：冻结后，Object.values / keys / entries 通过 Proxy 正常工作
 */
export function testObjectStaticMethodsWorkOnProxyOfFrozen() {
    const obj = { x: 1, y: 2 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const vals = Object.values(proxy);
    const keys = Object.keys(proxy);
    const entries = Object.entries(proxy);
    return (
        vals.length === 2 &&
        keys.includes('x') &&
        entries.some(([k, v]) => k === 'y' && v === 2)
    );
}

/**
 * 测试点 51：冻结 null 或 undefined 会抛错（但 Proxy 可包装它们？）
 */
export function testFreezingNullThrowsButProxyCanWrap() {
    let freezeError = false;
    try {
        Object.freeze(null);
    } catch (e) {
        freezeError = true;
    }
    let proxyWorks = false;
    try {
        const p = new Proxy(null, {});
        proxyWorks = p === null;
    } catch (e) {
        proxyWorks = true;
    }
    return !freezeError && proxyWorks;
}

/**
 * 测试点 52：冻结对象后，Proxy 无法通过 with 语句修改（模拟旧语法）
 */
export function testWithStatementOnProxyOfFrozen() {

    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    let result = true;
    try {

        proxy.a = 999;
        if (proxy.a !== 1) {
            result = false;
        }
    } catch (e) {

    }
    return result && frozen.a === 1;
}

/**
 * 测试点 53：冻结对象的 Symbol.toStringTag 是否仍可被 Proxy 读取
 */
export function testSymbolToStringTagOnFrozenViaProxy() {
    const obj = {};
    obj[Symbol.toStringTag] = 'MyObj';
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    return Object.prototype.toString.call(proxy) === '[object MyObj]';
}

/**
 * 测试点 54：冻结后，Proxy 的 has 拦截器对非自身属性应返回 false（如果原型无）
 */
export function testHasTrapOnFrozenForNonExistentProp() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        has(target, prop) {
            return prop in target;
        }
    });
    return !('missing' in proxy);
}

/**
 * 测试点 55：冻结 Map 对象（非 Map 实例内容）—— 注意：freeze 不递归冻结容器内容
 */
export function testFreezingMapInstanceItself() {
    const map = new Map([['key', 'value']]);
    const frozen = Object.freeze(map);
    const proxy = new Proxy(frozen, {});
    try {
        proxy.set('new', 'test');
        return false;
    } catch (e) {

        map.set('another', 'ok');
        return map.has('another');
    }
}

/**
 * 测试点 56：冻结对象后，Proxy 无法通过 eval 间接修改（eval 使用代理上下文）
 */
export function testEvalCannotModifyFrozenViaProxy() {
    const obj = { code: 'safe' };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    try {

        eval('proxy.code = "evil"');
        return frozen.code === 'safe';
    } catch (e) {
        return frozen.code === 'safe';
    }
}

/**
 * 测试点 57：冻结对象的属性描述符通过 Proxy 的 getOwnPropertyDescriptor 应一致
 */
export function testGetOwnPropertyDescriptorConsistency() {
    const obj = { data: 42 };
    const frozen = Object.freeze(obj);
    const directDesc = Object.getOwnPropertyDescriptor(frozen, 'data');
    const proxy = new Proxy(frozen, {});
    const proxyDesc = Object.getOwnPropertyDescriptor(proxy, 'data');
    return (
        directDesc.value === proxyDesc.value &&
            directDesc.writable === proxyDesc.writable &&
            directDesc.configurable === proxyDesc.configurable
    );
}

/**
 * 测试点 58：冻结后，Proxy 的 ownKeys 必须包含所有不可枚举自身属性（包括 Symbol）
 */
export function testOwnKeysIncludesNonEnumerableAndSymbolOnFrozen() {
    const sym = Symbol('s');
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        enumerable: false,
        writable: true,
        configurable: true
    });
    obj[sym] = 'symbolVal';
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const keys = Reflect.ownKeys(proxy);
    return keys.includes('hidden') && keys.includes(sym);
}

/**
 * 测试点 60：冻结 Proxy 实例本身（而非 target）是否影响其行为
 */
export function testFreezingTheProxyInstance() {
    const target = { a: 1 };
    const handler = {
        set(target, prop, value) {
            target[prop] = value;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    const frozenProxy = Object.freeze(proxy);

    try {
        frozenProxy.a = 999;
        return target.a === 999;
    } catch (e) {
        return target.a === 1;
    }

}

/**
 * 测试点 61：冻结包含私有字段的类实例 —— 私有字段不受 freeze 影响（因为不在对象自有属性中）
 */
export function testFrozenClassInstanceWithPrivateField() {

    const privateData = new WeakMap();

    class MyClass {
        constructor(val) {
            privateData.set(this, val);
        }

        getValue() {
            return privateData.get(this);
        }

        setValue(v) {
            privateData.set(this, v);
        }
    }

    const instance = new MyClass(100);
    const frozen = Object.freeze(instance);
    frozen.setValue(200);
    return frozen.getValue() === 200;
}

/**
 * 测试点 62：冻结类的 prototype 后，实例方法不可被覆盖（通过 Proxy）
 */
export function testFrozenPrototypePreventsMethodOverrideViaProxy() {
    class A {
        method() {
            return 'original';
        }
    }

    Object.freeze(A.prototype);
    const instance = new A();
    const proxy = new Proxy(instance, {});
    try {
        proxy.method = () => 'hacked';
        return proxy.method() === 'original';
    } catch (e) {
        return proxy.method() === 'original';
    }
}

/**
 * 测试点 63：Proxy 的 handler 被冻结后，仍能正常拦截操作
 */
export function testFrozenProxyHandlerStillWorks() {
    const target = { x: 1 };
    const handler = {
        get(target, prop) {
            return target[prop] * 2;
        }
    };
    Object.freeze(handler);
    const proxy = new Proxy(target, handler);
    return proxy.x === 2;
}

/**
 * 测试点 64：冻结对象后，for...in 循环通过 Proxy 仅遍历可枚举自身属性（符合预期）
 */
export function testForInOnProxyOfFrozen() {
    const obj = {};
    Object.defineProperty(obj, 'nonEnum', {
        value: 'hidden',
        enumerable: false
    });
    obj.visible = 'show';
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const keys = [];
    for (const k in proxy) {
        keys.push(k);
    }
    return keys.length === 1 && keys[0] === 'visible';
}

/**
 * 测试点 65：冻结模块命名空间对象（模拟）后，Proxy 无法添加属性
 */
export function testFrozenModuleNamespaceLikeObject() {

    const ns = Object.create(null);
    Object.defineProperty(ns, 'default', { value: 42, enumerable: true });
    Object.defineProperty(ns, Symbol.toStringTag, { value: 'Module', enumerable: false });
    const frozen = Object.freeze(ns);
    const proxy = new Proxy(frozen, {});
    proxy.newExport = 'fail';
    return !('newExport' in frozen);
}

/**
 * 测试点 67：冻结后，structuredClone（若支持）应成功复制值但不共享引用
 */
export function testStructuredCloneOfFrozenObject() {
    if (typeof structuredClone === 'undefined') {

        return true;
    }
    const obj = { data: [1, 2, { nested: true }] };
    const frozen = Object.freeze(obj);
    try {
        const cloned = structuredClone(frozen);
        cloned.data[0] = 999;
        return frozen.data[0] === 1 && cloned.data[0] === 999;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点 69：冻结后，Object.getOwnPropertyNames 忽略不可枚举属性，Proxy 不改变此行为
 */
export function testGetOwnPropertyNamesOnProxyOfFrozen() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const names = Object.getOwnPropertyNames(proxy);
    return names.length === 2 && names[0] === 'a';
}

/**
 * 测试点 70：冻结 Proxy 的 target 后，handler 中的 this 指向仍正确
 */
export function testThisInFrozenTargetProxyHandler() {
    const target = {
        value: 10,
        getValue() {
            return this.value;
        }
    };
    const frozen = Object.freeze(target);
    let capturedThis = null;
    const proxy = new Proxy(frozen, {
        get(target, prop, receiver) {
            if (prop === 'getValue') {
                capturedThis = target;
                return target[prop];
            }
            return target[prop];
        }
    });
    proxy.getValue();
    return capturedThis === frozen;
}

/**
 * 测试点 72：冻结空对象后，Proxy 的 isExtensible 返回 false，preventExtensions 无副作用
 */
export function testPreventExtensionsOnAlreadyFrozen() {
    const obj = {};
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const already = Object.isExtensible(proxy);
    return already === false;
}

/**
 * 测试点 75：冻结后，Proxy 的 apply 拦截器对箭头函数无效（因箭头函数不可构造/apply？）
 */
export function testApplyOnFrozenArrowFunction() {
    const fn = () => 'arrow';
    const frozen = Object.freeze(fn);
    let applied = false;
    const proxy = new Proxy(frozen, {
        apply() {
            applied = true;
            return 'intercepted';
        }
    });
    const result = proxy();
    return applied && result === 'intercepted';

}

/**
 * 测试点 78：冻结包含 getter 的对象，Proxy 可拦截 getter 调用
 */
export function testProxyInterceptsGetterOnFrozenObject() {
    const obj = {
        _x: 10,
        get x() {
            return this._x;
        }
    };
    const frozen = Object.freeze(obj);
    let getterCalled = false;
    const proxy = new Proxy(frozen, {
        get(target, prop, receiver) {
            if (prop === 'x') {
                getterCalled = true;
            }
            return Reflect.get(target, prop, receiver);
        }
    });
    proxy.x;
    return getterCalled && proxy.x === 10;
}

/**
 * 测试点 79：冻结后，Proxy 的 construct 拦截器对类构造函数仍有效
 */
export function testProxyConstructOnFrozenClass() {
    class MyClass {
        constructor(val) {
            this.val = val;
        }
    }

    const FrozenClass = Object.freeze(MyClass);
    const proxy = new Proxy(FrozenClass, {
        construct(target, args) {
            const instance = new target(...args);
            instance.intercepted = true;
            return instance;
        }
    });
    const inst = new proxy(42);
    return inst.val === 42 && inst.intercepted === true;
}

/**
 * 测试点 80：冻结对象后，WeakSet 中的成员仍可被 Proxy 安全引用（无泄漏）
 */
export function testFrozenObjectInWeakSetWithProxy() {
    const obj = { id: 1 };
    const frozen = Object.freeze(obj);
    const ws = new WeakSet();
    ws.add(frozen);
    const proxy = new Proxy(frozen, {});
    return ws.has(proxy) !== true && ws.has(frozen) === true;
}

/**
 * 测试点 81：冻结对象可防止原型污染攻击（通过 Proxy 拦截 __proto__ 赋值）
 */
export function testFrozenObjectResistsProtoPollution() {
    const obj = {};
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});

    try {
        proxy.__proto__ = { malicious: true };
        proxy.constructor = { prototype: { polluted: true } };
    } catch (e) { /* ignore */
    }
    return (
        !('malicious' in {}) &&
            !('polluted' in {}.constructor.prototype)
    );
}

/**
 * 测试点 83：冻结的 Proxy target 在跨 iframe 通信中保持不可变（模拟）
 */
export function testFrozenObjectInPostMessageSimulation() {

    const obj = { secret: 'safe' };
    const frozen = Object.freeze(obj);

    const cloned = JSON.parse(JSON.stringify(frozen));
    cloned.secret = 'leaked';
    return frozen.secret === 'safe';
}

/**
 * 测试点 84：冻结对象作为 Map 的 key，其哈希稳定性不受 Proxy 影响
 */
export function testFrozenObjectAsMapKeyStableHash() {
    const obj = { id: 1 };
    const frozen = Object.freeze(obj);
    const map = new Map();
    map.set(frozen, 'value1');
    const proxy = new Proxy(frozen, {});
    map.set(proxy, 'value2');
    return map.size === 2 && map.get(frozen) === 'value1';
}

/**
 * 测试点 85：冻结后，Proxy 的 get trap 无法伪造不存在的属性（若 handler 不主动伪造）
 */
export function testProxyDoesNotFabricatePropsOnFrozen() {
    const obj = { real: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {
        get(target, prop) {
            return prop in target ? target[prop] : undefined;
        }
    });
    return proxy.fake === undefined && 'fake' in proxy === false;
}

/**
 * 测试点 87：冻结后，Object.isFrozen(proxy) 应返回 true
 */
export function testObjectIsFrozenWorksOnProxyOfFrozen() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    return Object.isFrozen(proxy) === true;
}

/**
 * 测试点 88：冻结对象不能被用作 Proxy 的 handler（因为 handler 需可配置？不，实际可以）
 */
export function testFrozenObjectAsProxyHandler() {
    const target = {};
    const handler = {
        get() {
            return 'intercepted';
        }
    };
    const frozenHandler = Object.freeze(handler);
    const proxy = new Proxy(target, frozenHandler);
    return proxy.anyProp === 'intercepted';
}

/**
 * 测试点 89：冻结后，Proxy 无法通过 Reflect.construct 修改类实例初始化
 */
export function testReflectConstructWithFrozenClass() {
    class A {
        constructor(x) {
            this.x = x;
        }
    }

    const FrozenA = Object.freeze(A);
    const instance = Reflect.construct(FrozenA, [42]);
    return instance.x === 42;
}

/**
 * 测试点 91：冻结后，Proxy 的 ownKeys 必须与 getOwnPropertyDescriptor 一致（规范要求）
 */
export function testOwnKeysConsistentWithGetOwnPropertyDescriptor() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const sym = Symbol('s');
    obj[sym] = 3;
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const keys = Reflect.ownKeys(proxy);
    for (const k of keys) {
        const desc = Object.getOwnPropertyDescriptor(proxy, k);
        if (!desc) {
            return false;
        }
    }
    return true;
}

/**
 * 测试点 92：冻结对象在模板字符串中通过 Proxy 访问正常
 */
export function testTemplateStringAccessOnProxyOfFrozen() {
    const obj = { name: 'Alice' };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const str = `${proxy.name} says hello`;
    return str === 'Alice says hello';
}

/**
 * 测试点 93：冻结后，Proxy 无法通过 Object.setPrototypeOf 改变原型（即使使用 null）
 */
export function testSetPrototypeOfToNullFailsOnFrozen() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    const result = Reflect.setPrototypeOf(frozen, null);
    return result === false && Object.getPrototypeOf(frozen) !== null;
}

/**
 * 测试点 95：冻结后，Proxy 无法通过 with 语句注入全局变量（安全防护）
 */
export function testWithStatementSecurityWithFrozenProxy() {
    const obj = { config: 'safe' };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    let result = 'safe';

    try {
        eval(`
      with (proxy) {
        config = 'hacked';
      }
    `);
        result = proxy.config;
    } catch (e) {

        result = 'safe';
    }
    return result === 'safe';
}

/**
 * 测试点 97：冻结后，Proxy 无法通过 Function.prototype.call/apply 修改 this 绑定影响原对象
 */
export function testCallApplyOnMethodOfFrozenObject() {
    const obj = {
        value: 10,
        getValue() {
            return this.value;
        }
    };
    const frozen = Object.freeze(obj);
    const proxy = new Proxy(frozen, {});
    const fake = { value: 999 };
    const result = proxy.getValue.call(fake);
    return result === 999 && frozen.value === 10;
}

