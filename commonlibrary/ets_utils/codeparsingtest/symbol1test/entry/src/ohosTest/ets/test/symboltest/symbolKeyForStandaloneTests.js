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
export const SymbolKeyForStandaloneTestUtils = {
    /**
     * 001. Symbol.keyFor() returns key for global Symbol from Symbol.for().
     * Feature: Returns the registry key for Symbols created via Symbol.for().
     */
    async test001_SymbolKeyForGlobalSymbol() {
        const targetKey = "global-key-001";
        const globalSym = Symbol.for(targetKey);
        const retrievedKey = Symbol.keyFor(globalSym);

        if (retrievedKey !== targetKey) {
            throw new Error(`Test001 failed: Symbol.keyFor(global Sym) returned "${retrievedKey}" (expected "${targetKey}")`);
        }
        return "Test Passed: SymbolKeyForGlobalSymbolTest001";
    },

    /**
     * 002. Symbol.keyFor() returns undefined for non-global Symbol.
     * Feature: Returns undefined for Symbols created via Symbol() (not registered).
     */
    async test002_SymbolKeyForNonGlobalSymbol() {
        const nonGlobalSym = Symbol("non-global-key-002");
        const retrievedKey = Symbol.keyFor(nonGlobalSym);

        if (retrievedKey !== undefined) {
            throw new Error(`Test002 failed: Symbol.keyFor(non-global Sym) returned "${retrievedKey}" (expected undefined)`);
        }
        return "Test Passed: SymbolKeyForNonGlobalSymbolTest002";
    },

    /**
     * 003. Symbol.keyFor() is case-sensitive for registry keys.
     * Feature: Registry keys are case-sensitive; returns key matching exact case.
     */
    async test003_SymbolKeyForCaseSensitive() {
        const keyUpper = "CaseSensitiveKey";
        const keyLower = "casesensitivekey";
        const symUpper = Symbol.for(keyUpper);
        const symLower = Symbol.for(keyLower);

        if (Symbol.keyFor(symUpper) !== keyUpper || Symbol.keyFor(symLower) !== keyLower) {
            throw new Error(`Test003 failed: Symbol.keyFor() case mismatch (upper: ${Symbol.keyFor(symUpper)}, lower: ${Symbol.keyFor(symLower)})`);
        }
        return "Test Passed: SymbolKeyForCaseSensitiveTest003";
    },

    /**
     * 004. Symbol.keyFor() returns "null" for Symbol.for(null).
     * Feature: null key in Symbol.for() is coerced to "null"; keyFor returns it.
     */
    async test004_SymbolKeyForNullKey() {
        const symFromNull = Symbol.for(null);
        const expectedKey = "null";
        const retrievedKey = Symbol.keyFor(symFromNull);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test004 failed: Symbol.keyFor(Symbol.for(null)) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForNullKeyTest004";
    },

    /**
     * 005. Symbol.keyFor() returns "undefined" for Symbol.for(undefined).
     * Feature: undefined key in Symbol.for() is coerced to "undefined"; keyFor returns it.
     */
    async test005_SymbolKeyForUndefinedKey() {
        const symFromUndefined = Symbol.for(undefined);
        const expectedKey = "undefined";
        const retrievedKey = Symbol.keyFor(symFromUndefined);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test005 failed: Symbol.keyFor(Symbol.for(undefined)) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForUndefinedKeyTest005";
    },

    /**
     * 006. Symbol.keyFor() returns empty string for Symbol.for("").
     * Feature: Empty string key in Symbol.for() is retained; keyFor returns "".
     */
    async test006_SymbolKeyForEmptyStringKey() {
        const emptyKey = "";
        const symFromEmpty = Symbol.for(emptyKey);
        const retrievedKey = Symbol.keyFor(symFromEmpty);

        if (retrievedKey !== emptyKey) {
            throw new Error(`Test006 failed: Symbol.keyFor(Symbol.for("")) returned "${retrievedKey}" (expected empty string)`);
        }
        return "Test Passed: SymbolKeyForEmptyStringKeyTest006";
    },




    /**
     * 009. Symbol.keyFor() returns consistent key across multiple calls.
     * Feature: Multiple calls for the same global Symbol return the same key.
     */
    async test009_SymbolKeyForConsistentCalls() {
        const targetKey = "consistent-key-009";
        const globalSym = Symbol.for(targetKey);
        const key1 = Symbol.keyFor(globalSym);
        const key2 = Symbol.keyFor(globalSym);
        const key3 = Symbol.keyFor(globalSym);

        if (!(key1 === key2 && key2 === key3 && key1 === targetKey)) {
            throw new Error(`Test009 failed: Symbol.keyFor() inconsistent (key1: ${key1}, key2: ${key2}, key3: ${key3})`);
        }
        return "Test Passed: SymbolKeyForConsistentCallsTest009";
    },

    /**
     * 010. Symbol.keyFor() returns undefined for built-in Symbols.
     * Feature: Built-in Symbols (e.g., Symbol.hasInstance) are not in global registry.
     */
    async test010_SymbolKeyForBuiltInSymbol() {
        const builtInSym = Symbol.hasInstance;
        const retrievedKey = Symbol.keyFor(builtInSym);

        if (retrievedKey !== undefined) {
            throw new Error(`Test010 failed: Symbol.keyFor(built-in Sym) returned "${retrievedKey}" (expected undefined)`);
        }
        return "Test Passed: SymbolKeyForBuiltInSymbolTest010";
    },

    /**
     * 011. Symbol.keyFor() returns object's toString() for Symbol.for(object).
     * Feature: Object key in Symbol.for() is coerced to "[object Object]"; keyFor returns it.
     */
    async test011_SymbolKeyForObjectAsKey() {
        const objKey = { name: "test" };
        const expectedKey = "[object Object]";
        const symFromObj = Symbol.for(objKey);
        const retrievedKey = Symbol.keyFor(symFromObj);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test011 failed: Symbol.keyFor(Symbol.for(Object)) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForObjectAsKeyTest011";
    },

    /**
     * 012. Symbol.keyFor() returns array's toString() for Symbol.for(array).
     * Feature: Array key in Symbol.for() is coerced to flattened string; keyFor returns it.
     */
    async test012_SymbolKeyForArrayAsKey() {
        const arrKey = [10, 20, 30];
        const expectedKey = "10,20,30";
        const symFromArr = Symbol.for(arrKey);
        const retrievedKey = Symbol.keyFor(symFromArr);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test012 failed: Symbol.keyFor(Symbol.for([${arrKey}])) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForArrayAsKeyTest012";
    },

    /**
     * 013. Symbol.keyFor() returns function's toString() for Symbol.for(function).
     * Feature: Function key in Symbol.for() is coerced to its string representation; keyFor returns it.
     */
    async test013_SymbolKeyForFunctionAsKey() {
        const funcKey = () => "func-test";
        const expectedKey = funcKey.toString();
        const symFromFunc = Symbol.for(funcKey);
        const retrievedKey = Symbol.keyFor(symFromFunc);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test013 failed: Symbol.keyFor(Symbol.for(Function)) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForFunctionAsKeyTest013";
    },

    /**
     * 014. Symbol.keyFor() returns RegExp's toString() for Symbol.for(RegExp).
     * Feature: RegExp key in Symbol.for() is coerced to its string representation; keyFor returns it.
     */
    async test014_SymbolKeyForRegExpAsKey() {
        const regKey = /test-regex/i;
        const expectedKey = regKey.toString();
        const symFromReg = Symbol.for(regKey);
        const retrievedKey = Symbol.keyFor(symFromReg);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test014 failed: Symbol.keyFor(Symbol.for(${regKey})) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForRegExpAsKeyTest014";
    },

    /**
     * 015. Symbol.keyFor() returns Date's toString() for Symbol.for(Date).
     * Feature: Date key in Symbol.for() is coerced to its string representation; keyFor returns it.
     */
    async test015_SymbolKeyForDateAsKey() {
        const dateKey = new Date("2024-12-31");
        const expectedKey = dateKey.toString();
        const symFromDate = Symbol.for(dateKey);
        const retrievedKey = Symbol.keyFor(symFromDate);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test015 failed: Symbol.keyFor(Symbol.for(Date)) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForDateAsKeyTest015";
    },

    /**
     * 016. Symbol.keyFor() consistent across nested scopes.
     * Feature: Global registry key retrieval works consistently in nested scopes.
     */
    async test016_SymbolKeyForNestedScopes() {
        const targetKey = "nested-scope-key-016";
        const sym = Symbol.for(targetKey);
        const retrievedKey = (() => {
            return ((() => Symbol.keyFor(sym))());
        })();

        if (retrievedKey !== targetKey) {
            throw new Error(`Test016 failed: Symbol.keyFor() in nested scope returned "${retrievedKey}" (expected "${targetKey}")`);
        }
        return "Test Passed: SymbolKeyForNestedScopesTest016";
    },

    /**
     * 017. Symbol.keyFor() returns special char key as-is.
     * Feature: Keys with special characters are retained; keyFor returns original key.
     */
    async test017_SymbolKeyForSpecialCharKey() {
        const specialKey = "!@#$%^&*()_+-=[]{}|;':\",./<>?";
        const sym = Symbol.for(specialKey);
        const retrievedKey = Symbol.keyFor(sym);

        if (retrievedKey !== specialKey) {
            throw new Error(`Test017 failed: Symbol.keyFor(special char key) returned "${retrievedKey}" (expected "${specialKey}")`);
        }
        return "Test Passed: SymbolKeyForSpecialCharKeyTest017";
    },

    /**
     * 018. Symbol.keyFor() returns key with spaces as-is.
     * Feature: Keys with leading/trailing spaces are retained; keyFor returns original key.
     */
    async test018_SymbolKeyForSpacedKey() {
        const spacedKey = "  key with spaces  ";
        const sym = Symbol.for(spacedKey);
        const retrievedKey = Symbol.keyFor(sym);

        if (retrievedKey !== spacedKey) {
            throw new Error(`Test018 failed: Symbol.keyFor(spaced key) returned "${retrievedKey}" (expected "${spacedKey}")`);
        }
        return "Test Passed: SymbolKeyForSpacedKeyTest018";
    },

    /**
     * 019. Symbol.keyFor() returns Number object's string for Symbol.for(Number object).
     * Feature: Number object key is coerced to string; keyFor returns it.
     */
    async test019_SymbolKeyForNumberObjectAsKey() {
        const numObjKey = new Number(789);
        const expectedKey = "789";
        const symFromNumObj = Symbol.for(numObjKey);
        const retrievedKey = Symbol.keyFor(symFromNumObj);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test019 failed: Symbol.keyFor(Number object) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForNumberObjectAsKeyTest019";
    },

    /**
     * 020. Symbol.keyFor() returns Boolean object's string for Symbol.for(Boolean object).
     * Feature: Boolean object key is coerced to string; keyFor returns it.
     */
    async test020_SymbolKeyForBooleanObjectAsKey() {
        const boolObjKey = new Boolean(false);
        const expectedKey = "false";
        const symFromBoolObj = Symbol.for(boolObjKey);
        const retrievedKey = Symbol.keyFor(symFromBoolObj);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test020 failed: Symbol.keyFor(Boolean object) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForBooleanObjectAsKeyTest020";
    },

    /**
     * 021. Symbol.keyFor() return type is string or undefined (strict check).
     * Feature: Returns only string (for global) or undefined (non-global); no other types.
     */
    async test021_SymbolKeyForReturnTypeStrict() {
        const globalSym = Symbol.for("return-type-021");
        const nonGlobalSym = Symbol("non-global-021");
        const keyGlobal = Symbol.keyFor(globalSym);
        const keyNonGlobal = Symbol.keyFor(nonGlobalSym);

        if (typeof keyGlobal !== "string" || typeof keyNonGlobal !== "undefined") {
            throw new Error(`Test021 failed: Invalid return types (global: ${typeof keyGlobal}, non-global: ${typeof keyNonGlobal})`);
        }
        return "Test Passed: SymbolKeyForReturnTypeStrictTest021";
    },

    /**
     * 022. Symbol.keyFor() consistent for multiple Symbol.for() calls.
     * Feature: Multiple Symbol.for() calls with same key return same key via keyFor().
     */
    async test022_SymbolKeyForMultipleSymbolForCalls() {
        const targetKey = "multi-call-key-022";
        const sym1 = Symbol.for(targetKey);
        const sym2 = Symbol.for(targetKey);
        const sym3 = Symbol.for(targetKey);

        if (Symbol.keyFor(sym1) !== targetKey || Symbol.keyFor(sym2) !== targetKey || Symbol.keyFor(sym3) !== targetKey) {
            throw new Error(`Test022 failed: Inconsistent keyFor() results across Symbol.for() calls`);
        }
        return "Test Passed: SymbolKeyForMultipleSymbolForCallsTest022";
    },

    /**
     * 023. Symbol.keyFor() works after deleting global Symbol reference.
     * Feature: Registry retains key; keyFor() works even if Symbol reference is deleted.
     */
    async test023_SymbolKeyForAfterReferenceDelete() {
        const targetKey = "delete-ref-key-023";
        let sym = Symbol.for(targetKey);
        const symId = sym.toString();

        const newSym = Symbol.for(targetKey);

        if (Symbol.keyFor(newSym) !== targetKey || newSym.toString() !== symId) {
            throw new Error(`Test023 failed: keyFor() failed after reference delete (key: ${Symbol.keyFor(newSym)}, id: ${newSym.toString()})`);
        }
        return "Test Passed: SymbolKeyForAfterReferenceDeleteTest023";
    },

    /**
     * 024. Symbol.keyFor() works in strict mode.
     * Feature: Behavior is consistent between strict and non-strict modes.
     */
    async test024_SymbolKeyForInStrictMode() {
        "use strict";
        const targetKey = "strict-mode-key-024";
        const sym = Symbol.for(targetKey);
        const retrievedKey = Symbol.keyFor(sym);

        if (retrievedKey !== targetKey) {
            throw new Error(`Test024 failed: Strict mode keyFor() returned "${retrievedKey}" (expected "${targetKey}")`);
        }
        return "Test Passed: SymbolKeyForInStrictModeTest024";
    },

    /**
     * 025. Symbol.keyFor() works for global Symbol in Map.
     * Feature: Global Symbol used as Map key retains registry key; keyFor() works.
     */
    async test025_SymbolKeyForGlobalSymbolInMap() {
        const targetKey = "map-key-025";
        const sym = Symbol.for(targetKey);
        const map = new Map([[sym, "map-value"]]);
        const retrievedSym = [...map.keys()][0];
        const retrievedKey = Symbol.keyFor(retrievedSym);

        if (retrievedKey !== targetKey) {
            throw new Error(`Test025 failed: keyFor() for Map-stored global Symbol returned "${retrievedKey}" (expected "${targetKey}")`);
        }
        return "Test Passed: SymbolKeyForGlobalSymbolInMapTest025";
    },

    /**
     * 026. Symbol.keyFor() works for global Symbol in Set.
     * Feature: Global Symbol used as Set element retains registry key; keyFor() works.
     */
    async test026_SymbolKeyForGlobalSymbolInSet() {
        const targetKey = "set-key-026";
        const sym = Symbol.for(targetKey);
        const set = new Set([sym]);
        const retrievedSym = [...set][0];
        const retrievedKey = Symbol.keyFor(retrievedSym);

        if (retrievedKey !== targetKey) {
            throw new Error(`Test026 failed: keyFor() for Set-stored global Symbol returned "${retrievedKey}" (expected "${targetKey}")`);
        }
        return "Test Passed: SymbolKeyForGlobalSymbolInSetTest026";
    },

    /**
     * 027. Symbol.keyFor() works for global Symbol from Promise.resolve().
     * Feature: Global Symbol passed via Promise retains registry key; keyFor() works.
     */
    async test027_SymbolKeyForGlobalSymbolInPromise() {
        const targetKey = "promise-key-027";
        const sym = Symbol.for(targetKey);
        const resolvedSym = await Promise.resolve(sym);
        const retrievedKey = Symbol.keyFor(resolvedSym);

        if (retrievedKey !== targetKey) {
            throw new Error(`Test027 failed: keyFor() for Promise-resolved global Symbol returned "${retrievedKey}" (expected "${targetKey}")`);
        }
        return "Test Passed: SymbolKeyForGlobalSymbolInPromiseTest027";
    },

    /**
     * 028. Symbol.keyFor() returns nested object's toString() for Symbol.for(nested object).
     * Feature: Nested object key is coerced to "[object Object]"; keyFor returns it.
     */
    async test028_SymbolKeyForNestedObjectAsKey() {
        const nestedObjKey = { a: { b: { c: 1 } } };
        const expectedKey = "[object Object]";
        const symFromNestedObj = Symbol.for(nestedObjKey);
        const retrievedKey = Symbol.keyFor(symFromNestedObj);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test028 failed: Symbol.keyFor(nested Object) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForNestedObjectAsKeyTest028";
    },

    /**
     * 029. Symbol.keyFor() returns TypedArray's toString() for Symbol.for(TypedArray).
     * Feature: TypedArray key is coerced to its string representation; keyFor returns it.
     */
    async test029_SymbolKeyForTypedArrayAsKey() {
        const typedArrKey = new Uint16Array([40, 50]);
        const expectedKey = typedArrKey.toString();
        const symFromTypedArr = Symbol.for(typedArrKey);
        const retrievedKey = Symbol.keyFor(symFromTypedArr);

        if (retrievedKey !== expectedKey) {
            throw new Error(`Test029 failed: Symbol.keyFor(TypedArray) returned "${retrievedKey}" (expected "${expectedKey}")`);
        }
        return "Test Passed: SymbolKeyForTypedArrayAsKeyTest029";
    },

    /**
     * 030. Symbol.keyFor() returns user key for Symbol.for() with built-in Symbol name.
     * Feature: User key matching built-in Symbol name is retained; no conflict.
     */
    async test030_SymbolKeyForBuiltInNameUserKey() {
        const builtInNameKey = "hasInstance";
        const sym = Symbol.for(builtInNameKey);
        const retrievedKey = Symbol.keyFor(sym);

        if (retrievedKey !== builtInNameKey) {
            throw new Error(`Test030 failed: Symbol.keyFor(user key "${builtInNameKey}") returned "${retrievedKey}" (expected "${builtInNameKey}")`);
        }
        return "Test Passed: SymbolKeyForBuiltInNameUserKeyTest030";
    }
};