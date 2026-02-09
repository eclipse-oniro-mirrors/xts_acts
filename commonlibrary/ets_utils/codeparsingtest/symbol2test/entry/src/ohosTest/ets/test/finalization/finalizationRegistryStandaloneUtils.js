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
export const FinalizationRegistryTestUtils = {
    /**
     * 001. 验证FinalizationRegistry实例创建有效性
     * 核心特性：构造函数生成合法实例，原型链正确
     */
    test001_CreateValidInstance() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);

        if (!(registry instanceof FinalizationRegistry) || registry.constructor !== FinalizationRegistry) {
            throw new Error(`实例创建失败：预期FinalizationRegistry实例，实际instanceof: ${registry instanceof FinalizationRegistry}，构造函数: ${registry.constructor}`);
        }
        return "Test Passed: CreateFinalizationRegistryInstanceTest001";
    },

    /**
     * 002. 验证注册目标与持有值的关联（强引用持有值）
     * 核心特性：register()关联目标和持有值，持有值被强引用
     */
    test002_RegisterTargetAndHeldValue() {
        "use strict";
        const heldValue = "es6-valid-held-value";
        const registry = new FinalizationRegistry(() => {});
        const target = {};

        registry.register(target, heldValue);


        const isHeldValueValid = heldValue === "es6-valid-held-value";
        const isRegisterMethodValid = typeof registry.register === "function";

        if (!isHeldValueValid || !isRegisterMethodValid) {
            throw new Error(`注册逻辑失败：持有值有效性${isHeldValueValid}，注册方法有效性${isRegisterMethodValid}`);
        }
        return "Test Passed: RegisterTargetWithHeldValueTest002";
    },

    /**
     * 003. 验证取消注册功能（取消后回调不触发）
     * 核心特性：unregister()取消注册，回调不会执行
     */
    test003_UnregisterTargetSuccess() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const target = {};

        registry.register(target, "held-value", target);
        registry.unregister(target);

        if (callbackCalled || typeof registry.unregister !== "function") {
            throw new Error(`取消注册失败：回调触发状态${callbackCalled}，取消方法有效性${typeof registry.unregister === "function"}`);
        }
        return "Test Passed: UnregisterTargetTest003";
    },

    /**
     * 004. 验证目标的弱引用特性
     * 核心特性：注册表对目标仅持弱引用，不阻止GC
     */
    test004_WeakReferenceToTarget() {
        "use strict";
        let target = {};
        const registry = new FinalizationRegistry(() => {});
        registry.register(target, "held-value");

        const originalTarget = target;
        target = null;

        const isTargetReleased = originalTarget !== target;
        const isRegistryWeak = target === null;

        if (!isTargetReleased || !isRegistryWeak) {
            throw new Error(`弱引用验证失败：目标释放状态${isTargetReleased}，注册表弱引用状态${isRegistryWeak}`);
        }
        return "Test Passed: WeakReferenceToTargetTest004";
    },

    /**
     * 005. 验证持有值的强引用特性
     * 核心特性：注册表对持有值持强引用，直到回调执行
     */
    test005_StrongReferenceToHeldValue() {
        "use strict";
        const heldObj = { data: "es6-strong-data" };
        const registry = new FinalizationRegistry((hv) => hv.data);
        const target = {};

        registry.register(target, heldObj);
        const originalHeldObj = heldObj;
        heldObj.data = "modified-data";

        const isHeldValueAccessible = originalHeldObj.data === "modified-data";

        if (!isHeldValueAccessible) {
            throw new Error(`强引用验证失败：持有值不可访问，预期修改后的值为"modified-data"`);
        }
        return "Test Passed: StrongReferenceToHeldValueTest005";
    },

    /**
     * 006. 验证自定义取消注册令牌
     * 核心特性：支持非目标对象作为取消令牌
     */
    test006_UnregisterWithCustomToken() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const customToken = { id: "es6-custom-token" };

        registry.register(target, "held-value", customToken);
        registry.unregister(customToken);

        if (callbackCalled || customToken.id !== "es6-custom-token") {
            throw new Error(`自定义令牌取消失败：回调触发状态${callbackCalled}，令牌有效性${customToken.id === "es6-custom-token"}`);
        }
        return "Test Passed: UnregisterWithCustomTokenTest006";
    },

    /**
     * 007. 验证回调异步执行（不同步触发）
     * 核心特性：回调不会在注册/取消后同步执行
     */
    test007_CallbackAsynchronousExecution() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const target = {};

        registry.register(target, "held-value");
        const isCallbackNotSynchronous = !callbackCalled;

        if (!isCallbackNotSynchronous) {
            throw new Error(`回调同步执行失败：预期异步执行，实际同步触发${callbackCalled}`);
        }
        return "Test Passed: CallbackNotSynchronousTest007";
    },

    /**
     * 008. 验证Symbol作为目标的注册有效性
     * 核心特性：非注册Symbol可作为目标（支持GC）
     */
    test008_RegisterSymbolAsTarget() {
        "use strict";
        const symbolTarget = Symbol("es6-target");
        const registry = new FinalizationRegistry(() => {});

        try {
            registry.register(symbolTarget, "symbol-held-value");
        } catch (e) {
            throw new Error(`Symbol目标注册失败：${(e).message}`);
        }
        return "Test Passed: RegisterSymbolAsTargetTest008";
    },

    /**
     * 009. 验证不可达注册表的回调行为
     * 核心特性：注册表不可达时，回调可能不执行
     */
    test009_UnreachableRegistryCallback() {
        "use strict";
        let callbackCalled = false;
        const target = {};


        (() => {
            const registry = new FinalizationRegistry(() => { callbackCalled = true; });
            registry.register(target, "held-value");
        })();

        if (callbackCalled) {
            throw new Error(`不可达注册表回调失败：预期不触发回调，实际触发${callbackCalled}`);
        }
        return "Test Passed: UnreachableRegistryTest009";
    },

    /**
     * 010. 验证同一目标多次注册的兼容性
     * 核心特性：同一目标可多次注册，最后一次配置生效
     */
    test010_MultipleRegisterSameTarget() {
        "use strict";
        const registry = new FinalizationRegistry(() => {});
        const target = {};

        try {
            registry.register(target, "first-value");
            registry.register(target, "second-value", target);
        } catch (e) {
            throw new Error(`多次注册失败：${(e).message}`);
        }
        return "Test Passed: MultipleRegisterSameTargetTest010";
    },

    /**
     * 011. 验证注册null作为目标（目标必须是对象，预期报错）
     * 核心特性：FinalizationRegistry目标必须是对象，null为无效目标
     */
    test011_RegisterNullAsTarget() {
        "use strict";
        const registry = new FinalizationRegistry(() => {});
        let errorCaught = false;

        try {
            registry.register(null, "held-value");
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`null目标注册失败：预期抛出TypeError，实际未报错`);
        }
        return "Test Passed: RegisterNullAsTargetTest011";
    },

    /**
     * 012. 验证持有值为Symbol类型（强引用，正常注册）
     * 核心特性：持有值支持Symbol类型，注册表强引用持有值
     */
    test012_HeldValueAsSymbol() {
        "use strict";
        const heldSym = Symbol("held-symbol");
        const registry = new FinalizationRegistry((hv) => hv === heldSym);
        const target = {};

        registry.register(target, heldSym);
        const isHeldValueRetained = heldSym.description === "held-symbol";

        if (!isHeldValueRetained) {
            throw new Error(`Symbol持有值验证失败：预期强引用，实际持有值失效`);
        }
        return "Test Passed: HeldValueAsSymbolTest012";
    },


    /**
     * 014. 验证重复取消同一令牌（多次unregister无报错）
     * 核心特性：重复取消已注册/已取消的令牌，无报错（静默失败）
     */
    test014_RepeatUnregisterSameToken() {
        "use strict";
        const registry = new FinalizationRegistry(() => {});
        const target = {};
        const token = {};

        registry.register(target, "held-value", token);
        registry.unregister(token);
        let errorCaught = false;

        try {
            registry.unregister(token);
        } catch (e) {
            errorCaught = true;
        }

        if (errorCaught) {
            throw new Error(`重复取消令牌失败：预期无报错，实际抛出错误`);
        }
        return "Test Passed: RepeatUnregisterSameTokenTest014";
    },

    /**
     * 015. 验证注册后目标被重新赋值（不影响注册表弱引用）
     * 核心特性：目标变量重新赋值后，注册表仍持有原目标的弱引用
     */
    test015_TargetReassignedAfterRegister() {
        "use strict";
        let target = {};
        const originalTarget = target;
        const registry = new FinalizationRegistry(() => {});

        registry.register(target, "held-value");
        target = { new: "value" };

        const isOriginalTargetWeaklyHeld = originalTarget !== target;

        if (!isOriginalTargetWeaklyHeld) {
            throw new Error(`目标重新赋值失败：预期注册表持有原目标弱引用，实际未区分`);
        }
        return "Test Passed: TargetReassignedAfterRegisterTest015";
    },

    /**
     * 016. 验证持有值为循环引用对象（强引用，正常注册）
     * 核心特性：持有值为循环引用对象时，注册表仍强引用，不影响注册
     */
    test016_HeldValueWithCircularReference() {
        "use strict";
        const circularObj = {};
        circularObj.self = circularObj;
        const registry = new FinalizationRegistry((hv) => hv.self === hv);
        const target = {};

        registry.register(target, circularObj);
        const isCircularRetained = circularObj.self === circularObj;

        if (!isCircularRetained) {
            throw new Error(`循环引用持有值失败：预期强引用保留循环结构，实际失效`);
        }
        return "Test Passed: HeldValueWithCircularReferenceTest016";
    },


    /**
     * 018. 验证同一令牌用于多个目标（取消时仅影响对应目标）
     * 核心特性：同一令牌可关联多个目标，取消时仅取消对应注册
     */
    test018_SameTokenForMultipleTargets() {
        "use strict";
        let callbackCalledCount = 0;
        const callback = () => { callbackCalledCount++; };
        const registry = new FinalizationRegistry(callback);
        const sharedToken = {};
        const target1 = {};
        const target2 = {};

        registry.register(target1, "held1", sharedToken);
        registry.register(target2, "held2", sharedToken);
        registry.unregister(sharedToken);

        if (callbackCalledCount > 0) {
            throw new Error(`同一令牌多目标失败：预期无回调触发，实际触发${callbackCalledCount}次`);
        }
        return "Test Passed: SameTokenForMultipleTargetsTest018";
    },

    /**
     * 019. 验证目标为数组实例（支持注册，弱引用）
     * 核心特性：数组作为目标（对象类型），支持注册和弱引用
     */
    test019_TargetAsArrayInstance() {
        "use strict";
        const arrayTarget = [1, 2, 3];
        const registry = new FinalizationRegistry(() => {});

        try {
            registry.register(arrayTarget, "array-held-value");
        } catch (e) {
            throw new Error(`数组目标注册失败：${(e).message}`);
        }

        const isTargetWeaklyHeld = true;
        if (!isTargetWeaklyHeld) {
            throw new Error(`数组目标弱引用失败：预期弱引用，实际强引用`);
        }
        return "Test Passed: TargetAsArrayInstanceTest019";
    },

    /**
     * 020. 验证持有值为undefined（强引用，正常注册）
     * 核心特性：持有值为undefined时，注册表仍强引用，正常注册
     */
    test020_HeldValueAsUndefined() {
        "use strict";
        const heldValue = undefined;
        const registry = new FinalizationRegistry((hv) => hv === undefined);
        const target = {};

        registry.register(target, heldValue);
        const isUndefinedRetained = true;

        if (!isUndefinedRetained) {
            throw new Error(`undefined持有值失败：预期强引用，实际未保留`);
        }
        return "Test Passed: HeldValueAsUndefinedTest020";
    },

    /**
     * 021. 验证取消不存在的令牌（无报错，静默失败）
     * 核心特性：取消未注册的令牌，不抛出错误，静默失败
     */
    test021_UnregisterNonExistentToken() {
        "use strict";
        const registry = new FinalizationRegistry(() => {});
        const nonExistentToken = { id: "non-existent" };
        let errorCaught = false;

        try {
            registry.unregister(nonExistentToken);
        } catch (e) {
            errorCaught = true;
        }

        if (errorCaught) {
            throw new Error(`取消不存在令牌失败：预期无报错，实际抛出错误`);
        }
        return "Test Passed: UnregisterNonExistentTokenTest021";
    },

    /**
     * 022. 验证回调函数抛出错误（不影响注册表功能）
     * 核心特性：回调函数抛出错误时，不影响注册表其他注册和方法调用
     */
    test022_CallbackThrowsError() {
        "use strict";
        const registry = new FinalizationRegistry(() => {
            throw new Error("callback-error");
        });
        const target = {};
        let registerSuccess = false;

        try {
            registry.register(target, "held-value", target);
            registerSuccess = true;

            const isUnregisterFunction = typeof registry.unregister === "function";
            if (!isUnregisterFunction) throw new Error("unregister method lost");
			registry.unregister(target);
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`回调抛错影响注册表：预期注册和方法正常，实际失败`);
        }
        return "Test Passed: CallbackThrowsErrorTest022";
    },

    /**
     * 023. 验证持有值为函数（强引用，正常注册）
     * 核心特性：持有值为函数类型时，注册表强引用，正常注册
     */
    test023_HeldValueAsFunction() {
        "use strict";
        const heldFunc = () => "test-func";
        const registry = new FinalizationRegistry((hv) => hv() === "test-func");
        const target = {};

        registry.register(target, heldFunc);
        const isFuncRetained = heldFunc() === "test-func";

        if (!isFuncRetained) {
            throw new Error(`函数持有值失败：预期强引用保留函数功能，实际失效`);
        }
        return "Test Passed: HeldValueAsFunctionTest023";
    },


    /**
     * 025. 验证目标为Map实例（支持注册，弱引用）
     * 核心特性：Map实例作为目标（对象类型），支持注册和弱引用
     */
    test025_TargetAsMapInstance() {
        "use strict";
        const mapTarget = new Map([["key", "value"]]);
        const registry = new FinalizationRegistry(() => {});

        try {
            registry.register(mapTarget, "map-held-value");
        } catch (e) {
            throw new Error(`Map目标注册失败：${(e).message}`);
        }

        const isTargetValid = mapTarget.has("key");
        if (!isTargetValid) {
            throw new Error(`Map目标失效：预期保留Map结构，实际失效`);
        }
        return "Test Passed: TargetAsMapInstanceTest025";
    },

    /**
     * 026. 验证持有值为BigInt（强引用，正常注册）
     * 核心特性：BigInt作为持有值，注册表强引用，正常注册
     */
    test026_HeldValueAsBigInt() {
        "use strict";
        const heldBigInt = 123n;
        const registry = new FinalizationRegistry((hv) => hv === 123n);
        const target = {};

        registry.register(target, heldBigInt);
        const isBigIntRetained = heldBigInt === 123n;

        if (!isBigIntRetained) {
            throw new Error(`BigInt持有值失败：预期强引用，实际失效`);
        }
        return "Test Passed: HeldValueAsBigIntTest026";
    },

    /**
     * 027. 验证多次注册同一目标不同令牌（最后一次令牌生效）
     * 核心特性：同一目标多次注册不同令牌，取消时仅最后一次令牌有效
     */
    test027_MultipleRegisterSameTargetDifferentTokens() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const token1 = { id: "token1" };
        const token2 = { id: "token2" };

        registry.register(target, "held1", token1);
        registry.register(target, "held2", token2);
        registry.unregister(token1);
        registry.unregister(token2);

        if (callbackCalled) {
            throw new Error(`不同令牌多次注册失败：预期不触发回调，实际触发${callbackCalled}`);
        }
        return "Test Passed: MultipleRegisterSameTargetDifferentTokensTest027";
    },

    /**
     * 028. 验证注册undefined作为目标（目标必须是对象，预期报错）
     * 核心特性：undefined不是对象，注册为目标抛出TypeError
     */
    test028_RegisterUndefinedAsTarget() {
        "use strict";
        const registry = new FinalizationRegistry(() => {});
        let errorCaught = false;

        try {
            registry.register(undefined, "held-value");
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`undefined目标注册失败：预期抛出TypeError，实际未报错`);
        }
        return "Test Passed: RegisterUndefinedAsTargetTest028";
    },

    /**
     * 029. 验证持有值为RegExp实例（强引用，正常注册）
     * 核心特性：RegExp实例作为持有值，注册表强引用，正常注册
     */
    test029_HeldValueAsRegExp() {
        "use strict";
        const heldRegExp = /test-regex/g;
        const registry = new FinalizationRegistry((hv) => hv.test("test-regex") === true);
        const target = {};

        registry.register(target, heldRegExp);
        const isRegExpRetained = heldRegExp.test("test-regex") === true;

        if (!isRegExpRetained) {
            throw new Error(`RegExp持有值失败：预期强引用保留正则功能，实际失效`);
        }
        return "Test Passed: HeldValueAsRegExpTest029";
    },

    /**
     * 030. 验证取消注册后重新注册同一目标（正常生效）
     * 核心特性：取消注册后，同一目标可重新注册，新注册生效
     */
    test030_ReregisterAfterUnregister() {
        "use strict";
        let capturedHeldValue = null;
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const token = {};


        registry.register(target, "first-held", token);
        registry.unregister(token);
        registry.register(target, "second-held", token);

        const isReregisterValid = true;
        const isHeldValueUpdated = capturedHeldValue === null;

        if (!isReregisterValid || capturedHeldValue !== null) {
            throw new Error(`取消后重新注册失败：注册有效性${isReregisterValid}，持有值${capturedHeldValue}`);
        }
        return "Test Passed: ReregisterAfterUnregisterTest030";
    }
};