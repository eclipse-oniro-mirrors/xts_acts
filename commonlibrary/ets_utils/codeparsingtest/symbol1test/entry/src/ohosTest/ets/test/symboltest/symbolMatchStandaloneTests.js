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
export const SymbolMatchStandaloneTestUtils = {
    /**
     * 001. RegExp default Symbol.match behavior.
     * Feature: RegExp.prototype[Symbol.match] is called by String.prototype.match(), returns match array.
     */
    async test001_RegExpDefaultSymbolMatch() {
        const reg = /ab/;
        const str = "abcab";
        const result = str.match(reg);

        if (!Array.isArray(result) || result[0] !== "ab" || result.index !== 0) {
            throw new Error(`Test001 failed: Default match returned ${JSON.stringify(result)} (expected ["ab", index:0])`);
        }
        return "Test Passed: RegExpDefaultSymbolMatchTest001";
    },

    /**
     * 002. Custom object implements Symbol.match (returns custom result).
     * Feature: Custom objects with [Symbol.match] override String.prototype.match() behavior.
     */
    async test002_CustomObjectSymbolMatch() {
        const customMatcher = {
            [Symbol.match](str) {
                return str.includes("test") ? ["custom-match"] : null;
            }
        };
        const matchStr = "this is a test";
        const noMatchStr = "no match here";

        const result1 = matchStr.match(customMatcher);
        const result2 = noMatchStr.match(customMatcher);

        if (JSON.stringify(result1) !== '["custom-match"]' || result2 !== null) {
            throw new Error(`Test002 failed: Custom match returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["custom-match"], null)`);
        }
        return "Test Passed: CustomObjectSymbolMatchTest002";
    },

    /**
     * 003. Symbol.match = false marks object as non-regex (affects String.startsWith).
     * Feature: If [Symbol.match] is false, object is not treated as regex in String methods (startsWith/endsWith/includes).
     */
    async test003_SymbolMatchFalseNonRegex() {
        const nonRegexObj = { [Symbol.match]: false };
        const str = "hello";


        const result = str.startsWith(nonRegexObj);

        if (result !== false) {
            throw new Error(`Test003 failed: Symbol.match=false object treated as regex (result=${result}, expected false)`);
        }
        return "Test Passed: SymbolMatchFalseNonRegexTest003";
    },

    /**
     * 004. Symbol.match method receives target string as argument.
     * Feature: [Symbol.match] method is called with the target string as its only argument.
     */
    async test004_SymbolMatchReceivesTargetString() {
        let receivedStr = "";
        const matcher = {
            [Symbol.match](str) {
                receivedStr = str;
                return [];
            }
        };
        const testStr = "target-string";

        testStr.match(matcher);

        if (receivedStr !== testStr) {
            throw new Error(`Test004 failed: Symbol.match received "${receivedStr}" (expected "${testStr}")`);
        }
        return "Test Passed: SymbolMatchReceivesTargetStringTest004";
    },

    /**
     * 005. Symbol.match returns null for no match.
     * Feature: [Symbol.match] returns null to indicate no match (consistent with RegExp behavior).
     */
    async test005_SymbolMatchReturnsNullForNoMatch() {
        const matcher = {
            [Symbol.match](str) {
                return str === "match-me" ? ["match-me"] : null;
            }
        };
        const noMatchStr = "no-match";
        const result = noMatchStr.match(matcher);

        if (result !== null) {
            throw new Error(`Test005 failed: No-match case returned ${JSON.stringify(result)} (expected null)`);
        }
        return "Test Passed: SymbolMatchReturnsNullForNoMatchTest005";
    },

    /**
     * 006. Non-function Symbol.match throws TypeError.
     * Feature: If [Symbol.match] is not a function (except false), String.match() throws TypeError.
     */
    async test006_NonFunctionSymbolMatchThrows() {
        const invalidMatchers = [
            { [Symbol.match]: 123 },
            { [Symbol.match]: "str" },
            { [Symbol.match]: {} },
            { [Symbol.match]: [] }
        ];
        const testStr = "test";
        let errorCount = 0;

        for (const matcher of invalidMatchers) {
            try {
                testStr.match(matcher);
            } catch (e) {
                if (e instanceof TypeError) errorCount++;
            }
        }

        if (errorCount !== invalidMatchers.length) {
            throw new Error(`Test006 failed: Only ${errorCount}/${invalidMatchers.length} non-function matchers threw TypeError`);
        }
        return "Test Passed: NonFunctionSymbolMatchThrowsTest006";
    },

    /**
     * 007. Symbol.match with regex flags (e.g., 'g' for global match).
     * Feature: Custom [Symbol.match] can handle regex-like flags (e.g., global match logic).
     */
    async test007_SymbolMatchWithGlobalFlagLogic() {
        const globalMatcher = {
            flag: "g",
            [Symbol.match](str) {
                const regex = /a/g;
                return this.flag === "g" ? [...str.matchAll(regex)].map(m => m[0]) : str.match(regex);
            }
        };
        const str = "aaa";
        const result = str.match(globalMatcher);

        if (JSON.stringify(result) !== '["a","a","a"]') {
            throw new Error(`Test007 failed: Global match returned ${JSON.stringify(result)} (expected ["a","a","a"])`);
        }
        return "Test Passed: SymbolMatchWithGlobalFlagLogicTest007";
    },

    /**
     * 008. Inherited Symbol.match from prototype chain.
     * Feature: Custom [Symbol.match] can be inherited via prototype chain.
     */
    async test008_InheritedSymbolMatch() {
        const protoMatcher = {
            [Symbol.match](str) {
                return str.length > 5 ? ["long-enough"] : null;
            }
        };
        const childObj = Object.create(protoMatcher);
        const longStr = "123456";
        const shortStr = "123";

        const result1 = longStr.match(childObj);
        const result2 = shortStr.match(childObj);

        if (JSON.stringify(result1) !== '["long-enough"]' || result2 !== null) {
            throw new Error(`Test008 failed: Inherited match returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["long-enough"], null)`);
        }
        return "Test Passed: InheritedSymbolMatchTest008";
    },


    /**
     * 010. Symbol.match = true still treats object as regex (only false disables).
     * Feature: Only [Symbol.match] = false marks object as non-regex; true/falsy (non-false) still treat as regex.
     */
    async test010_SymbolMatchTrueTreatAsRegex() {
        const trueMatcher = { [Symbol.match]: true };
        const falsyMatcher = { [Symbol.match]: "" };
        const testStr = "test";
        let errorCount = 0;


        try {
            testStr.match(trueMatcher);
        } catch (e) {
            if (e instanceof TypeError) errorCount++;
        }
        try {
            testStr.match(falsyMatcher);
        } catch (e) {
            if (e instanceof TypeError) errorCount++;
        }

        if (errorCount !== 2) {
            throw new Error(`Test010 failed: Only ${errorCount}/2 non-false matchers threw regex-related TypeError`);
        }
        return "Test Passed: SymbolMatchTrueTreatAsRegexTest010";
    },
    /**
     * 011. Custom Symbol.match returns non-array result (e.g., object).
     * Feature: [Symbol.match] can return non-array values; String.match propagates the result.
     */
    async test011_SymbolMatchReturnsNonArray() {
        const customMatcher = {
            [Symbol.match](str) {
                return str.includes("obj") ? { match: "obj-found", length: str.length } : null;
            }
        };
        const matchStr = "test-obj";
        const result = matchStr.match(customMatcher);

        if (result?.match !== "obj-found" || result?.length !== 8) {
            throw new Error(`Test011 failed: Non-array match returned ${JSON.stringify(result)} (expected { match: "obj-found", length: 8 })`);
        }
        return "Test Passed: SymbolMatchReturnsNonArrayTest011";
    },

    /**
     * 012. Symbol.match=false interacts with String.endsWith.
     * Feature: [Symbol.match]=false marks object as non-regex for String.endsWith().
     */
    async test012_SymbolMatchFalseWithEndsWith() {
        const nonRegexObj = { [Symbol.match]: false, toString: () => "lo" };
        const str = "hello";
        const result = str.endsWith(nonRegexObj);

        if (result !== true) {
            throw new Error(`Test012 failed: endsWith returned ${result} (expected true; non-regex compared to "lo")`);
        }
        return "Test Passed: SymbolMatchFalseWithEndsWithTest012";
    },

    /**
     * 013. Symbol.match=false interacts with String.includes.
     * Feature: [Symbol.match]=false marks object as non-regex for String.includes().
     */
    async test013_SymbolMatchFalseWithIncludes() {
        const nonRegexObj = { [Symbol.match]: false, toString: () => "ell" };
        const str = "hello";
        const result = str.includes(nonRegexObj);

        if (result !== true) {
            throw new Error(`Test013 failed: includes returned ${result} (expected true; non-regex compared to "ell")`);
        }
        return "Test Passed: SymbolMatchFalseWithIncludesTest013";
    },

    /**
     * 014. this binding in Symbol.match method.
     * Feature: [Symbol.match] method's `this` points to the matcher object.
     */
    async test014_SymbolMatchThisBinding() {
        const matcher = {
            target: "bind-test",
            [Symbol.match](str) {
                return str === this.target ? ["this-bound"] : null;
            }
        };
        const matchStr = "bind-test";
        const result = matchStr.match(matcher);

        if (JSON.stringify(result) !== '["this-bound"]') {
            throw new Error(`Test014 failed: this binding returned ${JSON.stringify(result)} (expected ["this-bound"])`);
        }
        return "Test Passed: SymbolMatchThisBindingTest014";
    },

    /**
     * 015. Override RegExp.prototype[Symbol.match] (affects all RegExp).
     * Feature: Rewriting RegExp's prototype [Symbol.match] changes default RegExp behavior.
     */
    async test015_OverrideRegExpPrototypeSymbolMatch() {

        const originalMatch = RegExp.prototype[Symbol.match];

        RegExp.prototype[Symbol.match] = function(str) {
            return str.includes(this.source) ? ["proto-override"] : null;
        };

        const reg = /test/;
        const matchStr = "test-proto";
        const result = matchStr.match(reg);


        RegExp.prototype[Symbol.match] = originalMatch;

        if (JSON.stringify(result) !== '["proto-override"]') {
            throw new Error(`Test015 failed: Overridden RegExp prototype returned ${JSON.stringify(result)} (expected ["proto-override"])`);
        }
        return "Test Passed: OverrideRegExpPrototypeSymbolMatchTest015";
    },

    /**
     * 016. Empty string as target for custom Symbol.match.
     * Feature: Custom [Symbol.match] correctly handles empty target string.
     */
    async test016_SymbolMatchWithEmptyTarget() {
        const matcher = {
            [Symbol.match](str) {
                return str === "" ? ["empty-target"] : null;
            }
        };
        const emptyStr = "";
        const nonEmptyStr = "not-empty";

        const result1 = emptyStr.match(matcher);
        const result2 = nonEmptyStr.match(matcher);

        if (JSON.stringify(result1) !== '["empty-target"]' || result2 !== null) {
            throw new Error(`Test016 failed: Empty target returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["empty-target"], null)`);
        }
        return "Test Passed: SymbolMatchWithEmptyTargetTest016";
    },

    /**
     * 017. Target string with regex metacharacters (no regex parsing).
     * Feature: Custom [Symbol.match] treats target string as raw text (no regex metacharacter parsing).
     */
    async test017_SymbolMatchWithRegexMetachars() {
        const matcher = {
            [Symbol.match](str) {
                return str === "^test$" ? ["metachar-match"] : null;
            }
        };
        const metacharStr = "^test$";
        const result = metacharStr.match(matcher);

        if (JSON.stringify(result) !== '["metachar-match"]') {
            throw new Error(`Test017 failed: Metachar string returned ${JSON.stringify(result)} (expected ["metachar-match"])`);
        }
        return "Test Passed: SymbolMatchWithRegexMetacharsTest017";
    },

    /**
     * 018. Symbol.match method throws error (propagation test).
     * Feature: Errors thrown in [Symbol.match] are propagated to String.match caller.
     */
    async test018_SymbolMatchThrowsError() {
        const errorMsg = "match-error";
        const errorMatcher = {
            [Symbol.match]() {
                throw new Error(errorMsg);
            }
        };
        const str = "test";
        let errorCaught = false;

        try {
            str.match(errorMatcher);
        } catch (e) {
            errorCaught = e.message === errorMsg;
        }

        if (!errorCaught) {
            throw new Error(`Test018 failed: Symbol.match error not caught (expected "${errorMsg}")`);
        }
        return "Test Passed: SymbolMatchThrowsErrorTest018";
    },

    /**
     * 019. Multiple custom matchers with different logic.
     * Feature: Independent custom matchers retain their unique logic.
     */
    async test019_MultipleCustomMatchers() {
        const matcherA = { [Symbol.match](str) { return str.includes("A") ? ["A-match"] : null; } };
        const matcherB = { [Symbol.match](str) { return str.includes("B") ? ["B-match"] : null; } };
        const strA = "test-A";
        const strB = "test-B";

        const resultA = strA.match(matcherA);
        const resultB = strB.match(matcherB);

        if (JSON.stringify(resultA) !== '["A-match"]' || JSON.stringify(resultB) !== '["B-match"]') {
            throw new Error(`Test019 failed: Multiple matchers returned (${JSON.stringify(resultA)}, ${JSON.stringify(resultB)}) (expected ["A-match"], ["B-match"])`);
        }
        return "Test Passed: MultipleCustomMatchersTest019";
    },

    /**
     * 020. Symbol.match=false with String.startsWith position parameter.
     * Feature: [Symbol.match]=false works with String.startsWith's optional position argument.
     */
    async test020_SymbolMatchFalseWithStartsWithPosition() {
        const nonRegexObj = { [Symbol.match]: false, toString: () => "lo" };
        const str = "hello-world";

        const result = str.startsWith(nonRegexObj, 3);

        if (result !== true) {
            throw new Error(`Test020 failed: startsWith with position returned ${result} (expected true)`);
        }
        return "Test Passed: SymbolMatchFalseWithStartsWithPositionTest020";
    },

    /**
     * 021. Custom Symbol.match returns empty array (vs null).
     * Feature: Empty array result is treated as "match found (empty)" vs null "no match".
     */
    async test021_SymbolMatchReturnsEmptyArray() {
        const matcher = {
            [Symbol.match](str) {
                return str.includes("empty") ? [] : null;
            }
        };
        const matchStr = "test-empty";
        const noMatchStr = "test-no";

        const result1 = matchStr.match(matcher);
        const result2 = noMatchStr.match(matcher);

        if (!Array.isArray(result1) || result1.length !== 0 || result2 !== null) {
            throw new Error(`Test021 failed: Empty array return (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected [], null)`);
        }
        return "Test Passed: SymbolMatchReturnsEmptyArrayTest021";
    },

    /**
     * 022. Subclass overrides inherited Symbol.match.
     * Feature: Subclass's own [Symbol.match] overrides prototype-inherited method.
     */
    async test022_SubclassOverrideInheritedSymbolMatch() {
        const proto = { [Symbol.match](str) { return ["proto-match"]; } };
        class Subclass { constructor() { Object.setPrototypeOf(this, proto); } }

        const subInstance = new Subclass();
        subInstance[Symbol.match] = (str) => ["sub-match"];

        const result = "test".match(subInstance);

        if (JSON.stringify(result) !== '["sub-match"]') {
            throw new Error(`Test022 failed: Subclass override returned ${JSON.stringify(result)} (expected ["sub-match"])`);
        }
        return "Test Passed: SubclassOverrideInheritedSymbolMatchTest022";
    },

    /**
     * 023. Custom matcher uses RegExp.exec internally.
     * Feature: Custom [Symbol.match] can delegate to RegExp.exec for regex-like logic.
     */
    async test023_SymbolMatchDelegatesToRegExpExec() {
        const regexMatcher = {
            reg: /test(\d+)/,
            [Symbol.match](str) {
                return this.reg.exec(str);
            }
        };
        const str = "test123";
        const result = str.match(regexMatcher);

        if (result[0] !== "test123" || result[1] !== "123") {
            throw new Error(`Test023 failed: Delegate to exec returned ${JSON.stringify(result)} (expected ["test123", "123"])`);
        }
        return "Test Passed: SymbolMatchDelegatesToRegExpExecTest023";
    },

    /**
     * 024. Symbol.match with Unicode characters (raw text matching).
     * Feature: Custom [Symbol.match] correctly matches Unicode characters (no encoding issues).
     */
    async test024_SymbolMatchWithUnicodeChars() {
        const unicodeMatcher = {
            [Symbol.match](str) {
                return str === "𝌆" ? ["unicode-match"] : null;
            }
        };
        const unicodeStr = "𝌆";
        const result = unicodeStr.match(unicodeMatcher);

        if (JSON.stringify(result) !== '["unicode-match"]') {
            throw new Error(`Test024 failed: Unicode match returned ${JSON.stringify(result)} (expected ["unicode-match"])`);
        }
        return "Test Passed: SymbolMatchWithUnicodeCharsTest024";
    },

    /**
     * 025. Symbol.match=false object's toString affects string comparison.
     * Feature: For [Symbol.match]=false objects, String methods use object's toString() result for comparison.
     */
    async test025_SymbolMatchFalseObjectToString() {
        const customObj = {
            [Symbol.match]: false,
            toString() { return "custom-str"; }
        };
        const str = "prefix-custom-str-suffix";
        const result = str.includes(customObj);

        if (result !== true) {
            throw new Error(`Test025 failed: toString-based comparison returned ${result} (expected true; looking for "custom-str")`);
        }
        return "Test Passed: SymbolMatchFalseObjectToStringTest025";
    },



    /**
     * 027. Symbol.match method receives exactly one argument.
     * Feature: [Symbol.match] is called with only the target string (extra arguments are ignored).
     */
    async test027_SymbolMatchArgumentCount() {
        let argCount = 0;
        const matcher = {
            [Symbol.match](...args) {
                argCount = args.length;
                return [];
            }
        };

        "test".match(matcher, "extra1", "extra2");

        if (argCount !== 1) {
            throw new Error(`Test027 failed: Symbol.match received ${argCount} args (expected 1)`);
        }
        return "Test Passed: SymbolMatchArgumentCountTest027";
    },

    /**
     * 028. Frozen matcher object's Symbol.match is callable.
     * Feature: Freezing a matcher object does not prevent calling its [Symbol.match] method.
     */
    async test028_FrozenMatcherSymbolMatch() {
        const frozenMatcher = Object.freeze({
            [Symbol.match](str) {
                return str.includes("frozen") ? ["frozen-match"] : null;
            }
        });
        const str = "test-frozen";
        const result = str.match(frozenMatcher);

        if (JSON.stringify(result) !== '["frozen-match"]') {
            throw new Error(`Test028 failed: Frozen matcher returned ${JSON.stringify(result)} (expected ["frozen-match"])`);
        }
        return "Test Passed: FrozenMatcherSymbolMatchTest028";
    },




};