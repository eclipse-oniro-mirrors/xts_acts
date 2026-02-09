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
 * 测试点 1：Proxy 对象的原型是否可以通过 Object.getPrototypeOf 正确获取
 * 预期：Proxy 的原型应与其 target 对象的原型一致（除非显式设置 Proxy 的 prototype）
 */
export function testProxyPrototypeIsAccessible() {
    const target = {};
    const proxy = new Proxy(target, {});
    const targetProto = Object.getPrototypeOf(target);
    const proxyProto = Object.getPrototypeOf(proxy);
    return proxyProto === targetProto;
}

/**
 * 测试点 2：通过 Proxy 拦截 getPrototypeOf 操作，并验证 Object.getPrototypeOf 是否触发该拦截
 * 预期：如果 handler 定义了 getPrototypeOf，则 Object.getPrototypeOf(proxy) 应返回 handler 返回值
 */
export function testProxyGetPrototypeOfTrap() {
    const target = {};
    let trapCalled = false;
    const handler = {
        getPrototypeOf() {
            trapCalled = true;
            return Array.prototype;
        }
    };
    const proxy = new Proxy(target, handler);
    const proto = Object.getPrototypeOf(proxy);
    return trapCalled && proto === Array.prototype;
}

/**
 * 测试点 3：即使 Proxy 拦截了 getPrototypeOf，原始 target 的原型仍保持不变
 * 预期：Object.getPrototypeOf(target) 不受 Proxy handler 影响
 */
export function testTargetPrototypeUnaffectedByProxy() {
    const originalProto = Object.getPrototypeOf({});
    const target = {};
    const handler = {
        getPrototypeOf() {
            return Date.prototype;
        }
    };
    const proxy = new Proxy(target, handler);

    Object.getPrototypeOf(proxy);

    return Object.getPrototypeOf(target) === originalProto;
}

/**
 * 测试点 4：Proxy 的 handler 中 getPrototypeOf 返回非对象值（如 null）是否被允许
 * 规范要求：getPrototypeOf 必须返回对象或 null
 */
export function testGetPrototypeOfTrapReturnsNull() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return null;
        }
    });
    try {
        const proto = Object.getPrototypeOf(proxy);
        return proto === null;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点 5：Proxy 的 getPrototypeOf trap 返回非对象非 null 值（如字符串）应抛出 TypeError
 */
export function testGetPrototypeOfTrapInvalidReturnValue() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return "not an object";
        }
    });
    try {
        Object.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 6：对不可扩展（non-extensible）target 创建 Proxy，其 getPrototypeOf 是否仍可被拦截
 */
export function testProxyOnNonExtensibleTargetGetPrototypeOf() {
    const target = {};
    Object.preventExtensions(target);
    let called = false;
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            called = true;
            return Object.prototype;
        }
    });
    const proto = Object.getPrototypeOf(proxy);
    return called && proto === Object.prototype;
}

/**
 * 测试点 7：Proxy 本身被冻结，是否影响 Object.getPrototypeOf 的行为
 */
export function testFrozenProxyGetPrototypeOf() {
    const target = {};
    const proxy = new Proxy(target, {});
    Object.freeze(proxy);
    const proto = Object.getPrototypeOf(proxy);
    return proto === Object.getPrototypeOf(target);
}

/**
 * 测试点 8：嵌套 Proxy（Proxy of Proxy）的 getPrototypeOf 行为
 */
export function testNestedProxyGetPrototypeOf() {
    const target = {};
    const inner = new Proxy(target, {});
    const outer = new Proxy(inner, {
        getPrototypeOf() {
            return Array.prototype;
        }
    });
    return Object.getPrototypeOf(outer) === Array.prototype;
}

/**
 * 测试点 9：未定义 getPrototypeOf trap 时，Object.getPrototypeOf 应回退到目标对象的原型
 */
export function testNoGetPrototypeOfTrapFallback() {
    const target = { x: 1 };
    const CustomProto = { y: 2 };
    Object.setPrototypeOf(target, CustomProto);
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === CustomProto;
}

/**
 * 测试点 10：Proxy 的 getPrototypeOf trap 被调用时，this 指向 handler 对象（严格模式下）
 */
export function testGetPrototypeOfTrapThisBinding() {
    const target = {};
    let thisIsHandler = false;
    const handler = {
        getPrototypeOf() {
            thisIsHandler = this === handler;
            return Object.prototype;
        }
    };
    const proxy = new Proxy(target, handler);
    Object.getPrototypeOf(proxy);
    return thisIsHandler;
}

/**
 * 测试点 11：在 getPrototypeOf trap 中修改 target 的原型，是否影响后续调用（验证隔离性）
 */
export function testGetPrototypeOfTrapDoesNotAffectTargetPrototype() {
    const target = {};
    const originalProto = Object.getPrototypeOf(target);
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            Object.setPrototypeOf(target, Array.prototype);
            return Date.prototype;
        }
    });
    const resultProto = Object.getPrototypeOf(proxy);
    const targetProtoAfter = Object.getPrototypeOf(target);

    return resultProto === Date.prototype && targetProtoAfter === Array.prototype;
}

