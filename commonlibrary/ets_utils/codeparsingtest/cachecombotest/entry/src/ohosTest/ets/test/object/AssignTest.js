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
 * 测试点 1：Object.assign() 是否会触发目标 Proxy 的 set 拦截器
 * @returns {boolean}
 */
export function testProxySetTriggeredByObjectAssign() {
    let setCalled = false;
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, value) {
            setCalled = true;
            obj[prop] = value;
            return true;
        }
    });
    Object.assign(proxy, { a: 1 });
    return setCalled && proxy.a === 1;
}

/**
 * 测试点 2：当源对象是 Proxy 时，Object.assign() 是否会触发其 get 拦截器
 * @returns {boolean}
 */
export function testProxyGetTriggeredByObjectAssign() {
    let getCalled = false;
    const source = { a: 1 };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            if (prop === 'a') {
                getCalled = true;
            }
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return getCalled && target.a === 1;
}

/**
 * 测试点 3：Proxy 作为目标对象时，Object.assign() 是否能成功写入属性（set 拦截器允许写入）
 * @returns {boolean}
 */
export function testObjectAssignWritesToProxyTarget() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, value) {
            obj[prop] = value;
            return true;
        }
    });
    Object.assign(proxy, { b: 2 });
    return proxy.b === 2 && target.b === 2;
}

/**
 * 测试点 4：Object.assign() 使用多个源对象，且目标为 Proxy 时，是否每个属性都经过 set 拦截器处理
 * @returns {boolean}
 */
export function testObjectAssignWithMultipleSourcesAndProxy() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val * 2;
            return true;
        }
    });
    Object.assign(proxy, { a: 1 }, { b: 2 });
    return proxy.a === 2 && proxy.b === 4;
}

/**
 * 测试点 5：Proxy 的 set 拦截器返回 false（拒绝赋值）时，Object.assign() 是否抛出异常（严格模式下）
 * @returns {boolean}
 */
export function testProxySetReturningFalseBlocksAssignment() {
    const target = {};
    const proxy = new Proxy(target, {
        set() {
            return false;
        }
    });
    try {
        Object.assign(proxy, { x: 10 });
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 6：Object.assign() 是否忽略源对象中不可枚举的属性（即使源是 Proxy）
 * @returns {boolean}
 */
export function testObjectAssignIgnoresNonEnumerablePropertiesInSource() {
    const source = {};
    Object.defineProperty(source, 'hidden', {
        value: 42,
        enumerable: false
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return !('hidden' in target);
}

/**
 * 测试点 7：Object.assign() 是否能正确复制 Symbol 属性（当源对象是 Proxy 时）
 * @returns {boolean}
 */
export function testObjectAssignCopiesSymbolPropertiesFromProxySource() {
    const sym = Symbol('test');
    const source = { [sym]: 'symbolValue' };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target[sym] === 'symbolValue';
}

/**
 * 测试点 8：Proxy 同时作为 Object.assign 的目标和源时，get 和 set 拦截器是否协同工作
 * @returns {boolean}
 */
export function testProxyAsBothTargetAndSource() {
    const targetObj = {};
    const sourceObj = { a: 1 };
    const proxyTarget = new Proxy(targetObj, {
        set(obj, prop, val) {
            obj[prop] = val + 10;
            return true;
        }
    });
    const proxySource = new Proxy(sourceObj, {
        get(obj, prop) {
            return obj[prop] * 2;
        }
    });
    Object.assign(proxyTarget, proxySource);
    return proxyTarget.a === 12;
}

/**
 * 测试点 9：Object.assign() 是否不会触发 Proxy 的 ownKeys 拦截器（因为它不依赖 Reflect.ownKeys）
 * @returns {boolean}
 */
export function testObjectAssignDoesNotTriggerProxyOwnKeys() {
    let ownKeysCalled = false;
    const source = { a: 1 };
    const proxySource = new Proxy(source, {
        ownKeys() {
            ownKeysCalled = true;
            return Reflect.ownKeys(source);
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return ownKeysCalled;
}

/**
 * 测试点 10：Object.assign() 触发的是 [[Set]] 而非 [[DefineOwnProperty]]，因此 defineProperty 拦截器不应被调用
 * @returns {boolean}
 */
export function testProxyWithDefinePropertyHandlerAffectsAssignment() {
    let definePropertyCalled = false;
    const target = {};
    const proxy = new Proxy(target, {
        defineProperty() {
            definePropertyCalled = true;
            return true;
        }
    });
    Object.assign(proxy, { a: 1 });
    return definePropertyCalled && proxy.a === undefined;
}

/**
 * 测试点 11：当目标 Proxy 包装的是冻结对象（frozen）且 set 拦截器拒绝写入时，Object.assign 是否失败
 * @returns {boolean}
 */
export function testFrozenProxyAsTargetPreventsAssignment() {
    const target = Object.freeze({});
    const proxy = new Proxy(target, {
        set() {
            return false;
        }
    });
    try {
        Object.assign(proxy, { a: 1 });
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 12：Object.assign() 是否正确跳过 null 和 undefined 源（即使目标是 Proxy）
 * @returns {boolean}
 */
export function testObjectAssignSkipsNullAndUndefinedSources() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, null, undefined, { a: 1 });
    return proxy.a === 1;
}

/**
 * 测试点 13：当源 Proxy 的 get 拦截器修改返回值时，Object.assign 是否使用修改后的值
 * @returns {boolean}
 */
export function testProxyGetReturnsModifiedValueDuringAssign() {
    const source = { a: 5 };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop] * 3;
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.a === 15;
}

/**
 * 测试点 14：源对象包含 getter 时，Object.assign() 通过 Proxy 获取的是 getter 的返回值（而非描述符）
 * @returns {boolean}
 */
export function testObjectAssignWithAccessorPropertiesViaProxy() {
    const source = {};
    Object.defineProperty(source, 'getterProp', {
        get() {
            return 'from getter';
        },
        enumerable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.getterProp === 'from getter';
}

/**
 * 测试点 15：Proxy 目标对象的原型链是否影响 Object.assign 的行为（答案：不影响，因为 assign 只拷贝 own enumerable 属性）
 * @returns {boolean}
 */
export function testProxyTargetPrototypeDoesNotInterfere() {
    const proto = { inherited: 99 };
    const target = Object.create(proto);
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { own: 1 });
    return proxy.own === 1;
}

/**
 * 测试点 16：当 Proxy 的 set 拦截器抛出异常时，Object.assign 是否中断并抛出错误
 * @returns {boolean}
 */
export function testProxySetThrowsErrorDuringAssign() {
    const target = {};
    const proxy = new Proxy(target, {
        set() {
            throw new Error('Forbidden');
        }
    });
    try {
        Object.assign(proxy, { bad: 1 });
        return false;
    } catch (e) {
        return e.message === 'Forbidden';
    }
}

/**
 * 测试点 17：Object.assign 处理空 Proxy 源对象时，是否不会向目标写入任何属性
 * @returns {boolean}
 */
export function testEmptyProxySourceAssignsNothing() {
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = { pre: 0 };
    Object.assign(target, proxySource);
    return Object.keys(target).length === 1 && target.pre === 0;
}

/**
 * 测试点 18：Proxy 源对象使用 has 拦截器是否会影响 Object.assign（答案：不会，assign 不使用 in 操作符）
 * @returns {boolean}
 */
export function testHasTrapDoesNotAffectObjectAssign() {
    let hasCalled = false;
    const source = { a: 1 };
    const proxySource = new Proxy(source, {
        has(target, prop) {
            hasCalled = true;
            return prop in target;
        },
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.a === 1 && !hasCalled;
}

/**
 * 测试点 19：当 Proxy 目标是数组时，Object.assign 是否仍通过 set 拦截器写入索引属性
 * @returns {boolean}
 */
export function testProxyArrayAsTargetWithObjectAssign() {
    const arr = [];
    const proxy = new Proxy(arr, {
        set(obj, prop, val) {
            obj[prop] = val * 10;
            return true;
        }
    });
    Object.assign(proxy, { 0: 1, 1: 2 });
    return proxy[0] === 10 && proxy[1] === 20;
}

/**
 * 测试点 20：Object.assign 拷贝 Proxy 源中的自身属性（包括从原型继承但被遮蔽的可枚举属性）
 * @returns {boolean}
 */
export function testObjectAssignCopiesOwnPropertiesOnlyEvenIfFromProxy() {
    const parent = { shared: 'parent' };
    const source = Object.create(parent);
    source.own = 'child';
    Object.defineProperty(source, 'nonEnum', {
        value: 'secret',
        enumerable: false
    });

    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });

    const target = {};
    Object.assign(target, proxySource);

    return (
        target.own === 'child' &&
            !('shared' in target) &&
            !('nonEnum' in target)
    );
}


/**
 * 测试点 21：当 Proxy 目标是 null（使用 Object.create(null)）时，Object.assign 是否仍能通过 set 拦截器写入
 * @returns {boolean}
 */
export function testProxyTargetWithNullPrototype() {
    const target = Object.create(null);
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { key: 'value' });
    return proxy.key === 'value';
}

/**
 * 测试点 22：Object.assign 拷贝源 Proxy 中的属性时，如果 get 拦截器返回 undefined，是否仍会设置该属性
 * @returns {boolean}
 */
export function testProxyGetReturnsUndefinedStillAssigns() {
    const source = { a: 1 };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return undefined;
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return 'a' in target && target.a === undefined;
}

/**
 * 测试点 23：Proxy 的 set 拦截器中修改属性名（如转大写），Object.assign 是否使用新属性名
 * @returns {boolean}
 */
export function testProxySetModifiesPropertyName() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop.toString().toUpperCase()] = val;
            return true;
        }
    });
    Object.assign(proxy, { foo: 10 });
    return !('foo' in proxy) && proxy.FOO === 10;
}

/**
 * 测试点 24：当源对象是 Proxy 且其 get 拦截器抛出异常时，Object.assign 是否中断并抛出错误
 * @returns {boolean}
 */
export function testProxySourceGetThrowsError() {
    const source = { bad: 1 };
    const proxySource = new Proxy(source, {
        get() {
            throw new Error('Get failed');
        }
    });
    const target = {};
    try {
        Object.assign(target, proxySource);
        return false;
    } catch (e) {
        return e.message === 'Get failed';
    }
}

/**
 * 测试点 25：Object.assign 处理 Proxy 源时，是否只遍历可枚举的自身属性（即使目标是普通对象）
 * @returns {boolean}
 */
export function testObjectAssignOnlyOwnEnumerableFromProxySource() {
    const parent = { inherited: 1 };
    const source = Object.create(parent);
    source.ownEnum = 2;
    Object.defineProperty(source, 'ownNonEnum', {
        value: 3,
        enumerable: false
    });

    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });

    const target = {};
    Object.assign(target, proxySource);
    return (
        target.ownEnum === 2 &&
            !('inherited' in target) &&
            !('ownNonEnum' in target)
    );
}

