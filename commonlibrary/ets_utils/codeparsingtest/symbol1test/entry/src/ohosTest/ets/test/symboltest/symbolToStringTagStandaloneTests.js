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
export const SymbolToStringTagStandaloneTestUtils = {
    /**
     * 001. Default object toStringTag (returns "Object").
     * Feature: Plain object without [Symbol.toStringTag] uses default tag "Object".
     */
    async test001_DefaultObjectToStringTag() {
        const plainObj = {};
        const result = Object.prototype.toString.call(plainObj);

        if (result !== "[object Object]") {
            throw new Error(`Test001 failed: Default object returned ${result} (expected "[object Object]")`);
        }
        return "Test Passed: DefaultObjectToStringTagTest001";
    },

    /**
     * 002. Custom object implements toStringTag (overrides type tag).
     * Feature: Object with [Symbol.toStringTag] returns custom tag in toString().
     */
    async test002_CustomObjectToStringTag() {
        const customObj = {
            [Symbol.toStringTag]: "MyCustomObj"
        };
        const result = Object.prototype.toString.call(customObj);

        if (result !== "[object MyCustomObj]") {
            throw new Error(`Test002 failed: Custom object returned ${result} (expected "[object MyCustomObj]")`);
        }
        return "Test Passed: CustomObjectToStringTagTest002";
    },

    /**
     * 003. Built-in Array toStringTag (default "Array").
     * Feature: Built-in Array's [Symbol.toStringTag] is "Array".
     */
    async test003_BuiltInArrayToStringTag() {
        const arr = [1, 2, 3];
        const result = Object.prototype.toString.call(arr);

        if (result !== "[object Array]") {
            throw new Error(`Test003 failed: Built-in Array returned ${result} (expected "[object Array]")`);
        }
        return "Test Passed: BuiltInArrayToStringTagTest003";
    },

    /**
     * 004. Subclass inherits parent's toStringTag.
     * Feature: Subclass without own [Symbol.toStringTag] inherits from parent.
     */
    async test004_SubclassInheritToStringTag() {
        class Parent {
            get [Symbol.toStringTag]() {
                return "ParentTag";
            }
        }
        class Child extends Parent {}
        const childInstance = new Child();
        const result = Object.prototype.toString.call(childInstance);

        if (result !== "[object ParentTag]") {
            throw new Error(`Test004 failed: Subclass inherited ${result} (expected "[object ParentTag]")`);
        }
        return "Test Passed: SubclassInheritToStringTagTest004";
    },

    /**
     * 005. Frozen object retains toStringTag.
     * Feature: Frozen object's [Symbol.toStringTag] remains effective.
     */
    async test005_FrozenObjectToStringTag() {
        const frozenObj = {
            get [Symbol.toStringTag]() {
                return "FrozenTag";
            }
        };
        Object.freeze(frozenObj);
        const result = Object.prototype.toString.call(frozenObj);

        if (result !== "[object FrozenTag]") {
            throw new Error(`Test005 failed: Frozen object returned ${result} (expected "[object FrozenTag]")`);
        }
        return "Test Passed: FrozenObjectToStringTagTest005";
    },


    /**
     * 007. Null/undefined have no toStringTag (default tags).
     * Feature: null/undefined don't have [Symbol.toStringTag], return "Null"/"Undefined".
     */
    async test007_NullUndefinedToStringTag() {
        const nullResult = Object.prototype.toString.call(null);
        const undefinedResult = Object.prototype.toString.call(undefined);

        if (nullResult !== "[object Null]" || undefinedResult !== "[object Undefined]") {
            throw new Error(`Test007 failed: Null/undefined returned (${nullResult}, ${undefinedResult}) (expected "[object Null]", "[object Undefined]")`);
        }
        return "Test Passed: NullUndefinedToStringTagTest007";
    },

    /**
     * 008. Override built-in Array's toStringTag.
     * Feature: Array instance can override [Symbol.toStringTag] to custom value.
     */
    async test008_OverrideArrayToStringTag() {
        const customArr = [1, 2, 3];
        customArr[Symbol.toStringTag] = "CustomArray";
        const result = Object.prototype.toString.call(customArr);

        if (result !== "[object CustomArray]") {
            throw new Error(`Test008 failed: Overridden Array returned ${result} (expected "[object CustomArray]")`);
        }
        return "Test Passed: OverrideArrayToStringTagTest008";
    },


    /**
     * 010. Function object toStringTag (default "Function").
     * Feature: Function's [Symbol.toStringTag] defaults to "Function", customizable.
     */
    async test010_FunctionToStringTag() {
        function TestFunc() {}
        const defaultResult = Object.prototype.toString.call(TestFunc);

        TestFunc[Symbol.toStringTag] = "CustomFunc";
        const customResult = Object.prototype.toString.call(TestFunc);

        if (defaultResult !== "[object Function]" || customResult !== "[object CustomFunc]") {
            throw new Error(`Test010 failed: Function returned (${defaultResult}, ${customResult}) (expected "[object Function]", "[object CustomFunc]")`);
        }
        return "Test Passed: FunctionToStringTagTest010";
    },

    /**
     * 011. Built-in Promise toStringTag (default "Promise").
     * Feature: Built-in Promise's [Symbol.toStringTag] is "Promise".
     */
    async test011_BuiltInPromiseToStringTag() {
        const promise = Promise.resolve();
        const result = Object.prototype.toString.call(promise);

        if (result !== "[object Promise]") {
            throw new Error(`Test011 failed: Built-in Promise returned ${result} (expected "[object Promise]")`);
        }
        return "Test Passed: BuiltInPromiseToStringTagTest011";
    },

    /**
     * 012. Getter function as toStringTag (dynamic return value).
     * Feature: [Symbol.toStringTag] can be a getter, returning dynamic values.
     */
    async test012_GetterToStringTag() {
        let tag = "InitialTag";
        const getterObj = {
            get [Symbol.toStringTag]() {
                return tag;
            }
        };
        const result1 = Object.prototype.toString.call(getterObj);
        tag = "UpdatedTag";
        const result2 = Object.prototype.toString.call(getterObj);

        if (result1 !== "[object InitialTag]" || result2 !== "[object UpdatedTag]") {
            throw new Error(`Test012 failed: Getter tag returned (${result1}, ${result2}) (expected "[object InitialTag]", "[object UpdatedTag]")`);
        }
        return "Test Passed: GetterToStringTagTest012";
    },

    /**
     * 014. Built-in Map toStringTag (default "Map").
     * Feature: Built-in Map's [Symbol.toStringTag] is "Map".
     */
    async test014_BuiltInMapToStringTag() {
        const map = new Map([["a", 1]]);
        const result = Object.prototype.toString.call(map);

        if (result !== "[object Map]") {
            throw new Error(`Test014 failed: Built-in Map returned ${result} (expected "[object Map]")`);
        }
        return "Test Passed: BuiltInMapToStringTagTest014";
    },

    /**
     * 015. Dynamic delete toStringTag (falls back to default).
     * Feature: Deleting [Symbol.toStringTag] makes object use default tag.
     */
    async test015_DeleteToStringTagFallback() {
        const deleteObj = {
            [Symbol.toStringTag]: "DeleteTag"
        };
        const result1 = Object.prototype.toString.call(deleteObj);
        delete deleteObj[Symbol.toStringTag];
        const result2 = Object.prototype.toString.call(deleteObj);

        if (result1 !== "[object DeleteTag]" || result2 !== "[object Object]") {
            throw new Error(`Test015 failed: Delete tag returned (${result1}, ${result2}) (expected "[object DeleteTag]", "[object Object]")`);
        }
        return "Test Passed: DeleteToStringTagFallbackTest015";
    },

    /**
     * 016. TypedArray (Uint8Array) toStringTag (default "Uint8Array").
     * Feature: TypedArray instances have specific [Symbol.toStringTag] values.
     */
    async test016_TypedArrayToStringTag() {
        const uint8Arr = new Uint8Array([1, 2]);
        const result = Object.prototype.toString.call(uint8Arr);

        if (result !== "[object Uint8Array]") {
            throw new Error(`Test016 failed: Uint8Array returned ${result} (expected "[object Uint8Array]")`);
        }
        return "Test Passed: TypedArrayToStringTagTest016";
    },

    /**
     * 017. Error object toStringTag (default "Error").
     * Feature: Error instance's [Symbol.toStringTag] is "Error".
     */
    async test017_ErrorObjectToStringTag() {
        const error = new Error("test error");
        const result = Object.prototype.toString.call(error);

        if (result !== "[object Error]") {
            throw new Error(`Test017 failed: Error object returned ${result} (expected "[object Error]")`);
        }
        return "Test Passed: ErrorObjectToStringTagTest017";
    },

    /**
     * 018. Generator function toStringTag (default "Generator").
     * Feature: Generator function instances have [Symbol.toStringTag] "Generator".
     */
    async test018_GeneratorFunctionToStringTag() {
        function* genFunc() { yield; }
        const generator = genFunc();
        const result = Object.prototype.toString.call(generator);

        if (result !== "[object Generator]") {
            throw new Error(`Test018 failed: Generator returned ${result} (expected "[object Generator]")`);
        }
        return "Test Passed: GeneratorFunctionToStringTagTest018";
    },


    /**
     * 020. WeakMap toStringTag (default "WeakMap").
     * Feature: Built-in WeakMap's [Symbol.toStringTag] is "WeakMap".
     */
    async test020_BuiltInWeakMapToStringTag() {
        const weakMap = new WeakMap();
        const result = Object.prototype.toString.call(weakMap);

        if (result !== "[object WeakMap]") {
            throw new Error(`Test020 failed: WeakMap returned ${result} (expected "[object WeakMap]")`);
        }
        return "Test Passed: BuiltInWeakMapToStringTagTest020";
    },


    /**
     * 022. Multi-level inheritance override (subclass > parent > grandparent).
     * Feature: Multi-level inheritance follows toStringTag override priority.
     */
    async test022_MultiLevelInheritanceOverride() {
        class Grandparent {
            get [Symbol.toStringTag]() {
                return "GrandparentTag";
            }
        }
        class Parent extends Grandparent {
            get [Symbol.toStringTag]() {
                return "ParentTag";
            }
        }
        class Child extends Parent {
            get [Symbol.toStringTag]() {
                return "ChildTag";
            }
        }
        const childInstance = new Child();
        const result = Object.prototype.toString.call(childInstance);

        if (result !== "[object ChildTag]") {
            throw new Error(`Test022 failed: Multi-level override returned ${result} (expected "[object ChildTag]")`);
        }
        return "Test Passed: MultiLevelInheritanceOverrideTest022";
    },

    /**
     * 023. Symbol object toStringTag (default "Symbol").
     * Feature: Symbol wrapper object's [Symbol.toStringTag] is "Symbol".
     */
    async test023_SymbolObjectToStringTag() {
        const sym = Symbol("test");
        const symObj = Object(sym);
        const result = Object.prototype.toString.call(symObj);

        if (result !== "[object Symbol]") {
            throw new Error(`Test023 failed: Symbol object returned ${result} (expected "[object Symbol]")`);
        }
        return "Test Passed: SymbolObjectToStringTagTest023";
    },

    /**
     * 024. Date object toStringTag (default "Date").
     * Feature: Built-in Date's [Symbol.toStringTag] is "Date".
     */
    async test024_DateObjectToStringTag() {
        const date = new Date();
        const result = Object.prototype.toString.call(date);

        if (result !== "[object Date]") {
            throw new Error(`Test024 failed: Date object returned ${result} (expected "[object Date]")`);
        }
        return "Test Passed: DateObjectToStringTagTest024";
    },

    /**
     * 025. RegExp object toStringTag (default "RegExp").
     * Feature: Built-in RegExp's [Symbol.toStringTag] is "RegExp".
     */
    async test025_RegExpObjectToStringTag() {
        const reg = /test/g;
        const result = Object.prototype.toString.call(reg);

        if (result !== "[object RegExp]") {
            throw new Error(`Test025 failed: RegExp object returned ${result} (expected "[object RegExp]")`);
        }
        return "Test Passed: RegExpObjectToStringTagTest025";
    },

    /**
     * 026. Proxy object inherits target's toStringTag.
     * Feature: Proxy instance inherits [Symbol.toStringTag] from target object.
     */
    async test026_ProxyInheritToStringTag() {
        const target = { [Symbol.toStringTag]: "ProxyTargetTag" };
        const proxy = new Proxy(target, {});
        const result = Object.prototype.toString.call(proxy);

        if (result !== "[object ProxyTargetTag]") {
            throw new Error(`Test026 failed: Proxy returned ${result} (expected "[object ProxyTargetTag]")`);
        }
        return "Test Passed: ProxyInheritToStringTagTest026";
    },

    /**
     * 027. Empty class toStringTag (default "Object").
     * Feature: Empty class instance without toStringTag returns default "Object".
     */
    async test027_EmptyClassToStringTag() {
        class EmptyClass {}
        const instance = new EmptyClass();
        const result = Object.prototype.toString.call(instance);

        if (result !== "[object Object]") {
            throw new Error(`Test027 failed: Empty class returned ${result} (expected "[object Object]")`);
        }
        return "Test Passed: EmptyClassToStringTagTest027";
    },


    /**
     * 029. Built-in Set toStringTag (default "Set").
     * Feature: Built-in Set's [Symbol.toStringTag] is "Set".
     */
    async test029_BuiltInSetToStringTag() {
        const set = new Set([1, 2]);
        const result = Object.prototype.toString.call(set);

        if (result !== "[object Set]") {
            throw new Error(`Test029 failed: Built-in Set returned ${result} (expected "[object Set]")`);
        }
        return "Test Passed: BuiltInSetToStringTagTest029";
    },

    /**
     * 030. toJSON does not affect toStringTag.
     * Feature: Defining toJSON method does not change [Symbol.toStringTag] behavior.
     */
    async test030_ToJSONDoesNotAffectToStringTag() {
        const jsonObj = {
            [Symbol.toStringTag]: "JsonTag",
            toJSON() {
                return { key: "value" };
            }
        };
        const result = Object.prototype.toString.call(jsonObj);

        if (result !== "[object JsonTag]") {
            throw new Error(`Test030 failed: toJSON affected tag returned ${result} (expected "[object JsonTag]")`);
        }
        return "Test Passed: ToJSONDoesNotAffectToStringTagTest030";
    }
};