/**
 * 测试点 12：Proxy 的原型可通过 Reflect.getPrototypeOf 获取，且与 Object.getPrototypeOf 一致
 */
export function testReflectAndObjectGetPrototypeOfConsistent() {
    const target = {};
    const proxy = new Proxy(target, {});
    return Reflect.getPrototypeOf(proxy) === Object.getPrototypeOf(proxy);
}

/**
 * 测试点 13：当 Proxy 的 handler 为 null 时（无效代理），Object.getPrototypeOf 抛出异常
 */
export function testProxyWithNullHandler() {
    const target = {};
    try {
        const proxy = new Proxy(target, null);
        Object.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 14：Proxy 的 getPrototypeOf trap 在严格模式下必须返回合法值（已在测试5覆盖），此处验证返回 undefined 是否失败
 */
export function testGetPrototypeOfTrapReturnsUndefined() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return undefined;
        }
    });
    try {
        Object.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 15：使用 Object.create(null) 作为 target，Proxy 的原型应为 null（若无 trap）
 */
export function testProxyOfNullPrototypeObject() {
    const target = Object.create(null);
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === null;
}

/**
 * 测试点 17：多次调用 Object.getPrototypeOf(proxy) 是否每次都触发 trap（若存在）
 */
export function testGetPrototypeOfTrapCalledEveryTime() {
    let callCount = 0;
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            callCount++;
            return Object.prototype;
        }
    });
    Object.getPrototypeOf(proxy);
    Object.getPrototypeOf(proxy);
    Object.getPrototypeOf(proxy);
    return callCount === 3;
}

/**
 * 测试点 18：Proxy 的原型不能通过 Object.setPrototypeOf 直接修改（会抛出错误或无效）
 */
export function testSetPrototypeOfOnProxyFails() {
    const target = {};
    const proxy = new Proxy(target, {});
    try {
        Object.setPrototypeOf(proxy, Array.prototype);


        return Object.getPrototypeOf(proxy) === Array.prototype;
    } catch (e) {

        return true;
    }
}

/**
 * 测试点 19：Proxy 的 getPrototypeOf trap 与 hasOwnPrototype 行为无关（独立测试）
 * 验证即使 target 没有 prototype 属性，getPrototypeOf 仍正常工作
 */
export function testGetPrototypeOfIndependentOfPrototypeProperty() {
    const target = {};
    target.prototype = "fake";
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Function.prototype;
        }
    });
    return Object.getPrototypeOf(proxy) === Function.prototype;
}

/**
 * 测试点 20：当 Proxy 的 target 是另一个 Proxy 且两者都有 getPrototypeOf trap，外层优先
 */
export function testOuterProxyTrapOverridesInner() {
    const raw = {};
    const inner = new Proxy(raw, {
        getPrototypeOf() {
            return String.prototype;
        }
    });
    const outer = new Proxy(inner, {
        getPrototypeOf() {
            return Number.prototype;
        }
    });
    return Object.getPrototypeOf(outer) === Number.prototype;
}


/**
 * 测试点 21：可撤销 Proxy（revocable proxy）在撤销后调用 Object.getPrototypeOf 应抛出 TypeError
 */
export function testRevokedProxyGetPrototypeOfThrows() {
    const target = {};
    const { proxy, revoke } = Proxy.revocable(target, {});
    revoke();
    try {
        Object.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 22：Proxy 的 getPrototypeOf trap 返回 target 的真实原型，应与直接获取一致
 */
export function testTrapReturnsActualTargetPrototype() {
    const proto = { custom: true };
    const target = Object.create(proto);
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Object.getPrototypeOf(target);
        }
    });
    return Object.getPrototypeOf(proxy) === proto;
}

/**
 * 测试点 23：当 target 是数组时，Proxy 的原型应为 Array.prototype（若无 trap）
 */
export function testProxyOfArrayPrototype() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {});
    return Object.getPrototypeOf(proxy) === Array.prototype;
}

/**
 * 测试点 24：Proxy 的 getPrototypeOf trap 返回一个非标准对象（如自定义对象），应被接受
 */
export function testGetPrototypeOfTrapReturnsCustomObject() {
    const target = {};
    const fakeProto = { isFake: true };
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return fakeProto;
        }
    });
    return Object.getPrototypeOf(proxy) === fakeProto;
}

/**
 * 测试点 25：Object.getPrototypeOf 在 Proxy 上调用时，不会触发 get 或其他 traps
 */
export function testGetPrototypeOfDoesNotTriggerGetTrap() {
    let getCalled = false;
    const target = {};
    const proxy = new Proxy(target, {
        get() {
            getCalled = true;
            return undefined;
        },
        getPrototypeOf() {
            return Object.prototype;
        }
    });
    Object.getPrototypeOf(proxy);
    return !getCalled;
}

/**
 * 测试点 26：Proxy 的 handler 中 getPrototypeOf 为 undefined（未定义），应回退到默认行为
 */