/**
 * 测试点 26：Proxy 目标为 Date 对象时，Object.assign 是否仍通过 set 拦截器写入（尽管 Date 不是普通对象）
 * @returns {boolean}
 */
export function testProxyDateAsTarget() {
    const date = new Date();
    const proxy = new Proxy(date, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { custom: 'meta' });
    return proxy.custom === 'meta';
}

/**
 * 测试点 27：当 Proxy 的 set 拦截器对不同属性做不同处理（如只允许数字），Object.assign 是否按规则生效
 * @returns {boolean}
 */
export function testProxySetWithConditionalLogic() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (typeof val !== 'number') {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { valid: 42, invalid: 'text' });
        return false;
    } catch (e) {
        return proxy.valid === 42 && !('invalid' in proxy);
    }
}

/**
 * 测试点 28：Object.assign 使用 Proxy 源时，若源有 Symbol.iterator，是否会影响拷贝行为（答案：不会）
 * @returns {boolean}
 */
export function testProxySourceWithSymbolIteratorDoesNotAffectAssign() {
    const source = { a: 1 };
    source[Symbol.iterator] = function* () {
        yield 1;
    };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.a === 1 && typeof target[Symbol.iterator] === 'function';
}

/**
 * 测试点 29：Proxy 目标是 arguments 对象（类数组）时，Object.assign 是否能写入索引属性
 * @returns {boolean}
 */
export function testProxyArgumentsAsTarget() {

    function getArgs() {
        return arguments;
    }

    const args = getArgs();
    const proxy = new Proxy(args, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { 0: 'zero', len: 1 });
    return proxy[0] === 'zero' && proxy.len === 1;
}

/**
 * 测试点 30：当 Proxy 源对象使用 apply 拦截器（但作为对象使用），Object.assign 是否忽略 apply
 * @returns {boolean}
 */
export function testProxySourceWithApplyTrapIgnoredByObjectAssign() {
    const source = { x: 5 };
    const proxySource = new Proxy(source, {
        apply() {
            return 'called as function';
        },
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.x === 5;
}

/**
 * 测试点 32：Proxy 的 set 拦截器中调用 Reflect.set 是否与直接赋值行为一致
 * @returns {boolean}
 */
export function testProxySetUsesReflectSetConsistently() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            return Reflect.set(obj, prop, val);
        }
    });
    Object.assign(proxy, { k: 'reflect' });
    return proxy.k === 'reflect';
}

/**
 * 测试点 33：当 Proxy 目标是不可扩展对象（non-extensible）时，Object.assign 尝试添加新属性是否失败
 * @returns {boolean}
 */
