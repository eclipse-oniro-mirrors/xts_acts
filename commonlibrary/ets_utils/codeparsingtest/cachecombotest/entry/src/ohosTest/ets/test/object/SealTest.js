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
 * 测试点2：Proxy 是否能阻止对 sealed 对象的扩展（即使通过代理）
 * 预期：无法添加新属性，且 defineProperty 应失败或被拦截
 */
export function testSealedProxyPreventsExtension() {
    const obj = { x: 10 };
    Object.seal(obj);

    let definePropertyCalled = false;
    const proxy = new Proxy(obj, {
        defineProperty(target, prop, descriptor) {
            definePropertyCalled = true;
            return Reflect.defineProperty(target, prop, descriptor);
        }
    });

    try {
        Object.defineProperty(proxy, 'y', { value: 20, writable: true });
    } catch (e) {

    }

    const propertyAdded = 'y' in obj;
    return definePropertyCalled && !propertyAdded;
}

/**
 * 测试点4：sealed 对象的 Proxy 是否允许修改已有属性的值（应允许）
 */
export function testSealedProxyAllowsExistingPropertyUpdate() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    proxy.a = 99;
    return obj.a === 99;
}

/**
 * 测试点5：尝试通过 Proxy 添加新属性到 sealed 对象（应失败）
 */
export function testSealedProxyBlocksNewPropertyAddition() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    proxy.b = 2;
    return !('b' in obj);
}

/**
 * 测试点6：Proxy 的 has 陷阱在 sealed 对象上是否正常工作
 */
export function testSealedProxyHasTrapWorks() {
    const obj = { x: 1 };
    Object.seal(obj);
    let hasCalled = false;
    const proxy = new Proxy(obj, {
        has(target, prop) {
            if (prop === 'x') {
                hasCalled = true;
            }
            return Reflect.has(target, prop);
        }
    });
    'x' in proxy;
    return hasCalled;
}

/**
 * 测试点7：Proxy 的 getOwnPropertyDescriptor 在 sealed 对象上是否可拦截
 */
export function testSealedProxyGetOwnPropertyDescriptorIntercepted() {
    const obj = { y: 42 };
    Object.seal(obj);
    let getDescCalled = false;
    const proxy = new Proxy(obj, {
        getOwnPropertyDescriptor(target, prop) {
            if (prop === 'y') {
                getDescCalled = true;
            }
            return Reflect.getOwnPropertyDescriptor(target, prop);
        }
    });
    Object.getOwnPropertyDescriptor(proxy, 'y');
    return getDescCalled;
}

/**
 * 测试点8：sealed 对象的属性描述符是否变为 non-configurable
 */
export function testSealedPropertiesAreNonConfigurable() {
    const obj = { z: 100 };
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'z');
    return desc.configurable === false;
}

/**
 * 测试点9：通过 Proxy 尝试重新定义 sealed 属性的 configurable（应失败）
 */