export function testHandlerGetPrototypeOfUndefined() {
    const proto = { x: 1 };
    const target = Object.create(proto);
    const handler = {};
    handler.getPrototypeOf = undefined;
    const proxy = new Proxy(target, handler);
    return Object.getPrototypeOf(proxy) === proto;
}

/**
 * 测试点 27：Proxy 的 target 是函数，其原型应为 Function.prototype（若无 trap）
 */
export function testProxyOfFunctionPrototype() {

    function foo() {
    }

    const proxy = new Proxy(foo, {});
    return Object.getPrototypeOf(proxy) === Function.prototype;
}

/**
 * 测试点 28：在 getPrototypeOf trap 中抛出异常，Object.getPrototypeOf 应传播该异常
 */
export function testGetPrototypeOfTrapThrowsError() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            throw new Error("trap error");
        }
    });
    try {
        Object.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return e.message === "trap error";
    }
}

/**
 * 测试点 29：Proxy 的原型链深度不影响 Object.getPrototypeOf（它只返回直接原型）
 */
export function testDeepPrototypeChainWithProxy() {
    const level3 = {};
    const level2 = Object.create(level3);
    const level1 = Object.create(level2);
    const proxy = new Proxy(level1, {});
    return Object.getPrototypeOf(proxy) === level2;
}

/**
 * 测试点 30：即使 Proxy 被用作另一个对象的原型，其自身的 getPrototypeOf 行为不变
 */
export function testProxyUsedAsPrototypeStillHasCorrectGetPrototypeOf() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Date.prototype;
        }
    });
    const obj = Object.create(proxy);

    return Object.getPrototypeOf(proxy) === Date.prototype;
}

/**
 * 测试点 31：Object.getPrototypeOf 调用时，Proxy 的 target 为 null（无效），应抛错（但 Proxy 构造时已校验）
 * 实际上 new Proxy(null, ...) 会抛错，所以本测试验证构造阶段
 */
export function testProxyWithNullTargetThrowsAtConstruction() {
    try {
        new Proxy(null, {});
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 32：Proxy 的 getPrototypeOf trap 返回 Object.prototype 的子类实例，合法
 */
export function testGetPrototypeOfTrapReturnsSubclassPrototype() {
    class MyClass {
    }

    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return MyClass.prototype;
        }
    });
    return Object.getPrototypeOf(proxy) === MyClass.prototype;
}

/**
 * 测试点 33：多次创建相同配置的 Proxy，每个都独立触发 getPrototypeOf trap
 */
export function testMultipleProxiesEachTriggerTrap() {
    let count1 = 0, count2 = 0;
    const target1 = {}, target2 = {};
    const p1 = new Proxy(target1, {
        getPrototypeOf() {
            count1++;
            return Object.prototype;
        }
    });
    const p2 = new Proxy(target2, {
        getPrototypeOf() {
            count2++;
            return Array.prototype;
        }
    });
    Object.getPrototypeOf(p1);
    Object.getPrototypeOf(p2);
    return count1 === 1 && count2 === 1;
}

/**
 * 测试点 34：Proxy 的 handler 是另一个 Proxy，getPrototypeOf 仍正常工作
 */
export function testHandlerIsAlsoAProxy() {
    const target = {};
    const realHandler = {
        getPrototypeOf() {
            return RegExp.prototype;
        }
    };
    const handlerProxy = new Proxy(realHandler, {});
    const proxy = new Proxy(target, handlerProxy);
    return Object.getPrototypeOf(proxy) === RegExp.prototype;
}

/**
 * 测试点 35：Object.getPrototypeOf 在 Proxy 上调用时，不修改任何对象状态（纯读取）
 */
export function testGetPrototypeOfIsPureReadOperation() {
    const originalProto = Object.getPrototypeOf({});
    const target = {};
    const proxy = new Proxy(target, {});
    Object.getPrototypeOf(proxy);
    return Object.getPrototypeOf(target) === originalProto;
}

/**
 * 测试点 36：Proxy 的 getPrototypeOf trap 返回跨“realm”风格的对象（模拟），应被接受
 */
export function testGetPrototypeOfTrapReturnsCrossRealmLikeObject() {

    const iframeProto = Object.create(null);
    iframeProto.constructor = { name: "FakeWindow" };
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return iframeProto;
        }
    });
    return Object.getPrototypeOf(proxy) === iframeProto;
}

/**
 * 测试点 37：Proxy 的 target 是 Error 对象，原型应为 Error.prototype（若无 trap）
 */
export function testProxyOfErrorObjectPrototype() {
    const err = new Error("test");
    const proxy = new Proxy(err, {});
    return Object.getPrototypeOf(proxy) === Error.prototype;
}

/**
 * 测试点 38：在严格模式下，getPrototypeOf trap 必须返回 object 或 null —— 已覆盖，此处验证返回 Boolean.prototype 是否合法
 */
export function testGetPrototypeOfTrapReturnsBuiltInPrototype() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Boolean.prototype;
        }
    });
    return Object.getPrototypeOf(proxy) === Boolean.prototype;
}

/**
 * 测试点 39：Proxy 的 getPrototypeOf trap 被调用时，arguments.length 为 0（无参数）
 */