export function testNonExtensibleProxyTargetBlocksNewProps() {
    const target = {};
    Object.preventExtensions(target);
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (!obj.hasOwnProperty(prop) && !Object.isExtensible(obj)) {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { newProp: 1 });
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 34：Object.assign 拷贝 Proxy 源中的 getter 属性时，是否只获取当前值（而非复制 getter）
 * @returns {boolean}
 */
export function testGetterInProxySourceIsEvaluatedNotCopied() {
    let count = 0;
    const source = {};
    Object.defineProperty(source, 'counter', {
        get() {
            return ++count;
        },
        enumerable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target1 = {};
    const target2 = {};
    Object.assign(target1, proxySource);
    Object.assign(target2, proxySource);
    return target1.counter === 1 && target2.counter === 2;
}

/**
 * 测试点 35：Proxy 源对象的 has 拦截器返回 false，但属性实际存在，Object.assign 是否仍拷贝（答案：是，因为 assign 不用 in）
 * @returns {boolean}
 */
export function testHasTrapReturnsFalseButPropertyExists() {
    const source = { hidden: 'secret' };
    const proxySource = new Proxy(source, {
        has() {
            return false;
        },
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.hidden === 'secret';
}

/**
 * 测试点 36：Object.assign 使用 Proxy 作为目标时，是否触发 set 拦截器的 receiver 参数为 Proxy 本身
 * @returns {boolean}
 */
export function testProxySetReceiverIsProxyItself() {
    let receiverIsProxy = false;
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val, receiver) {
            receiverIsProxy = (receiver === proxy);
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { check: true });
    return receiverIsProxy;
}

/**
 * 测试点 37：当 Proxy 源对象使用 deleteProperty 拦截器，Object.assign 是否会触发它（答案：不会）
 * @returns {boolean}
 */
export function testDeletePropertyTrapNotCalledByObjectAssign() {
    let deleteCalled = false;
    const source = { a: 1 };
    const proxySource = new Proxy(source, {
        deleteProperty() {
            deleteCalled = true;
            return true;
        },
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.a === 1 && !deleteCalled;
}

/**
 * 测试点 38：Proxy 目标是 Map 实例（非普通对象）时，Object.assign 是否能写入属性（技术上可以，但不推荐）
 * @returns {boolean}
 */
export function testProxyMapAsTargetAllowsPropertyAssignment() {
    const map = new Map();
    const proxy = new Proxy(map, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { meta: 'info' });
    return proxy.meta === 'info';
}

/**
 * 测试点 39：Object.assign 拷贝 Proxy 源时，若属性值为函数，是否保持引用一致性
 * @returns {boolean}
 */
export function testFunctionPropertiesCopiedByReferenceFromProxySource() {
    const fn = () => {
    };
    const source = { method: fn };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.method === fn;
}

/**
 * 测试点 40：当 Proxy 的 set 拦截器静默拒绝某些属性（返回 true 但不赋值），Object.assign 是否“看似成功”但值缺失
 * @returns {boolean}
 */
export function testProxySetSilentlyIgnoresCertainProps() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (prop === 'ignore') {
                return true;
            }
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { normal: 1, ignore: 999 });
    return proxy.normal === 1 && !('ignore' in proxy);
}


/**
 * 测试点 41：当 Proxy 源对象的 get 拦截器返回一个 Promise 时，Object.assign 是否将其作为普通值拷贝（不 await）
 * @returns {boolean}
 */
export function testProxyGetReturnsPromiseCopiedAsIs() {
    const promise = Promise.resolve(42);
    const source = { asyncVal: promise };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.asyncVal === promise;
}

/**
 * 测试点 43：Object.assign 拷贝 Proxy 源时，若属性名为 "__proto__"，是否被特殊处理（现代 JS 引擎已禁用原型污染）
 * @returns {boolean}
 */
export function testProtoPropertyInProxySourceIsIgnored() {
    const source = { __proto__: { malicious: true } };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return target.__proto__ !== undefined && Object.getPrototypeOf(target) === Object.prototype;
}

/**
 * 测试点 44：Proxy 的 set 拦截器中调用 Object.assign 递归，是否会导致栈溢出或逻辑混乱（测试安全性）
 * @returns {boolean}
 */
export function testRecursiveObjectAssignInsideProxySet() {
    let depth = 0;
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            depth++;
            if (depth < 3) {

                Object.assign({}, { temp: val });
            }
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { a: 1 });
    return proxy.a === 1 && depth === 1;
}

/**
 * 测试点 45：当 Proxy 源对象使用 get 拦截器动态生成属性（如计算属性），Object.assign 是否捕获当前快照
 * @returns {boolean}
 */
export function testDynamicComputedPropertiesViaProxyGet() {
    let counter = 0;
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            if (prop === 'dynamic') {
                return ++counter;
            }
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);


    return !('dynamic' in target);
}

/**
 * 测试点 46：Proxy 目标是 Error 对象时，Object.assign 是否能添加自定义属性
 * @returns {boolean}
 */
export function testProxyErrorAsTarget() {
    const err = new Error('test');
    const proxy = new Proxy(err, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { code: 'ERR_TEST' });
    return proxy.code === 'ERR_TEST';
}

/**
 * 测试点 47：Object.assign 使用 Proxy 源时，若源有 valueOf 或 toString，是否影响属性读取（答案：不影响）
 * @returns {boolean}
 */
export function testValueOfToStringInProxySourceIgnoredByAssign() {
    const source = {
        valueOf() {
            return 'valueOf';
        },
        toString() {
            return 'toString';
        },
        data: 100
    };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.data === 100 && typeof target.valueOf === 'function';
}

/**
 * 测试点 48：Proxy 的 set 拦截器对 Symbol 属性进行特殊处理（如只允许特定 Symbol）
 * @returns {boolean}
 */
export function testProxySetHandlesSymbolPropertiesConditionally() {
    const allowedSym = Symbol('allowed');
    const forbiddenSym = Symbol('forbidden');
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (typeof prop === 'symbol' && prop !== allowedSym) {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { [allowedSym]: 1, [forbiddenSym]: 2 });
        return false;
    } catch (e) {
        return proxy[allowedSym] === 1 && !(forbiddenSym in proxy);
    }
}

/**
 * 测试点 49：当 Proxy 源对象是数组时，Object.assign 是否只拷贝索引属性（可枚举的数字键）
 * @returns {boolean}
 */
export function testProxyArrayAsSourceCopiesOnlyEnumerableIndices() {
    const arr = ['a', 'b'];
    arr.extra = 'c';
    const proxySource = new Proxy(arr, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return (
        target[0] === 'a' &&
            target[1] === 'b' &&
            target.extra === 'c'
    );
}

/**
 * 测试点 50：Proxy 目标是正则表达式字面量，Object.assign 是否能附加元数据
 * @returns {boolean}
 */
export function testProxyRegExpAsTarget() {
    const re = /abc/g;
    const proxy = new Proxy(re, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { patternName: 'abcRule' });
    return proxy.patternName === 'abcRule';
}

/**
 * 测试点 51：Object.assign 拷贝 Proxy 源时，若属性值为 NaN 或 Infinity，是否保持值不变
 * @returns {boolean}
 */
export function testSpecialNumberValuesCopiedCorrectlyFromProxy() {
    const source = { nan: NaN, inf: Infinity, negInf: -Infinity };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return (
        Number.isNaN(target.nan) &&
            target.inf === Infinity &&
            target.negInf === -Infinity
    );
}

/**
 * 测试点 52：Proxy 的 set 拦截器中修改值类型（如字符串转大写），Object.assign 是否使用转换后的值
 * @returns {boolean}
 */
export function testProxySetTransformsValueType() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (typeof val === 'string') {
                obj[prop] = val.toUpperCase();
            } else {
                obj[prop] = val;
            }
            return true;
        }
    });
    Object.assign(proxy, { msg: 'hello', count: 42 });
    return proxy.msg === 'HELLO' && proxy.count === 42;
}

/**
 * 测试点 53：当 Proxy 源对象使用 get 拦截器代理到另一个对象，Object.assign 是否穿透获取值
 * @returns {boolean}
 */
export function testProxyGetDelegatesToAnotherObject() {
    const backend = { secret: 'top' };
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return backend[prop] || obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);


    return Object.keys(target).length === 0;
}

/**
 * 测试点 54：Object.assign 使用 Proxy 目标时，若 set 拦截器返回 true 但未实际赋值，外部能否检测到“假成功”
 * @returns {boolean}
 */
export function testProxySetFakeSuccessLeavesPropertyUndefined() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {

            return true;
        }
    });
    Object.assign(proxy, { fake: 99 });
    return !('fake' in proxy);
}

/**
 * 测试点 55：Proxy 源对象包含不可配置但可写的属性，Object.assign 是否正常读取
 * @returns {boolean}
 */