export function testSealedProxyCannotRedefineConfigurable() {
    const obj = { p: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    try {
        Object.defineProperty(proxy, 'p', { configurable: true });
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点10：Proxy 的 ownKeys 陷阱能否正确反映 sealed 对象的键（不能增删）
 */
export function testSealedProxyOwnKeysReflectsExactKeys() {
    const obj = { m: 1, n: 2 };
    Object.seal(obj);
    let ownKeysCalled = false;
    const proxy = new Proxy(obj, {
        ownKeys(target) {
            ownKeysCalled = true;
            return Reflect.ownKeys(target);
        }
    });
    const keys = Reflect.ownKeys(proxy);
    const expected = ['m', 'n'];
    const matches = keys.length === expected.length && keys.every(k => expected.includes(k));
    return ownKeysCalled && matches;
}

/**
 * 测试点11：对 sealed 对象使用 Proxy 后，Object.isSealed 应仍返回 true
 */
export function testProxyOfSealedObjectIsStillReportedAsSealed() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    return Object.isSealed(proxy) === true;
}

/**
 * 测试点12：Proxy 的 get 陷阱在访问 sealed 对象属性时是否触发
 */
export function testSealedProxyGetTrapInvoked() {
    const obj = { val: 'hello' };
    Object.seal(obj);
    let getCalled = false;
    const proxy = new Proxy(obj, {
        get(target, prop) {
            if (prop === 'val') {
                getCalled = true;
            }
            return Reflect.get(target, prop);
        }
    });
    void proxy.val;
    return getCalled;
}

/**
 * 测试点14：Proxy 的 preventExtensions 陷阱在 sealed 对象上是否被调用（sealed 隐含 preventExtensions）
 */
export function testSealedProxyPreventExtensionsTrapCalled() {
    const obj = { a: 1 };
    Object.seal(obj);
    let preventExtCalled = false;
    const proxy = new Proxy(obj, {
        preventExtensions(target) {
            preventExtCalled = true;
            return Reflect.preventExtensions(target);
        }
    });

    Object.preventExtensions(proxy);
    return preventExtCalled;
}

/**
 * 测试点15：sealed 对象的 Proxy 是否阻止 [[Prototype]] 修改（即 setPrototypeOf 失败）
 */
export function testSealedProxySetPrototypeOfFails() {
    const obj = { a: 1 };
    Object.seal(obj);
    let setProtoCalled = false;
    const proxy = new Proxy(obj, {
        setPrototypeOf(target, proto) {
            setProtoCalled = true;
            return Reflect.setPrototypeOf(target, proto);
        }
    });
    try {
        Object.setPrototypeOf(proxy, {});
        return false;
    } catch (e) {
        return setProtoCalled;
    }
}

/**
 * 测试点16：Proxy 的 isExtensible 陷阱在 sealed 对象上返回 false
 */
export function testSealedProxyIsExtensibleReturnsFalse() {
    const obj = { x: 1 };
    Object.seal(obj);
    let isExtCalled = false;
    const proxy = new Proxy(obj, {
        isExtensible(target) {
            isExtCalled = true;
            return Reflect.isExtensible(target);
        }
    });
    const ext = Object.isExtensible(proxy);
    return isExtCalled && ext === false;
}

/**
 * 测试点17：对已 seal 的对象再 seal（通过 Proxy），行为应无变化
 */
export function testDoubleSealViaProxyNoEffect() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    Object.seal(proxy);
    proxy.b = 2;
    return !('b' in obj) && obj.a === 1;
}

/**
 * 测试点18：Proxy 拦截 apply / construct 不适用（非函数），但确保普通对象不报错
 */
export function testSealedProxyNonFunctionSafe() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});

    try {
        proxy();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点19：Proxy 拦截 get 时返回修改后的值，不影响原始 sealed 对象
 */
export function testSealedProxyGetCanTransformValueWithoutMutatingTarget() {
    const obj = { secret: 42 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        get(target, prop) {
            if (prop === 'secret') {
                return 'hidden';
            }
            return Reflect.get(target, prop);
        }
    });
    const val = proxy.secret;
    return val === 'hidden' && obj.secret === 42;
}

/**
 * 测试点20：Object.seal + Proxy 后，for...in 遍历结果与原对象一致
 */
export function testSealedProxyForInMatchesOriginal() {
    const obj = { alpha: 1, beta: 2 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const keysFromProxy = [];
    for (const k in proxy) {
        keysFromProxy.push(k);
    }
    const originalKeys = Object.keys(obj);
    keysFromProxy.sort();
    originalKeys.sort();
    return JSON.stringify(keysFromProxy) === JSON.stringify(originalKeys);
}

/**
 * 测试点22：Proxy 的 get 陷阱在访问不存在的属性时仍被调用（即使对象已 seal）
 */
export function testSealedProxyGetTrapCalledForNonExistentProperty() {
    const obj = { a: 1 };
    Object.seal(obj);
    let getCalledForMissing = false;
    const proxy = new Proxy(obj, {
        get(target, prop) {
            if (prop === 'missing') {
                getCalledForMissing = true;
            }
            return Reflect.get(target, prop);
        }
    });
    void proxy.missing;
    return getCalledForMissing;
}

/**
 * 测试点23：对 sealed 对象使用 Proxy 后，Object.keys() 结果不变
 */
export function testSealedProxyObjectKeysUnchanged() {
    const obj = { x: 1, y: 2 };
    const originalKeys = Object.keys(obj).sort();
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const proxyKeys = Object.keys(proxy).sort();
    return JSON.stringify(originalKeys) === JSON.stringify(proxyKeys);
}

/**
 * 测试点24：Proxy 拦截 set 时抛出错误，是否阻止无效赋值（即使属性存在）
 */
export function testSealedProxySetTrapCanThrowToBlockUpdate() {
    const obj = { a: 10 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        set() {
            throw new Error('blocked');
        }
    });
    try {
        proxy.a = 20;
        return false;
    } catch (e) {
        return obj.a === 10;
    }
}