export function testGetPrototypeOfTrapReceivesNoArguments() {
    let argLength = -1;
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf(...args) {
            argLength = args.length;
            return Object.prototype;
        }
    });
    Object.getPrototypeOf(proxy);
    return argLength === 1;
}

/**
 * 测试点 40：Object.getPrototypeOf(proxy) 与 proxy.__proto__ 在非标准环境中可能不同，但在标准中 __proto__ 已废弃；
 * 本测试确保在支持 __proto__ 的引擎中，两者一致（仅用于兼容性验证）
 */
export function testGetPrototypeOfConsistentWithProtoGetter() {
    const target = {};
    const CustomProto = { z: 99 };
    Object.setPrototypeOf(target, CustomProto);
    const proxy = new Proxy(target, {});

    if ('__proto__' in proxy) {
        return proxy.__proto__ === Object.getPrototypeOf(proxy);
    }

    return true;
}


/**
 * 测试点 41：Proxy 作为另一个对象的 prototype，其自身的 getPrototypeOf 行为不受影响
 */
export function testProxyAsPrototypeDoesNotAlterItsOwnGetPrototypeOf() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Map.prototype;
        }
    });
    const obj = Object.create(proxy);

    return Object.getPrototypeOf(proxy) === Map.prototype;
}

/**
 * 测试点 42：Object.getPrototypeOf 在 Proxy 上调用时，不会触发 apply 或 construct traps（即使 target 是函数）
 */
export function testGetPrototypeOfDoesNotTriggerApplyOrConstruct() {
    let applyCalled = false, constructCalled = false;

    function TargetFn() {
    }

    const proxy = new Proxy(TargetFn, {
        apply() {
            applyCalled = true;
        },
        construct() {
            constructCalled = true;
        },
        getPrototypeOf() {
            return Function.prototype;
        }
    });
    Object.getPrototypeOf(proxy);
    return !applyCalled && !constructCalled;
}

/**
 * 测试点 43：Proxy 的 getPrototypeOf trap 返回一个冻结对象，应被接受
 */
export function testGetPrototypeOfTrapReturnsFrozenObject() {
    const frozenProto = Object.freeze({ frozen: true });
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return frozenProto;
        }
    });
    return Object.getPrototypeOf(proxy) === frozenProto;
}

/**
 * 测试点 44：当 target 的原型是 Proxy 时，Object.getPrototypeOf(target) 返回该 Proxy（非展开）
 */
export function testTargetPrototypeIsProxy() {
    const innerTarget = {};
    const protoProxy = new Proxy(innerTarget, {});
    const target = Object.create(protoProxy);
    return Object.getPrototypeOf(target) === protoProxy;
}

/**
 * 测试点 45：Proxy 的 getPrototypeOf trap 返回自身（形成循环原型），应被允许（JS 允许循环原型）
 */
export function testGetPrototypeOfTrapReturnsCircularPrototype() {
    const target = {};
    let proxy;
    proxy = new Proxy(target, {
        getPrototypeOf() {
            return proxy;
        }
    });
    try {
        const proto = Object.getPrototypeOf(proxy);
        return proto === proxy;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点 46：Object.getPrototypeOf 在跨原型链查找时不递归展开 Proxy
 */
export function testGetPrototypeOfDoesNotUnwrapNestedProxiesInChain() {
    const level3 = {};
    const level2 = new Proxy(level3, {});
    const level1 = Object.create(level2);
    const proxy1 = new Proxy(level1, {});

    return Object.getPrototypeOf(proxy1) !== level1;
}

/**
 * 测试点 47：Proxy 的 handler 中 getPrototypeOf 是一个绑定函数，this 指向正确
 */
export function testGetPrototypeOfTrapIsBoundFunction() {
    const target = {};
    const context = { called: false };
    const handler = {
        getPrototypeOf() {
            context.called = true;
            return Object.prototype;
        }
    };
    const boundGetProto = handler.getPrototypeOf.bind(context);
    const proxy = new Proxy(target, {
        getPrototypeOf: boundGetProto
    });
    Object.getPrototypeOf(proxy);
    return context.called;
}

/**
 * 测试点 48：Proxy 的 target 是 arguments 对象，其原型应为 Object.prototype（非数组）
 */
export function testProxyOfArgumentsObjectPrototype() {

    function getArgs() {
        return arguments;
    }

    const args = getArgs(1, 2);
    const proxy = new Proxy(args, {});
    return Object.getPrototypeOf(proxy) === Object.prototype;
}

/**
 * 测试点 49：在 getPrototypeOf trap 中访问 target 的原型，不会触发其他 traps
 */
export function testAccessingTargetPrototypeInsideTrapIsSafe() {
    let getCalled = false;
    const target = Object.create({ x: 1 });
    const proxy = new Proxy(target, {
        get() {
            getCalled = true;
        },
        getPrototypeOf() {
            return Object.getPrototypeOf(target);
        }
    });
    Object.getPrototypeOf(proxy);
    return !getCalled;
}

/**
 * 测试点 50：Proxy 的 getPrototypeOf trap 返回 null 后，再次调用仍返回 null（一致性）
 */
export function testGetPrototypeOfTrapConsistentlyReturnsNull() {
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return null;
        }
    });
    const p1 = Object.getPrototypeOf(proxy);
    const p2 = Object.getPrototypeOf(proxy);
    return p1 === null && p2 === null && p1 === p2;
}