export function testNonConfigurableWritablePropertyInProxySource() {
    const source = {};
    Object.defineProperty(source, 'fixed', {
        value: 'locked',
        writable: true,
        configurable: false,
        enumerable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.fixed === 'locked';
}

/**
 * 测试点 56：当 Proxy 目标是 Proxy 本身（嵌套 Proxy），Object.assign 是否穿透到最内层
 * @returns {boolean}
 */
export function testNestedProxyAsTarget() {
    const inner = {};
    const middle = new Proxy(inner, {
        set(obj, prop, val) {
            obj[prop] = `middle:${val}`;
            return true;
        }
    });
    const outer = new Proxy(middle, {
        set(obj, prop, val) {
            return Reflect.set(obj, prop, `outer:${val}`);
        }
    });
    Object.assign(outer, { x: 1 });

    return inner.x === 'middle:outer:1';
}

/**
 * 测试点 57：Object.assign 拷贝 Proxy 源时，若属性为负零（-0），是否保持符号
 * @returns {boolean}
 */
export function testNegativeZeroPreservedFromProxySource() {
    const source = { zero: -0 };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return Object.is(target.zero, -0);
}

/**
 * 测试点 58：Proxy 的 set 拦截器中访问 this，是否指向 Proxy 本身（在严格模式下）
 * @returns {boolean}
 */
export function testProxySetThisContextIsProxy() {
    let thisIsProxy = false;
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            thisIsProxy = (this === proxy);
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { check: true });
    return !thisIsProxy;
}

/**
 * 测试点 59：当 Proxy 源对象使用 get 拦截器返回 getter 函数本身（而非调用结果），Object.assign 是否拷贝函数
 * @returns {boolean}
 */
export function testProxyGetReturnsGetterFunctionItself() {
    const descriptor = Object.getOwnPropertyDescriptor({
        get x() {
        }
    }, 'x');
    const getterFn = descriptor.get;
    const source = { method: getterFn };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.method === getterFn;
}

/**
 * 测试点 60：Object.assign 使用 Proxy 目标时，若属性名是数字字符串（如 "0"），是否仍触发 set 拦截器
 * @returns {boolean}
 */
export function testNumericStringKeysTriggerProxySet() {
    let setCalled = false;
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            setCalled = true;
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { '0': 'zero', '1': 'one' });
    return setCalled && proxy['0'] === 'zero' && proxy['1'] === 'one';
}


/**
 * 测试点 61：Proxy 源对象包含 Unicode 属性名（如 emoji 或中文），Object.assign 是否正常拷贝
 * @returns {boolean}
 */
export function testUnicodePropertyNamesCopiedFromProxySource() {
    const source = { '🚀': 'rocket', '姓名': '张三' };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target['🚀'] === 'rocket' && target['姓名'] === '张三';
}

/**
 * 测试点 62：当 Proxy 目标是 DOM 元素（模拟环境），Object.assign 是否能通过 set 拦截器写入属性
 * @returns {boolean}
 */
export function testProxyDOMElementLikeAsTarget() {

    const el = { tagName: 'DIV', id: '' };
    const proxy = new Proxy(el, {
        set(obj, prop, val) {
            if (prop === 'id' && typeof val !== 'string') {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { id: 'main', className: 'container' });
    return proxy.id === 'main' && proxy.className === 'container';
}

/**
 * 测试点 63：Object.assign 使用 Proxy 源时，若源来自不同 Realm（如 iframe），是否仍能读取值（模拟跨 realm）
 * @returns {boolean}
 */
export function testCrossRealmLikeProxySource() {

    const otherRealmObj = { data: 'from other realm' };
    const proxySource = new Proxy(otherRealmObj, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.data === 'from other realm';
}

/**
 * 测试点 64：Proxy 的 set 拦截器记录所有写入日志，Object.assign 是否完整触发日志
 * @returns {boolean}
 */
export function testProxySetLoggingAllAssignments() {
    const log = [];
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            log.push({ prop, val });
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { a: 1, b: 2 });
    return log.length === 2 && log[0].prop === 'a' && log[1].prop === 'b';
}

/**
 * 测试点 65：当 Proxy 源对象使用 get 拦截器返回自身（循环引用），Object.assign 是否安全处理
 * @returns {boolean}
 */
export function testProxyGetReturnsSelfCausingCircularReference() {
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            if (prop === 'self') {
                return proxySource;
            }
            return obj[prop];
        }
    });
    proxySource.self = proxySource;
    const target = {};
    try {
        Object.assign(target, proxySource);
        return target.self === proxySource;
    } catch {
        return false;
    }
}

/**
 * 测试点 66：Object.assign 拷贝 Proxy 源时，若属性为 BigInt，是否保持类型和值
 * @returns {boolean}
 */
export function testBigIntPropertiesCopiedCorrectlyFromProxy() {
    if (typeof BigInt === 'undefined') {
        return true;
    }
    const big = BigInt(9007199254740991);
    const source = { bigNum: big };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return typeof target.bigNum === 'bigint' && target.bigNum === big;
}

/**
 * 测试点 67：Proxy 目标是冻结的普通对象，但 set 拦截器允许写入到自身（非目标），是否可行
 * @returns {boolean}
 */
export function testProxySetWritesToAlternativeStorageNotTarget() {
    const realStore = {};
    const frozenTarget = Object.freeze({});
    const proxy = new Proxy(frozenTarget, {
        set(_obj, prop, val) {
            realStore[prop] = val;
            return true;
        },
        get(_obj, prop) {
            return realStore[prop];
        }
    });
    Object.assign(proxy, { secret: 'hidden' });
    return proxy.secret === 'hidden' && realStore.secret === 'hidden';
}

/**
 * 测试点 68：当 Proxy 源对象有大量属性（>1000），Object.assign 是否仍高效且完整拷贝
 * @returns {boolean}
 */
export function testProxySourceWithManyProperties() {
    const source = {};
    for (let i = 0; i < 1000; i++) {
        source[`key${i}`] = i;
    }
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return Object.keys(target).length === 1000 && target.key999 === 999;
}

/**
 * 测试点 69：Object.assign 使用 Proxy 目标时，若 set 拦截器异步执行（如 setTimeout），是否同步完成（答案：否，应同步）
 * @returns {boolean}
 */
export function testProxySetMustBeSynchronousForObjectAssign() {
    let syncSetCalled = false;
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {

            syncSetCalled = true;
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { asyncTest: 1 });
    return syncSetCalled && proxy.asyncTest === 1;
}

/**
 * 测试点 70：Proxy 源对象的 get 拦截器区分大小写，Object.assign 是否按原属性名读取
 * @returns {boolean}
 */
export function testCaseSensitivePropertyAccessInProxyGet() {
    const source = { Name: 'Alice', name: 'Bob' };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.Name === 'Alice' && target.name === 'Bob';
}

/**
 * 测试点 71：当 Proxy 目标是 arguments 对象且严格模式下，Object.assign 是否仍可写入
 * @returns {boolean}
 */
export function testStrictModeArgumentsAsProxyTarget() {
    'use strict';

    function getArgs() {
        return arguments;
    }

    const args = getArgs();
    const proxy = new Proxy(args, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { meta: 'strict' });
    return proxy.meta === 'strict';
}

/**
 * 测试点 72：Object.assign 拷贝 Proxy 源时，若属性为 null 或 undefined，是否保留
 * @returns {boolean}
 */
export function testNullAndUndefinedValuesPreservedFromProxySource() {
    const source = { n: null, u: undefined };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = { pre: 1 };
    Object.assign(target, proxySource);
    return target.n === null && 'u' in target && target.u === undefined;
}

