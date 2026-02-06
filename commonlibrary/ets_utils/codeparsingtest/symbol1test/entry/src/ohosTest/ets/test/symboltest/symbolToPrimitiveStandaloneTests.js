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
export const SymbolToPrimitiveStandaloneTestUtils = {
    /**
     * 001. Custom object implements toPrimitive (handles "number" hint).
     * Feature: Object with [Symbol.toPrimitive] returns number for "number" hint.
     */
    async test001_CustomToPrimitiveNumberHint() {
        const numObj = {
            [Symbol.toPrimitive](hint) {
                if (hint === "number") return 123;
                return "default";
            }
        };

        const result = Number(numObj);

        if (result !== 123 || typeof result !== "number") {
            throw new Error(`Test001 failed: Number hint returned ${result} (expected 123, type number)`);
        }
        return "Test Passed: CustomToPrimitiveNumberHintTest001";
    },

    /**
     * 002. Custom object implements toPrimitive (handles "string" hint).
     * Feature: Object with [Symbol.toPrimitive] returns string for "string" hint.
     */
    async test002_CustomToPrimitiveStringHint() {
        const strObj = {
            [Symbol.toPrimitive](hint) {
                if (hint === "string") return "custom-string";
                return 456;
            }
        };

        const result = String(strObj);

        if (result !== "custom-string" || typeof result !== "string") {
            throw new Error(`Test002 failed: String hint returned ${result} (expected "custom-string", type string)`);
        }
        return "Test Passed: CustomToPrimitiveStringHintTest002";
    },

    /**
     * 003. Custom object implements toPrimitive (handles "default" hint).
     * Feature: Object with [Symbol.toPrimitive] returns primitive for "default" hint.
     */
    async test003_CustomToPrimitiveDefaultHint() {
        const defaultObj = {
            [Symbol.toPrimitive](hint) {
                if (hint === "default") return true;
                return "other";
            }
        };

        const result = defaultObj + "";

        if (result !== "true" || typeof defaultObj[Symbol.toPrimitive]("default") !== "boolean") {
            throw new Error(`Test003 failed: Default hint returned ${result} (expected "true", primitive boolean)`);
        }
        return "Test Passed: CustomToPrimitiveDefaultHintTest003";
    },

    /**
     * 004. toPrimitive must return primitive value (throws if returns object).
     * Feature: [Symbol.toPrimitive] must return primitive; object return throws TypeError.
     */
    async test004_ToPrimitiveReturnsObjectThrows() {
        const invalidObj = {
            [Symbol.toPrimitive]() {
                return {};
            }
        };
        let errorCaught = false;

        try {
            Number(invalidObj);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test004 failed: Returning object did not throw TypeError`);
        }
        return "Test Passed: ToPrimitiveReturnsObjectThrowsTest004";
    },

    /**
     * 005. toPrimitive ignores hint (returns same primitive for all hints).
     * Feature: [Symbol.toPrimitive] can ignore hint, return consistent primitive.
     */
    async test005_ToPrimitiveIgnoresHint() {
        const ignoreHintObj = {
            [Symbol.toPrimitive]() {
                return 789;
            }
        };
        const resultNum = Number(ignoreHintObj);
        const resultStr = String(ignoreHintObj);
        const resultDefault = ignoreHintObj + 0;

        if (resultNum !== 789 || resultStr !== "789" || resultDefault !== 789) {
            throw new Error(`Test005 failed: Ignored hint returned (${resultNum}, ${resultStr}, ${resultDefault}) (expected 789, "789", 789)`);
        }
        return "Test Passed: ToPrimitiveIgnoresHintTest005";
    },

    /**
     * 006. No toPrimitive falls back to valueOf → toString.
     * Feature: Object without [Symbol.toPrimitive] uses valueOf() then toString().
     */
    async test006_NoToPrimitiveFallback() {
        const fallbackObj = {
            valueOf() {
                return 10;
            },
            toString() {
                return "fallback";
            }
        };
        const resultNum = Number(fallbackObj);

        fallbackObj.valueOf = () => {};
        const resultStr = String(fallbackObj);

        if (resultNum !== 10 || resultStr !== "fallback") {
            throw new Error(`Test006 failed: Fallback returned (${resultNum}, ${resultStr}) (expected 10, "fallback")`);
        }
        return "Test Passed: NoToPrimitiveFallbackTest006";
    },

    /**
     * 007. Date object default toPrimitive (treats "default" as "string").
     * Feature: Date.prototype[Symbol.toPrimitive] treats "default" as "string".
     */
    async test007_DateDefaultToPrimitive() {
        const date = new Date("2025-01-01");
        const defaultHintResult = date + "";
        const stringHintResult = String(date);

        if (defaultHintResult !== stringHintResult) {
            throw new Error(`Test007 failed: Date default hint returned ${defaultHintResult} (expected same as string hint ${stringHintResult})`);
        }
        return "Test Passed: DateDefaultToPrimitiveTest007";
    },

    /**
     * 008. Symbol object toPrimitive (ignores hint, returns symbol).
     * Feature: Symbol.prototype[Symbol.toPrimitive] ignores hint, returns symbol.
     */
    async test008_SymbolObjectToPrimitive() {
        const sym = Symbol("test");
        const symObj = Object(sym);
        const resultNum = symObj[Symbol.toPrimitive]("number");
        const resultStr = symObj[Symbol.toPrimitive]("string");

        if (resultNum !== sym || resultStr !== sym || typeof resultNum !== "symbol") {
            throw new Error(`Test008 failed: Symbol object toPrimitive returned (${resultNum}, ${resultStr}) (expected ${sym}, ${sym})`);
        }
        return "Test Passed: SymbolObjectToPrimitiveTest008";
    },

    /**
     * 009. Non-function toPrimitive throws TypeError.
     * Feature: [Symbol.toPrimitive] must be function; non-function throws.
     */
    async test009_NonFunctionToPrimitiveThrows() {
        const invalidObj = {
            [Symbol.toPrimitive]: "not a function"
        };
        let errorCaught = false;

        try {
            String(invalidObj);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test009 failed: Non-function toPrimitive did not throw TypeError`);
        }
        return "Test Passed: NonFunctionToPrimitiveThrowsTest009";
    },

    /**
     * 010. Inherited toPrimitive (subclass uses parent's logic).
     * Feature: [Symbol.toPrimitive] can be inherited via prototype chain.
     */
    async test010_InheritedToPrimitive() {
        const parent = {
            [Symbol.toPrimitive](hint) {
                return hint === "number" ? 111 : "parent";
            }
        };
        const child = Object.create(parent);
        const resultNum = Number(child);
        const resultStr = String(child);

        if (resultNum !== 111 || resultStr !== "parent") {
            throw new Error(`Test010 failed: Inherited toPrimitive returned (${resultNum}, ${resultStr}) (expected 111, "parent")`);
        }
        return "Test Passed: InheritedToPrimitiveTest010";
    },

    /**
     * 011. Dynamic modification of toPrimitive (runtime changes affect conversion).
     * Feature: Modifying [Symbol.toPrimitive] at runtime changes subsequent conversions.
     */
    async test011_DynamicModifyToPrimitive() {
        const dynObj = {
            [Symbol.toPrimitive](hint) {
                return hint === "number" ? 1 : "a";
            }
        };
        const result1 = Number(dynObj);
        dynObj[Symbol.toPrimitive] = (hint) => hint === "number" ? 2 : "b";
        const result2 = Number(dynObj);
        const result3 = String(dynObj);

        if (result1 !== 1 || result2 !== 2 || result3 !== "b") {
            throw new Error(`Test011 failed: Dynamic modify returned (${result1}, ${result2}, ${result3}) (expected 1, 2, "b")`);
        }
        return "Test Passed: DynamicModifyToPrimitiveTest011";
    },

    /**
     * 012. Frozen object retains toPrimitive functionality.
     * Feature: Frozen objects with [Symbol.toPrimitive] remain callable for conversion.
     */
    async test012_FrozenObjectToPrimitive() {
        const frozenObj = {
            [Symbol.toPrimitive](hint) {
                return hint === "string" ? "frozen" : 999;
            }
        };
        Object.freeze(frozenObj);
        const resultStr = String(frozenObj);
        const resultNum = Number(frozenObj);

        if (resultStr !== "frozen" || resultNum !== 999) {
            throw new Error(`Test012 failed: Frozen object returned (${resultStr}, ${resultNum}) (expected "frozen", 999)`);
        }
        return "Test Passed: FrozenObjectToPrimitiveTest012";
    },


    /**
     * 014. Multi-level inheritance priority (subclass > parent > grandparent).
     * Feature: toPrimitive follows prototype chain priority (subclass highest).
     */
    async test014_MultiLevelInheritanceToPrimitive() {
        const grandparent = {
            [Symbol.toPrimitive]() {
                return "grandparent";
            }
        };
        const parent = Object.create(grandparent);
        parent[Symbol.toPrimitive] = () => "parent";
        const child = Object.create(parent);
        child[Symbol.toPrimitive] = () => "child";

        const result = String(child);

        if (result !== "child") {
            throw new Error(`Test014 failed: Multi-level inheritance returned "${result}" (expected "child")`);
        }
        return "Test Passed: MultiLevelInheritanceToPrimitiveTest014";
    },






    /**
     * 019. Equality operator triggers "default" hint.
     * Feature: == operator triggers "default" hint for toPrimitive.
     */
    async test019_EqualityOperatorTriggersDefaultHint() {
        let defaultHintCalled = false;
        const eqObj = {
            [Symbol.toPrimitive](hint) {
                if (hint === "default") defaultHintCalled = true;
                return "test";
            }
        };
        const result = eqObj == "test";

        if (!defaultHintCalled || !result) {
            throw new Error(`Test019 failed: Default hint called ${defaultHintCalled}, equality ${result} (expected true, true)`);
        }
        return "Test Passed: EqualityOperatorTriggersDefaultHintTest019";
    },





    /**
     * 022. Arrow function as toPrimitive (this binding).
     * Feature: Arrow function as toPrimitive inherits this from creation context.
     */
    async test022_ArrowFunctionToPrimitiveThisBinding() {
        const context = { value: 100 };
        const arrowObj = {
            [Symbol.toPrimitive]: () => context.value
        };
        const result1 = Number(arrowObj);
        context.value = 200;
        const result2 = Number(arrowObj);

        if (result1 !== 100 || result2 !== 200) {
            throw new Error(`Test022 failed: Arrow function this returned (${result1}, ${result2}) (expected 100, 200)`);
        }
        return "Test Passed: ArrowFunctionToPrimitiveThisBindingTest022";
    },

    /**
     * 023. Closure-based toPrimitive (retains context).
     * Feature: Closure in toPrimitive retains private context.
     */
    async test023_ClosureBasedToPrimitive() {
        const createObj = (init) => {
            let count = init;
            return {
                [Symbol.toPrimitive](hint) {
                    return hint === "number" ? count++ : String(count);
                }
            };
        };
        const closureObj = createObj(5);
        const result1 = Number(closureObj);
        const result2 = Number(closureObj);
        const result3 = String(closureObj);

        if (result1 !== 5 || result2 !== 6 || result3 !== "7") {
            throw new Error(`Test023 failed: Closure returned (${result1}, ${result2}, "${result3}") (expected 5, 6, "7")`);
        }
        return "Test Passed: ClosureBasedToPrimitiveTest023";
    },

    /**
     * 024. Dynamic state affects toPrimitive return.
     * Feature: toPrimitive returns different values based on object's dynamic state.
     */
    async test024_DynamicStateToPrimitive() {
        const stateObj = {
            isActive: true,
            [Symbol.toPrimitive](hint) {
                return this.isActive ? "active" : "inactive";
            }
        };
        const result1 = String(stateObj);
        stateObj.isActive = false;
        const result2 = String(stateObj);

        if (result1 !== "active" || result2 !== "inactive") {
            throw new Error(`Test024 failed: Dynamic state returned ("${result1}", "${result2}") (expected "active", "inactive")`);
        }
        return "Test Passed: DynamicStateToPrimitiveTest024";
    },


    /**
     * 026. toPrimitive returns NaN/Infinity (valid number primitives).
     * Feature: [Symbol.toPrimitive] can return NaN or Infinity for "number" hint.
     */
    async test026_ToPrimitiveReturnsSpecialNumbers() {
        const nanObj = {
            [Symbol.toPrimitive](hint) {
                return hint === "number" ? NaN : "nan";
            }
        };
        const infObj = {
            [Symbol.toPrimitive](hint) {
                return hint === "number" ? Infinity : "inf";
            }
        };
        const resultNan = Number(nanObj);
        const resultInf = Number(infObj);

        if (!isNaN(resultNan) || resultInf !== Infinity) {
            throw new Error(`Test026 failed: Special numbers returned (${resultNan}, ${resultInf}) (expected NaN, Infinity)`);
        }
        return "Test Passed: ToPrimitiveReturnsSpecialNumbersTest026";
    },

    /**
     * 027. toPrimitive returns empty string for "string" hint.
     * Feature: Returning empty string (valid primitive) for string conversion.
     */
    async test027_ToPrimitiveReturnsEmptyString() {
        const emptyStrObj = {
            [Symbol.toPrimitive](hint) {
                return hint === "string" ? "" : 0;
            }
        };
        const resultStr = String(emptyStrObj);
        const resultLen = resultStr.length;

        if (resultStr !== "" || resultLen !== 0) {
            throw new Error(`Test027 failed: Empty string return ("${resultStr}", length ${resultLen}) (expected "", 0)`);
        }
        return "Test Passed: ToPrimitiveReturnsEmptyStringTest027";
    },

    /**
     * 028. Subclass overrides parent's toPrimitive.
     * Feature: Subclass explicitly overrides parent's [Symbol.toPrimitive].
     */
    async test028_SubclassOverrideParentToPrimitive() {
        class Parent {
            [Symbol.toPrimitive]() {
                return "parent";
            }
        }
        class Child extends Parent {
            [Symbol.toPrimitive]() {
                return "child";
            }
        }
        const child = new Child();
        const result = String(child);

        if (result !== "child") {
            throw new Error(`Test028 failed: Subclass override returned "${result}" (expected "child")`);
        }
        return "Test Passed: SubclassOverrideParentToPrimitiveTest028";
    },

    /**
     * 029. Manual call to toPrimitive with different hints.
     * Feature: [Symbol.toPrimitive] can be called directly with explicit hints.
     */
    async test029_ManualCallToPrimitive() {
        const manualObj = {
            [Symbol.toPrimitive](hint) {
                switch (hint) {
                    case "number": return 123;
                    case "string": return "manual";
                    case "default": return true;
                    default: return null;
                }
            }
        };
        const resultNum = manualObj[Symbol.toPrimitive]("number");
        const resultStr = manualObj[Symbol.toPrimitive]("string");
        const resultDef = manualObj[Symbol.toPrimitive]("default");

        if (resultNum !== 123 || resultStr !== "manual" || resultDef !== true) {
            throw new Error(`Test029 failed: Manual call returned (${resultNum}, "${resultStr}", ${resultDef}) (expected 123, "manual", true)`);
        }
        return "Test Passed: ManualCallToPrimitiveTest029";
    },

    /**
     * 030. Array overrides toPrimitive (custom array conversion).
     * Feature: Array can override [Symbol.toPrimitive] to customize conversion.
     */
    async test030_ArrayOverrideToPrimitive() {
        const customArray = [1, 2, 3];
        customArray[Symbol.toPrimitive] = function(hint) {
            return hint === "number" ? this.reduce((a, b) => a + b, 0) : this.join(",");
        };
        const resultNum = Number(customArray);
        const resultStr = String(customArray);

        if (resultNum !== 6 || resultStr !== "1,2,3") {
            throw new Error(`Test030 failed: Array override returned (${resultNum}, "${resultStr}") (expected 6, "1,2,3")`);
        }
        return "Test Passed: ArrayOverrideToPrimitiveTest030";
    }
};