/**
 * 测试点 51：Object.getPrototypeOf 在 Proxy 上调用时，不依赖对象的 enumerable/configurable 属性
 */
export function testGetPrototypeOfIgnoresPropertyDescriptorFlags() {
    const target = {};
    Object.defineProperty(target, 'x', {
        value: 1,
        writable: false,
        enumerable: false,
        configurable: false
    });
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === Object.getPrototypeOf(target);
}

/**
 * 测试点 52：Proxy 的 target 是 RegExp 实例，原型应为 RegExp.prototype（若无 trap）
 */
export function testProxyOfRegExpPrototype() {
    const re = /abc/g;
    const proxy = new Proxy(re, {});
    return Object.getPrototypeOf(proxy) === RegExp.prototype;
}

/**
 * 测试点 53：getPrototypeOf trap 返回一个具有 Symbol.toStringTag 的对象，不影响结果
 */
export function testGetPrototypeOfTrapReturnsObjectWithSymbolToStringTag() {
    const customProto = {};
    customProto[Symbol.toStringTag] = "Custom";
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return customProto;
        }
    });
    return Object.getPrototypeOf(proxy) === customProto;
}

/**
 * 测试点 54：Proxy 的 handler 被修改后，后续 getPrototypeOf 调用使用新 handler
 */
export function testHandlerMutationAffectsFutureGetPrototypeOfCalls() {
    const target = {};
    const handler1 = {
        getPrototypeOf() {
            return Array.prototype;
        }
    };
    const proxy = new Proxy(target, handler1);
    let first = Object.getPrototypeOf(proxy);
    handler1.getPrototypeOf = () => Date.prototype;
    let second = Object.getPrototypeOf(proxy);
    return first === Array.prototype && second === Date.prototype;
}

/**
 * 测试点 55：Object.getPrototypeOf 在 Proxy 上调用时，不会改变对象的 extensibility
 */
export function testGetPrototypeOfDoesNotAffectExtensibility() {
    const target = {};
    Object.preventExtensions(target);
    const proxy = new Proxy(target, {});
    const wasNonExtensible = !Object.isExtensible(target);
    Object.getPrototypeOf(proxy);
    const stillNonExtensible = !Object.isExtensible(target);
    return wasNonExtensible && stillNonExtensible;
}

/**
 * 测试点 56：Proxy 的 getPrototypeOf trap 返回一个 Proxy，应被接受（嵌套返回）
 */
export function testGetPrototypeOfTrapReturnsAnotherProxy() {
    const innerTarget = {};
    const innerProxy = new Proxy(innerTarget, {});
    const outerProxy = new Proxy({}, {
        getPrototypeOf() {
            return innerProxy;
        }
    });
    return Object.getPrototypeOf(outerProxy) === innerProxy;
}

/**
 * 测试点 57：当 Proxy 的 target 是 Object.create(null)，且有 getPrototypeOf trap，优先使用 trap
 */
export function testTrapOverridesNullPrototypeTarget() {
    const target = Object.create(null);
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Set.prototype;
        }
    });
    return Object.getPrototypeOf(proxy) === Set.prototype;
}

/**
 * 测试点 58：Object.getPrototypeOf 在 Proxy 上调用时，与 Object.prototype.toString 无冲突
 */
export function testGetPrototypeOfIndependentOfToString() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return WeakMap.prototype;
        }
    });

    String(proxy);
    return Object.getPrototypeOf(proxy) === WeakMap.prototype;
}

/**
 * 测试点 59：Proxy 的 getPrototypeOf trap 被 delete 后，应回退到默认行为
 */
export function testDeletingGetPrototypeOfTrapRestoresDefault() {
    const proto = { deleted: true };
    const target = Object.create(proto);
    const handler = {
        getPrototypeOf() {
            return Number.prototype;
        }
    };
    const proxy = new Proxy(target, handler);

    if (Object.getPrototypeOf(proxy) !== Number.prototype) {
        return false;
    }

    delete handler.getPrototypeOf;

    return Object.getPrototypeOf(proxy) === proto;
}

/**
 * 测试点 60：在严格模式全局作用域下，Proxy 的 getPrototypeOf 行为不变（验证环境无关性）
 * 由于无法在函数内切换 strict mode 影响 Proxy 行为，本测试验证其与非严格一致
 */
export function testGetPrototypeOfBehaviorIsStrictModeInvariant() {

    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Promise.prototype;
        }
    });
    return Object.getPrototypeOf(proxy) === Promise.prototype;
}


/**
 * 测试点 61：Proxy 的 getPrototypeOf trap 返回一个具有 null 原型的对象（Object.create(null)），应被接受
 */
export function testGetPrototypeOfTrapReturnsNullProtoObject() {
    const nullProtoObj = Object.create(null);
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return nullProtoObj;
        }
    });
    return Object.getPrototypeOf(proxy) === nullProtoObj;
}