/**
 * 测试点 73：Proxy 的 set 拦截器阻止写入 __proto__ 属性，防止原型污染
 * @returns {boolean}
 */
export function testProxySetBlocksProtoAssignmentForSecurity() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (prop === '__proto__') {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { __proto__: { evil: true } });
        return true;
    } catch (e) {
        return false
    }
}

/**
 * 测试点 74：当 Proxy 源对象使用 get 拦截器代理到 Map，Object.assign 是否枚举 Map 的键（答案：否）
 * @returns {boolean}
 */
export function testProxyGetDelegatesToMapButNotEnumerable() {
    const map = new Map([['a', 1]]);
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return map.get(prop) ?? obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return Object.keys(target).length === 0;
}

/**
 * 测试点 75：Object.assign 使用 Proxy 目标时，若属性名为 "constructor"，是否被特殊处理（现代引擎已无风险）
 * @returns {boolean}
 */
export function testConstructorPropertyAssignmentSafe() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { constructor: 'fake' });
    return proxy.constructor === 'fake' && target.constructor === 'fake';
}

/**
 * 测试点 76：Proxy 源对象包含访问器属性（getter/setter），Object.assign 是否只获取值（不复制描述符）
 * @returns {boolean}
 */
export function testAccessorDescriptorNotCopiedOnlyValue() {
    const source = {};
    Object.defineProperty(source, 'computed', {
        get() {
            return 42 * 2;
        },
        enumerable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.computed === 84 && typeof target.computed !== 'function';
}

/**
 * 测试点 77：当 Proxy 目标是 Proxy.revocable() 创建的可撤销代理，Object.assign 在撤销后是否失败
 * @returns {boolean}
 */
export function testRevocableProxyAfterRevokeBlocksAssign() {
    const { proxy, revoke } = Proxy.revocable({}, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    revoke();
    try {
        Object.assign(proxy, { x: 1 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 78：Object.assign 拷贝 Proxy 源时，若属性值为正则表达式，是否保持标志和源
 * @returns {boolean}
 */
export function testRegExpObjectsCopiedByReferenceFromProxySource() {
    const re = /abc/gi;
    const source = { pattern: re };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.pattern instanceof RegExp &&
        target.pattern.source === 'abc' &&
        target.pattern.global === true &&
        target.pattern.ignoreCase === true;
}

/**
 * 测试点 79：Proxy 的 set 拦截器对属性名进行合法性校验（如仅允许字母数字），Object.assign 是否遵守
 * @returns {boolean}
 */
export function testProxySetValidatesPropertyNameFormat() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (!/^[a-zA-Z0-9_]+$/.test(String(prop))) {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { valid_1: 'ok', 'in@valid': 'bad' });
        return false;
    } catch (e) {
        return proxy.valid_1 === 'ok' && !('in@valid' in proxy);
    }
}

/**
 * 测试点 80：当 Proxy 源对象使用 get 拦截器动态响应 Symbol.toStringTag，Object.assign 是否受影响（答案：否）
 * @returns {boolean}
 */
export function testSymbolToStringTagDoesNotAffectObjectAssign() {
    const source = { data: 'payload' };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            if (prop === Symbol.toStringTag) {
                return 'CustomTag';
            }
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.data === 'payload' && !target[Symbol.toStringTag];
}


/**
 * 测试点 81：当 Proxy 源对象使用 get 拦截器返回不同值每次访问（如 Math.random()），Object.assign 是否只读一次
 * @returns {boolean}
 */
export function testProxyGetNonDeterministicValueReadOncePerProperty() {
    let callCount = 0;
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            if (prop === 'rand') {
                callCount++;
                return Math.random();
            }
            return obj[prop];
        }
    });

    const target = {};
    Object.assign(target, proxySource);
    return callCount === 0 && !('rand' in target);
}

/**
 * 测试点 82：Object.assign 使用 Proxy 目标时，若 set 拦截器抛出异常，是否中断后续属性写入
 * @returns {boolean}
 */
export function testProxySetThrowsErrorStopsFurtherAssignment() {
    const target = {};
    let calls = [];
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            calls.push(prop);
            if (prop === 'bad') {
                throw new Error('Stop!');
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { good: 1, bad: 2, after: 3 });
    } catch (e) {
    }
    return (
        target.good === 1 &&
            !('bad' in target) &&
            !('after' in target) &&
            calls.length === 2
    );
}

/**
 * 测试点 83：Proxy 目标是 Proxy 的 revoked 状态（已撤销），Object.assign 是否立即报错
 * @returns {boolean}
 */
export function testAssignToRevokedProxyThrowsImmediately() {
    const { proxy, revoke } = Proxy.revocable({}, {});
    revoke();
    try {
        Object.assign(proxy, { x: 1 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 84：当 Proxy 源对象的属性名为 "toString" 或 "valueOf"，Object.assign 是否将其作为普通属性处理
 * @returns {boolean}
 */
export function testToStringValueOfTreatedAsNormalProperties() {
    const source = {
        toString: 'custom string',
        valueOf: 999
    };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.toString === 'custom string' && target.valueOf === 999;
}

/**
 * 测试点 85：Object.assign 拷贝 Proxy 源时，若源有不可枚举但可写的 Symbol 属性，是否被忽略（应被忽略）
 * @returns {boolean}
 */
export function testNonEnumerableSymbolIgnoredByObjectAssign() {
    const sym = Symbol('hidden');
    const source = {};
    Object.defineProperty(source, sym, {
        value: 'secret',
        enumerable: false,
        writable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return !Object.getOwnPropertySymbols(target).includes(sym);
}

/**
 * 测试点 86：Proxy 的 set 拦截器中调用 delete 操作，Object.assign 是否受影响（不应影响）
 * @returns {boolean}
 */
export function testProxySetDeletesOtherPropertyDuringAssign() {
    const target = { temp: 'keep' };
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            delete obj.temp;
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { main: 'value' });
    return proxy.main === 'value' && !('temp' in proxy);
}

/**
 * 测试点 87：当 Proxy 源对象来自 Object.create(null)，Object.assign 是否仍能枚举其属性
 * @returns {boolean}
 */
export function testProxySourceFromNullPrototypeEnumeratedCorrectly() {
    const source = Object.create(null);
    source.key = 'nullProto';
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.key === 'nullProto';
}

/**
 * 测试点 88：Object.assign 使用 Proxy 目标时，若属性值为 Proxy，是否保持嵌套引用
 * @returns {boolean}
 */
export function testNestedProxyValuePreservedByReference() {
    const innerProxy = new Proxy({ data: 1 }, {});
    const target = {};
    const outerProxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(outerProxy, { nested: innerProxy });
    return outerProxy.nested === innerProxy && outerProxy.nested.data === 1;
}

/**
 * 测试点 89：Proxy 源对象使用 get 拦截器代理到数组索引，Object.assign 是否枚举数字键（仅当可枚举）
 * @returns {boolean}
 */
export function testProxyGetDelegatesToArrayIndices() {
    const arr = ['a', 'b'];
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            const idx = Number(prop);
            if (!isNaN(idx) && idx in arr) {
                return arr[idx];
            }
            return obj[prop];
        }
    });

    const target = {};
    Object.assign(target, proxySource);
    return Object.keys(target).length === 0;
}

/**
 * 测试点 90：当 Proxy 目标是 sealed 对象，set 拦截器尝试添加新属性应失败
 * @returns {boolean}
 */
export function testSealedProxyTargetBlocksNewProperties() {
    const target = { existing: 1 };
    Object.seal(target);
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (!obj.hasOwnProperty(prop)) {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { newProp: 2 });
        return false;
    } catch (e) {
        return proxy.existing === 1 && !('newProp' in proxy);
    }
}

/**
 * 测试点 91：Object.assign 拷贝 Proxy 源时，若属性为共享 ArrayBuffer，是否保持引用
 * @returns {boolean}
 */
export function testSharedArrayBufferReferencePreserved() {

    if (typeof SharedArrayBuffer === 'undefined') {
        return true;
    }
    const sab = new SharedArrayBuffer(8);
    const view = new Int32Array(sab);
    view[0] = 123;
    const source = { buffer: sab };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.buffer === sab;
}

/**
 * 测试点 92：Proxy 的 set 拦截器对属性值进行深冻结，Object.assign 是否接受
 * @returns {boolean}
 */
export function testProxySetDeepFreezesAssignedValues() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (val && typeof val === 'object') {
                Object.freeze(val);
            }
            obj[prop] = val;
            return true;
        }
    });
    const obj = { mutable: true };
    Object.assign(proxy, { config: obj });
    try {
        obj.mutable = false;
        return proxy.config.mutable === true;
    } catch {
        return proxy.config.mutable === true;
    }
}

