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
export const SymbolForStandaloneTestUtils = {
    /**
     * 001. Symbol.for() is case-sensitive for string keys.
     * Feature: Keys with different case are treated as distinct in global registry.
     */
    async test001_SymbolForCaseSensitiveKeys() {
        const keyUpper = "UserKey";
        const keyLower = "userkey";
        const symUpper = Symbol.for(keyUpper);
        const symLower = Symbol.for(keyLower);

        if (symUpper === symLower) {
            throw new Error(`Test001 failed: Symbol.for("${keyUpper}") === Symbol.for("${keyLower}") (expected distinct; case-sensitive)`);
        }
        return "Test Passed: SymbolForCaseSensitiveKeysTest001";
    },

    /**
     * 002. Symbol.for("") uses empty string as valid key.
     * Feature: Empty string is a valid key in global registry.
     */
    async test002_SymbolForEmptyStringKey() {
        const emptyKey = "";
        const sym1 = Symbol.for(emptyKey);
        const sym2 = Symbol.for(emptyKey);
        const retrievedKey = Symbol.keyFor(sym1);

        if (sym1 !== sym2 || retrievedKey !== emptyKey) {
            throw new Error(`Test002 failed: Symbol.for("") not identical or keyFor=${retrievedKey} (expected "")`);
        }
        return "Test Passed: SymbolForEmptyStringKeyTest002";
    },

    /**
     * 003. Object as key is coerced to "[object Object]".
     * Feature: Object key is converted to its toString() result for registry.
     */
    async test003_SymbolForObjectKey() {
        const objKey = { id: 123 };
        const expectedStrKey = "[object Object]";
        const symFromObj = Symbol.for(objKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromObj !== symFromStr || Symbol.keyFor(symFromObj) !== expectedStrKey) {
            throw new Error(`Test003 failed: Symbol.for(Object) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForObjectKeyTest003";
    },

    /**
     * 005. Array as key uses array's toString() result.
     * Feature: Array key is coerced to its flattened string representation.
     */
    async test005_SymbolForArrayKey() {
        const arrKey = [4, 5, 6];
        const expectedStrKey = "4,5,6";
        const symFromArr = Symbol.for(arrKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromArr !== symFromStr) {
            throw new Error(`Test005 failed: Symbol.for([${arrKey}]) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForArrayKeyTest005";
    },

    /**
     * 006. Symbol.for() persists across nested scopes.
     * Feature: Global registry is shared even in deep nested scopes.
     */
    async test006_SymbolForNestedScopePersistence() {
        const key = "nested-scope-key";

        const innerSym = (() => {
            return ((() => Symbol.for(key))());
        })();
        const outerSym = Symbol.for(key);

        if (innerSym !== outerSym) {
            throw new Error(`Test006 failed: Symbol.for() from nested scope != outer scope (expected identical)`);
        }
        return "Test Passed: SymbolForNestedScopePersistenceTest006";
    },

    /**
     * 007. Function as key uses function's toString() result.
     * Feature: Function key is converted to its string representation for registry.
     */
    async test007_SymbolForFunctionKey() {
        const funcKey = () => "test";
        const expectedStrKey = funcKey.toString();
        const symFromFunc = Symbol.for(funcKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromFunc !== symFromStr || Symbol.keyFor(symFromFunc) !== expectedStrKey) {
            throw new Error(`Test007 failed: Symbol.for(Function) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForFunctionKeyTest007";
    },

    /**
     * 008. Symbol.keyFor() returns null for non-global Symbol.
     * Feature: Symbol.keyFor() returns undefined (per spec) for non-registered Symbols.
     */
    async test008_SymbolKeyForNonGlobalSymbol() {
        const nonGlobalSym = Symbol("non-global");
        const retrievedKey = Symbol.keyFor(nonGlobalSym);

        if (retrievedKey !== undefined) {
            throw new Error(`Test008 failed: Symbol.keyFor(non-global) returned "${retrievedKey}" (expected undefined)`);
        }
        return "Test Passed: SymbolKeyForNonGlobalSymbolTest008";
    },

    /**
     * 009. Date object as key uses Date's toString() result.
     * Feature: Date key is coerced to its string representation for registry.
     */
    async test009_SymbolForDateKey() {
        const dateKey = new Date("2024-01-01");
        const expectedStrKey = dateKey.toString();
        const symFromDate = Symbol.for(dateKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromDate !== symFromStr) {
            throw new Error(`Test009 failed: Symbol.for(Date) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForDateKeyTest009";
    },

    /**
     * 010. Symbol.for() does not conflict with built-in Symbols.
     * Feature: User-defined keys don't collide with built-in Symbol keys.
     */
    async test010_SymbolForNoConflictWithBuiltIn() {
        const builtInKey = "hasInstance";
        const userSym = Symbol.for(builtInKey);
        const builtInSym = Symbol.hasInstance;

        if (userSym === builtInSym) {
            throw new Error(`Test010 failed: Symbol.for("${builtInKey}") === Symbol.hasInstance (expected distinct)`);
        }
        return "Test Passed: SymbolForNoConflictWithBuiltInTest010";
    },

    /**
     * 011. Nested object as key uses flattened toString().
     * Feature: Nested object key is coerced to its top-level toString() result.
     */
    async test011_SymbolForNestedObjectKey() {
        const nestedObjKey = { a: { b: 3 } };
        const expectedStrKey = "[object Object]";
        const symFromNested = Symbol.for(nestedObjKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromNested !== symFromStr) {
            throw new Error(`Test011 failed: Symbol.for(nested Object) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForNestedObjectKeyTest011";
    },

    /**
     * 012. RegExp as key uses RegExp's toString().
     * Feature: RegExp key is converted to its string representation for registry.
     */
    async test012_SymbolForRegExpKey() {
        const regKey = /abc/gi;
        const expectedStrKey = regKey.toString();
        const symFromReg = Symbol.for(regKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromReg !== symFromStr || Symbol.keyFor(symFromReg) !== expectedStrKey) {
            throw new Error(`Test012 failed: Symbol.for(${regKey}) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForRegExpKeyTest012";
    },



    /**
     * 014. undefined as key is coerced to "undefined".
     * Feature: undefined key is converted to string "undefined" in registry.
     */
    async test014_SymbolForUndefinedKey() {
        const undefinedKey = undefined;
        const expectedStrKey = "undefined";
        const sym = Symbol.for(undefinedKey);
        const retrievedKey = Symbol.keyFor(sym);

        if (retrievedKey !== expectedStrKey) {
            throw new Error(`Test014 failed: Symbol.for(undefined) keyFor=${retrievedKey} (expected "${expectedStrKey}")`);
        }
        return "Test Passed: SymbolForUndefinedKeyTest014";
    },

    /**
     * 015. null as key is coerced to "null".
     * Feature: null key is converted to string "null" in registry.
     */
    async test015_SymbolForNullKey() {
        const nullKey = null;
        const expectedStrKey = "null";
        const sym = Symbol.for(nullKey);
        const retrievedKey = Symbol.keyFor(sym);

        if (retrievedKey !== expectedStrKey) {
            throw new Error(`Test015 failed: Symbol.for(null) keyFor=${retrievedKey} (expected "${expectedStrKey}")`);
        }
        return "Test Passed: SymbolForNullKeyTest015";
    },



    /**
     * 017. Cross-module simulation with global Symbol.
     * Feature: Global registry is shared across "modules" (IIFE simulation).
     */
    async test017_SymbolForCrossModuleSharing() {
        const key = "cross-module-key";

        const moduleA = (() => {
            const sym = Symbol.for(key);
            return { getSym: () => sym };
        })();

        const moduleB = (() => {
            const sym = Symbol.for(key);
            return { getSym: () => sym };
        })();

        const symA = moduleA.getSym();
        const symB = moduleB.getSym();
        if (symA !== symB) {
            throw new Error(`Test017 failed: Global Symbol not shared across simulated modules`);
        }
        return "Test Passed: SymbolForCrossModuleSharingTest017";
    },

    /**
     * 018. Global Symbol as Map key retains identity.
     * Feature: Global Symbol used as Map key retains reference identity.
     */
    async test018_SymbolForAsMapKey() {
        const key = "map-key";
        const globalSym = Symbol.for(key);
        const map = new Map();
        map.set(globalSym, "map-value");

        if (!map.has(globalSym) || map.get(globalSym) !== "map-value") {
            throw new Error(`Test018 failed: Map does not retain global Symbol key or value`);
        }
        return "Test Passed: SymbolForAsMapKeyTest018";
    },

    /**
     * 019. Global Symbol in Set retains uniqueness.
     * Feature: Global Symbol in Set is treated as unique (same instance).
     */
    async test019_SymbolForInSet() {
        const key = "set-key";
        const sym1 = Symbol.for(key);
        const sym2 = Symbol.for(key);
        const set = new Set([sym1, sym2]);

        if (set.size !== 1 || !set.has(sym1)) {
            throw new Error(`Test019 failed: Set size=${set.size} (expected 1) for global Symbol`);
        }
        return "Test Passed: SymbolForInSetTest019";
    },

    /**
     * 020. Symbol.for() works in strict mode.
     * Feature: Symbol.for() behavior is consistent in strict mode.
     */
    async test020_SymbolForInStrictMode() {
        "use strict";
        const key = "strict-key";
        const sym1 = Symbol.for(key);
        const sym2 = Symbol.for(key);

        if (sym1 !== sym2 || Symbol.keyFor(sym1) !== key) {
            throw new Error(`Test020 failed: Strict mode Symbol.for() returns non-identical Symbols or wrong key`);
        }
        return "Test Passed: SymbolForInStrictModeTest020";
    },

    /**
     * 021. Key with leading/trailing spaces is case-sensitive.
     * Feature: Keys with spaces are treated as distinct (including space position).
     */
    async test021_SymbolForKeyWithSpaces() {
        const keyWithSpace = "  test-key  ";
        const keyWithoutSpace = "test-key";
        const symWithSpace = Symbol.for(keyWithSpace);
        const symWithoutSpace = Symbol.for(keyWithoutSpace);

        if (symWithSpace === symWithoutSpace) {
            throw new Error(`Test021 failed: Symbol.for("${keyWithSpace}") === Symbol.for("${keyWithoutSpace}") (expected distinct)`);
        }
        return "Test Passed: SymbolForKeyWithSpacesTest021";
    },

    /**
     * 022. Special character key (e.g., @#$) is valid.
     * Feature: Keys with special characters are stored as-is in registry.
     */
    async test022_SymbolForSpecialCharKey() {
        const specialKey = "@#$special-key!";
        const sym1 = Symbol.for(specialKey);
        const sym2 = Symbol.for(specialKey);
        const retrievedKey = Symbol.keyFor(sym1);

        if (sym1 !== sym2 || retrievedKey !== specialKey) {
            throw new Error(`Test022 failed: Special char key not preserved (keyFor=${retrievedKey}, expected "${specialKey}")`);
        }
        return "Test Passed: SymbolForSpecialCharKeyTest022";
    },

    /**
     * 023. Number object as key is coerced to string.
     * Feature: Number object key is converted to its string representation.
     */
    async test023_SymbolForNumberObjectKey() {
        const numObjKey = new Number(456);
        const expectedStrKey = "456";
        const symFromNumObj = Symbol.for(numObjKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromNumObj !== symFromStr) {
            throw new Error(`Test023 failed: Symbol.for(Number object) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForNumberObjectKeyTest023";
    },

    /**
     * 024. Boolean object as key is coerced to string.
     * Feature: Boolean object key is converted to its string representation.
     */
    async test024_SymbolForBooleanObjectKey() {
        const boolObjKey = new Boolean(true);
        const expectedStrKey = "true";
        const symFromBoolObj = Symbol.for(boolObjKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromBoolObj !== symFromStr) {
            throw new Error(`Test024 failed: Symbol.for(Boolean object) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForBooleanObjectKeyTest024";
    },

    /**
     * 025. Symbol.keyFor() returns string or undefined (type check).
     * Feature: Symbol.keyFor() return type is string (for global) or undefined (non-global).
     */
    async test025_SymbolKeyForReturnType() {
        const globalSym = Symbol.for("return-type-key");
        const nonGlobalSym = Symbol("non-global");
        const keyForGlobal = Symbol.keyFor(globalSym);
        const keyForNonGlobal = Symbol.keyFor(nonGlobalSym);

        if (typeof keyForGlobal !== "string" || typeof keyForNonGlobal !== "undefined") {
            throw new Error(`Test025 failed: Symbol.keyFor() return types invalid (global: ${typeof keyForGlobal}, non-global: ${typeof keyForNonGlobal})`);
        }
        return "Test Passed: SymbolKeyForReturnTypeTest025";
    },

    /**
     * 026. Reuse key after deleting global Symbol reference.
     * Feature: Registry retains Symbol even if reference is deleted.
     */
    async test026_SymbolForKeyReuseAfterDelete() {
        const key = "reuse-key";
        let sym1 = Symbol.for(key);

        const sym2 = Symbol.for(key);

        if (sym1 !== sym2) {
            throw new Error(`Test026 failed: Symbol.for() did not reuse registry entry after reference deletion`);
        }
        return "Test Passed: SymbolForKeyReuseAfterDeleteTest026";
    },

    /**
     * 027. Global Symbol as object property (enumerability).
     * Feature: Global Symbol as object property is non-enumerable (same as regular Symbol).
     */
    async test027_SymbolForAsObjectProperty() {
        const globalSym = Symbol.for("prop-key");
        const obj = { [globalSym]: "prop-value", strProp: "str-value" };
        const keys = Object.keys(obj);
        const ownSymbols = Object.getOwnPropertySymbols(obj);

        if (!ownSymbols.includes(globalSym) || keys.includes(globalSym.toString())) {
            throw new Error(`Test027 failed: Global Symbol property not in ownSymbols or enumerated in Object.keys()`);
        }
        return "Test Passed: SymbolForAsObjectPropertyTest027";
    },

    /**
     * 028. TypedArray as key uses its toString().
     * Feature: TypedArray key is coerced to its string representation.
     */
    async test028_SymbolForTypedArrayKey() {
        const typedArrKey = new Uint8Array([7, 8, 9]);
        const expectedStrKey = typedArrKey.toString();
        const symFromTypedArr = Symbol.for(typedArrKey);
        const symFromStr = Symbol.for(expectedStrKey);

        if (symFromTypedArr !== symFromStr) {
            throw new Error(`Test028 failed: Symbol.for(Uint8Array) != Symbol.for("${expectedStrKey}") (expected identical)`);
        }
        return "Test Passed: SymbolForTypedArrayKeyTest028";
    },


    /**
     * 030. Global Symbol with Promise.resolve retains identity.
     * Feature: Global Symbol passed through Promise.resolve retains reference.
     */
    async test030_SymbolForInPromise() {
        const key = "promise-key";
        const globalSym = Symbol.for(key);
        const resolvedSym = await Promise.resolve(globalSym);

        if (resolvedSym !== globalSym) {
            throw new Error(`Test030 failed: Resolved Promise global Symbol != original (${resolvedSym} vs ${globalSym})`);
        }
        return "Test Passed: SymbolForInPromiseTest030";
    }
};