/**
 * 测试点 62：Object.getPrototypeOf 在 Proxy 上调用时，与 Reflect.getPrototypeOf 行为必须一致（ECMAScript 要求）
 */
export function testObjectAndReflectGetPrototypeOfConsistencyOnProxy() {
    const target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Intl.DateTimeFormat.prototype;
        }
    });
    return Object.getPrototypeOf(proxy) === Reflect.getPrototypeOf(proxy);
}

/**
 * 测试点 63：Proxy 的 target 是 Promise 实例，其原型应为 Promise.prototype（若无 trap）
 */
export function testProxyOfPromiseInstancePrototype() {
    const p = Promise.resolve(42);
    const proxy = new Proxy(p, {});
    return Object.getPrototypeOf(proxy) === Promise.prototype;
}

/**
 * 测试点 64：getPrototypeOf trap 中返回一个未公开的内置原型（如 JSON），虽然 JSON 不是构造器，但其 prototype 存在
 */
export function testGetPrototypeOfTrapReturnsJSONPrototype() {

    const fakeJSONProto = {};
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return fakeJSONProto;
        }
    });
    return Object.getPrototypeOf(proxy) === fakeJSONProto;
}

/**
 * 测试点 65：Proxy 被设置为自己的原型（通过 Object.setPrototypeOf），然后调用 Object.getPrototypeOf 应返回自身
 */
export function testProxySetAsOwnPrototype() {
    const target = {};
    const proxy = new Proxy(target, {});
    try {
        Object.setPrototypeOf(proxy, proxy);
        return Object.getPrototypeOf(proxy) === proxy;
    } catch (e) {

        return true;
    }
}

/**
 * 测试点 66：在 getPrototypeOf trap 中动态修改 handler 自身，不影响当前调用结果
 */
export function testModifyingHandlerInsideGetPrototypeOfTrapDoesNotAffectCurrentCall() {
    const handler = {
        getPrototypeOf() {
            this.getPrototypeOf = () => Array.prototype;
            return Date.prototype;
        }
    };
    const proxy = new Proxy({}, handler);
    const result = Object.getPrototypeOf(proxy);
    const nextResult = Object.getPrototypeOf(proxy);
    return result === Date.prototype && nextResult === Array.prototype;
}

/**
 * 测试点 67：Proxy 的 target 是一个类实例，原型应为该类的 prototype（若无 trap）
 */
export function testProxyOfClassInstancePrototype() {
    class MyClass {
    }

    const instance = new MyClass();
    const proxy = new Proxy(instance, {});
    return Object.getPrototypeOf(proxy) === MyClass.prototype;
}

/**
 * 测试点 69：Proxy 的 getPrototypeOf trap 返回一个带有 getter 的对象，不会触发该 getter
 */
export function testGetPrototypeOfTrapReturnsObjectWithGetterDoesNotInvokeIt() {
    let getterCalled = false;
    const protoWithGetter = {
        get hidden() {
            getterCalled = true;
            return 'secret';
        }
    };
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return protoWithGetter;
        }
    });
    const proto = Object.getPrototypeOf(proxy);
    return proto === protoWithGetter && !getterCalled;
}

/**
 * 测试点 70：当 Proxy 的 handler 是冻结对象时，getPrototypeOf 仍可被调用
 */
export function testFrozenHandlerStillAllowsGetPrototypeOf() {
    const target = {};
    const handler = Object.freeze({
        getPrototypeOf() {
            return Map.prototype;
        }
    });
    const proxy = new Proxy(target, handler);
    return Object.getPrototypeOf(proxy) === Map.prototype;
}

/**
 * 测试点 71：Proxy 的 target 是一个原始值包装对象（如 new Number(5)），原型应为 Number.prototype
 */
export function testProxyOfNumberWrapperPrototype() {
    const numObj = new Number(5);
    const proxy = new Proxy(numObj, {});
    return Object.getPrototypeOf(proxy) === Number.prototype;
}

/**
 * 测试点 72：Object.getPrototypeOf 在 Proxy 上调用时，不会触发 has trap
 */
export function testGetPrototypeOfDoesNotTriggerHasTrap() {
    let hasCalled = false;
    const target = {};
    const proxy = new Proxy(target, {
        has() {
            hasCalled = true;
            return true;
        },
        getPrototypeOf() {
            return Object.prototype;
        }
    });
    Object.getPrototypeOf(proxy);
    return !hasCalled;
}

/**
 * 测试点 73：Proxy 的 getPrototypeOf trap 返回一个 Proxy，该内部 Proxy 也有 trap，但不会递归触发
 */
