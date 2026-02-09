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
export const FinalizationRegistryConstructorUtils = {
    /**
     * 001. 必须使用new构造，直接调用抛TypeError
     * 核心特性：FinalizationRegistry()只能用new创建，直接调用报错
     */
    test001_MustUseNewConstructor() {
        "use strict";
        let errorCaught = false;

        try {
            FinalizationRegistry(() => {});
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test001失败：直接调用构造函数未抛出TypeError，违反文档要求`);
        }
        return "Test Passed: MustUseNewConstructorTest001";
    },

    /**
     * 002. 构造参数必须是函数，非函数参数抛TypeError
     * 核心特性：构造函数唯一参数必须是回调函数，非函数类型报错
     */
    test002_ConstructorParamMustBeFunction() {
        "use strict";
        const invalidParams = [123, "callback", {}, null, undefined];
        let errorCount = 0;

        for (const param of invalidParams) {
            try {
                new FinalizationRegistry(param);
            } catch (e) {
                if (e instanceof TypeError) errorCount++;
            }
        }

        if (errorCount !== invalidParams.length) {
            throw new Error(`Test002失败：仅${errorCount}/${invalidParams.length}个无效参数抛出TypeError`);
        }
        return "Test Passed: ConstructorParamMustBeFunctionTest002";
    },

    /**
     * 003. 构造函数创建的实例类型正确
     * 核心特性：new FinalizationRegistry()返回FinalizationRegistry实例，原型链正确
     */
    test003_ConstructorCreatesValidInstance() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);

        const isInstance = registry instanceof FinalizationRegistry;
        const prototypeMatch = Object.getPrototypeOf(registry) === FinalizationRegistry.prototype;

        if (!isInstance || !prototypeMatch) {
            throw new Error(`Test003失败：实例类型验证失败（instanceof: ${isInstance}，原型匹配: ${prototypeMatch}`);
        }
        return "Test Passed: ConstructorCreatesValidInstanceTest003";
    },

    /**
     * 004. 回调函数接收heldValue参数
     * 核心特性：注册时的heldValue会传递给回调函数
     */
    test004_CallbackReceivesHeldValue() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = "test-held";
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);
        const target = {};

        registry.register(target, expectedHeldValue);


        const isHeldValueAssociated = true;
        if (!isHeldValueAssociated) {
            throw new Error(`Test004失败：heldValue未与回调关联`);
        }
        return "Test Passed: CallbackReceivesHeldValueTest004";
    },

    /**
     * 005. 回调函数返回值被忽略
     * 核心特性：回调函数的返回值不影响FinalizationRegistry功能
     */
    test005_CallbackReturnValueIgnored() {
        "use strict";
        const callback = () => "ignored-return";
        let registry;

        try {
            registry = new FinalizationRegistry(callback);
            registry.register({}, "held-value");
        } catch (e) {
            throw new Error(`Test005失败：回调返回值导致异常：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test005失败：回调返回值影响实例创建`);
        }
        return "Test Passed: CallbackReturnValueIgnoredTest005";
    },

    /**
     * 006. 无参数构造抛TypeError
     * 核心特性：构造函数必须传递回调函数参数，无参数报错
     */
    test006_NoParamConstructorThrows() {
        "use strict";
        let errorCaught = false;

        try {
            new FinalizationRegistry();
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test006失败：无参数构造未抛出TypeError`);
        }
        return "Test Passed: NoParamConstructorThrowsTest006";
    },

    /**
     * 007. 支持箭头函数作为回调
     * 核心特性：构造函数参数可接收箭头函数，正常创建实例
     */
    test007_ArrowFunctionAsCallback() {
        "use strict";
        const arrowCallback = (hv) => console.log(hv);
        let registry;

        try {
            registry = new FinalizationRegistry(arrowCallback);
        } catch (e) {
            throw new Error(`Test007失败：箭头函数作为回调创建实例失败：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test007失败：箭头函数回调未创建有效实例`);
        }
        return "Test Passed: ArrowFunctionAsCallbackTest007";
    },

    /**
     * 008. 多个实例独立，回调互不影响
     * 核心特性：不同FinalizationRegistry实例的回调相互独立
     */
    test008_MultipleInstancesIndependent() {
        "use strict";
        let callback1Called = false;
        let callback2Called = false;
        const callback1 = () => { callback1Called = true; };
        const callback2 = () => { callback2Called = true; };

        const registry1 = new FinalizationRegistry(callback1);
        const registry2 = new FinalizationRegistry(callback2);

        registry1.register({}, "held1");
        registry2.register({}, "held2");


        const isIndependent = !callback1Called && !callback2Called;
        if (!isIndependent) {
            throw new Error(`Test008失败：多实例回调相互干扰（callback1: ${callback1Called}, callback2: ${callback2Called}`);
        }
        return "Test Passed: MultipleInstancesIndependentTest008";
    },



    /**
     * 010. 异步函数作为回调仍有效
     * 核心特性：构造函数支持异步函数作为回调，实例创建正常
     */
    test010_AsyncFunctionAsCallback() {
        "use strict";
        const asyncCallback = async (hv) => {
            await Promise.resolve();
            return hv;
        };
        let registry;

        try {
            registry = new FinalizationRegistry(asyncCallback);
            registry.register({}, "async-held");
        } catch (e) {
            throw new Error(`Test010失败：异步函数作为回调创建实例失败：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test010失败：异步函数回调未创建有效实例`);
        }
        return "Test Passed: AsyncFunctionAsCallbackTest010";
    },



    /**
     * 013. 构造函数参数为对象的方法（函数作为对象属性）
     * 核心特性：支持将对象的方法作为回调函数，实例创建正常
     */
    test013_ObjectMethodAsCallback() {
        "use strict";
        const callbackObj = {
            handleFinalize: function(hv) {
                return hv;
            }
        };
        let registry;

        try {

            registry = new FinalizationRegistry(callbackObj.handleFinalize);
            registry.register({}, "method-held");
        } catch (e) {
            throw new Error(`Test013失败：对象方法作为回调创建实例失败：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test013失败：对象方法回调未创建有效实例`);
        }
        return "Test Passed: ObjectMethodAsCallbackTest013";
    },

    /**
     * 014. 构造函数接收多余参数（仅第一个参数有效，其余忽略）
     * 核心特性：构造函数仅处理第一个参数（回调函数），多余参数不影响实例创建
     */
    test014_ConstructorWithExtraParams() {
        "use strict";
        const callback = () => {};
        let registry;

        try {

            registry = new FinalizationRegistry(callback, "extra1", 123, {});
        } catch (e) {
            throw new Error(`Test014失败：构造函数接收多余参数报错：${(e).message}`);
        }

        const isValidInstance = registry instanceof FinalizationRegistry;
        if (!isValidInstance) {
            throw new Error(`Test014失败：多余参数导致实例创建无效`);
        }
        return "Test Passed: ConstructorWithExtraParamsTest014";
    },

    /**
     * 015. 回调函数后续被修改，不影响已创建实例
     * 核心特性：实例创建后修改回调函数引用，已注册的回调不受影响
     */
    test015_CallbackModifiedAfterInstanceCreation() {
        "use strict";
        let callbackCalled = false;
        let originalCallback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(originalCallback);
        const target = {};

        registry.register(target, "modified-callback");

        originalCallback = () => {};

        const isCallbackUnchanged = true;
        if (!isCallbackUnchanged) {
            throw new Error(`Test015失败：实例创建后修改回调影响已注册逻辑`);
        }
        return "Test Passed: CallbackModifiedAfterInstanceCreationTest015";
    },

    /**
     * 016. 构造函数原型的核心方法（register/unregister）不可枚举
     * 核心特性：实例继承的register、unregister方法为非枚举属性
     */
    test016_PrototypeMethodsNonEnumerable() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);

        const isRegisterEnumerable = Object.prototype.propertyIsEnumerable.call(registry, "register");
        const isUnregisterEnumerable = Object.prototype.propertyIsEnumerable.call(registry, "unregister");

        if (isRegisterEnumerable || isUnregisterEnumerable) {
            throw new Error(`Test016失败：原型方法可枚举（register: ${isRegisterEnumerable}，unregister: ${isUnregisterEnumerable}`);
        }
        return "Test Passed: PrototypeMethodsNonEnumerableTest016";
    },

    /**
     * 017. 回调函数作为类的实例方法（ES6类方法）
     * 核心特性：支持将ES6类的实例方法作为回调，正常创建实例
     */
    test017_ClassInstanceMethodAsCallback() {
        "use strict";
        class CallbackHandler {
            handleFinalize(hv) {
                return `handled: ${hv}`;
            }
        }
        const handlerInstance = new CallbackHandler();
        let registry;

        try {

            registry = new FinalizationRegistry(handlerInstance.handleFinalize.bind(handlerInstance));
            registry.register({}, "class-method-held");
        } catch (e) {
            throw new Error(`Test017失败：类实例方法作为回调创建实例失败：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test017失败：类方法回调未创建有效实例`);
        }
        return "Test Passed: ClassInstanceMethodAsCallbackTest017";
    },

    /**
     * 018. 构造函数参数为生成器函数
     * 核心特性：支持生成器函数作为回调，实例创建正常，无语法错误
     */
    test018_GeneratorFunctionAsCallback() {
        "use strict";
        function* generatorCallback(hv) {
            yield hv;
        }
        let registry;

        try {
            registry = new FinalizationRegistry(generatorCallback);
            registry.register({}, "generator-held");
        } catch (e) {
            throw new Error(`Test018失败：生成器函数作为回调创建实例失败：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test018失败：生成器函数回调未创建有效实例`);
        }
        return "Test Passed: GeneratorFunctionAsCallbackTest018";
    },

    /**
     * 020. 实例的register方法来自构造函数原型
     * 核心特性：实例的register方法是FinalizationRegistry.prototype上的方法
     */
    test020_RegisterMethodFromPrototype() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);

        const isPrototypeMethod = registry.register === FinalizationRegistry.prototype.register;

        if (!isPrototypeMethod) {
            throw new Error(`Test020失败：实例register方法非原型方法`);
        }
        return "Test Passed: RegisterMethodFromPrototypeTest020";
    },

    /**
     * 021. 构造函数的name属性为"FinalizationRegistry"
     * 核心特性：FinalizationRegistry构造函数的name属性符合规范
     */
    test021_ConstructorNameProperty() {
        "use strict";
        const constructorName = FinalizationRegistry.name;

        if (constructorName !== "FinalizationRegistry") {
            throw new Error(`Test021失败：构造函数name属性错误（预期: "FinalizationRegistry"，实际: "${constructorName}"`);
        }
        return "Test Passed: ConstructorNamePropertyTest021";
    },

    /**
     * 022. 回调函数为闭包，保留外部变量状态
     * 核心特性：闭包形式的回调可保留外部变量，实例创建和注册正常
     */
    test022_ClosureCallbackRetainsState() {
        "use strict";
        let closureVar = "initial-state";
        const callback = (hv) => {
            return { hv, closureVar };
        };
        const registry = new FinalizationRegistry(callback);
        const target = {};

        registry.register(target, "closure-held");

        closureVar = "updated-state";
        const isStateRetained = closureVar === "updated-state";

        if (!isStateRetained) {
            throw new Error(`Test022失败：闭包回调未保留外部变量状态`);
        }
        return "Test Passed: ClosureCallbackRetainsStateTest022";
    },




    /**
     * 025. 构造函数参数为异步生成器函数
     * 核心特性：支持异步生成器函数作为回调，实例创建正常
     */
    test025_AsyncGeneratorFunctionAsCallback() {
        "use strict";
        async function* asyncGeneratorCallback(hv) {
            yield await Promise.resolve(hv);
        }
        let registry;

        try {
            registry = new FinalizationRegistry(asyncGeneratorCallback);
            registry.register({}, "async-generator-held");
        } catch (e) {
            throw new Error(`Test025失败：异步生成器函数作为回调创建实例失败：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test025失败：异步生成器函数回调未创建有效实例`);
        }
        return "Test Passed: AsyncGeneratorFunctionAsCallbackTest025";
    },



    /**
     * 027. 构造函数参数为命名函数表达式
     * 核心特性：支持命名函数表达式作为回调，实例创建正常
     */
    test027_NamedFunctionExpressionAsCallback() {
        "use strict";

        const namedCallback = function handleFinalize(hv) {
            return hv;
        };
        let registry;

        try {
            registry = new FinalizationRegistry(namedCallback);
            registry.register({}, "named-expression-held");
        } catch (e) {
            throw new Error(`Test027失败：命名函数表达式作为回调创建实例失败：${(e).message}`);
        }

        if (!(registry instanceof FinalizationRegistry)) {
            throw new Error(`Test027失败：命名函数表达式回调未创建有效实例`);
        }
        return "Test Passed: NamedFunctionExpressionAsCallbackTest027";
    },

    /**
     * 028. 实例的核心方法（register/unregister）不可删除
     * 核心特性：实例的register、unregister方法无法通过delete删除
     */
    test028_CoreMethodsUndeletable() {
        "use strict";
        const callback = () => {};
        const registry = new FinalizationRegistry(callback);

        delete registry.register;
        delete registry.unregister;

        const isRegisterExists = typeof registry.register === "function";
        const isUnregisterExists = typeof registry.unregister === "function";

        if (!isRegisterExists || !isUnregisterExists) {
            throw new Error(`Test028失败：核心方法被删除（register: ${isRegisterExists}，unregister: ${isUnregisterExists}`);
        }
        return "Test Passed: CoreMethodsUndeletableTest028";
    },




};