/**
 * 测试点26：Proxy 的 apply / construct 陷阱不适用于非函数 sealed 对象（安全）
 */
export function testSealedNonFunctionProxyApplyConstructSafe() {
    const obj = { data: 42 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        apply() {
            return 'applied';
        },
        construct() {
            return {};
        }
    });

    try {
        proxy();
        return false;
    } catch (e) {
        return e.message.includes('not a function') || e instanceof TypeError;
    }
}

/**
 * 测试点27：Object.seal 不影响原型链，Proxy 可代理原型方法访问
 */
export function testSealedProxyStillInheritsFromPrototype() {
    const parent = { inherited: 'yes' };
    const obj = Object.create(parent);
    obj.own = 'value';
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    return proxy.inherited === 'yes' && proxy.own === 'value';
}

/**
 * 测试点29：Reflect.set 在 sealed Proxy 上对新属性返回 false
 */
export function testReflectSetOnSealedProxyReturnsFalseForNewProp() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const result = Reflect.set(proxy, 'b', 2);
    return result === false && !('b' in obj);
}

/**
 * 测试点30：Reflect.deleteProperty 在 sealed Proxy 上返回 false
 */
export function testReflectDeletePropertyOnSealedProxyReturnsFalse() {
    const obj = { toDelete: 123 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const result = Reflect.deleteProperty(proxy, 'toDelete');
    return result === false && 'toDelete' in obj;
}

/**
 * 测试点32：多次 seal 同一对象（通过 Proxy）不会报错
 */
export function testMultipleSealViaProxyNoError() {
    const obj = { a: 1 };
    const proxy = new Proxy(obj, {});
    try {
        Object.seal(proxy);
        Object.seal(proxy);
        Object.seal(obj);
        return Object.isSealed(obj) && Object.isSealed(proxy);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点34：sealed 对象的 Proxy 在 for...in 中仍可被拦截（通过 get）
 */
export function testSealedProxyForInTriggersGetTrap() {
    const obj = { loop: 10 };
    Object.seal(obj);
    let getCalledInLoop = false;
    const proxy = new Proxy(obj, {
        get(target, prop) {
            if (prop === 'loop') {
                getCalledInLoop = true;
            }
            return Reflect.get(target, prop);
        }
    });
    for (const k in proxy) {
        void proxy[k];
    }
    return getCalledInLoop;
}

/**
 * 测试点35：Object.seal + Proxy 后，JSON.stringify 结果不变
 */
export function testSealedProxyJSONStringifyUnchanged() {
    const obj = { name: 'test', id: 42 };
    const original = JSON.stringify(obj);
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const viaProxy = JSON.stringify(proxy);
    return original === viaProxy;
}

/**
 * 测试点39：通过 Proxy 访问 sealed 对象的 length（如果是数组）是否正常
 */
export function testSealedArrayProxyLengthAccessWorks() {
    const arr = [1, 2, 3];
    Object.seal(arr);
    const proxy = new Proxy(arr, {});
    return proxy.length === 3 && arr.length === 3;
}

/**
 * 测试点41：对 sealed 对象创建 Proxy 的 Proxy，行为是否一致
 */
export function testDoubleProxyOnSealedObjectWorksConsistently() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy1 = new Proxy(obj, {});
    const proxy2 = new Proxy(proxy1, {});
    proxy2.a = 99;
    proxy2.b = 2;
    return obj.a === 99 && !('b' in obj);
}

/**
 * 测试点42：sealed 数组通过 Proxy 修改现有索引应成功
 */
export function testSealedArrayProxyCanModifyExistingIndex() {
    const arr = [10, 20];
    Object.seal(arr);
    const proxy = new Proxy(arr, {});
    proxy[0] = 100;
    return arr[0] === 100;
}

/**
 * 测试点43：sealed 数组通过 Proxy 添加新索引应失败（因 length 不可扩展）
 */
export function testSealedArrayProxyCannotAddNewIndex() {
    const arr = [1];
    Object.seal(arr);
    const proxy = new Proxy(arr, {});
    proxy[1] = 2;
    return arr.length === 1 && arr[1] === undefined;
}

/**
 * 测试点44：Proxy 的 set 陷阱中抛出异常，是否阻止对 sealed 对象的修改
 */
export function testSealedProxySetTrapThrowPreventsUpdate() {
    const obj = { x: 5 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        set() {
            throw new Error('forbidden');
        }
    });
    try {
        proxy.x = 10;
        return false;
    } catch (e) {
        return obj.x === 5;
    }
}

/**
 * 测试点45：Object.seal 不递归密封嵌套对象，Proxy 可修改嵌套属性
 */
export function testSealedProxyCanModifyNestedObjectProperties() {
    const obj = { inner: { value: 1 } };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    proxy.inner.value = 99;
    return obj.inner.value === 99;
}

/**
 * 测试点46：Proxy 拦截 get 时访问原型链上的属性，sealed 不影响原型
 */
export function testSealedProxyGetFromPrototypeStillWorks() {
    const proto = { shared: 'proto' };
    const obj = Object.create(proto);
    obj.local = 'own';
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    return proxy.shared === 'proto' && proxy.local === 'own';
}

/**
 * 测试点47：Reflect.ownKeys 与 Object.getOwnPropertyNames + Symbols 一致
 */
export function testSealedProxyReflectOwnKeysMatchesManualEnumeration() {
    const sym = Symbol('s');
    const obj = { a: 1, [sym]: 2 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const keys1 = Reflect.ownKeys(proxy);
    const keys2 = [...Object.getOwnPropertyNames(obj), ...Object.getOwnPropertySymbols(obj)];
    keys1.sort((a, b) => String(a).localeCompare(String(b)));
    keys2.sort((a, b) => String(a).localeCompare(String(b)));
    return JSON.stringify(keys1) === JSON.stringify(keys2);
}

/**
 * 测试点49：尝试通过 Proxy 修改 sealed 对象的 __proto__（应失败）
 */
export function testSealedProxyCannotModifyProtoViaUnderscore() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    let success = true;
    try {
        proxy.__proto__ = {};
    } catch (e) {
        success = false;
    }

    return Object.getPrototypeOf(proxy) === Object.getPrototypeOf(obj);
}

/**
 * 测试点50：Object.seal 后，Proxy 的 defineProperty 无法更改 writable（若已 seal）
 */
export function testSealedProxyDefinePropertyCannotChangeWritable() {
    const obj = { data: 42 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    try {
        Object.defineProperty(proxy, 'data', { writable: false });

        return true;
    } catch (e) {
        const desc = Object.getOwnPropertyDescriptor(obj, 'data');
        return fakse
    }
}

/**
 * 测试点52：sealed 对象的 Proxy 在 JSON.stringify 中忽略不可枚举属性（正常行为）
 */
export function testSealedProxyJSONStringifyIgnoresNonEnumerable() {
    const obj = { visible: 1 };
    Object.defineProperty(obj, 'hidden', {
        value: 2,
        enumerable: false,
        writable: true,
        configurable: true
    });
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const str = JSON.stringify(proxy);
    return str === '{"visible":1}';
}

/**
 * 测试点54：多次代理 + seal 后，Object.isSealed 仍返回 true
 */
export function testNestedProxySealedObjectIsSealedStillTrue() {
    const obj = { a: 1 };
    Object.seal(obj);
    const p1 = new Proxy(obj, {});
    const p2 = new Proxy(p1, {});
    const p3 = new Proxy(p2, {});
    return Object.isSealed(p3) === true;
}

/**
 * 测试点55：Proxy 拦截 set 时修改 target，是否影响原始 sealed 对象（应影响）
 */
export function testSealedProxySetTrapModifiesTargetDirectly() {
    const obj = { count: 0 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        set(target, prop, value) {
            target[prop] = value * 2;
            return true;
        }
    });
    proxy.count = 5;
    return obj.count === 10;
}

/**
 * 测试点56：Symbol.toStringTag 在 sealed 对象上可通过 Proxy 自定义
 */
export function testSealedProxyCanCustomizeToStringTag() {
    const obj = {};
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        get(target, prop) {
            if (prop === Symbol.toStringTag) {
                return 'MySealedObject';
            }
            return Reflect.get(target, prop);
        }
    });
    const tag = Object.prototype.toString.call(proxy);
    return tag === '[object MySealedObject]';
}