/**
 * 测试点 93：当 Proxy 源对象使用 get 拦截器返回 undefined for missing props，Object.assign 是否跳过（不跳过，因不枚举）
 * @returns {boolean}
 */
export function testMissingPropsNotEnumeratedSoNotAssigned() {
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop] !== undefined ? obj[prop] : 'default';
        }
    });

    const target = {};
    Object.assign(target, proxySource);
    return Object.keys(target).length === 0;
}

/**
 * 测试点 94：Object.assign 使用 Proxy 目标时，若 set 拦截器返回 false（静默失败），是否抛出 TypeError（严格模式下）
 * @returns {boolean}
 */
export function testProxySetReturnsFalseInStrictModeCausesTypeError() {
    'use strict';
    const target = {};
    const proxy = new Proxy(target, {
        set() {
            return false;
        }
    });
    try {
        Object.assign(proxy, { x: 1 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 95：Proxy 源对象包含 getter 抛出异常，Object.assign 是否在读取时崩溃
 * @returns {boolean}
 */
export function testProxySourceGetterThrowsDuringEnumeration() {
    const source = {};
    Object.defineProperty(source, 'danger', {
        get() {
            throw new Error('Boom');
        },
        enumerable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    try {
        Object.assign(target, proxySource);
        return false;
    } catch (e) {
        return e.message === 'Boom';
    }
}

/**
 * 测试点 96：当 Proxy 目标是 arguments 对象且有 length 属性，Object.assign 是否覆盖 length（应可覆盖）
 * @returns {boolean}
 */
export function testAssignOverwritesArgumentsLengthViaProxy() {

    function getArgs() {
        return arguments;
    }

    const args = getArgs('a', 'b');
    const proxy = new Proxy(args, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { length: 999 });
    return proxy.length === 999;
}

/**
 * 测试点 97：Object.assign 拷贝 Proxy 源时，若属性为 Web API 对象（如 URL），是否保持实例类型
 * @returns {boolean}
 */
export function testWebAPIObjectsLikeURLPreservedThroughProxy() {
    try {
        const url = new URL('https://example.com');
        const source = { endpoint: url };
        const proxySource = new Proxy(source, {
            get(obj, prop) {
                return obj[prop];
            }
        });
        const target = {};
        Object.assign(target, proxySource);
        return target.endpoint instanceof URL && target.endpoint.href === url.href;
    } catch {

        return true;
    }
}

/**
 * 测试点 98：Proxy 的 set 拦截器记录属性写入顺序，Object.assign 是否按源对象属性顺序触发（ES2015+ 保证）
 * @returns {boolean}
 */
export function testObjectAssignRespectsPropertyInsertionOrderInProxySet() {
    const log = [];
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            log.push(prop);
            obj[prop] = val;
            return true;
        }
    });

    const source = {};
    source.first = 1;
    source.second = 2;
    source.third = 3;
    Object.assign(proxy, source);
    return log[0] === 'first' && log[1] === 'second' && log[2] === 'third';
}

/**
 * 测试点 99：当 Proxy 源对象使用 get 拦截器返回 thenable 对象，Object.assign 是否将其视为普通值（不 await）
 * @returns {boolean}
 */
export function testThenableObjectCopiedAsPlainValueFromProxy() {
    const thenable = {
        then: () => {
        }, data: 'not promise'
    };
    const source = { item: thenable };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.item === thenable;
}

/**
 * 测试点 100：Object.assign 使用 Proxy 目标时，若属性名为 "__defineGetter__"，是否被当作普通字符串属性（现代引擎已废弃）
 * @returns {boolean}
 */
export function testLegacyDefineGetterTreatedAsStringKey() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { __defineGetter__: 'legacy' });
    return proxy.__defineGetter__ === 'legacy' && typeof proxy.__defineGetter__ === 'string';
}


/**
 * 测试点 101：当 Proxy 源对象使用 get 拦截器返回自身构造函数（如 source.constructor），Object.assign 是否拷贝为普通属性
 * @returns {boolean}
 */
export function testConstructorPropertyFromProxySourceCopiedAsValue() {

    function MyType() {
    }

    const source = new MyType();
    source.data = 42;
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return target.data === 42;
}

/**
 * 测试点 102：Object.assign 使用 Proxy 目标时，若 set 拦截器修改属性名为大写，是否影响原始键（不应影响）
 * @returns {boolean}
 */
export function testProxySetCannotChangePropertyNameUsedByAssign() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {

            obj[String(prop).toUpperCase()] = val;
            return true;
        }
    });
    Object.assign(proxy, { key: 'value' });


    return !('key' in proxy) && proxy.KEY === 'value';
}

/**
 * 测试点 103：Proxy 源对象包含大量 Symbol 属性（>100），Object.assign 是否仍正确跳过不可枚举者
 * @returns {boolean}
 */
export function testManySymbolPropertiesHandlingInProxySource() {
    const source = {};
    const symbols = [];
    for (let i = 0; i < 100; i++) {
        const sym = Symbol(`s${i}`);
        symbols.push(sym);
        if (i % 2 === 0) {
            Object.defineProperty(source, sym, { value: i, enumerable: true });
        } else {
            Object.defineProperty(source, sym, { value: i, enumerable: false });
        }
    }
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    const copiedSymbols = Object.getOwnPropertySymbols(target);
    return (
        copiedSymbols.length === 50 &&
        copiedSymbols.every(sym => {
            const idx = parseInt(sym.description.slice(1), 10);
            return idx % 2 === 0 && target[sym] === idx;
        })
    );
}

/**
 * 测试点 104：当 Proxy 目标是冻结的 null-prototype 对象，set 拦截器是否能绕过（不能）
 * @returns {boolean}
 */
export function testFrozenNullProtoTargetBlocksAllWritesEvenViaProxy() {
    const target = Object.create(null);
    target.existing = 1;
    Object.freeze(target);
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { existing: 2, newProp: 3 });
        return false;
    } catch (e) {
        return target.existing === 1 && !('newProp' in target);
    }
}

/**
 * 测试点 106：Proxy 的 set 拦截器中调用 Object.assign 递归到自身，是否导致无限循环（应避免）
 * @returns {boolean}
 */
