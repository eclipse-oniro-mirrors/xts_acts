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
export const FinalizationRegistryRegisterUtils = {
    /**
     * 001. 有效注册：target为对象，heldValue为字符串（无unregisterToken）
     * 核心特性：target是对象、heldValue与target不同，注册成功
     */
    test001_ValidRegisterObjectTarget() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "valid-held-value";
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test001失败：有效参数注册失败（target: 对象，heldValue: 字符串）`);
        }
        return "Test Passed: ValidRegisterObjectTargetTest001";
    },

    /**
     * 002. 有效注册：target为非注册Symbol
     * 核心特性：target支持非注册Symbol，符合参数类型要求
     */
    test002_ValidRegisterSymbolTarget() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = Symbol("non-registered-symbol");
        const heldValue = 123;
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test002失败：非注册Symbol作为target注册失败`);
        }
        return "Test Passed: ValidRegisterSymbolTargetTest002";
    },

    /**
     * 003. 无效注册：heldValue与target相同（抛TypeError）
     * 核心特性：heldValue不能等于target，否则抛出TypeError
     */
    test003_InvalidRegisterHeldValueEqualsTarget() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        let errorCaught = false;

        try {
            registry.register(target, target);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test003失败：heldValue与target相同时未抛出TypeError`);
        }
        return "Test Passed: InvalidRegisterHeldValueEqualsTargetTest003";
    },

    /**
     * 004. 有效注册：unregisterToken为对象
     * 核心特性：unregisterToken是对象，支持后续取消注册
     */
    test004_ValidRegisterWithObjectToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = { data: "held" };
        const unregisterToken = {};
        let registerSuccess = false;

        try {
            registry.register(target, heldValue, unregisterToken);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test004失败：unregisterToken为对象时注册失败`);
        }
        return "Test Passed: ValidRegisterWithObjectTokenTest004";
    },

    /**
     * 005. 有效注册：unregisterToken为非注册Symbol
     * 核心特性：unregisterToken支持非注册Symbol，符合类型要求
     */
    test005_ValidRegisterWithSymbolToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "symbol-token-held";
        const unregisterToken = Symbol("token-symbol");
        let registerSuccess = false;

        try {
            registry.register(target, heldValue, unregisterToken);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test005失败：unregisterToken为非注册Symbol时注册失败`);
        }
        return "Test Passed: ValidRegisterWithSymbolTokenTest005";
    },

    /**
     * 006. 无效注册：target为primitive类型（字符串）
     * 核心特性：target必须是对象或非注册Symbol，primitive类型抛TypeError
     */
    test006_InvalidRegisterPrimitiveTarget() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = "primitive-string";
        const heldValue = 456;
        let errorCaught = false;

        try {
            registry.register(target, heldValue);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test006失败：target为primitive类型时未抛出TypeError`);
        }
        return "Test Passed: InvalidRegisterPrimitiveTargetTest006";
    },

    /**
     * 007. 无效注册：unregisterToken为primitive类型（数字）
     * 核心特性：unregisterToken必须是对象或非注册Symbol，primitive类型抛TypeError
     */
    test007_InvalidRegisterPrimitiveToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "invalid-token-held";
        const unregisterToken = 789;
        let errorCaught = false;

        try {
            registry.register(target, heldValue, unregisterToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test007失败：unregisterToken为primitive类型时未抛出TypeError`);
        }
        return "Test Passed: InvalidRegisterPrimitiveTokenTest007";
    },

    /**
     * 008. 有效注册：不提供unregisterToken（无法取消注册）
     * 核心特性：unregisterToken可选，不提供时注册成功但无法取消
     */
    test008_ValidRegisterWithoutToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = new Map();
        const heldValue = () => "no-token-held";
        let registerSuccess = false;

        try {
            const returnValue = registry.register(target, heldValue);
            registerSuccess = returnValue === undefined;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test008失败：不提供unregisterToken时注册失败或返回值异常`);
        }
        return "Test Passed: ValidRegisterWithoutTokenTest008";
    },

    /**
     * 009. 有效注册：heldValue为对象（非target）
     * 核心特性：heldValue可是对象，只要与target不同即可
     */
    test009_ValidRegisterHeldValueAsObject() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = { name: "held-object" };
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test009失败：heldValue为非target对象时注册失败`);
        }
        return "Test Passed: ValidRegisterHeldValueAsObjectTest009";
    },

    /**
     * 010. 有效注册：同一target多次注册
     * 核心特性：支持同一target重复注册，无报错
     */
    test010_ValidRegisterSameTargetMultipleTimes() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        let registerCount = 0;

        try {
            registry.register(target, "first-held");
            registerCount++;
            registry.register(target, "second-held", target);
            registerCount++;
        } catch (e) {
            registerCount = -1;
        }

        if (registerCount !== 2) {
            throw new Error(`Test010失败：同一target多次注册失败（注册次数: ${registerCount}`);
        }
        return "Test Passed: ValidRegisterSameTargetMultipleTimesTest010";
    },

    /**
     * 011. 有效注册：heldValue为undefined（与target不同）
     * 核心特性：heldValue支持undefined，只要与target不同即可正常注册
     */
    test011_ValidRegisterHeldValueAsUndefined() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = undefined;
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test011失败：heldValue为undefined且与target不同时注册失败`);
        }
        return "Test Passed: ValidRegisterHeldValueAsUndefinedTest011";
    },

    /**
     * 012. 无效注册：unregisterToken为null（primitive类型，抛TypeError）
     * 核心特性：unregisterToken必须是对象或非注册Symbol，null为无效类型
     */
    test012_InvalidRegisterTokenAsNull() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "null-token-held";
        const unregisterToken = null;
        let errorCaught = false;

        try {
            registry.register(target, heldValue, unregisterToken);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test012失败：unregisterToken为null时未抛出TypeError`);
        }
        return "Test Passed: InvalidRegisterTokenAsNullTest012";
    },

    /**
     * 013. 有效注册：target为Array实例（对象类型）
     * 核心特性：target支持Array实例，符合“对象”类型要求
     */
    test013_ValidRegisterTargetAsArray() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = [1, 2, 3];
        const heldValue = "array-target-held";
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test013失败：target为Array实例时注册失败`);
        }
        return "Test Passed: ValidRegisterTargetAsArrayTest013";
    },

    /**
     * 014. 有效注册：同一target多次注册不同token（最后一次token生效）
     * 核心特性：同一target重复注册不同token，后续取消仅响应最后一次token
     */
    test014_ValidRegisterSameTargetDifferentTokens() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const token1 = { id: "token1" };
        const token2 = { id: "token2" };
        let registerCount = 0;

        try {
            registry.register(target, "held1", token1);
            registerCount++;
            registry.register(target, "held2", token2);
            registerCount++;
        } catch (e) {
            registerCount = -1;
        }

        if (registerCount !== 2) {
            throw new Error(`Test014失败：同一target不同token多次注册失败（注册次数: ${registerCount}`);
        }
        return "Test Passed: ValidRegisterSameTargetDifferentTokensTest014";
    },

    /**
     * 015. 有效注册：heldValue为循环引用对象（与target不同）
     * 核心特性：heldValue支持循环引用对象，只要与target不同即可注册
     */
    test015_ValidRegisterHeldValueCircular() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = {};
        heldValue.self = heldValue;
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test015失败：heldValue为循环引用对象且与target不同时注册失败`);
        }
        return "Test Passed: ValidRegisterHeldValueCircularTest015";
    },

    /**
     * 016. 验证注册返回值始终为undefined
     * 核心特性：无论参数如何，register()返回值均为undefined
     */
    test016_RegisterReturnValueAlwaysUndefined() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "return-undefined-held";
        const token = {};
        let returnValue1, returnValue2;

        try {
            returnValue1 = registry.register(target, heldValue);
            returnValue2 = registry.register(target, heldValue, token);
        } catch (e) {
            throw new Error(`Test016失败：注册过程抛出异常`);
        }

        if (returnValue1 !== undefined || returnValue2 !== undefined) {
            throw new Error(`Test016失败：注册返回值非undefined（无token: ${returnValue1}，有token: ${returnValue2}`);
        }
        return "Test Passed: RegisterReturnValueAlwaysUndefinedTest016";
    },

    /**
     * 017. 有效注册：target为冻结对象（Object.freeze）
     * 核心特性：target为冻结对象时，仍可正常注册
     */
    test017_ValidRegisterTargetAsFrozenObject() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = Object.freeze({ data: "frozen" });
        const heldValue = "frozen-target-held";
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test017失败：target为冻结对象时注册失败`);
        }
        return "Test Passed: ValidRegisterTargetAsFrozenObjectTest017";
    },

    /**
     * 019. 有效注册：heldValue为BigInt（与target不同）
     * 核心特性：heldValue支持BigInt类型，只要与target不同即可注册
     */
    test019_ValidRegisterHeldValueAsBigInt() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = 12345n;
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test019失败：heldValue为BigInt且与target不同时注册失败`);
        }
        return "Test Passed: ValidRegisterHeldValueAsBigIntTest019";
    },

    /**
     * 020. 有效注册：unregisterToken为冻结对象
     * 核心特性：unregisterToken为冻结对象时，仍可正常注册
     */
    test020_ValidRegisterTokenAsFrozenObject() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "frozen-token-held";
        const unregisterToken = Object.freeze({ id: "frozen-token" });
        let registerSuccess = false;

        try {
            registry.register(target, heldValue, unregisterToken);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test020失败：unregisterToken为冻结对象时注册失败`);
        }
        return "Test Passed: ValidRegisterTokenAsFrozenObjectTest020";
    },

    /**
     * 021. 有效注册：target为Date实例（对象类型）
     * 核心特性：target支持Date实例，符合“对象”类型要求
     */
    test021_ValidRegisterTargetAsDate() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = new Date();
        const heldValue = "date-target-held";
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test021失败：target为Date实例时注册失败`);
        }
        return "Test Passed: ValidRegisterTargetAsDateTest021";
    },

    /**
     * 022. 无效注册：target为undefined（primitive类型，抛TypeError）
     * 核心特性：target必须是对象或非注册Symbol，undefined为无效类型
     */
    test022_InvalidRegisterTargetAsUndefined() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = undefined;
        const heldValue = "undefined-target-held";
        let errorCaught = false;

        try {
            registry.register(target, heldValue);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test022失败：target为undefined时未抛出TypeError`);
        }
        return "Test Passed: InvalidRegisterTargetAsUndefinedTest022";
    },

    /**
     * 023. 有效注册：heldValue为RegExp实例（与target不同）
     * 核心特性：heldValue支持RegExp实例，只要与target不同即可注册
     */
    test023_ValidRegisterHeldValueAsRegExp() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = /test-regex/;
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test023失败：heldValue为RegExp实例且与target不同时注册失败`);
        }
        return "Test Passed: ValidRegisterHeldValueAsRegExpTest023";
    },

    /**
     * 024. 有效注册：同一token关联多个target
     * 核心特性：同一unregisterToken可用于多个target注册，无报错
     */
    test024_ValidRegisterMultipleTargetsWithSameToken() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target1 = {};
        const target2 = {};
        const sharedToken = {};
        let registerCount = 0;

        try {
            registry.register(target1, "held1", sharedToken);
            registerCount++;
            registry.register(target2, "held2", sharedToken);
            registerCount++;
        } catch (e) {
            registerCount = -1;
        }

        if (registerCount !== 2) {
            throw new Error(`Test024失败：同一token关联多个target注册失败（注册次数: ${registerCount}`);
        }
        return "Test Passed: ValidRegisterMultipleTargetsWithSameTokenTest024";
    },

    /**
     * 025. 无效注册：register方法this绑定错误（非FinalizationRegistry实例）
     * 核心特性：register方法必须通过FinalizationRegistry实例调用，this绑定错误抛TypeError
     */
    test025_InvalidRegisterThisBinding() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "this-binding-held";
        const unboundRegister = registry.register;
        let errorCaught = false;

        try {
            unboundRegister(target, heldValue);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test025失败：register方法this绑定错误时未抛出TypeError`);
        }
        return "Test Passed: InvalidRegisterThisBindingTest025";
    },

    /**
     * 026. 有效注册：target为类实例（自定义对象）
     * 核心特性：target支持自定义类实例，符合“对象”类型要求
     */
    test026_ValidRegisterTargetAsClassInstance() {
        "use strict";
        class CustomClass {}
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = new CustomClass();
        const heldValue = "class-instance-held";
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test026失败：target为自定义类实例时注册失败`);
        }
        return "Test Passed: ValidRegisterTargetAsClassInstanceTest026";
    },

    /**
     * 027. 有效注册：heldValue为函数（与target不同）
     * 核心特性：heldValue支持函数类型，只要与target不同即可注册
     */
    test027_ValidRegisterHeldValueAsFunction() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = () => "held-function";
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test027失败：heldValue为函数且与target不同时注册失败`);
        }
        return "Test Passed: ValidRegisterHeldValueAsFunctionTest027";
    },


    /**
     * 029. 有效注册：unregisterToken为非注册Symbol（冻结）
     * 核心特性：unregisterToken为冻结的非注册Symbol时，可正常注册
     */
    test029_ValidRegisterTokenAsFrozenSymbol() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = {};
        const heldValue = "frozen-symbol-token-held";
        const unregisterToken = Object.freeze(Symbol("frozen-token-symbol"));
        let registerSuccess = false;

        try {
            registry.register(target, heldValue, unregisterToken);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test029失败：unregisterToken为冻结非注册Symbol时注册失败`);
        }
        return "Test Passed: ValidRegisterTokenAsFrozenSymbolTest029";
    },

    /**
     * 030. 有效注册：target为RegExp实例（对象类型）
     * 核心特性：target支持RegExp实例，符合“对象”类型要求
     */
    test030_ValidRegisterTargetAsRegExp() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);
        const target = /target-regex/;
        const heldValue = "regex-target-held";
        let registerSuccess = false;

        try {
            registry.register(target, heldValue);
            registerSuccess = true;
        } catch (e) {
            registerSuccess = false;
        }

        if (!registerSuccess) {
            throw new Error(`Test030失败：target为RegExp实例时注册失败`);
        }
        return "Test Passed: ValidRegisterTargetAsRegExpTest030";
    }
};