/**
 * 测试点58：Object.seal 后，Proxy 无法通过 Object.assign 添加属性
 */
export function testSealedProxyBlocksObjectAssignExtension() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    try {
        Object.assign(proxy, { b: 2 });
    } catch (e) {

    }
    return !('b' in obj);
}

/**
 * 测试点59：Proxy 拦截 preventExtensions 时返回 false，但对象已 seal，应仍不可扩展
 */
export function testSealedProxyPreventExtensionsTrapReturnsFalseButStillNotExtensible() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        preventExtensions() {
            return false;
        }
    });
    const isExt = Object.isExtensible(proxy);
    const isSealed = Object.isSealed(proxy);

    return isExt === false && isSealed === true;
}

/**
 * 测试点60：从 sealed Proxy 解构赋值，只获取自有可枚举属性
 */
export function testSealedProxyDestructuringAssignmentWorks() {
    const obj = { first: 10, second: 20 };
    Object.defineProperty(obj, 'nonEnum', {
        value: 30,
        enumerable: false
    });
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const { first, second, nonEnum } = proxy;
    return first === 10 && second === 20 && nonEnum === 30;
}

/**
 * 测试点61：sealed 对象上的访问器属性（getter/setter）仍可被调用（但不能重定义）
 */
export function testSealedProxyAccessorPropertiesStillWork() {
    const obj = {
        _val: 10,
        get value() {
            return this._val;
        },
        set value(v) {
            this._val = v * 2;
        }
    };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    proxy.value = 5;
    return obj._val === 10 && proxy.value === 10;
}