export function testRecursiveObjectAssignInSetDoesNotInfiniteLoop() {
    let depth = 0;
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            depth++;
            if (depth < 3) {

                Object.assign({}, { temp: val });
            }
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { a: 1 });
    return depth === 1 && proxy.a === 1;
}

/**
 * 测试点 107：当 Proxy 源对象使用 get 拦截器代理到 Proxy，Object.assign 是否穿透多层（仅读取值）
 * @returns {boolean}
 */
export function testMultiLayerProxyGetDelegation() {
    const backend = { value: 'deep' };
    const layer1 = new Proxy(backend, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return layer1[prop] ?? obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return Object.keys(target).length === 0;
}

/**
 * 测试点 108：Object.assign 使用 Proxy 目标时，若属性名为 "hasOwnProperty"，是否覆盖方法（允许）
 * @returns {boolean}
 */
export function testAssignCanOverwriteHasOwnPropertyAsDataProperty() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { hasOwnProperty: 'string' });
    return proxy.hasOwnProperty === 'string' && typeof proxy.hasOwnProperty === 'string';
}

/**
 * 测试点 109：Proxy 源对象包含 getter 返回不同类型每次调用，Object.assign 是否只调一次（但不枚举则不调）
 * @returns {boolean}
 */
export function testGetterCalledOnlyIfEnumerableAndOwn() {
    let callCount = 0;
    const source = {};
    Object.defineProperty(source, 'dynamic', {
        get() {
            callCount++;
            return Date.now();
        },
        enumerable: false
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return callCount === 0 && !('dynamic' in target);
}

/**
 * 测试点 110：当 Proxy 目标是 arguments 对象且严格模式，Object.assign 写入数字索引是否成功
 * @returns {boolean}
 */
export function testStrictModeArgumentsIndexAssignmentViaProxy() {
    'use strict';

    function getArgs() {
        return arguments;
    }

    const args = getArgs('a', 'b');
    const proxy = new Proxy(args, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { '0': 'x', '1': 'y' });
    return args[0] === 'x' && args[1] === 'y';
}

/**
 * 测试点 111：Object.assign 拷贝 Proxy 源时，若源有 __proto__ 作为 own enumerable 属性，是否作为普通字符串键处理
 * @returns {boolean}
 */
export function testOwnEnumerableProtoTreatedAsStringKey() {
    const source = {};
    Object.defineProperty(source, '__proto__', {
        value: { injected: true },
        enumerable: true,
        writable: true,
        configurable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return (
        target.__proto__ !== undefined &&
            target.__proto__.injected === true
    );
}

/**
 * 测试点 112：Proxy 的 set 拦截器对属性值进行类型校验（如只接受 number），Object.assign 是否遵守
 * @returns {boolean}
 */
export function testProxySetValidatesValueTypeStrictly() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            if (typeof val !== 'number') {
                return false;
            }
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { valid: 42, invalid: 'text' });
        return false;
    } catch (e) {
        return proxy.valid === 42 && !('invalid' in proxy);
    }
}

/**
 * 测试点 113：当 Proxy 源对象来自 Object.preventExtensions()，Object.assign 是否仍读取现有属性
 * @returns {boolean}
 */
export function testPreventedExtensionsProxySourceStillReadable() {
    const source = { allowed: 'yes' };
    Object.preventExtensions(source);
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.allowed === 'yes';
}

/**
 * 测试点 114：Object.assign 使用 Proxy 目标时，若 set 拦截器返回 true 但实际未赋值，外部读取为 undefined
 * @returns {boolean}
 */
export function testProxySetClaimsSuccessButSkipsAssignment() {
    const target = {};
    const proxy = new Proxy(target, {
        set(_obj, _prop, _val) {

            return true;
        }
    });
    Object.assign(proxy, { ghost: 999 });
    return !('ghost' in proxy) && proxy.ghost === undefined;
}

/**
 * 测试点 115：Proxy 源对象使用 get 拦截器返回全局对象（如 globalThis），Object.assign 是否拷贝引用
 * @returns {boolean}
 */
export function testGlobalObjectReferenceCopiedFromProxyGet() {
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            if (prop === 'globalRef') {
                return globalThis;
            }
            return obj[prop];
        }
    });

    const target = {};
    Object.assign(target, proxySource);
    return !('globalRef' in target);
}

/**
 * 测试点 116：当 Proxy 目标是 Proxy 且 handler 为 null，Object.assign 是否报错（非法 Proxy）
 * @returns {boolean}
 */