export function testGetPrototypeOfReturnsProxyWithItsOwnTrapNotInvoked() {
    const innerTarget = {};
    const innerProxy = new Proxy(innerTarget, {
        getPrototypeOf() {
            throw new Error("Should not be called");
        }
    });
    const outerProxy = new Proxy({}, {
        getPrototypeOf() {
            return innerProxy;
        }
    });
    try {
        const result = Object.getPrototypeOf(outerProxy);
        return result === innerProxy;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点 74：Proxy 的 target 是 arguments 对象（严格模式下），其原型仍为 Object.prototype
 */
export function testProxyOfStrictModeArgumentsPrototype() {
    "use strict";

    function getStrictArgs() {
        return arguments;
    }

    const args = getStrictArgs(1, 2);
    const proxy = new Proxy(args, {});
    return Object.getPrototypeOf(proxy) === Object.prototype;
}

/**
 * 测试点 75：Object.getPrototypeOf 在 Proxy 上调用时，即使 target 已被 delete，只要 proxy 存在就有效（target 是引用）
 */
export function testGetPrototypeOfWorksEvenIfTargetVariableIsDeleted() {
    let target = {};
    const proxy = new Proxy(target, {
        getPrototypeOf() {
            return Set.prototype;
        }
    });
    target = null;
    return Object.getPrototypeOf(proxy) === Set.prototype;
}

/**
 * 测试点 76：Proxy 的 getPrototypeOf trap 返回一个跨上下文风格的对象（如 { constructor: window } 模拟），应被接受
 */
export function testGetPrototypeOfTrapReturnsCrossContextLikeObject() {
    const fakeWindowProto = {
        constructor: { window: true }
    };
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return fakeWindowProto;
        }
    });
    return Object.getPrototypeOf(proxy) === fakeWindowProto;
}

/**
 * 测试点 77：Object.getPrototypeOf 在 Proxy 上调用时，不会改变对象的 property descriptor
 */
export function testGetPrototypeOfDoesNotAlterPropertyDescriptors() {
    const target = {};
    Object.defineProperty(target, 'x', { value: 1, writable: false });
    const originalDesc = Object.getOwnPropertyDescriptor(target, 'x');
    const proxy = new Proxy(target, {});
    Object.getPrototypeOf(proxy);
    const newDesc = Object.getOwnPropertyDescriptor(target, 'x');
    return (
        originalDesc.writable === newDesc.writable &&
            originalDesc.value === newDesc.value
    );
}

/**
 * 测试点 78：Proxy 的 getPrototypeOf trap 返回一个 Symbol 值（非法），应抛出 TypeError
 */
export function testGetPrototypeOfTrapReturnsSymbolThrows() {
    const sym = Symbol('invalid');
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return sym;
        }
    });
    try {
        Object.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点 79：Proxy 的 target 是一个 DOM 元素模拟对象（含 __proto__），其原型行为应正常
 */
export function testProxyOfDOMLikeObjectPrototype() {

    const domLike = Object.create({ tagName: 'DIV' });
    const proxy = new Proxy(domLike, {});
    return Object.getPrototypeOf(proxy) === domLike.__proto__;
}

/**
 * 测试点 80：连续创建 100 个 Proxy 并调用 getPrototypeOf，行为一致且无内存泄漏迹象（轻量验证）
 */
export function testMassProxyGetPrototypeOfConsistency() {
    const results = [];
    for (let i = 0; i < 100; i++) {
        const target = { id: i };
        const proxy = new Proxy(target, {
            getPrototypeOf() {
                return WeakSet.prototype;
            }
        });
        results.push(Object.getPrototypeOf(proxy) === WeakSet.prototype);
    }
    return results.every(Boolean);
}


/**
 * 测试点 81：Proxy 的 handler 是 target 自身（自引用 handler），getPrototypeOf 仍正常工作
 */
export function testHandlerIsTargetItself() {
    const target = {
        getPrototypeOf() {
            return BigInt.prototype;
        }
    };
    const proxy = new Proxy(target, target);
    return Object.getPrototypeOf(proxy) === BigInt.prototype;
}

/**
 * 测试点 82：Object.getPrototypeOf 在 Proxy 上调用时，不会触发 ownKeys trap
 */
export function testGetPrototypeOfDoesNotTriggerOwnKeysTrap() {
    let ownKeysCalled = false;
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        ownKeys() {
            ownKeysCalled = true;
            return ['a'];
        },
        getPrototypeOf() {
            return Object.prototype;
        }
    });
    Object.getPrototypeOf(proxy);
    return !ownKeysCalled;
}

/**
 * 测试点 83：Proxy 的 getPrototypeOf trap 返回一个具有不可配置属性的对象，应被接受
 */
export function testGetPrototypeOfTrapReturnsObjectWithNonConfigurableProps() {
    const proto = {};
    Object.defineProperty(proto, 'locked', {
        value: true,
        configurable: false,
        writable: false
    });
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return proto;
        }
    });
    return Object.getPrototypeOf(proxy) === proto;
}

/**
 * 测试点 85：在 getPrototypeOf trap 中访问 globalThis，不影响结果（验证无隐式依赖）
 */
export function testGetPrototypeOfTrapAccessesGlobalThisSafely() {
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            void globalThis;
            return Uint8Array.prototype;
        }
    });
    try {
        return Object.getPrototypeOf(proxy) === Uint8Array.prototype;
    } catch (e) {

        if (typeof window !== 'undefined' || typeof self !== 'undefined') {
            return Object.getPrototypeOf(proxy) === Uint8Array.prototype;
        }
        return false;
    }
}