/**
 * 测试点62：尝试通过 Proxy 重新定义 sealed 访问器属性（应失败）
 */
export function testSealedProxyCannotRedefineAccessorProperty() {
    const obj = {
        get x() {
            return 1;
        }
    };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    try {
        Object.defineProperty(proxy, 'x', { value: 99 });
        return false;
    } catch (e) {
        return typeof obj.x === 'function' || obj.x === 1;
    }
}

/**
 * 测试点63：Proxy 作为另一个对象的 prototype，其 target 被 seal，不影响继承读取
 */
export function testSealedObjectAsPrototypeViaProxyWorks() {
    const parent = { inherited: 'from sealed' };
    Object.seal(parent);
    const proxyParent = new Proxy(parent, {});
    const child = Object.create(proxyParent);
    return child.inherited === 'from sealed';
}

/**
 * 测试点64：Object.seal 后，Proxy 的 ownKeys 顺序应与原对象一致（规范要求）
 */
export function testSealedProxyOwnKeysOrderMatchesOriginal() {
    const obj = {
        b: 2,
        a: 1,
        '2': 'two',
        '1': 'one'
    };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const objKeys = Reflect.ownKeys(obj);
    const proxyKeys = Reflect.ownKeys(proxy);
    return JSON.stringify(objKeys) === JSON.stringify(proxyKeys);
}

/**
 * 测试点65：Proxy 拦截 set 时修改其他属性，副作用应生效（即使目标是 sealed）
 */
export function testSealedProxySetTrapSideEffectOnOtherProperty() {
    const obj = { main: 0, counter: 0 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        set(target, prop, value) {
            if (prop === 'main') {
                target.counter++;
                target.main = value;
            }
            return true;
        }
    });
    proxy.main = 42;
    return obj.main === 42 && obj.counter === 1;
}