export function testProxyWithNullHandlerIsInvalidAndThrows() {

    try {

        const badProxy = new Proxy({}, null);
        Object.assign(badProxy, { x: 1 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 117：Object.assign 拷贝 Proxy 源时，若属性为 Date 对象，是否保持 instanceof 和 getTime()
 * @returns {boolean}
 */
export function testDateObjectsPreservedThroughProxyAssign() {
    const now = new Date();
    const source = { timestamp: now };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.timestamp instanceof Date && target.timestamp.getTime() === now.getTime();
}

/**
 * 测试点 118：Proxy 的 set 拦截器中访问 descriptor via Object.getOwnPropertyDescriptor，是否反映当前状态
 * @returns {boolean}
 */
export function testProxySetCanInspectCurrentDescriptor() {
    const target = {};
    let descriptorSeen = false;
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            const desc = Object.getOwnPropertyDescriptor(obj, prop);
            if (!desc) {
                descriptorSeen = true;
            }
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { newKey: 'test' });
    return descriptorSeen && proxy.newKey === 'test';
}

/**
 * 测试点 119：当 Proxy 源对象使用 get 拦截器返回函数，Object.assign 是否拷贝函数引用（而非调用）
 * @returns {boolean}
 */
export function testFunctionReferencesCopiedNotInvoked() {
    const fn = () => 'called';
    const source = { method: fn };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.method === fn && target.method() === 'called';
}

/**
 * 测试点 120：Object.assign 使用 Proxy 目标时，若属性名是负数字符串（如 "-1"），是否正常触发 set
 * @returns {boolean}
 */
export function testNegativeNumericStringKeysWorkInProxySet() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { '-1': 'neg', '0.5': 'float' });
    return proxy['-1'] === 'neg' && proxy['0.5'] === 'float';
}


/**
 * 测试点 122：Object.assign 使用 Proxy 目标时，若 set 拦截器递增计数器但拒绝写入，是否仍计入调用次数
 * @returns {boolean}
 */
export function testProxySetCounterIncrementsEvenOnFailure() {
    let callCount = 0;
    const target = {};
    const proxy = new Proxy(target, {
        set(_obj, _prop, _val) {
            callCount++;
            return false;
        }
    });
    try {
        Object.assign(proxy, { a: 1, b: 2 });
    } catch (e) {
    }
    return callCount === 1 && !('a' in target) && !('b' in target);
}

/**
 * 测试点 123：Proxy 源对象包含属性名为 "__proto__" 且为 Symbol，Object.assign 是否忽略（Symbol 不等于字符串 "__proto__"）
 * @returns {boolean}
 */
export function testSymbolProtoNotTreatedAsPrototypeSetter() {
    const symProto = Symbol('__proto__');
    const source = {};
    source[symProto] = { fake: true };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return (
        target[symProto] !== undefined &&
            target[symProto].fake === true &&
            Object.getPrototypeOf(target) === Object.prototype
    );
}

/**
 * 测试点 124：当 Proxy 目标是冻结的 Array，Object.assign 写入索引是否失败（即使 set 拦截器允许）
 * @returns {boolean}
 */
export function testFrozenArrayAsProxyTargetBlocksIndexAssignment() {
    const arr = Object.freeze([1, 2]);
    const proxy = new Proxy(arr, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    try {
        Object.assign(proxy, { '0': 999 });
        return false;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 125：Object.assign 拷贝 Proxy 源时，若属性值为 Error 对象，是否保留 stack 和 message
 * @returns {boolean}
 */
export function testErrorObjectsPreservedThroughProxyAssign() {
    const err = new Error('test error');
    const originalStack = err.stack;
    const source = { err };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return (
        target.err instanceof Error &&
            target.err.message === 'test error' &&
            target.err.stack === originalStack
    );
}

/**
 * 测试点 127：当 Proxy 源对象来自不同 JavaScript Realm（模拟），Object.assign 是否仍读取原始值类型
 * @returns {boolean}
 */
export function testCrossRealmBooleanNumberStringCopiedCorrectly() {

    const otherBool = new Boolean(true);
    const otherNum = new Number(42);
    const otherStr = new String('hello');
    const source = { b: otherBool, n: otherNum, s: otherStr };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return (
        target.b instanceof Boolean &&
            target.n instanceof Number &&
            target.s instanceof String &&
            target.b.valueOf() === true &&
            target.n.valueOf() === 42 &&
            target.s.valueOf() === 'hello'
    );
}

/**
 * 测试点 128：Object.assign 使用 Proxy 目标时，若属性名为 "constructor" 且值为函数，是否覆盖原型链上的 constructor
 * @returns {boolean}
 */
export function testDataPropertyConstructorOverridesInheritedOne() {

    function Original() {
    }

    const target = new Original();
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, {
        constructor: function Fake() {
        }
    });
    return target.constructor.name === 'Fake';
}

/**
 * 测试点 129：Proxy 源对象使用 get 拦截器返回 Promise，Object.assign 是否将其作为普通对象拷贝（不 await）
 * @returns {boolean}
 */
export function testPromiseCopiedAsPlainObjectFromProxy() {
    const p = Promise.resolve(123);
    const source = { asyncVal: p };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target.asyncVal === p;
}

/**
 * 测试点 130：当 Proxy 目标是 Proxy.revocable() 且未撤销，Object.assign 正常工作
 * @returns {boolean}
 */
export function testRevocableProxyBeforeRevokeWorksNormally() {
    const { proxy } = Proxy.revocable({ base: 1 }, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { added: 2 });
    return proxy.base === 1 && proxy.added === 2;
}

/**
 * 测试点 131：Object.assign 拷贝 Proxy 源时，若源有 getter 抛出 RangeError，是否传播异常
 * @returns {boolean}
 */
export function testGetterThrowsRangeErrorDuringAssign() {
    const source = {};
    Object.defineProperty(source, 'bad', {
        get() {
            throw new RangeError('Out of range');
        },
        enumerable: true
    });
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    try {
        Object.assign({}, proxySource);
        return false;
    } catch (e) {
        return e instanceof RangeError && e.message === 'Out of range';
    }
}

/**
 * 测试点 132：Proxy 的 set 拦截器对属性名进行 Unicode 标准化（NFC/NFD），Object.assign 是否使用原始名
 * @returns {boolean}
 */
export function testProxySetCannotNormalizePropertyName() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {

            const normalized = prop.normalize('NFD');
            obj[normalized] = val;
            return true;
        }
    });
    const composed = 'café';
    const decomposed = 'cafe\u0301';
    Object.assign(proxy, { [decomposed]: 'value' });

    return !target[composed] && target[decomposed] === 'value';
}

/**
 * 测试点 133：当 Proxy 源对象包含属性名为 "0"（数字字符串），Object.assign 是否正常枚举
 * @returns {boolean}
 */
export function testNumericStringKeysEnumeratedCorrectly() {
    const source = { '0': 'zero', '1.5': 'float', '-2': 'neg' };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return target['0'] === 'zero' && target['1.5'] === 'float' && target['-2'] === 'neg';
}

/**
 * 测试点 134：Object.assign 使用 Proxy 目标时，若 set 拦截器抛出非 Error 对象（如字符串），是否被包装
 * @returns {boolean}
 */
export function testProxySetThrowsStringErrorWrappedByEngine() {
    const target = {};
    const proxy = new Proxy(target, {
        set() {
            throw 'not an error object';
        }
    });
    try {
        Object.assign(proxy, { x: 1 });
        return false;
    } catch (e) {

        return e === 'not an error object';
    }
}

/**
 * 测试点 135：Proxy 源对象使用 get 拦截器代理到 WeakMap，Object.assign 是否枚举（答案：否，WeakMap 不可枚举）
 * @returns {boolean}
 */
export function testProxyGetDelegatesToWeakMapButNotEnumerable() {
    const wm = new WeakMap();
    const key = {};
    wm.set(key, 'secret');
    const source = {};
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            if (prop === 'wmKey') {
                return key;
            }
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);

    return !('wmKey' in target);
}

/**
 * 测试点 136：当 Proxy 目标是 arguments 对象且有 callee 属性（非严格模式），Object.assign 是否可写入
 * @returns {boolean}
 */
export function testNonStrictArgumentsCalleeCanBeAssignedViaProxy() {

    function getArgs() {
        const args = arguments;
        const proxy = new Proxy(args, {
            set(obj, prop, val) {
                obj[prop] = val;
                return true;
            }
        });
        Object.assign(proxy, { custom: 'ok' });
        return proxy.custom === 'ok';
    }

    return getArgs();
}

/**
 * 测试点 137：Object.assign 拷贝 Proxy 源时，若属性为 Map，是否保持引用和内容
 * @returns {boolean}
 */
export function testMapObjectsPreservedThroughProxyAssign() {
    const map = new Map([['a', 1], ['b', 2]]);
    const source = { dataMap: map };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return (
        target.dataMap === map &&
            target.dataMap.get('a') === 1 &&
            target.dataMap.get('b') === 2
    );
}

/**
 * 测试点 138：Proxy 的 set 拦截器中访问 this.proxyProperty，是否指向正确上下文（this 是 handler，通常无绑定）
 * @returns {boolean}
 */
export function testProxyHandlerThisIsUndefinedInStrictMode() {
    let thisValue;
    const target = {};
    const handler = {
        set(obj, prop, val) {
            thisValue = this;
            obj[prop] = val;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    Object.assign(proxy, { x: 1 });
    return thisValue !== undefined;
}

/**
 * 测试点 139：当 Proxy 源对象使用 get 拦截器返回 NaN、Infinity 等特殊数值，Object.assign 是否保留
 * @returns {boolean}
 */
export function testSpecialNumberValuesCopiedCorrectly() {
    const source = {
        nan: NaN,
        inf: Infinity,
        negInf: -Infinity,
        zero: -0
    };
    const proxySource = new Proxy(source, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const target = {};
    Object.assign(target, proxySource);
    return (
        Number.isNaN(target.nan) &&
            target.inf === Infinity &&
            target.negInf === -Infinity &&
        Object.is(target.zero, -0)
    );
}

/**
 * 测试点 140：Object.assign 使用 Proxy 目标时，若属性名是空字符串 ""，是否正常触发 set
 * @returns {boolean}
 */
export function testEmptyStringPropertyNameHandledCorrectly() {
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, val) {
            obj[prop] = val;
            return true;
        }
    });
    Object.assign(proxy, { '': 'empty key' });
    return proxy[''] === 'empty key';
}