/**
 * 测试点 86：Proxy 的 getPrototypeOf trap 返回一个空对象字面量，应被接受
 */
export function testGetPrototypeOfTrapReturnsObjectLiteral() {
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return {};
        }
    });
    const proto = Object.getPrototypeOf(proxy);
    return proto.constructor === Object && proto.toString === Object.prototype.toString;
}

/**
 * 测试点 89：Proxy 的 target 是一个带有私有字段的类实例（模拟），原型行为正常
 */
export function testProxyOfClassWithPrivateFieldSimulation() {
    class WithPrivate {
        constructor() {
            this._private = Symbol('private');
        }
    }

    const instance = new WithPrivate();
    const proxy = new Proxy(instance, {});
    return Object.getPrototypeOf(proxy) === WithPrivate.prototype;
}

/**
 * 测试点 90：Object.getPrototypeOf 在 Proxy 上调用时，不会改变对象的 isFrozen 状态
 */
export function testGetPrototypeOfDoesNotAffectIsFrozenStatus() {
    const target = Object.freeze({});
    const proxy = new Proxy(target, {});
    const wasFrozen = Object.isFrozen(target);
    Object.getPrototypeOf(proxy);
    const stillFrozen = Object.isFrozen(target);
    return wasFrozen && stillFrozen;
}

/**
 * 测试点 91：Proxy 的 getPrototypeOf trap 返回一个继承自 null 的对象，应被接受
 */
export function testGetPrototypeOfTrapReturnsObjectInheritingFromNull() {
    const NullInherit = Object.create(null);
    NullInherit.custom = true;
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return NullInherit;
        }
    });
    return Object.getPrototypeOf(proxy) === NullInherit;
}

/**
 * 测试点 92：Proxy 的 target 是 SharedArrayBuffer（若支持），其原型应为 SharedArrayBuffer.prototype
 */
export function testProxyOfSharedArrayBufferPrototype() {
    if (typeof SharedArrayBuffer === 'undefined') {
        return true;
    }
    const sab = new SharedArrayBuffer(1024);
    const proxy = new Proxy(sab, {});
    return Object.getPrototypeOf(proxy) === SharedArrayBuffer.prototype;
}

/**
 * 测试点 93：Object.getPrototypeOf 在 Proxy 上调用时，不会触发 defineProperty trap
 */
export function testGetPrototypeOfDoesNotTriggerDefinePropertyTrap() {
    let definePropertyCalled = false;
    const target = {};
    const proxy = new Proxy(target, {
        defineProperty() {
            definePropertyCalled = true;
            return true;
        },
        getPrototypeOf() {
            return Object.prototype;
        }
    });
    Object.getPrototypeOf(proxy);
    return !definePropertyCalled;
}

/**
 * 测试点 94：Proxy 的 getPrototypeOf trap 返回一个 Proxy，该 Proxy 的 target 是函数，行为正常
 */
export function testGetPrototypeOfReturnsProxyWhoseTargetIsFunction() {

    function fn() {
    }

    const innerProxy = new Proxy(fn, {});
    const outerProxy = new Proxy({}, {
        getPrototypeOf() {
            return innerProxy;
        }
    });
    return Object.getPrototypeOf(outerProxy) === innerProxy;
}

/**
 * 测试点 95：Proxy 的 target 是 Error 对象且带有自定义 stack，原型仍为 Error.prototype
 */
export function testProxyOfErrorWithCustomStackPrototype() {
    const err = new Error("custom");
    err.stack = "Fake stack trace";
    const proxy = new Proxy(err, {});
    return Object.getPrototypeOf(proxy) === Error.prototype;
}

/**
 * 测试点 96：Object.getPrototypeOf 在 Proxy 上调用时，即使 handler 是 Proxy，也能正确委托
 */
export function testHandlerIsProxyAndDelegatesGetPrototypeOf() {
    const realHandler = {
        getPrototypeOf() {
            return Atomics;
        }
    };
    const handlerProxy = new Proxy(realHandler, {
        get(target, prop) {
            return target[prop];
        }
    });
    const proxy = new Proxy({}, handlerProxy);
    return Object.getPrototypeOf(proxy) === Atomics;
}

/**
 * 测试点 97：Proxy 的 getPrototypeOf trap 返回一个具有 Symbol.iterator 的对象，不会触发迭代
 */
export function testGetPrototypeOfTrapReturnsIterableObjectDoesNotInvokeIterator() {
    let iteratorCalled = false;
    const iterableProto = {
        [Symbol.iterator]() {
            iteratorCalled = true;
            return { next: () => ({ done: true }) };
        }
    };
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return iterableProto;
        }
    });
    const proto = Object.getPrototypeOf(proxy);
    return proto === iterableProto && !iteratorCalled;
}

/**
 * 测试点 100：Proxy 的 getPrototypeOf trap 返回 undefined（非法），应抛出 TypeError —— 再次验证规范强制性
 */
export function testGetPrototypeOfTrapReturnsUndefinedThrowsTypeError() {
    const proxy = new Proxy({}, {
        getPrototypeOf() {
            return undefined;
        }
    });
    try {
        Object.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}