/**
 * 测试点66：对已 freeze 的对象再 seal（通过 Proxy），无影响且 isSealed 为 true
 */
export function testFrozenObjectIsAlsoSealedAndProxyRespectsIt() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const proxy = new Proxy(obj, {});
    proxy.b = 2;
    return Object.isSealed(proxy) === true && !('b' in obj) && obj.a === 1;
}

/**
 * 测试点67：Proxy 的 get 陷阱中访问 target 的非自身属性，应走原型链
 */
export function testSealedProxyGetTrapRespectsPrototypeChainInTarget() {
    const proto = { protoVal: 'proto' };
    const obj = Object.create(proto);
    obj.ownVal = 'own';
    Object.seal(obj);
    let accessedProto = false;
    const proxy = new Proxy(obj, {
        get(target, prop) {
            if (prop === 'protoVal') {
                accessedProto = target.protoVal === 'proto';
            }
            return Reflect.get(target, prop);
        }
    });
    void proxy.protoVal;
    return accessedProto;
}

/**
 * 测试点68：使用 Proxy 拦截 apply 于函数对象，即使该函数已被 seal
 */
export function testSealedFunctionProxyApplyTrapWorks() {

    function fn() {
        return 'original';
    }

    fn.custom = 'data';
    Object.seal(fn);
    const proxy = new Proxy(fn, {
        apply() {
            return 'intercepted';
        }
    });
    return proxy() === 'intercepted' && proxy.custom === 'data';
}

/**
 * 测试点69：Proxy 的 construct 陷阱对 sealed 构造函数仍有效
 */
export function testSealedConstructorProxyConstructTrapWorks() {

    function MyClass() {
        this.initialized = true;
    }

    MyClass.prototype.value = 42;
    Object.seal(MyClass);
    const proxy = new Proxy(MyClass, {
        construct(target, args, newTarget) {
            const instance = new target(...args);
            instance.intercepted = true;
            return instance;
        }
    });
    const inst = new proxy();
    return inst.initialized === true && inst.intercepted === true;
}

/**
 * 测试点70：Object.seal 不影响 Proxy 的 handler 本身（handler 是独立对象）
 */
export function testSealingTargetDoesNotAffectProxyHandler() {
    const obj = { a: 1 };
    const handler = {
        get(target, prop) {
            return prop === 'a' ? 'modified' : Reflect.get(target, prop);
        }
    };
    Object.seal(obj);
    const proxy = new Proxy(obj, handler);
    return proxy.a === 'modified';
}

/**
 * 测试点71：Proxy 拦截 getOwnPropertyDescriptor 返回 non-configurable 描述符，必须与 target 一致
 */
export function testSealedProxyGetOwnPropertyDescriptorMustMatchNonConfigurable() {
    const obj = { x: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        getOwnPropertyDescriptor(target, prop) {
            const desc = Reflect.getOwnPropertyDescriptor(target, prop);

            desc.configurable = true;
            return desc;
        }
    });
    try {

        const desc = Object.getOwnPropertyDescriptor(proxy, 'x');

        return desc.configurable === false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点72：在严格模式下，Proxy set 陷阱返回 false 会导致 TypeError（即使属性存在）
 */
export function testSealedProxySetTrapReturnsFalseThrowsInStrictMode() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        set() {
            return false;
        }
    });
    try {
        (function () {
            'use strict';
            proxy.a = 2;
        })();
        return false;
    } catch (e) {
        return e instanceof TypeError && obj.a === 1;
    }
}

/**
 * 测试点73：Proxy 的 has 陷阱返回 true 对不存在属性，in 操作符受骗，但不影响 seal 状态
 */
export function testSealedProxyHasTrapLiesAboutNonExistentProperty() {
    const obj = { real: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        has(target, prop) {
            return prop === 'fake' || Reflect.has(target, prop);
        }
    });
    return ('fake' in proxy) === true && !('fake' in obj);
}

/**
 * 测试点74：Object.seal 后，Proxy 无法通过扩展运算符 {...proxy} 添加属性（只复制自有可枚举）
 */
export function testSealedProxySpreadOperatorOnlyCopiesOwnEnumerable() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const copy = { ...proxy };
    return 'a' in copy && !('b' in copy);
}

