/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export const FinalizationRegistryComprehensiveUtils = {
    /**
     * 001. 综合场景：构造+注册+GC触发回调（验证弱引用与heldValue传递）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test001_ConstructorRegisterGCCallback() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = "comprehensive-held-001";
        const callback = (hv) => {
            capturedHeldValue = hv;
        };

        const executeRegistration = () => {
            const registry = new FinalizationRegistry(callback);
            const target = {};
            registry.register(target, expectedHeldValue);
        };


        executeRegistration();

        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test001失败：GC后回调未接收正确heldValue（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        }
        return "Test Passed: ConstructorRegisterGCCallbackTest001";
    },

    /**
     * 002. 综合场景：注册+unregister+GC（取消后回调不触发）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test002_RegisterUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const token = {};


        const executeRegistration = () => {
            const target = {};
            registry.register(target, "unregister-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test002失败：unregister后GC仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: RegisterUnregisterGCTest002";
    },

    /**
     * 003. 综合场景：强引用heldValue（GC后仍可访问）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test003_StrongReferenceHeldValueGC() {
        "use strict";
        let capturedHeldObj = null;
        const heldObj = { id: 1, data: "strong-hold-data" };
        const callback = (hv) => {
            capturedHeldObj = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, heldObj);
        };

        executeRegistration();
        heldObj.data = "updated-after-register";
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isHeldObjValid = capturedHeldObj?.id === 1 && capturedHeldObj?.data === "updated-after-register";
        if (!isHeldObjValid) {
            throw new Error(`Test003失败：GC后heldValue对象失效（实际: ${JSON.stringify(capturedHeldObj)}`);
        }
        return "Test Passed: StrongReferenceHeldValueGCTest003";
    },

    /**
     * 004. 综合场景：同一目标多次注册+GC（最后一次heldValue生效）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test004_MultipleRegisterSameTargetGC() {
        "use strict";
        let capturedHeldValue = null;
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);
        const finalHeldValue = "final-held-004";

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "first-held");
            registry.register(target, "second-held");
            registry.register(target, finalHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== finalHeldValue) {
            throw new Error(`Test004失败：多次注册后GC回调未接收最后一个heldValue（实际: ${capturedHeldValue}`);
        }
        return "Test Passed: MultipleRegisterSameTargetGCTest004";
    },

    /**
     * 005. 综合场景：Symbol目标+Symbol token+取消+GC
     * 优化点：内部方法封装Symbol目标、GC前后各10ms延时
     */
    async test005_SymbolTargetTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const symbolToken = Symbol("token-005");

        const executeRegistration = () => {
            const symbolTarget = Symbol("target-005");
            registry.register(symbolTarget, "symbol-held", symbolToken);
        };

        executeRegistration();
        registry.unregister(symbolToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test005失败：Symbol token取消后GC仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: SymbolTargetTokenUnregisterGCTest005";
    },

    /**
     * 006. 综合场景：无token注册+GC（无法取消，回调触发）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test006_NoTokenRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Map();
            registry.register(target, "no-token-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test006失败：无token注册后GC未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: NoTokenRegisterGCTest006";
    },

    /**
     * 007. 综合场景：循环引用目标+GC（弱引用仍可回收）
     * 优化点：内部方法封装循环引用目标、GC前后各10ms延时
     */
    async test007_CircularReferenceTargetGC() {
        "use strict";
        let callbackCalled = false;
        const callback = (hv) => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            target.self = target;
            registry.register(target, "circular-held-007");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test007失败：循环引用目标GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: CircularReferenceTargetGCTest007";
    },

    /**
     * 008. 综合场景：多实例独立注册+GC（回调互不干扰）
     * 优化点：内部方法封装多target、GC前后各10ms延时
     */
    async test008_MultipleInstancesGC() {
        "use strict";
        let instance1Called = false;
        let instance2Called = false;
        const callback1 = () => {
            instance1Called = true;
        };
        const callback2 = function() {
            instance2Called = true;
        };
        const registry1 = new FinalizationRegistry(callback1);
        const registry2 = new FinalizationRegistry(callback2);

        const executeRegistration = () => {
            const target1 = {};
            const target2 = {};
            registry1.register(target1, "instance1-held");
            registry2.register(target2, "instance2-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!instance1Called || !instance2Called) {
            throw new Error(`Test008失败：多实例GC回调未全部触发（instance1: ${instance1Called}，instance2: ${instance2Called}`);
        }
        return "Test Passed: MultipleInstancesGCTest008";
    },

    /**
     * 009. 综合场景：注册后目标生命周期结束+GC（原目标仍被回收）
     * 优化点：内部方法封装目标（无需重新赋值）、GC前后各10ms延时
     */
    async test009_TargetLifecycleEndGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = "lifecycle-end-held";
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test009失败：目标生命周期结束后GC回调未接收heldValue（实际: ${capturedHeldValue}`);
        }
        return "Test Passed: TargetLifecycleEndGCTest009";
    },

    /**
     * 010. 综合场景：冻结对象目标+GC（冻结对象可被回收）
     * 优化点：内部方法封装冻结对象、GC前后各10ms延时
     */
    async test010_FrozenTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = Object.freeze({ frozen: true });
            registry.register(target, "frozen-held-010");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test0010失败：冻结对象目标GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: FrozenTargetRegisterGCTest010";
    },

    /**
     * 011. 综合场景：同一token关联多个target+取消+GC（全部取消不触发回调）
     * 核心特性：一个token绑定多个target，取消后所有target GC均不触发回调
     */
    async test011_MultipleTargetsSameTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const sharedToken = {};

        const executeRegistration = () => {
            const target1 = {};
            const target2 = new Map();
            const target3 = Symbol("multi-target-011");
            registry.register(target1, "target1-held", sharedToken);
            registry.register(target2, "target2-held", sharedToken);
            registry.register(target3, "target3-held", sharedToken);
        };

        executeRegistration();
        registry.unregister(sharedToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test011失败：同一token多target取消后仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: MultipleTargetsSameTokenUnregisterGCTest011";
    },

    /**
     * 012. 综合场景：heldValue为null（≠target）+注册+GC（回调正常接收）
     * 核心特性：heldValue为null且不等于target时，GC后回调接收null
     */
    async test012_HeldValueAsNullRegisterGC() {
        "use strict";
        let capturedHeldValue = undefined;
        const expectedHeldValue = null;
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test012失败：heldValue为null时回调未接收正确值（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        }
        return "Test Passed: HeldValueAsNullRegisterGCTest012";
    },

    /**
     * 013. 综合场景：target为类实例+注册+GC（类实例可回收）
     * 核心特性：自定义类实例作为target，GC后回调正常触发
     */
    async test013_ClassInstanceTargetRegisterGC() {
        "use strict";
        class CustomTarget {}
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new CustomTarget();
            registry.register(target, "class-instance-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test013失败：类实例target GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: ClassInstanceTargetRegisterGCTest013";
    },

    /**
     * 014. 综合场景：注册-取消-重新注册-GC（重新注册后回调触发）
     * 核心特性：取消后重新注册同一target，GC后回调正常执行
     */
    async test014_RegisterUnregisterReregisterGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = "reregister-held-014";
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);
        const token = {};

        const executeRegistration = (isFirst = true) => {
            const target = {};
            const heldValue = isFirst ? "first-held" : expectedHeldValue;
            registry.register(target, heldValue, token);
        };

        executeRegistration(true);
        registry.unregister(token);
        executeRegistration(false);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test014失败：重新注册后GC回调未接收正确heldValue（实际: ${capturedHeldValue}`);
        }
        return "Test Passed: RegisterUnregisterReregisterGCTest014";
    },

    /**
     * 015. 综合场景：heldValue为非注册Symbol+注册+GC（回调接收Symbol）
     * 核心特性：非注册Symbol作为heldValue，GC后回调正常接收
     */
    async test015_HeldValueAsNonRegisteredSymbolGC() {
        "use strict";
        let capturedHeldSymbol = null;
        const expectedHeldSymbol = Symbol("held-symbol-015");
        const callback = (hv) => {
            capturedHeldSymbol = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldSymbol);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldSymbol !== expectedHeldSymbol) {
            throw new Error(`Test015失败：Symbol类型heldValue未被正确接收（实际: ${capturedHeldSymbol}`);
        }
        return "Test Passed: HeldValueAsNonRegisteredSymbolGCTest015";
    },

    /**
     * 016. 综合场景：多轮注册-取消-注册-取消-GC（最终取消不触发回调）
     * 核心特性：多轮操作后最终取消，GC后回调不执行
     */
    async test016_MultipleRoundRegisterUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const token1 = {};
        const token2 = {};

        const executeRegistration = (token, heldValue) => {
            const target = {};
            registry.register(target, heldValue, token);
        };


        executeRegistration(token1, "round1-held");
        registry.unregister(token1);
        executeRegistration(token2, "round2-held");
        registry.unregister(token2);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test016失败：多轮取消后GC仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: MultipleRoundRegisterUnregisterGCTest016";
    },

    /**
     * 017. 综合场景：target为WeakSet实例+注册+GC（WeakSet可回收）
     * 核心特性：WeakSet实例作为target，GC后回调正常触发
     */
    async test017_WeakSetTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new WeakSet();
            registry.register(target, "weakset-held-017");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test017失败：WeakSet实例target GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: WeakSetTargetRegisterGCTest017";
    },

    /**
     * 018. 综合场景：回调内部修改外部变量+GC（验证回调执行时机）
     * 核心特性：GC触发回调时，可正常修改外部声明的变量
     */
    async test018_CallbackModifyExternalVarGC() {
        "use strict";
        let externalCount = 0;
        const callback = () => {
            externalCount++;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target1 = {};
            const target2 = Symbol("modify-var-target");
            registry.register(target1, "var1-held");
            registry.register(target2, "var2-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (externalCount !== 2) {
            throw new Error(`Test018失败：回调未正确修改外部变量（预期: 2，实际: ${externalCount}`);
        }
        return "Test Passed: CallbackModifyExternalVarGCTest018";
    },

    /**
     * 019. 综合场景：同一registry注册不同类型target（对象+Symbol）+GC（独立触发）
     * 核心特性：同一注册表中不同类型target，GC后各自回调独立触发
     */
    async test019_DifferentTypeTargetsSameRegistryGC() {
        "use strict";
        let objectTargetCalled = false;
        let symbolTargetCalled = false;
        const callback = (hv) => {
            if (hv === "object-type-held") objectTargetCalled = true;
            if (hv === "symbol-type-held") symbolTargetCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const objectTarget = new Date();
            const symbolTarget = Symbol("different-type-target");
            registry.register(objectTarget, "object-type-held");
            registry.register(symbolTarget, "symbol-type-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!objectTargetCalled || !symbolTargetCalled) {
            throw new Error(`Test019失败：不同类型target回调未全部触发（对象: ${objectTargetCalled}，Symbol: ${symbolTargetCalled}`);
        }
        return "Test Passed: DifferentTypeTargetsSameRegistryGCTest019";
    },

    /**
     * 020. 综合场景：token为类实例+注册+取消+GC（类实例token可正常取消）
     * 核心特性：自定义类实例作为token，取消后GC不触发回调
     */
    async test020_ClassInstanceTokenUnregisterGC() {
        "use strict";
        class TokenClass {}
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const token = new TokenClass();

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "class-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test020失败：类实例token取消后仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: ClassInstanceTokenUnregisterGCTest020";
    },

    /**
     * 021. 综合场景：target为Proxy代理对象+注册+GC（代理对象可回收）
     */
    async test021_ProxyTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const originalTarget = {};
            const proxyTarget = new Proxy(originalTarget, {});
            registry.register(proxyTarget, "proxy-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test021失败：Proxy代理对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ProxyTargetRegisterGCTest021";
    },

    /**
     * 022. 综合场景：heldValue为已resolved Promise+GC（回调接收完整Promise）
     */
    async test022_HeldValueAsResolvedPromiseGC() {
        "use strict";
        let capturedPromise = null;
        const resolvedPromise = Promise.resolve("promise-resolved");
        const callback = (hv) => { capturedPromise = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, resolvedPromise);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedPromise instanceof Promise && await capturedPromise === "promise-resolved";
        if (!isValid) throw new Error(`Test022失败：resolved Promise作为heldValue失效（实际: ${capturedPromise}`);
        return "Test Passed: HeldValueAsResolvedPromiseGCTest022";
    },

    /**
     * 023. 综合场景：target为密封对象（Object.seal）+注册+GC（密封对象可回收）
     */
    async test023_SealedTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = Object.seal({ sealed: true });
            registry.register(target, "sealed-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test023失败：密封对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: SealedTargetRegisterGCTest023";
    },

    /**
     * 024. 综合场景：token为Proxy代理对象+注册+取消+GC（代理token可正常取消）
     */
    async test024_ProxyTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            const originalToken = {};
            const proxyToken = new Proxy(originalToken, {});
            registry.register(target, "proxy-token-held", proxyToken);
            return proxyToken;
        };

        const proxyToken = executeRegistration();
        registry.unregister(proxyToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test024失败：Proxy代理token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ProxyTokenUnregisterGCTest024";
    },


    /**
     * 026. 综合场景：同一target不同token，取消最早token（不影响后续注册）
     */
    async test026_UnregisterEarlyTokenForSameTargetGC() {
        "use strict";
        let capturedHeldValue = null;
        const finalHeldValue = "final-early-token-held";
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);
        const token1 = {};
        const token2 = {};

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "early-held", token1);
            registry.register(target, finalHeldValue, token2);
        };

        executeRegistration();
        registry.unregister(token1);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== finalHeldValue) throw new Error(`Test026失败：取消早期token后未接收后期heldValue（实际: ${capturedHeldValue}`);
        return "Test Passed: UnregisterEarlyTokenForSameTargetGCTest026";
    },

    /**
     * 027. 综合场景：target为Error实例+注册+GC（错误实例可回收）
     */
    async test027_ErrorInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Error("test-error-target");
            registry.register(target, "error-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test027失败：Error实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ErrorInstanceTargetRegisterGCTest027";
    },



    /**
     * 029. 综合场景：token为Error实例+注册+取消+GC（错误实例token可正常取消）
     */
    async test029_ErrorInstanceTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Error("test-error-token");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "error-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test029失败：Error实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ErrorInstanceTokenUnregisterGCTest029";
    },

    /**
     * 030. 综合场景：target为Set实例+注册+GC（Set实例可回收）
     */
    async test030_SetInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Set([1, 2, 3]);
            registry.register(target, "set-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test030失败：Set实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: SetInstanceTargetRegisterGCTest030";
    },

    /**
     * 031. 综合场景：heldValue为BigInt+注册+GC（回调接收BigInt）
     */
    async test031_HeldValueAsBigIntGC() {
        "use strict";
        let capturedBigInt = null;
        const expectedBigInt = 9876543210123456789n;
        const callback = (hv) => { capturedBigInt = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedBigInt);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedBigInt !== expectedBigInt) throw new Error(`Test031失败：BigInt作为heldValue未正确接收（预期: ${expectedBigInt}，实际: ${capturedBigInt}`);
        return "Test Passed: HeldValueAsBigIntGCTest031";
    },



    /**
     * 034. 综合场景：heldValue为NaN+注册+GC（回调接收NaN）
     */
    async test034_HeldValueAsNaNGCC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = NaN;
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!Number.isNaN(capturedHeldValue)) throw new Error(`Test034失败：NaN作为heldValue未正确接收（实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueAsNaNGCTest034";
    },

    /**
     * 035. 综合场景：target为RegExp实例+注册+GC（正则实例可回收）
     */
    async test035_RegExpInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = /test-regex-target/gi;
            registry.register(target, "regex-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test035失败：RegExp实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: RegExpInstanceTargetRegisterGCTest035";
    },

    /**
     * 036. 综合场景：回调抛出错误+注册+GC（错误不影响GC和其他逻辑）
     */
    async test036_CallbackThrowsErrorGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;

        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "throw-error-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test036失败：回调抛错后未触发（实际: ${callbackCalled}`);
        return "Test Passed: CallbackThrowsErrorGCTest036";
    },

    /**
     * 037. 综合场景：heldValue为Infinity+注册+GC（回调接收Infinity）
     */
    async test037_HeldValueAsInfinityGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = Infinity;
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) throw new Error(`Test037失败：Infinity作为heldValue未正确接收（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueAsInfinityGCTest037";
    },

    /**
     * 038. 综合场景：target为嵌套冻结对象+注册+GC（嵌套冻结对象可回收）
     */
    async test038_NestedFrozenTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const nestedObj = Object.freeze({ deep: "frozen" });
            const target = Object.freeze({ nested: nestedObj });
            registry.register(target, "nested-frozen-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test038失败：嵌套冻结对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NestedFrozenTargetRegisterGCTest038";
    },

    /**
     * 039. 综合场景：token为嵌套密封对象+注册+取消+GC（嵌套密封token可取消）
     */
    async test039_NestedSealedTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const nestedToken = Object.seal({ deep: "sealed" });
            const token = Object.seal({ nested: nestedToken });
            const target = {};
            registry.register(target, "nested-sealed-held", token);
            return token;
        };

        const token = executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test039失败：嵌套密封token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NestedSealedTokenUnregisterGCTest039";
    },

    /**
     * 040. 综合场景：heldValue为嵌套对象+注册+GC（回调接收完整嵌套对象）
     */
    async test040_HeldValueAsNestedObjectGC() {
        "use strict";
        let capturedNestedObj = null;
        const nestedHeldValue = {
            level1: { level2: { value: "nested-held-value" } }
        };
        const callback = (hv) => { capturedNestedObj = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, nestedHeldValue);
        };

        executeRegistration();
        nestedHeldValue.level1.level2.updated = true;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedNestedObj?.level1?.level2?.value === "nested-held-value" && capturedNestedObj?.level1?.level2?.updated === true;
        if (!isValid) throw new Error(`Test040失败：嵌套heldValue对象失效（实际: ${JSON.stringify(capturedNestedObj)}`);
        return "Test Passed: HeldValueAsNestedObjectGCTest040";
    },

    /**
     * 041. 综合场景：target为已rejected Promise+注册+GC（Promise实例可回收）
     */
    async test041_RejectedPromiseTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = Promise.reject(new Error("rejected-promise-target"));
            registry.register(target, "rejected-promise-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test041失败：已rejected Promise实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: RejectedPromiseTargetRegisterGCTest041";
    },

    /**
     * 042. 综合场景：token为已resolved Promise+注册+取消+GC（Promise token可取消）
     */
    async test042_ResolvedPromiseTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = Promise.resolve("resolved-promise-token");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "promise-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test042失败：已resolved Promise实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ResolvedPromiseTokenUnregisterGCTest042";
    },

    /**
     * 043. 综合场景：heldValue为循环引用对象+注册+GC（循环引用heldValue可访问）
     */
    async test043_HeldValueAsCircularObjectGC() {
        "use strict";
        let capturedCircularObj = null;
        const circularObj = {};
        circularObj.self = circularObj;
        circularObj.nested = { parent: circularObj };
        const callback = (hv) => { capturedCircularObj = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, circularObj);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedCircularObj?.self === capturedCircularObj && capturedCircularObj?.nested?.parent === capturedCircularObj;
        if (!isValid) throw new Error(`Test043失败：循环引用heldValue对象失效（实际: ${capturedCircularObj}`);
        return "Test Passed: HeldValueAsCircularObjectGCTest043";
    },


    /**
     * 046. 综合场景：heldValue为带参数函数+注册+GC（回调可调用heldValue函数）
     */
    async test046_HeldValueAsParamFunctionGC() {
        "use strict";
        let capturedFunction = null;
        const addFn = (a, b) => a + b;
        const callback = (hv) => { capturedFunction = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, addFn);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedFunction === "function" && capturedFunction(2, 3) === 5;
        if (!isValid) throw new Error(`Test046失败：函数类型heldValue失效（实际: ${capturedFunction}`);
        return "Test Passed: HeldValueAsParamFunctionGCTest046";
    },




    /**
     * 049. 综合场景：多registry实例+同一token+注册+取消+GC（取消仅影响当前实例）
     */
    async test049_MultipleRegistriesSameTokenUnregisterGC() {
        "use strict";
        let registry1Called = false;
        let registry2Called = false;
        const callback1 = () => { registry1Called = true; };
        const callback2 = () => { registry2Called = true; };
        const registry1 = new FinalizationRegistry(callback1);
        const registry2 = new FinalizationRegistry(callback2);
        const sharedToken = {};

        const executeRegistration = () => {
            const target1 = {};
            const target2 = {};
            registry1.register(target1, "registry1-held", sharedToken);
            registry2.register(target2, "registry2-held", sharedToken);
        };

        executeRegistration();
        registry1.unregister(sharedToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (registry1Called || !registry2Called) throw new Error(`Test049失败：多实例同一token取消逻辑异常（registry1: ${registry1Called}，registry2: ${registry2Called}`);
        return "Test Passed: MultipleRegistriesSameTokenUnregisterGCTest049";
    },

    /**
     * 050. 综合场景：heldValue为undefined+注册+GC（回调接收undefined）
     */
    async test050_HeldValueAsUndefinedGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = undefined;
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) throw new Error(`Test050失败：undefined作为heldValue未正确接收（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueAsUndefinedGCTest050";
    },





    /**
     * 053. 综合场景：heldValue为已注册Symbol（Symbol.iterator）+注册+GC（回调接收）
     */
    async test053_HeldValueAsRegisteredSymbolGC() {
        "use strict";
        let capturedSymbol = null;
        const expectedSymbol = Symbol.iterator;
        const callback = (hv) => { capturedSymbol = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedSymbol);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedSymbol !== expectedSymbol) throw new Error(`Test053失败：已注册Symbol作为heldValue未正确接收（实际: ${capturedSymbol}`);
        return "Test Passed: HeldValueAsRegisteredSymbolGCTest053";
    },



    /**
     * 055. 综合场景：target被WeakMap引用再释放+GC（WeakMap引用不影响回收）
     */
    async test055_TargetReferencedByWeakMapThenReleasedGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const weakMap = new WeakMap();

        const executeRegistration = () => {
            const target = {};
            weakMap.set(target, "weakmap-value");
            registry.register(target, "weakmap-ref-held");
            weakMap.delete(target);

        };

       executeRegistration();

        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test055失败：WeakMap释放引用后target未被GC（实际: ${callbackCalled}`);
        return "Test Passed: TargetReferencedByWeakMapThenReleasedGCTest055";
    },
    /**
     * 056. 综合场景：heldValue被WeakSet引用+GC（WeakSet不影响heldValue强引用）
     */
    async test056_HeldValueReferencedByWeakSetGC() {
        "use strict";
        let capturedHeldValue = null;
        const heldValue = {};
        const weakSet = new WeakSet([heldValue]);
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, heldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== heldValue) throw new Error(`Test056失败：WeakSet引用的heldValue被释放（实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueReferencedByWeakSetGCTest056";
    },

    /**
     * 057. 综合场景：token被深度修改属性后+取消+GC（token属性深度修改不影响取消）
     */
    async test057_TokenDeepModifiedPropertiesUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            const token = { id: 1, nested: { data: "original" } };
            registry.register(target, "deep-modified-token-held", token);
            return token;
        };

        const token = executeRegistration();
        token.id = 999;
        token.nested.data = "modified";
        token.nested.newProp = { deep: "added" };
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test057失败：token深度修改后取消失效（实际: ${callbackCalled}`);
        return "Test Passed: TokenDeepModifiedPropertiesUnregisterGCTest057";
    },

    /**
     * 058. 综合场景：heldValue替换原型链后+GC（完整原型链修改不影响heldValue）
     */
    async test058_HeldValueReplacePrototypeChainGC() {
        "use strict";
        let capturedHeldValue = null;
        const heldValue = {};
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, heldValue);
        };

        executeRegistration();
        const newProto1 = { method1: () => "proto1" };
        const newProto2 = { method2: () => "proto2" };
        Object.setPrototypeOf(newProto1, newProto2);
        Object.setPrototypeOf(heldValue, newProto1);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = heldValue.method1() === "proto1" && heldValue.method2() === "proto2";
        if (!isValid) throw new Error(`Test058失败：heldValue原型链替换后失效（实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueReplacePrototypeChainGCTest058";
    },

    /**
     * 059. 综合场景：target为不可扩展对象（Object.preventExtensions）+注册+GC（可回收）
     */
    async test059_NonExtensibleTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = { nonExtensible: true };
            Object.preventExtensions(target);
            registry.register(target, "non-extensible-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test059失败：不可扩展对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NonExtensibleTargetRegisterGCTest059";
    },

    /**
     * 060. 综合场景：token为不可扩展对象+注册+取消+GC（不可扩展token可取消）
     */
    async test060_NonExtensibleTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const token = { nonExtensible: true };
            Object.preventExtensions(token);
            const target = {};
            registry.register(target, "non-extensible-token-held", token);
            return token;
        };

        const token = executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test060失败：不可扩展token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NonExtensibleTokenUnregisterGCTest060";
    },

    /**
     * 061. 综合场景：多个target先后注册+先后释放+GC（回调按释放顺序触发）
     */
    async test061_MultipleTargetsSequentialReleaseGC() {
        "use strict";
        const callbackOrder = [];
        const callback = (hv) => { callbackOrder.push(hv); };
        const registry = new FinalizationRegistry(callback);
        const targets = [];

        const executeRegistration = () => {
            for (let i = 1; i <= 4; i++) {
                const target = {};
                targets.push({ target, held: `target-${i}` });
                registry.register(target, `target-${i}`);
            }
        };

        executeRegistration();

        targets[1].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        targets[3].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        targets[0].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        targets[2].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const expectedOrder = ["target-2", "target-4", "target-1", "target-3"];
        if (JSON.stringify(callbackOrder) !== JSON.stringify(expectedOrder)) throw new Error(`Test061失败：回调触发顺序异常（预期: ${expectedOrder}，实际: ${callbackOrder}`);
        return "Test Passed: MultipleTargetsSequentialReleaseGCTest061";
    },


    /**
     * 064. 综合场景：注册后延迟20ms取消+GC（延迟取消仍有效）
     */
    async test064_Delayed20msUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = {};

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "delayed-20ms-unregister-held", token);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 20));
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test064失败：延迟20ms取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: Delayed20msUnregisterGCTest064";
    },


    /**
     * 068. 综合场景：target为Intl.DateTimeFormat实例（复杂格式）+注册+GC
     */
    async test068_ComplexIntlDateTimeFormatTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Intl.DateTimeFormat('zh-CN', {
                dateStyle: 'full',
                timeStyle: 'long',
                timeZone: 'Asia/Shanghai'
            });
            registry.register(target, "complex-intl-datetime-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test068失败：复杂格式的Intl.DateTimeFormat实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ComplexIntlDateTimeFormatTargetRegisterGCTest068";
    },



    /**
     * 070. 综合场景：token为Intl.Collator实例（复杂排序规则）+注册+取消+GC
     */
    async test070_ComplexIntlCollatorTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Intl.Collator('zh-CN', {
            sensitivity: 'accent',
            caseFirst: 'upper'
        });

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "complex-intl-collator-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test070失败：复杂排序规则的Intl.Collator实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ComplexIntlCollatorTokenUnregisterGCTest070";
    },

    /**
     * 071. 综合场景：target为Intl.PluralRules实例（多语言复数）+注册+GC
     */
    async test071_MultiLangIntlPluralRulesTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Intl.PluralRules('ar-EG', { type: 'ordinal' });
            registry.register(target, "multi-lang-intl-plural-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test071失败：多语言复数规则的Intl.PluralRules实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: MultiLangIntlPluralRulesTargetRegisterGCTest071";
    },



    /**
     * 073. 综合场景：token为Intl.ListFormat实例（多格式列表）+注册+取消+GC
     */
    async test073_MultiFormatIntlListFormatTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Intl.ListFormat('fr-CA', {
            type: 'disjunction',
            style: 'narrow'
        });

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "multi-format-intl-list-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test073失败：多格式列表的Intl.ListFormat实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: MultiFormatIntlListFormatTokenUnregisterGCTest073";
    },

    /**
     * 074. 综合场景：target为Uint16Array实例（大尺寸）+注册+GC
     */
    async test074_LargeUint16ArrayTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Uint16Array(1024);
            for (let i = 0; i < target.length; i++) target[i] = i % 65535;
            registry.register(target, "large-uint16array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test074失败：大尺寸Uint16Array实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: LargeUint16ArrayTargetRegisterGCTest074";
    },

    /**
     * 075. 综合场景：heldValue为Int32Array实例（填充数据）+注册+GC
     */
    async test075_HeldValueAsFilledInt32ArrayGC() {
        "use strict";
        let capturedTypedArray = null;
        const intArray = new Int32Array(512);
        intArray.fill(100);
        intArray[100] = -200;
        intArray[200] = 300;
        const callback = (hv) => { capturedTypedArray = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, intArray);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedTypedArray instanceof Int32Array &&
            capturedTypedArray[100] === -200 && capturedTypedArray[200] === 300;
        if (!isValid) throw new Error(`Test075失败：填充数据的Int32Array实例作为heldValue失效（实际: ${capturedTypedArray}`);
        return "Test Passed: HeldValueAsFilledInt32ArrayGCTest075";
    },

    /**
     * 076. 综合场景：token为Uint32Array实例（随机数据）+注册+取消+GC
     */
    async test076_RandomDataUint32ArrayTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Uint32Array(256);
        for (let i = 0; i < token.length; i++) token[i] = Math.floor(Math.random() * 4294967295);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "random-uint32array-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test076失败：随机数据的Uint32Array实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: RandomDataUint32ArrayTokenUnregisterGCTest076";
    },

    /**
     * 077. 综合场景：target为Float32Array实例（精度测试数据）+注册+GC
     */
    async test077_PrecisionFloat32ArrayTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Float32Array([0.1, 0.2, 0.3, 0.1 + 0.2]);
            registry.register(target, "precision-float32array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test077失败：精度测试数据的Float32Array实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: PrecisionFloat32ArrayTargetRegisterGCTest077";
    },

    /**
     * 078. 综合场景：heldValue为BigUint64Array实例（大数值）+注册+GC
     */
    async test078_HeldValueAsBigUint64ArrayWithLargeNumbersGC() {
        "use strict";
        let capturedTypedArray = null;
        const bigArray = new BigUint64Array([9876543210123456789n, 1234567890987654321n]);
        const callback = (hv) => { capturedTypedArray = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, bigArray);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedTypedArray instanceof BigUint64Array &&
            capturedTypedArray[0] === 9876543210123456789n;
        if (!isValid) throw new Error(`Test078失败：大数值的BigUint64Array实例作为heldValue失效（实际: ${capturedTypedArray}`);
        return "Test Passed: HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078";
    },

    /**
     * 079. 综合场景：token为BigInt64Array实例（正负大数值）+注册+取消+GC
     */
    async test079_BigInt64ArrayWithPosNegTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new BigInt64Array([-9876543210123456789n, 1234567890987654321n]);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "bigint64-posneg-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test079失败：正负大数值的BigInt64Array实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: BigInt64ArrayWithPosNegTokenUnregisterGCTest079";
    },

    /**
     * 080. 综合场景：target为ArrayBuffer实例（共享数据）+注册+GC
     */
    async test080_ArrayBufferWithSharedDataTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const buffer = new ArrayBuffer(16);
            const view1 = new Uint8Array(buffer);
            const view2 = new Float32Array(buffer);
            view1.fill(255);
            view2[2] = 1.234;
            registry.register(buffer, "arraybuffer-shared-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test080失败：共享数据的ArrayBuffer实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ArrayBufferWithSharedDataTargetRegisterGCTest080";
    },

    /**
     * 081. 综合场景：heldValue为SharedArrayBuffer实例（原子操作）+注册+GC
     */
    async test081_HeldValueAsSharedArrayBufferWithAtomicsGC() {
        "use strict";
        if (typeof SharedArrayBuffer !== "function" || typeof Atomics !== "object") return "Test Skipped: SharedArrayBuffer/Atomics not supported";

        let capturedBuffer = null;
        const buffer = new SharedArrayBuffer(4);
        const view = new Int32Array(buffer);
        Atomics.store(view, 0, 100);
        const callback = (hv) => { capturedBuffer = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, buffer);
        };

        executeRegistration();
        Atomics.add(view, 0, 50);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedBuffer instanceof SharedArrayBuffer && Atomics.load(new Int32Array(capturedBuffer), 0) === 150;
        if (!isValid) throw new Error(`Test081失败：原子操作的SharedArrayBuffer实例作为heldValue失效（实际: ${capturedBuffer}`);
        return "Test Passed: HeldValueAsSharedArrayBufferWithAtomicsGCTest081";
    },

    /**
     * 082. 综合场景：token为ArrayBuffer实例（多视图操作）+注册+取消+GC
     */
    async test082_ArrayBufferWithMultiViewTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new ArrayBuffer(32);
        const view1 = new Uint16Array(token);
        const view2 = new DataView(token);
        view1.set([1, 2, 3, 4]);
        view2.setFloat64(8, 123.456);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "arraybuffer-multiview-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test082失败：多视图操作的ArrayBuffer实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ArrayBufferWithMultiViewTokenUnregisterGCTest082";
    },

    /**
     * 083. 综合场景：target为Proxy代理的Map实例（带拦截器）+注册+GC
     */
    async test083_ProxyMapWithInterceptorTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const originalMap = new Map();
            originalMap.set("key", "value");
            const proxyTarget = new Proxy(originalMap, {
                get(target, prop) {
                    return prop === "intercepted" ? "yes" : target[prop];
                }
            });
            registry.register(proxyTarget, "proxy-map-interceptor-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test083失败：带拦截器的Proxy-Map实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ProxyMapWithInterceptorTargetRegisterGCTest083";
    },

    /**
     * 086. 综合场景：同一target多次注册不同token，取消中间token+GC（不影响前后注册）
     */
    async test086_UnregisterMiddleTokenForSameTargetGC() {
        "use strict";
        let capturedHeldValue = null;
        const finalHeldValue = "final-middle-token-held";
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);
        const token1 = {};
        const token2 = {};
        const token3 = {};

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "early-held", token1);
            registry.register(target, "middle-held", token2);
            registry.register(target, finalHeldValue, token3);
        };

        executeRegistration();
        registry.unregister(token2);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== finalHeldValue) throw new Error(`Test086失败：取消中间token后未接收最终heldValue（实际: ${capturedHeldValue}`);
        return "Test Passed: UnregisterMiddleTokenForSameTargetGCTest086";
    },

    /**
     * 087. 综合场景：heldValue为带闭包变量的普通函数+注册+GC
     */
    async test087_HeldValueAsFunctionWithClosureGC() {
        "use strict";
        let capturedFn = null;
        const closureVar = "test-closure";
        const addFn = (a) => a + closureVar;
        const callback = (hv) => { capturedFn = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, addFn);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedFn === "function" && capturedFn("val-") === "val-test-closure";
        if (!isValid) throw new Error(`Test087失败：带闭包的普通函数作为heldValue失效（实际: ${capturedFn}`);
        return "Test Passed: HeldValueAsFunctionWithClosureGCTest087";
    },

    /**
     * 088. 综合场景：target为带自定义原型链的对象+注册+GC（原型链不影响回收）
     */
    async test088_CustomPrototypeChainTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const baseProto = { baseMethod: () => "base" };
            const subProto = Object.create(baseProto);
            subProto.subMethod = () => "sub";
            const target = Object.create(subProto);
            target.prop = "custom";
            registry.register(target, "custom-proto-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test088失败：带自定义原型链的对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: CustomPrototypeChainTargetRegisterGCTest088";
    },

    /**
     * 089. 综合场景：token为带方法的普通对象，修改方法后取消+GC（方法修改不影响取消）
     */
    async test089_TokenWithModifiedMethodUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const token = {
                id: 1,
                getValue: () => "original"
            };
            const target = {};
            registry.register(target, "token-modified-method-held", token);
            return token;
        };

        const token = executeRegistration();
        token.getValue = () => "modified";
        token.newMethod = () => "added";
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || token.getValue() !== "modified") throw new Error(`Test089失败：修改方法的token取消异常（实际: ${callbackCalled}，方法返回: ${token.getValue()}`);
        return "Test Passed: TokenWithModifiedMethodUnregisterGCTest089";
    },

    /**
     * 090. 综合场景：heldValue为WeakSet实例（含多个自定义对象）+注册+GC
     */
    async test090_HeldValueAsWeakSetWithMultiObjectsGC() {
        "use strict";
        let capturedWeakSet = null;
        const weakSet = new WeakSet();
        const obj1 = { a: 1 };
        const obj2 = { b: 2 };
        const obj3 = { c: 3 };
        weakSet.add(obj1);
        weakSet.add(obj2);
        weakSet.add(obj3);
        const callback = (hv) => { capturedWeakSet = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, weakSet);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedWeakSet instanceof WeakSet && capturedWeakSet.has(obj1) && capturedWeakSet.has(obj2);
        if (!isValid) throw new Error(`Test090失败：含多个对象的WeakSet作为heldValue失效（实际: ${capturedWeakSet}`);
        return "Test Passed: HeldValueAsWeakSetWithMultiObjectsGCTest090";
    },

    /**
     * 091. 综合场景：target为AggregateError实例（含多个不同类型错误）+注册+GC
     */
    async test091_AggregateErrorWithMultiErrorTypesTargetRegisterGC() {
        "use strict";
        if (typeof AggregateError !== "function") return "Test Skipped: AggregateError not supported";

        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const errors = [
                new TypeError("type-error"),
                new RangeError("range-error"),
                new SyntaxError("syntax-error")
            ];
            const target = new AggregateError(errors, "multi-type-aggregate");
            registry.register(target, "aggregate-multi-error-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test091失败：含多类型错误的AggregateError实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: AggregateErrorWithMultiErrorTypesTargetRegisterGCTest091";
    },

    /**
     * 092. 综合场景：token为ReferenceError实例，修改错误属性后取消+GC
     */
    async test092_ReferenceErrorTokenWithModifiedPropsUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new ReferenceError("original-message");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "ref-error-token-held", token);
        };

        executeRegistration();
        token.message = "modified-message";
        token.customProp = "added-prop";
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || token.message !== "modified-message" || token.customProp !== "added-prop") throw new Error(`Test092失败：修改属性的ReferenceError token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: ReferenceErrorTokenWithModifiedPropsUnregisterGCTest092";
    },

    /**
     * 093. 综合场景：heldValue为Date实例，修改时间后GC（时间修改不影响实例完整性）
     */
    async test093_HeldValueAsDateWithModifiedTimeGC() {
        "use strict";
        let capturedDate = null;
        const date = new Date("2024-01-01");
        const callback = (hv) => { capturedDate = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, date);
        };

        executeRegistration();
        date.setFullYear(2025);
        date.setMonth(5);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedDate instanceof Date && capturedDate.getFullYear() === 2025 && capturedDate.getMonth() === 5;
        if (!isValid) throw new Error(`Test093失败：修改时间的Date实例作为heldValue失效（实际: ${capturedDate}`);
        return "Test Passed: HeldValueAsDateWithModifiedTimeGCTest093";
    },

    /**
     * 094. 综合场景：target为RegExp实例（带多行+忽略大小写标志）+注册+GC
     */
    async test094_RegExpWithMULTILINECaseInsensitiveTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = /^test$/gmi;
            registry.register(target, "regex-multi-flag-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test094失败：带多标志的RegExp实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: RegExpWithMULTILINECaseInsensitiveTargetRegisterGCTest094";
    },

    /**
     * 095. 综合场景：token为Set实例，删除部分元素后取消+GC（元素删除不影响取消）
     */
    async test095_SetWithRemovedElementsTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Set([1, 2, 3, 4, 5]);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "set-removed-elem-token-held", token);
        };

        executeRegistration();
        token.delete(2);
        token.delete(4);
        token.add(6);
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(1) || !token.has(6) || token.has(2)) throw new Error(`Test095失败：修改元素的Set token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: SetWithRemovedElementsTokenUnregisterGCTest095";
    },

    /**
     * 096. 综合场景：heldValue为Map实例，修改键值对后GC（键值修改不影响实例）
     */
    async test096_HeldValueAsMapWithModifiedEntriesGC() {
        "use strict";
        let capturedMap = null;
        const map = new Map([["a", 1], ["b", 2], ["c", 3]]);
        const callback = (hv) => { capturedMap = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, map);
        };

        executeRegistration();
        map.set("b", 22);
        map.delete("c");
        map.set("d", 4);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedMap instanceof Map && capturedMap.get("b") === 22 && capturedMap.has("d") && !capturedMap.has("c");
        if (!isValid) throw new Error(`Test096失败：修改键值的Map实例作为heldValue失效（实际: ${capturedMap}`);
        return "Test Passed: HeldValueAsMapWithModifiedEntriesGCTest096";
    },

    /**
     * 097. 综合场景：target为WeakMap实例，删除部分键后GC（键删除不影响回收）
     */
    async test097_WeakMapWithRemovedKeysTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new WeakMap();
            const key1 = {};
            const key2 = {};
            const key3 = {};
            target.set(key1, "val1");
            target.set(key2, "val2");
            target.set(key3, "val3");
            target.delete(key2);
            registry.register(target, "weakmap-removed-keys-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test097失败：删除键的WeakMap实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: WeakMapWithRemovedKeysTargetRegisterGCTest097";
    },

    /**
     * 098. 综合场景：token为非全局Symbol实例，关联对象后取消+GC
     */
    async test098_NonGlobalSymbolTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = Symbol("non-global-token");
        const gObj = { sym: token };

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "non-global-symbol-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || gObj.sym !== token) throw new Error(`Test098失败：非全局Symbol token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: NonGlobalSymbolTokenUnregisterGCTest098";
    },

    /**
     * 099. 综合场景：heldValue为带默认参数的箭头函数+注册+GC
     */
    async test099_HeldValueAsArrowFunctionWithDefaultParamsGC() {
        "use strict";
        let capturedArrowFn = null;
        const arrowFn = (a, b = 10, c = 20) => a + b + c;
        const callback = (hv) => { capturedArrowFn = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, arrowFn);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedArrowFn === "function" && capturedArrowFn(5) === 35 && capturedArrowFn(5, 5) === 30;
        if (!isValid) throw new Error(`Test099失败：带默认参数的箭头函数作为heldValue失效（实际: ${capturedArrowFn}`);
        return "Test Passed: HeldValueAsArrowFunctionWithDefaultParamsGCTest099";
    },

    /**
     * 100. 综合场景：target为动态添加多个方法的对象+注册+GC
     */
    async test100_DynamicMultiMethodObjectTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = { base: "prop" };
            target.method1 = () => "method1";
            target.method2 = (x) => x * 2;
            target.method3 = async () => "async-method3";
            registry.register(target, "dynamic-multi-method-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test100失败：动态添加多方法的对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: DynamicMultiMethodObjectTargetRegisterGCTest100";
    },

    /**
     * 101. 综合场景：token为冻结对象（Object.freeze），取消后验证属性+GC
     */
    async test101_FrozenObjectTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = Object.freeze({ id: 101, frozen: true });

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "frozen-token-held", token);
        };

        executeRegistration();

        try {
            token.id = 999;
        } catch (e) {}
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || token.id !== 101) throw new Error(`Test101失败：冻结对象token取消异常（实际: ${callbackCalled}，id: ${token.id}`);
        return "Test Passed: FrozenObjectTokenUnregisterGCTest101";
    },

    /**
     * 102. 综合场景：heldValue为循环引用的复杂嵌套对象+注册+GC
     */
    async test102_HeldValueAsComplexCircularObjectGC() {
        "use strict";
        let capturedCircularObj = null;
        const objA = { name: "A" };
        const objB = { name: "B" };
        const objC = { name: "C" };

        objA.ref = objB;
        objB.ref = objC;
        objC.ref = objA;
        objA.nested = { inner: objC };
        const callback = (hv) => { capturedCircularObj = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, objA);
        };

        executeRegistration();
        objA.name = "Modified A";
        objC.nestedInner = "added";
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedCircularObj.name === "Modified A" && capturedCircularObj.ref.ref.ref === capturedCircularObj && objC.nestedInner === "added";
        if (!isValid) throw new Error(`Test102失败：循环引用的复杂对象作为heldValue失效（实际: ${capturedCircularObj}`);
        return "Test Passed: HeldValueAsComplexCircularObjectGCTest102";
    },

    /**
     * 103. 综合场景：target为带getter/setter属性的对象+注册+GC
     */
    async test103_ObjectWithGetterSetterTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            let innerVal = 10;
            const target = {
                get value() { return innerVal; },
                set value(val) { innerVal = val * 2; }
            };
            target.value = 20;
            registry.register(target, "getter-setter-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test103失败：带getter/setter的对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ObjectWithGetterSetterTargetRegisterGCTest103";
    },

    /**
     * 104. 综合场景：token为带静态方法的自定义类+注册+取消+GC
     */
    async test104_CustomClassWithStaticMethodTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        class StaticClass {
            static staticMethod(x) { return x * 10; }
            constructor(id) { this.id = id; }
        }
        const token = new StaticClass(104);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "static-class-token-held", token);
        };

        executeRegistration();
        const staticResult = StaticClass.staticMethod(5);
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || staticResult !== 50 || token.id !== 104) throw new Error(`Test104失败：带静态方法的自定义类token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: CustomClassWithStaticMethodTokenUnregisterGCTest104";
    },

    /**
     * 105. 综合场景：heldValue为Promise.reject返回的错误实例+注册+GC
     */
    async test105_HeldValueAsRejectedPromiseErrorGC() {
        "use strict";
        let capturedRejectedPromise = null;
        const error = new Error("reject-error");
        const rejectedPromise = Promise.reject(error);
        const callback = (hv) => { capturedRejectedPromise = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, rejectedPromise);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedRejectedPromise instanceof Promise;
        let errorCaptured = false;
        try {
            await capturedRejectedPromise;
        } catch (e) {
            errorCaptured = e === error;
        }
        if (!isValid || !errorCaptured) throw new Error(`Test105失败：Promise.reject的错误实例作为heldValue失效（实际: ${capturedRejectedPromise}`);
        return "Test Passed: HeldValueAsRejectedPromiseErrorGCTest105";
    },

    /**
     * 106. 综合场景：target为嵌套数组（含复杂对象和原始值）+注册+GC
     */
    async test106_NestedArrayWithMixedValuesTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = [
                1,
                "string",
                { obj: "val" },
                [2, 3, [4, 5]],
                Symbol("array-sym"),
                true
            ];
            registry.register(target, "nested-mixed-array-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test106失败：嵌套混合类型数组target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NestedArrayWithMixedValuesTargetRegisterGCTest106";
    },

    /**
     * 107. 综合场景：token为RegExp实例（带全局标志），执行匹配后取消+GC
     */
    async test107_RegExpWithGlobalFlagUsedTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = /test/g;

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "regex-global-used-token-held", token);
        };

        executeRegistration();

        token.test("test test");
        const lastIndex = token.lastIndex;
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || token.lastIndex !== lastIndex) throw new Error(`Test107失败：执行匹配的全局RegExp token取消异常（实际: ${callbackCalled}，lastIndex: ${token.lastIndex}`);
        return "Test Passed: RegExpWithGlobalFlagUsedTokenUnregisterGCTest107";
    },

    /**
     * 108. 综合场景：heldValue为自定义类的单例实例+注册+GC
     */
    async test108_HeldValueAsCustomClassSingletonGC() {
        "use strict";
        let capturedSingleton = null;
        class SingletonClass {
            constructor() {
                if (SingletonClass.instance) return SingletonClass.instance;
                this.id = 108;
                SingletonClass.instance = this;
            }
            getValue() { return this.id; }
        }
        const singleton = new SingletonClass();
        const callback = (hv) => { capturedSingleton = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, singleton);
        };

        executeRegistration();
        singleton.id = 208;
        const newInstance = new SingletonClass();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedSingleton === singleton && newInstance === singleton && capturedSingleton.getValue() === 208;
        if (!isValid) throw new Error(`Test108失败：自定义类单例实例作为heldValue失效（实际: ${capturedSingleton}`);
        return "Test Passed: HeldValueAsCustomClassSingletonGCTest108";
    },

    /**
     * 109. 综合场景：target为带闭包的对象方法（方法依赖外部变量）+注册+GC
     */
    async test109_ObjectMethodWithClosureTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const externalVar = "external";
            const target = {
                method() { return externalVar + "-method"; },
                getExternal() { return externalVar; }
            };
            registry.register(target, "object-method-closure-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test109失败：带闭包的对象方法target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ObjectMethodWithClosureTargetRegisterGCTest109";
    },

    /**
     * 110. 综合场景：token为Date实例（UTC时间），修改时区相关属性后取消+GC
     */
    async test110_UTCDateTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Date(Date.UTC(2024, 0, 1, 0, 0, 0));

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "utc-date-token-held", token);
        };

        executeRegistration();
        token.setUTCHours(12);
        token.setUTCSeconds(30);
        const utcTime = token.toISOString();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || token.toISOString() !== utcTime) throw new Error(`Test110失败：UTC时间Date token取消异常（实际: ${callbackCalled}，时间: ${token.toISOString()}`);
        return "Test Passed: UTCDateTokenUnregisterGCTest110";
    },

    /**
     * 111. 综合场景：heldValue为Set实例（含Symbol和对象元素）+注册+GC
     */
    async test111_HeldValueAsSetWithSymbolAndObjectsGC() {
        "use strict";
        let capturedSet = null;
        const sym1 = Symbol("set-sym1");
        const sym2 = Symbol("set-sym2");
        const obj1 = { sym: sym1 };
        const obj2 = { sym: sym2 };
        const set = new Set([sym1, sym2, obj1, obj2]);
        const callback = (hv) => { capturedSet = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, set);
        };

        executeRegistration();
        obj1.updated = true;
        set.delete(sym2);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedSet instanceof Set && capturedSet.has(sym1) && capturedSet.has(obj1) && obj1.updated && !capturedSet.has(sym2);
        if (!isValid) throw new Error(`Test111失败：含Symbol和对象的Set实例作为heldValue失效（实际: ${capturedSet}`);
        return "Test Passed: HeldValueAsSetWithSymbolAndObjectsGCTest111";
    },

    /**
     * 112. 综合场景：target为Map实例（键为Date对象）+注册+GC
     */
    async test112_MapWithDateKeysTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Map();
            const date1 = new Date("2024-01-01");
            const date2 = new Date("2024-02-01");
            const date3 = new Date("2024-03-01");
            target.set(date1, "jan");
            target.set(date2, "feb");
            target.set(date3, "mar");
            registry.register(target, "map-date-keys-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test112失败：键为Date对象的Map实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: MapWithDateKeysTargetRegisterGCTest112";
    },

    /**
     * 113. 综合场景：token为WeakSet实例（含自定义类实例），添加新实例后取消+GC
     */
    async test113_WeakSetWithCustomClassInstancesTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new WeakSet();

        class TestClass { constructor(id) { this.id = id; } }
        const instance1 = new TestClass(1);
        const instance2 = new TestClass(2);
        token.add(instance1);
        token.add(instance2);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "weakset-custom-instances-token-held", token);
        };

        executeRegistration();
        const instance3 = new TestClass(3);
        token.add(instance3);
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(instance1) || !token.has(instance3)) throw new Error(`Test113失败：含自定义类实例的WeakSet token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: WeakSetWithCustomClassInstancesTokenUnregisterGCTest113";
    },

    /**
     * 114. 综合场景：heldValue为带剩余参数的函数+注册+GC
     */
    async test114_HeldValueAsFunctionWithRestParamsGC() {
        "use strict";
        let capturedRestFn = null;
        const restFn = (a, ...rest) => rest.reduce((sum, val) => sum + val, a);
        const callback = (hv) => { capturedRestFn = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, restFn);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedRestFn === "function" && capturedRestFn(1, 2, 3, 4) === 10;
        if (!isValid) throw new Error(`Test114失败：带剩余参数的函数作为heldValue失效（实际: ${capturedRestFn}`);
        return "Test Passed: HeldValueAsFunctionWithRestParamsGCTest114";
    },

    /**
     * 115. 综合场景：target为不可扩展且密封的对象（双重限制）+注册+GC
     */
    async test115_NonExtensibleAndSealedTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = { prop: "double-limit" };
            Object.seal(target);
            Object.preventExtensions(target);
            registry.register(target, "non-extensible-sealed-held");
        };

        executeRegistration();

        try {
            target.newProp = "added";
        } catch (e) {}
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test115失败：不可扩展且密封的对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NonExtensibleAndSealedTargetRegisterGCTest115";
    },

    /**
     * 116. 综合场景：heldValue为bind绑定上下文的函数+注册+GC
     */
    async test116_HeldValueAsBoundFunctionGC() {
        "use strict";
        let capturedBoundFn = null;
        const obj = { x: 10 };
        const addFn = function(y) { return this.x + y; };
        const boundFn = addFn.bind(obj);
        const callback = (hv) => { capturedBoundFn = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, boundFn);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedBoundFn === "function" && capturedBoundFn(5) === 15;
        if (!isValid) throw new Error(`Test116失败：bind绑定的函数作为heldValue失效（实际: ${capturedBoundFn}`);
        return "Test Passed: HeldValueAsBoundFunctionGCTest116";
    },

    /**
     * 117. 综合场景：target为自定义错误类实例（继承Error）+注册+GC
     */
    async test117_CustomErrorClassInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        class CustomError extends Error {
            constructor(message) {
                super(message);
                this.name = "CustomError";
                this.code = "CUSTOM_ERR";
            }
        }

        const executeRegistration = () => {
            const target = new CustomError("custom-error-message");
            registry.register(target, "custom-error-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test117失败：自定义错误类实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: CustomErrorClassInstanceTargetRegisterGCTest117";
    },



    /**
     * 119. 综合场景：heldValue为类的私有方法（通过闭包暴露）+注册+GC
     */
    async test119_HeldValueAsClassPrivateMethodViaClosureGC() {
        "use strict";
        let capturedPrivateMethod = null;
        class TestClass {
            #privateMethod(x) { return x * 100; }
            getPrivateMethod() { return (x) => this.#privateMethod(x); }
        }
        const instance = new TestClass();
        const exposedPrivateMethod = instance.getPrivateMethod();
        const callback = (hv) => { capturedPrivateMethod = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, exposedPrivateMethod);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedPrivateMethod === "function" && capturedPrivateMethod(5) === 500;
        if (!isValid) throw new Error(`Test119失败：类的私有方法（闭包暴露）作为heldValue失效（实际: ${capturedPrivateMethod}`);
        return "Test Passed: HeldValueAsClassPrivateMethodViaClosureGCTest119";
    },

    /**
     * 120. 综合场景：target为数组flat操作后的嵌套数组+注册+GC
     */
    async test120_FlattenedNestedArrayTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = [1, [2, [3, 4], 5]].flat(2);
            registry.register(target, "flattened-array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test120失败：扁平化嵌套数组target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: FlattenedNestedArrayTargetRegisterGCTest120";
    },

    /**
     * 121. 综合场景：token为WeakMap实例（键为自定义类实例），添加新键后取消+GC
     */
    async test121_WeakMapWithCustomClassKeysTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new WeakMap();

        class KeyClass { constructor(id) { this.id = id; } }
        const key1 = new KeyClass(1);
        const key2 = new KeyClass(2);
        token.set(key1, "val1");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "weakmap-custom-keys-token-held", token);
        };

        executeRegistration();
        token.set(key2, "val2");
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(key1) || !token.has(key2)) throw new Error(`Test121失败：键为自定义类实例的WeakMap token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: WeakMapWithCustomClassKeysTokenUnregisterGCTest121";
    },

    /**
     * 122. 综合场景：heldValue为BigInt实例（超大数值）+注册+GC
     */
    async test122_HeldValueAsLargeBigIntGC() {
        "use strict";
        let capturedBigInt = null;
        const largeBigInt = 987654321098765432109876543210n;
        const callback = (hv) => { capturedBigInt = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, largeBigInt);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedBigInt === "bigint" && capturedBigInt === 987654321098765432109876543210n;
        if (!isValid) throw new Error(`Test122失败：超大数值BigInt作为heldValue失效（实际: ${capturedBigInt}`);
        return "Test Passed: HeldValueAsLargeBigIntGCTest122";
    },

    /**
     * 123. 综合场景：target为数组fill操作后的固定值数组+注册+GC
     */
    async test123_FilledFixedValueArrayTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Array(5).fill("fixed-value");
            registry.register(target, "filled-array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test123失败：fill填充的固定值数组target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: FilledFixedValueArrayTargetRegisterGCTest123";
    },

    /**
     * 124. 综合场景：token为Symbol作为属性名的对象，添加新属性后取消+GC
     */
    async test124_ObjectWithSymbolPropertiesTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const sym1 = Symbol("prop1");
        const sym2 = Symbol("prop2");
        const token = {
            [sym1]: "val1",
            normalProp: "normal"
        };

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "object-symbol-props-token-held", token);
        };

        executeRegistration();
        token[sym2] = "val2";
        token.normalProp = "modified-normal";
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || token[sym1] !== "val1" || token[sym2] !== "val2") throw new Error(`Test124失败：含Symbol属性的对象token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: ObjectWithSymbolPropertiesTokenUnregisterGCTest124";
    },

    /**
     * 125. 综合场景：heldValue为Promise.prototype.finally绑定的函数+注册+GC
     */
    async test125_HeldValueAsPromiseFinallyBoundFunctionGC() {
        "use strict";
        let capturedFinallyFn = null;
        const logFn = () => "finally-executed";
        const boundFinally = Promise.prototype.finally.bind(Promise.resolve(), logFn);
        const callback = (hv) => { capturedFinallyFn = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, boundFinally);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedFinallyFn === "function";
        let finallyResult = false;
        try {
            const promise = capturedFinallyFn();
            finallyResult = await promise.then(() => true);
        } catch (e) {}
        if (!isValid || !finallyResult) throw new Error(`Test125失败：Promise.finally绑定的函数作为heldValue失效（实际: ${capturedFinallyFn}`);
        return "Test Passed: HeldValueAsPromiseFinallyBoundFunctionGCTest125";
    },

    /**
     * 126. 综合场景：target为继承Map的自定义类实例+注册+GC
     */
    async test126_InheritedMapCustomClassInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        class CustomMap extends Map {
            constructor() {
                super();
                this.customProp = "map-inherit";
            }
            customMethod() { return this.customProp + "-method"; }
        }

        const executeRegistration = () => {
            const target = new CustomMap();
            target.set("key", "val");
            registry.register(target, "inherited-map-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test126失败：继承Map的自定义类实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: InheritedMapCustomClassInstanceTargetRegisterGCTest126";
    },

    /**
     * 127. 综合场景：token为RegExp实例（Unicode标志+复杂模式），执行匹配后取消+GC
     */
    async test127_RegExpUnicodeComplexPatternTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = /[\p{L}\p{N}]+/gu;

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "regex-unicode-token-held", token);
        };

        executeRegistration();
        const testStr = "测试123 Test456 テスト789";
        const matches = [...testStr.matchAll(token)];
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || matches.length !== 3) throw new Error(`Test127失败：Unicode标志的复杂RegExp token取消异常（实际: ${callbackCalled}，匹配数: ${matches.length}`);
        return "Test Passed: RegExpUnicodeComplexPatternTokenUnregisterGCTest127";
    },

    /**
     * 128. 综合场景：heldValue为数组filter操作后的筛选结果+注册+GC
     */
    async test128_HeldValueAsFilteredArrayGC() {
        "use strict";
        let capturedFilteredArray = null;
        const originalArray = [1, 2, 3, 4, 5, 6, 7, 8];
        const filteredArray = originalArray.filter(item => item % 2 === 0);
        const callback = (hv) => { capturedFilteredArray = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, filteredArray);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = Array.isArray(capturedFilteredArray) && capturedFilteredArray.join(",") === "2,4,6,8";
        if (!isValid) throw new Error(`Test128失败：filter筛选后的数组作为heldValue失效（实际: ${capturedFilteredArray}`);
        return "Test Passed: HeldValueAsFilteredArrayGCTest128";
    },

    /**
     * 129. 综合场景：target为带静态属性的自定义类+注册+GC
     */
    async test129_CustomClassWithStaticPropertiesTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        class ClassWithStaticProps {
            static staticProp = "static-value";
            static staticMethod() { return this.staticProp; }
            constructor(id) { this.id = id; }
        }

        const executeRegistration = () => {
            const target = new ClassWithStaticProps(129);
            registry.register(target, "static-props-class-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test129失败：带静态属性的自定义类实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: CustomClassWithStaticPropertiesTargetRegisterGCTest129";
    },

    /**
     * 130. 综合场景：token为WeakSet实例（含错误实例），添加新错误后取消+GC
     */
    async test130_WeakSetWithErrorInstancesTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new WeakSet();
        const err1 = new Error("err1");
        const err2 = new TypeError("err2");
        token.add(err1);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "weakset-error-instances-token-held", token);
        };

        executeRegistration();
        token.add(err2);
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(err1) || !token.has(err2)) throw new Error(`Test130失败：含错误实例的WeakSet token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: WeakSetWithErrorInstancesTokenUnregisterGCTest130";
    },

    /**
     * 131. 综合场景：heldValue为数组map操作后的转换结果+注册+GC
     */
    async test131_HeldValueAsMappedArrayGC() {
        "use strict";
        let capturedMappedArray = null;
        const originalArray = [1, 2, 3, 4];
        const mappedArray = originalArray.map(item => ({ value: item * 10 }));
        const callback = (hv) => { capturedMappedArray = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, mappedArray);
        };

        executeRegistration();
        mappedArray[1].value = 200;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = Array.isArray(capturedMappedArray) && capturedMappedArray[1].value === 200 && capturedMappedArray[3].value === 40;
        if (!isValid) throw new Error(`Test131失败：map转换后的数组作为heldValue失效（实际: ${capturedMappedArray}`);
        return "Test Passed: HeldValueAsMappedArrayGCTest131";
    },

    /**
     * 132. 综合场景：target为日期对象数组（含不同时区日期）+注册+GC
     */
    async test132_ArrayOfDateObjectsTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = [
                new Date("2024-01-01T00:00:00"),
                new Date("2024-06-01T12:00:00"),
                new Date(Date.UTC(2024, 11, 31))
            ];
            registry.register(target, "date-array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test132失败：日期对象数组target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ArrayOfDateObjectsTargetRegisterGCTest132";
    },

    /**
     * 133. 综合场景：token为Map实例（键为BigInt），添加新键值后取消+GC
     */
    async test133_MapWithBigIntKeysTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Map();
        const key1 = 100n;
        const key2 = 200n;
        token.set(key1, "val1");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "map-bigint-keys-token-held", token);
        };

        executeRegistration();
        token.set(key2, "val2");
        token.set(300n, "val3");
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(key1) || !token.has(300n)) throw new Error(`Test133失败：键为BigInt的Map token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: MapWithBigIntKeysTokenUnregisterGCTest133";
    },

    /**
     * 134. 综合场景：heldValue为数组reduce操作后的累加结果+注册+GC
     */
    async test134_HeldValueAsReducedArrayResultGC() {
        "use strict";
        let capturedReducedResult = null;
        const array = [10, 20, 30, 40];
        const reducedResult = array.reduce((acc, curr) => {
            acc.sum += curr;
            acc.items.push(curr);
            return acc;
        }, { sum: 0, items: [] });
        const callback = (hv) => { capturedReducedResult = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, reducedResult);
        };

        executeRegistration();
        reducedResult.sum += 50;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedReducedResult.sum === 150 && capturedReducedResult.items.length === 4;
        if (!isValid) throw new Error(`Test134失败：reduce累加结果作为heldValue失效（实际: ${capturedReducedResult}`);
        return "Test Passed: HeldValueAsReducedArrayResultGCTest134";
    },

    /**
     * 135. 综合场景：target为带私有字段的继承类实例+注册+GC
     */
    async test135_InheritedClassWithPrivateFieldsTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        class ParentClass {
            #parentPrivate = "parent-private";
            getParentPrivate() { return this.#parentPrivate; }
        }

        class ChildClass extends ParentClass {
            #childPrivate = "child-private";
            getChildPrivate() { return this.#childPrivate; }
        }

        const executeRegistration = () => {
            const target = new ChildClass();
            registry.register(target, "inherited-private-fields-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test135失败：带私有字段的继承类实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: InheritedClassWithPrivateFieldsTargetRegisterGCTest135";
    },

    /**
     * 136. 综合场景：token为Set实例（含BigInt和Symbol混合元素），删除元素后取消+GC
     */
    async test136_SetWithBigIntSymbolMixedTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Set();
        const sym = Symbol("set-mixed");
        const bigInt = 123n;
        token.add(sym);
        token.add(bigInt);
        token.add("string");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "set-mixed-elements-token-held", token);
        };

        executeRegistration();
        token.delete("string");
        token.add(456n);
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(sym) || !token.has(456n)) throw new Error(`Test136失败：BigInt和Symbol混合的Set token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: SetWithBigIntSymbolMixedTokenUnregisterGCTest136";
    },

    /**
     * 137. 综合场景：heldValue为函数call调用绑定上下文后的结果+注册+GC
     */
    async test137_HeldValueAsFunctionCallBoundContextGC() {
        "use strict";
        let capturedCallResult = null;
        const context = { a: 5 };
        const multiplyFn = function(b) { return this.a * b; };
        const callResult = () => multiplyFn.call(context, 10);
        const callback = (hv) => { capturedCallResult = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, callResult);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedCallResult === "function" && capturedCallResult() === 50;
        if (!isValid) throw new Error(`Test137失败：call绑定上下文的函数结果作为heldValue失效（实际: ${capturedCallResult}`);
        return "Test Passed: HeldValueAsFunctionCallBoundContextGCTest137";
    },

    /**
     * 138. 综合场景：target为数组sort操作后的排序结果+注册+GC
     */
    async test138_SortedArrayTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = [3, 1, 4, 1, 5, 9, 2, 6].sort((a, b) => a - b);
            registry.register(target, "sorted-array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test138失败：排序后的数组target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: SortedArrayTargetRegisterGCTest138";
    },

    /**
     * 139. 综合场景：token为带方法的数组（修改数组原型），添加方法后取消+GC
     */
    async test139_ArrayWithPrototypeMethodsTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = [1, 2, 3];


        token.sum = function() { return this.reduce((a, b) => a + b, 0); };

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "array-proto-methods-token-held", token);
        };

        executeRegistration();
        token.double = function() { return this.map(item => item * 2); };
        const sumResult = token.sum();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || sumResult !== 6 || !token.double) throw new Error(`Test139失败：带自定义方法的数组token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: ArrayWithPrototypeMethodsTokenUnregisterGCTest139";
    },

    /**
     * 140. 综合场景：heldValue为自定义迭代器实例+注册+GC
     */
    async test140_HeldValueAsCustomIteratorGC() {
        "use strict";
        let capturedIterator = null;
        const customIterator = {
            items: [10, 20, 30],
            [Symbol.iterator]() {
                let index = 0;
                return {
                    next: () => {
                        if (index < this.items.length) {
                            return { value: this.items[index++], done: false };
                        } else {
                            return { done: true };
                        }
                    }
                };
            }
        };
        const callback = (hv) => { capturedIterator = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, customIterator);
        };

        executeRegistration();
        customIterator.items.push(40);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedIterator[Symbol.iterator] && [...capturedIterator].join(",") === "10,20,30,40";
        if (!isValid) throw new Error(`Test140失败：自定义迭代器作为heldValue失效（实际: ${capturedIterator}`);
        return "Test Passed: HeldValueAsCustomIteratorGCTest140";
    },


    /**
     * 142. 综合场景：token为WeakMap实例（键为日期对象），删除键后取消+GC
     */
    async test142_WeakMapWithDateKeysTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new WeakMap();
        const key1 = new Date("2024-01-01");
        const key2 = new Date("2024-02-01");
        token.set(key1, "val1");
        token.set(key2, "val2");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "weakmap-date-keys-token-held", token);
        };

        executeRegistration();
        token.delete(key2);
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(key1) || token.has(key2)) throw new Error(`Test142失败：键为日期对象的WeakMap token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: WeakMapWithDateKeysTokenUnregisterGCTest142";
    },

    /**
     * 143. 综合场景：heldValue为数组join操作后的字符串+注册+GC
     */
    async test143_HeldValueAsArrayJoinedStringGC() {
        "use strict";
        let capturedJoinedString = null;
        const array = ["a", "b", "c", "d"];
        const joinedString = array.join("-");
        const callback = (hv) => { capturedJoinedString = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, joinedString);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedJoinedString === "string" && capturedJoinedString === "a-b-c-d";
        if (!isValid) throw new Error(`Test143失败：数组join后的字符串作为heldValue失效（实际: ${capturedJoinedString}`);
        return "Test Passed: HeldValueAsArrayJoinedStringGCTest143";
    },



    /**
     * 145. 综合场景：token为Set实例（含日期对象），添加新日期后取消+GC
     */
    async test145_SetWithDateObjectsTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Set();
        const date1 = new Date("2024-01-01");
        const date2 = new Date("2024-06-01");
        token.add(date1);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "set-date-objects-token-held", token);
        };

        executeRegistration();
        token.add(date2);
        token.add(new Date("2024-12-31"));
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled || !token.has(date1) || !token.has(date2)) throw new Error(`Test145失败：含日期对象的Set token取消异常（实际: ${callbackCalled}`);
        return "Test Passed: SetWithDateObjectsTokenUnregisterGCTest145";
    }
};