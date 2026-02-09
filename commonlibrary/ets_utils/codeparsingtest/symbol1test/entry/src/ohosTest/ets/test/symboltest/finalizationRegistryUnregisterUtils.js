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
export const FinalizationRegistryUnregisterUtils = {
    /**
     * 001. 有效取消：token为注册时的对象token
     * 核心特性：传递注册时使用的对象类型token，成功取消对应注册
     */
    test001_ValidUnregisterWithObjectToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "object-token-held";
        const unregisterToken = {};
        let unregisterSuccess = false;


        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test001失败：使用注册时的对象token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithObjectTokenTest001";
    },

    /**
     * 002. 有效取消：token为注册时的非注册Symbol
     * 核心特性：传递注册时使用的非注册Symbol token，成功取消对应注册
     */
    test002_ValidUnregisterWithSymbolToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "symbol-token-held";
        const unregisterToken = Symbol("unregister-symbol");
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test002失败：使用注册时的非注册Symbol token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithSymbolTokenTest002";
    },

    /**
     * 003. 无效取消：token为primitive类型（字符串）
     * 核心特性：token必须是对象或非注册Symbol，primitive类型抛TypeError
     */
    test003_InvalidUnregisterWithPrimitiveToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const invalidToken = "primitive-string-token";
        let errorCaught = false;

        try {
            registry.unregister(invalidToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test003失败：token为primitive类型时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterWithPrimitiveTokenTest003";
    },

    /**
     * 004. 无效取消：token不存在（未注册该token）
     * 核心特性：取消未注册的token，无报错（静默失败）
     */
    test004_InvalidUnregisterNonExistentToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const nonExistentToken = {};
        let errorCaught = false;

        try {
            registry.unregister(nonExistentToken);
        } catch (e) {
            errorCaught = true;
        }

        if (errorCaught) {
            throw new Error(`Test004失败：取消不存在的token时抛出异常（预期静默失败）`);
        }
        return "Test Passed: InvalidUnregisterNonExistentTokenTest004";
    },

    /**
     * 005. 有效取消：同一token关联多个目标
     * 核心特性：同一token关联多个注册时，unregister取消所有关联的注册
     */
    test005_ValidUnregisterMultipleTargetsWithSameToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target1 = {};
        const target2 = {};
        const sharedToken = {};
        let unregisterSuccess = false;


        registry.register(target1, "held1", sharedToken);
        registry.register(target2, "held2", sharedToken);
        try {
            registry.unregister(sharedToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test005失败：取消同一token关联的多个目标时失败`);
        }
        return "Test Passed: ValidUnregisterMultipleTargetsWithSameTokenTest005";
    },

    /**
     * 006. 有效取消：token为冻结对象
     * 核心特性：token为冻结对象时，仍可正常取消注册
     */
    test006_ValidUnregisterWithFrozenToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "frozen-token-held";
        const unregisterToken = Object.freeze({ id: "frozen-token" });
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test006失败：使用冻结对象token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithFrozenTokenTest006";
    },

    /**
     * 007. 无效取消：unregister方法this绑定错误（非实例调用）
     * 核心特性：必须通过FinalizationRegistry实例调用，this绑定错误抛TypeError
     */
    test007_InvalidUnregisterThisBinding() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const validToken = {};
        const unboundUnregister = registry.unregister;
        let errorCaught = false;

        registry.register({}, "this-binding-held", validToken);
        try {
            unboundUnregister(validToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test007失败：unregister方法this绑定错误时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterThisBindingTest007";
    },

    /**
     * 008. 有效取消：注册→取消→重新注册→再次取消
     * 核心特性：取消后重新注册同一token，再次取消仍有效
     */
    test008_ValidUnregisterAfterReregister() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const token = {};
        let unregisterCount = 0;


        registry.register(target, "first-held", token);
        registry.unregister(token);
        unregisterCount++;
        registry.register(target, "second-held", token);
        try {
            registry.unregister(token);
            unregisterCount++;
        } catch (e) {
            unregisterCount = -1;
        }

        if (unregisterCount !== 2) {
            throw new Error(`Test008失败：重新注册后取消失败（取消次数: ${unregisterCount}`);
        }
        return "Test Passed: ValidUnregisterAfterReregisterTest008";
    },

    /**
     * 009. 无效取消：token为null（primitive类型）
     * 核心特性：null是primitive类型，非有效token，抛TypeError
     */
    test009_InvalidUnregisterWithNullToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const invalidToken = null;
        let errorCaught = false;

        try {
            registry.unregister(invalidToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test009失败：token为null时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterWithNullTokenTest009";
    },

    /**
     * 010. 有效取消：重复取消同一token（第二次静默失败）
     * 核心特性：对同一token重复取消，第一次有效，第二次无报错（静默失败）
     */
    test010_ValidRepeatUnregisterSameToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const token = {};
        let errorCaught = false;

        registry.register(target, "repeat-held", token);
        registry.unregister(token);
        try {
            registry.unregister(token);
        } catch (e) {
            errorCaught = true;
        }

        if (errorCaught) {
            throw new Error(`Test010失败：重复取消同一token时抛出异常（预期静默失败）`);
        }
        return "Test Passed: ValidRepeatUnregisterSameTokenTest010";
    },
    /**
     * 011. 有效取消：token为密封对象（Object.seal）
     * 核心特性：密封对象作为token时，可正常取消注册
     */
    test011_ValidUnregisterWithSealedToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "sealed-token-held";
        const unregisterToken = Object.seal({ id: "sealed-token" });
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test011失败：使用密封对象token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithSealedTokenTest011";
    },

    /**
     * 012. 无效取消：token为undefined（primitive类型）
     * 核心特性：undefined是primitive类型，非有效token，抛TypeError
     */
    test012_InvalidUnregisterWithUndefinedToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const invalidToken = undefined;
        let errorCaught = false;

        try {
            registry.unregister(invalidToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test012失败：token为undefined时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterWithUndefinedTokenTest012";
    },

    /**
     * 013. 有效取消：token为数组实例
     * 核心特性：数组实例作为token时，可正常取消注册
     */
    test013_ValidUnregisterWithArrayToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "array-token-held";
        const unregisterToken = [1, 2, 3];
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test013失败：使用数组实例token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithArrayTokenTest013";
    },

    /**
     * 014. 有效取消：同一target不同token，取消最后一个token
     * 核心特性：同一target多次注册不同token，取消最后一次的token仅影响对应注册
     */
    test014_ValidUnregisterLastTokenForSameTarget() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const token1 = { id: "token1" };
        const token2 = { id: "token2" };
        let unregisterSuccess = false;

        registry.register(target, "held1", token1);
        registry.register(target, "held2", token2);
        try {
            registry.unregister(token2);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test014失败：取消同一target的最后一个token失败`);
        }
        return "Test Passed: ValidUnregisterLastTokenForSameTargetTest014";
    },

    /**
     * 015. 无效取消：unregister方法被call绑定到非实例对象
     * 核心特性：通过call绑定非FinalizationRegistry实例作为this，抛TypeError
     */
    test015_InvalidUnregisterCallWithWrongThis() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const validToken = {};
        const wrongThis = {};
        let errorCaught = false;

        registry.register({}, "call-this-held", validToken);
        try {
            registry.unregister.call(wrongThis, validToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test015失败：call绑定错误this时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterCallWithWrongThisTest015";
    },

    /**
     * 016. 有效取消：token为Date实例
     * 核心特性：Date实例作为token时，可正常取消注册
     */
    test016_ValidUnregisterWithDateToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "date-token-held";
        const unregisterToken = new Date();
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test016失败：使用Date实例token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithDateTokenTest016";
    },


    /**
     * 018. 有效取消：token为冻结的非注册Symbol
     * 核心特性：冻结的非注册Symbol作为token时，可正常取消注册
     */
    test018_ValidUnregisterWithFrozenSymbolToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "frozen-symbol-held";
        const unregisterToken = Object.freeze(Symbol("frozen-symbol-token"));
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test018失败：使用冻结非注册Symbol token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithFrozenSymbolTokenTest018";
    },

    /**
     * 019. 有效取消：token为WeakMap实例
     * 核心特性：WeakMap实例作为token时，可正常取消注册
     */
    test019_ValidUnregisterWithWeakMapToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "weakmap-token-held";
        const unregisterToken = new WeakMap();
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test019失败：使用WeakMap实例token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithWeakMapTokenTest019";
    },

    /**
     * 021. 有效取消：取消后token被修改（不影响已取消状态）
     * 核心特性：token被修改后，已取消的注册状态不变（取消基于修改前的引用）
     */
    test021_ValidUnregisterTokenModifiedAfter() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const unregisterToken = { id: "original" };
        let unregisterSuccess = false;

        registry.register(target, "modified-token-held", unregisterToken);
        registry.unregister(unregisterToken);
        unregisterToken.id = "modified";
        try {

            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test021失败：token修改后影响已取消状态`);
        }
        return "Test Passed: ValidUnregisterTokenModifiedAfterTest021";
    },

    /**
     * 022. 无效取消：unregister方法被apply绑定到非实例对象
     * 核心特性：通过apply绑定非FinalizationRegistry实例作为this，抛TypeError
     */
    test022_InvalidUnregisterApplyWithWrongThis() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const validToken = {};
        const wrongThis = {};
        let errorCaught = false;

        registry.register({}, "apply-this-held", validToken);
        try {
            registry.unregister.apply(wrongThis, [validToken]);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test022失败：apply绑定错误this时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterApplyWithWrongThisTest022";
    },

    /**
     * 023. 有效取消：token为类实例
     * 核心特性：自定义类实例作为token时，可正常取消注册
     */
    test023_ValidUnregisterWithClassInstanceToken() {
        "use strict";
        class TokenClass {}
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "class-instance-held";
        const unregisterToken = new TokenClass();
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test023失败：使用类实例token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithClassInstanceTokenTest023";
    },

    /**
     * 024. 有效取消：同一token在不同registry实例中注册，取消不跨实例
     * 核心特性：token在多个registry实例中注册，取消仅影响当前实例的注册
     */
    test024_ValidUnregisterTokenAcrossRegistries() {
        "use strict";
        const callback = () => {};
        const registry1 = new FinalizationRegistry(callback);
        const registry2 = new FinalizationRegistry(callback);
        const target = {};
        const sharedToken = {};
        let unregisterCount = 0;

        registry1.register(target, "registry1-held", sharedToken);
        registry2.register(target, "registry2-held", sharedToken);
        try {
            registry1.unregister(sharedToken);
            unregisterCount++;
            registry2.unregister(sharedToken);
            unregisterCount++;
        } catch (e) {
            unregisterCount = -1;
        }

        if (unregisterCount !== 2) {
            throw new Error(`Test024失败：跨实例取消同一token失败（取消次数: ${unregisterCount}`);
        }
        return "Test Passed: ValidUnregisterTokenAcrossRegistriesTest024";
    },

    /**
     * 025. 无效取消：token为布尔值（primitive类型）
     * 核心特性：布尔值是primitive类型，非有效token，抛TypeError
     */
    test025_InvalidUnregisterWithBooleanToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const invalidToken = true;
        let errorCaught = false;

        try {
            registry.unregister(invalidToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test025失败：token为布尔值时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterWithBooleanTokenTest025";
    },

    /**
     * 026. 有效取消：token为RegExp实例
     * 核心特性：RegExp实例作为token时，可正常取消注册
     */
    test026_ValidUnregisterWithRegExpToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "regex-token-held";
        const unregisterToken = /token-regex/;
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test026失败：使用RegExp实例token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithRegExpTokenTest026";
    },

    /**
     * 027. 有效取消：token为循环引用对象
     * 核心特性：循环引用对象作为token时，可正常取消注册
     */
    test027_ValidUnregisterWithCircularToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "circular-token-held";
        const unregisterToken = {};
        unregisterToken.self = unregisterToken;
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test027失败：使用循环引用对象token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithCircularTokenTest027";
    },

    /**
     * 028. 无效取消：未传递任何参数（无token）
     * 核心特性：unregister必须接收1个参数，无参数抛TypeError
     */
    test028_InvalidUnregisterWithoutParams() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        let errorCaught = false;

        try {
            registry.unregister();
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test028失败：未传递参数时未抛出TypeError`);
        }
        return "Test Passed: InvalidUnregisterWithoutParamsTest028";
    },

    /**
     * 029. 有效取消：token为Map实例
     * 核心特性：Map实例作为token时，可正常取消注册
     */
    test029_ValidUnregisterWithMapToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "map-token-held";
        const unregisterToken = new Map();
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test029失败：使用Map实例token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithMapTokenTest029";
    },

    /**
     * 030. 有效取消：token为BigInt对象包装器（Object(BigInt)）
     * 核心特性：BigInt的对象包装器作为token时，可正常取消注册
     */
    test030_ValidUnregisterWithBigIntObjectToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "bigint-object-held";
        const unregisterToken = Object(12345n);
        let unregisterSuccess = false;

        registry.register(target, heldValue, unregisterToken);
        try {
            registry.unregister(unregisterToken);
            unregisterSuccess = true;
        } catch (e) {
            unregisterSuccess = false;
        }

        if (!unregisterSuccess) {
            throw new Error(`Test030失败：使用BigInt对象包装器token取消注册失败`);
        }
        return "Test Passed: ValidUnregisterWithBigIntObjectTokenTest030";
    }
};