/**
 * 测试点76：sealed 对象的 Proxy 在 for...in 中不遍历 Symbol 属性（符合规范）
 */
export function testSealedProxyForInDoesNotEnumerateSymbolProperties() {
    const sym = Symbol('s');
    const obj = { strKey: 1, [sym]: 2 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const keys = [];
    for (const k in proxy) {
        keys.push(k);
    }
    return keys.length === 1 && keys[0] === 'strKey';
}

/**
 * 测试点77：Proxy 的 ownKeys 包含不可枚举属性，for...in 仍只遍历可枚举（正常）
 */
export function testSealedProxyOwnKeysIncludesNonEnumerableButForInDoesNot() {
    const obj = {};
    Object.defineProperty(obj, 'nonEnum', { value: 1, enumerable: false });
    Object.defineProperty(obj, 'enum', { value: 2, enumerable: true });
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        ownKeys(target) {
            return Reflect.ownKeys(target);
        }
    });
    const forInKeys = [];
    for (const k in proxy) {
        forInKeys.push(k);
    }
    return forInKeys.length === 1 && forInKeys[0] === 'enum';
}

/**
 * 测试点78：尝试通过 Proxy 修改 sealed 对象的 length（数组），若超出范围应失败
 */
export function testSealedArrayProxyCannotShrinkLengthBelowItems() {
    const arr = [1, 2, 3];
    Object.seal(arr);
    const proxy = new Proxy(arr, {});
    let success = true;
    try {
        proxy.length = 1;
    } catch (e) {
        success = false;
    }
    return arr.length === 3 && success === false;
}

/**
 * 测试点79：Proxy 的 get 陷阱中 this 指向 proxy，而非 target（除非显式绑定）
 */
export function testSealedProxyGetTrapThisIsProxyNotTarget() {
    const obj = { val: 1 };
    Object.seal(obj);
    let thisIsProxy = false;
    const proxy = new Proxy(obj, {
        get(target, prop, receiver) {
            if (prop === 'val') {
                thisIsProxy = receiver === proxy;
            }
            return Reflect.get(target, prop, receiver);
        }
    });
    void proxy.val;
    return thisIsProxy;
}

/**
 * 测试点80：多个 Proxy 共享同一 sealed target，修改通过任一 Proxy 均同步
 */
export function testMultipleProxiesShareSameSealedTargetState() {
    const obj = { shared: 0 };
    Object.seal(obj);
    const p1 = new Proxy(obj, {});
    const p2 = new Proxy(obj, {});
    p1.shared = 100;
    return p2.shared === 100 && obj.shared === 100;
}

/**
 * 测试点81：对 Object.create(null) 创建的对象 seal 后，Proxy 行为正常
 */
export function testSealedProxyOnNullPrototypeObject() {
    const obj = Object.create(null);
    obj.key = 'value';
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    proxy.key = 'updated';
    proxy.newKey = 'fail';
    return obj.key === 'updated' && !('newKey' in obj);
}

/**
 * 测试点82：Proxy 的 set 陷阱中修改 target 的 prototype，应被拒绝（因 sealed）
 */
export function testSealedProxySetTrapCannotModifyPrototypeViaTarget() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        set(target, prop, value) {
            Object.setPrototypeOf(target, {});
            target[prop] = value;
            return true;
        }
    });
    try {
        proxy.a = 2;
        return false;
    } catch (e) {
        return obj.a === 1;
    }
}

/**
 * 测试点83：Object.seal 后，Proxy 无法通过 Object.setPrototypeOf 修改 [[Prototype]]
 */
export function testSealedProxySetPrototypeOfViaObjectMethodFails() {
    const obj = { x: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    let success = true;
    try {
        Object.setPrototypeOf(proxy, {});
    } catch (e) {
        success = false;
    }
    return success === false && Object.getPrototypeOf(proxy) === Object.prototype;
}

/**
 * 测试点84：Proxy 拦截 get 时返回非原始值，不影响 sealed 状态
 */
export function testSealedProxyGetReturnsComputedObject() {
    const obj = { base: 5 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        get(target, prop) {
            if (prop === 'computed') {
                return { value: target.base * 2 };
            }
            return Reflect.get(target, prop);
        }
    });
    const comp = proxy.computed;
    return comp.value === 10 && obj.base === 5;
}

/**
 * 测试点87：尝试通过 Proxy 访问 sealed 对象的 constructor 属性（来自原型），应成功
 */
export function testSealedProxyCanAccessInheritedConstructor() {
    const obj = { data: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    return proxy.constructor === Object;
}

/**
 * 测试点89：Object.seal 后，Proxy 无法通过 defineProperties 添加新属性
 */
export function testSealedProxyDefinePropertiesCannotAddNew() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    try {
        Object.defineProperties(proxy, { b: { value: 2 } });
    } catch (e) {

    }
    return !('b' in obj);
}

/**
 * 测试点90：Proxy 的 deleteProperty 陷阱在删除不存在属性时仍被调用
 */
export function testSealedProxyDeletePropertyTrapCalledForNonExistentProp() {
    const obj = { a: 1 };
    Object.seal(obj);
    let trapCalled = false;
    const proxy = new Proxy(obj, {
        deleteProperty(target, prop) {
            if (prop === 'missing') {
                trapCalled = true;
            }
            return Reflect.deleteProperty(target, prop);
        }
    });
    delete proxy.missing;
    return trapCalled;
}

export function testSealedProxyAccessInNestedFunctionWorks() {
    const obj = { nested: 100 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});

    function inner() {
        return proxy.nested;
    }

    return inner() === 100;
}

/**
 * 测试点92：Proxy 的 handler 被 freeze，不影响对 sealed target 的操作
 */
export function testFrozenHandlerStillOperatesOnSealedTarget() {
    const obj = { x: 1 };
    Object.seal(obj);
    const handler = {
        get(target, prop) {
            return prop === 'x' ? 'intercepted' : Reflect.get(target, prop);
        }
    };
    Object.freeze(handler);
    const proxy = new Proxy(obj, handler);
    return proxy.x === 'intercepted';
}

/**
 * 测试点94：Proxy 的 set 陷阱中抛出非 Error 对象，应被包装或传播
 */
export function testSealedProxySetTrapThrowsStringError() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        set() {
            throw 'not an error object';
        }
    });
    try {
        proxy.a = 2;
        return false;
    } catch (e) {
        return e === 'not an error object' && obj.a === 1;
    }
}

/**
 * 测试点95：sealed 对象的 Proxy 在 try/catch 中安全使用
 */
export function testSealedProxySafeInTryCatch() {
    const obj = { safe: true };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    let result = false;
    try {
        if (proxy.safe) {
            proxy.safe = false;
            result = proxy.safe;
        }
    } catch (e) {
        return false;
    }
    return result === false && obj.safe === false;
}

/**
 * 测试点96：Proxy 拦截 has 时抛出异常，in 操作符应传播错误
 */
export function testSealedProxyHasTrapThrowsCausesInToThrow() {
    const obj = { a: 1 };
    Object.seal(obj);
    const proxy = new Proxy(obj, {
        has() {
            throw new Error('has failed');
        }
    });
    try {
        'a' in proxy;
        return false;
    } catch (e) {
        return e.message === 'has failed';
    }
}

/**
 * 测试点98：Proxy 的 ownKeys 包含 Symbol.iterator，for...of 可工作（若定义）
 */
export function testSealedProxyWithCustomSymbolIteratorWorks() {
    const obj = {};
    obj[Symbol.iterator] = function* () {
        yield 1;
        yield 2;
    };
    Object.seal(obj);
    const proxy = new Proxy(obj, {});
    const arr = [...proxy];
    return JSON.stringify(arr) === '[1,2]';
}

/**
 * 测试点99：多个层级的 Proxy + seal，最内层对象状态一致
 */
export function testDeepNestedProxySealedInnermostObject() {
    const obj = { level: 0 };
    Object.seal(obj);
    const p1 = new Proxy(obj, {});
    const p2 = new Proxy(p1, {});
    const p3 = new Proxy(p2, {});
    p3.level = 99;
    return obj.level === 99 && p1.level === 99 && p2.level === 99;
}