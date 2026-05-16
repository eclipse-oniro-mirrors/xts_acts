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
export const SymbolReplaceStandaloneTestUtils = {
    /**
     * 001. RegExp default Symbol.replace (global replacement).
     * Feature: RegExp.prototype[Symbol.replace] is called by String.prototype.replace(), supports global replacement.
     */
    async test001_RegExpDefaultSymbolReplace() {
        const reg = /a/g;
        const str = "abab";
        const replaceVal = "x";

        const result = str.replace(reg, replaceVal);

        if (result !== "xbxb") {
            throw new Error(`Test001 failed: Default global replace returned "${result}" (expected "xbxb")`);
        }
        return "Test Passed: RegExpDefaultSymbolReplaceTest001";
    },

    /**
     * 002. Custom object implements Symbol.replace (override default logic).
     * Feature: Custom objects with [Symbol.replace] override String.prototype.replace() behavior.
     */
    async test002_CustomObjectSymbolReplace() {
        const customReplacer = {
            [Symbol.replace](str, replaceVal) {

                return str.includes("test") ? str.replace("test", replaceVal) : str;
            }
        };
        const matchStr = "this is a test";
        const noMatchStr = "no match here";
        const replaceVal = "REPLACED";

        const result1 = matchStr.replace(customReplacer, replaceVal);
        const result2 = noMatchStr.replace(customReplacer, replaceVal);

        if (result1 !== "this is a REPLACED" || result2 !== noMatchStr) {
            throw new Error(`Test002 failed: Custom replace returned ("${result1}", "${result2}") (expected "this is a REPLACED", "${noMatchStr}")`);
        }
        return "Test Passed: CustomObjectSymbolReplaceTest002";
    },




    /**
     * 005. Handle replace value as function.
     * Feature: Custom [Symbol.replace] supports replaceVal as function (calls function for replacement).
     */
    async test005_SymbolReplaceWithFunctionReplaceVal() {
        const funcReplacer = {
            [Symbol.replace](str, replaceFunc) {

                const match = str.match(/\d+/);
                if (match) {
                    const replacement = replaceFunc(match[0], match.index, str);
                    return str.replace(match[0], replacement);
                }
                return str;
            }
        };
        const str = "age: 25";

        const replaceFunc = (match) => String(Number(match) + 10);
        const result = str.replace(funcReplacer, replaceFunc);

        if (result !== "age: 35") {
            throw new Error(`Test005 failed: Function replace returned "${result}" (expected "age: 35")`);
        }
        return "Test Passed: SymbolReplaceWithFunctionReplaceValTest005";
    },

    /**
     * 007. Inherited Symbol.replace from prototype chain.
     * Feature: Custom [Symbol.replace] can be inherited via prototype.
     */
    async test007_InheritedSymbolReplace() {
        const protoReplacer = {
            [Symbol.replace](str, replaceVal) {

                return str.replace(/pro/g, replaceVal);
            }
        };
        const childObj = Object.create(protoReplacer);
        const str = "pro1 pro2 pro3";
        const replaceVal = "inherit";
        const result = str.replace(childObj, replaceVal);

        if (result !== "inherit1 inherit2 inherit3") {
            throw new Error(`Test007 failed: Inherited replace returned "${result}" (expected "inherit1 inherit2 inherit3")`);
        }
        return "Test Passed: InheritedSymbolReplaceTest007";
    },

    /**
     * 008. RegExp non-global replacement (only first match).
     * Feature: RegExp without 'g' flag replaces only first match via Symbol.replace.
     */
    async test008_RegExpNonGlobalSymbolReplace() {
        const reg = /a/;
        const str = "abab";
        const replaceVal = "x";
        const result = str.replace(reg, replaceVal);

        if (result !== "xbab") {
            throw new Error(`Test008 failed: Non-global replace returned "${result}" (expected "xbab")`);
        }
        return "Test Passed: RegExpNonGlobalSymbolReplaceTest008";
    },

    /**
     * 009. Custom Symbol.replace supports capture groups.
     * Feature: Custom [Symbol.replace] can handle regex capture groups in replaceVal.
     */
    async test009_SymbolReplaceWithCaptureGroups() {
        const captureReplacer = {
            [Symbol.replace](str, replaceVal) {

                const reg = /(\w+)=(\d+)/;
                const match = str.match(reg);
                if (match) {

                    return replaceVal.replace("$1", match[1]).replace("$2", match[2]);
                }
                return str;
            }
        };
        const str = "score=90";
        const replaceVal = "Result: $1 is $2";
        const result = str.replace(captureReplacer, replaceVal);

        if (result !== "Result: score is 90") {
            throw new Error(`Test009 failed: Capture group replace returned "${result}" (expected "Result: score is 90")`);
        }
        return "Test Passed: SymbolReplaceWithCaptureGroupsTest009";
    },

    /**
     * 010. Symbol.replace handles empty match.
     * Feature: Custom [Symbol.replace] correctly processes empty match (e.g., regex /^/).
     */
    async test010_SymbolReplaceWithEmptyMatch() {
        const emptyMatchReplacer = {
            [Symbol.replace](str, replaceVal) {

                const reg = /^/;
                return str.replace(reg, replaceVal);
            }
        };
        const str = "abc";
        const replaceVal = "prefix-";
        const result = str.replace(emptyMatchReplacer, replaceVal);

        if (result !== "prefix-abc") {
            throw new Error(`Test010 failed: Empty match replace returned "${result}" (expected "prefix-abc")`);
        }
        return "Test Passed: SymbolReplaceWithEmptyMatchTest010";
    },


    /**
     * 012. Replace value with special sequences ($&, $`, $').
     * Feature: Custom Symbol.replace handles special replace sequences (e.g., $& = matched substring).
     */
    async test012_SpecialReplaceSequences() {
        const specialReplacer = {
            [Symbol.replace](str, replaceVal) {
                const match = str.match(/test/);
                if (match) {

                    return replaceVal
                        .replace("$&", match[0])
                        .replace("$`", match.input.slice(0, match.index))
                        .replace("$'", match.input.slice(match.index + match[0].length));
                }
                return str;
            }
        };
        const str = "pre-test-post";
        const replaceVal = "[$`][$&][$']";
        const result = str.replace(specialReplacer, replaceVal);

        if (result !== "[pre-][test][-post]") {
            throw new Error(`Test012 failed: Special sequences returned "${result}" (expected "[pre-][test][-post]")`);
        }
        return "Test Passed: SpecialReplaceSequencesTest012";
    },

    /**
     * 014. Custom Symbol.replace with iterative replacement.
     * Feature: Custom logic can implement iterative replacement (multiple passes).
     */
    async test014_IterativeReplacement() {
        const iterativeReplacer = {
            [Symbol.replace](str, replaceVal) {
                let result = str;

                while (result.includes("a")) {
                    result = result.replace("a", replaceVal);
                }
                return result;
            }
        };
        const str = "aaabbb";
        const replaceVal = "x";
        const result = str.replace(iterativeReplacer, replaceVal);

        if (result !== "xxxbbb") {
            throw new Error(`Test014 failed: Iterative replace returned "${result}" (expected "xxxbbb")`);
        }
        return "Test Passed: IterativeReplacementTest014";
    },

    /**
     * 015. Errors in custom Symbol.replace (propagation to caller).
     * Feature: Errors thrown in [Symbol.replace] are propagated to String.replace caller.
     */
    async test015_ErrorPropagationInReplace() {
        const errorReplacer = {
            [Symbol.replace]() {
                throw new Error("replace-error");
            }
        };
        const str = "test";
        let errorCaught = false;

        try {
            str.replace(errorReplacer, "x");
        } catch (e) {
            errorCaught = e.message === "replace-error";
        }

        if (!errorCaught) {
            throw new Error(`Test015 failed: Replace error not propagated (expected "replace-error")`);
        }
        return "Test Passed: ErrorPropagationInReplaceTest015";
    },

    /**
     * 016. Frozen replacer object (still supports Symbol.replace).
     * Feature: Frozen objects retain [Symbol.replace] functionality.
     */
    async test016_FrozenReplacerSymbolReplace() {
        const frozenReplacer = Object.freeze({
            [Symbol.replace](str, replaceVal) {
                return str.replace(/frozen/g, replaceVal);
            }
        });
        const str = "frozen test frozen";
        const replaceVal = "fixed";
        const result = str.replace(frozenReplacer, replaceVal);

        if (result !== "fixed test fixed") {
            throw new Error(`Test016 failed: Frozen replacer returned "${result}" (expected "fixed test fixed")`);
        }
        return "Test Passed: FrozenReplacerSymbolReplaceTest016";
    },

    /**
     * 017. Replace function with multiple arguments (capture groups, index).
     * Feature: Replace function receives (match, capture1, index, originalStr) as arguments.
     */
    async test017_ReplaceFunctionWithArgs() {
        const funcReplacer = {
            [Symbol.replace](str, replaceFunc) {
                const reg = /(\w+)=(\d+)/;
                const match = str.match(reg);
                if (match) {

                    return replaceFunc(match[0], match[1], match[2], match.index, str);
                }
                return str;
            }
        };
        const str = "age=25";

        const replaceFunc = (match, key, val, index) => `${key}: ${val} (at ${index})`;
        const result = str.replace(funcReplacer, replaceFunc);

        if (result !== "age: 25 (at 0)") {
            throw new Error(`Test017 failed: Replace function args returned "${result}" (expected "age: 25 (at 0)")`);
        }
        return "Test Passed: ReplaceFunctionWithArgsTest017";
    },

    /**
     * 018. Multi-byte character replacement (Chinese, Unicode).
     * Feature: Symbol.replace correctly handles multi-byte characters (no truncation).
     */
    async test018_MultiByteCharacterReplace() {
        const multiByteReplacer = {
            [Symbol.replace](str, replaceVal) {
                return str.replace(/[\u4e00-\u9fa5]/g, replaceVal);
            }
        };
        const str = "你好abc世界";
        const replaceVal = "x";
        const result = str.replace(multiByteReplacer, replaceVal);

        if (result !== "xxabcxx") {
            throw new Error(`Test018 failed: Multi-byte replace returned "${result}" (expected "xxabcxx")`);
        }
        return "Test Passed: MultiByteCharacterReplaceTest018";
    },


    /**
     * 020. Named capture groups in replace value ($<name>).
     * Feature: Custom Symbol.replace supports named capture group placeholders ($<name>).
     */
    async test020_NamedCaptureGroupsReplace() {
        const namedReplacer = {
            [Symbol.replace](str, replaceVal) {
                const reg = /(?<key>\w+)=(?<val>\d+)/;
                const match = str.match(reg);
                if (match) {

                    return replaceVal
                        .replace("$<key>", match.groups.key)
                        .replace("$<val>", match.groups.val);
                }
                return str;
            }
        };
        const str = "score=90";
        const replaceVal = "Key: $<key>, Value: $<val>";
        const result = str.replace(namedReplacer, replaceVal);

        if (result !== "Key: score, Value: 90") {
            throw new Error(`Test020 failed: Named capture replace returned "${result}" (expected "Key: score, Value: 90")`);
        }
        return "Test Passed: NamedCaptureGroupsReplaceTest020";
    },



    /**
     * 023. RegExp lastIndex reset after replacement (global flag).
     * Feature: RegExp.lastIndex is reset to 0 after global replacement via Symbol.replace.
     */
    async test023_RegExpLastIndexResetAfterReplace() {
        const globalReg = /x/g;
        const str = "xxx";
        globalReg.lastIndex = 1;

        str.replace(globalReg, "y");
        const lastIndexAfter = globalReg.lastIndex;

        if (lastIndexAfter !== 0) {
            throw new Error(`Test023 failed: lastIndex after replace is ${lastIndexAfter} (expected 0)`);
        }
        return "Test Passed: RegExpLastIndexResetAfterReplaceTest023";
    },

    /**
     * 024. Custom Symbol.replace returns non-string value.
     * Feature: [Symbol.replace] can return non-string values (propagated to caller).
     */
    async test024_NonStringReturnFromReplace() {
        const nonStringReplacer = {
            [Symbol.replace](str, replaceVal) {

                return (str.match(new RegExp(replaceVal, "g")) || []).length;
            }
        };
        const str = "a b a b a";
        const replaceVal = "a";
        const result = str.replace(nonStringReplacer, replaceVal);

        if (result !== 3) {
            throw new Error(`Test024 failed: Non-string return is ${result} (expected 3)`);
        }
        return "Test Passed: NonStringReturnFromReplaceTest024";
    },

    /**
     * 025. Null/undefined as replace value.
     * Feature: Null/undefined as replaceVal are converted to "null"/"undefined" strings.
     */
    async test025_NullUndefinedAsReplaceVal() {
        const reg = /test/g;
        const str = "test test";

        const nullResult = str.replace(reg, null);
        const undefinedResult = str.replace(reg, undefined);

        if (nullResult !== "null null" || undefinedResult !== "undefined undefined") {
            throw new Error(`Test025 failed: Null/undefined replaceVal returned ("${nullResult}", "${undefinedResult}") (expected "null null", "undefined undefined")`);
        }
        return "Test Passed: NullUndefinedAsReplaceValTest025";
    },

    /**
     * 026. This binding in custom Symbol.replace.
     * Feature: [Symbol.replace] method's `this` points to the replacer object.
     */
    async test026_SymbolReplaceThisBinding() {
        const bindingReplacer = {
            prefix: "REPLACE_",
            [Symbol.replace](str, replaceVal) {

                return str.replace(/target/g, this.prefix + replaceVal);
            }
        };
        const str = "target value";
        const replaceVal = "NEW";
        const result = str.replace(bindingReplacer, replaceVal);

        if (result !== "REPLACE_NEW value") {
            throw new Error(`Test026 failed: This binding returned "${result}" (expected "REPLACE_NEW value")`);
        }
        return "Test Passed: SymbolReplaceThisBindingTest026";
    },

    /**
     * 027. Override RegExp.prototype[Symbol.replace] (global effect).
     * Feature: Rewriting RegExp's prototype [Symbol.replace] affects all RegExp instances.
     */
    async test027_OverrideRegExpPrototypeReplace() {
        const originalReplace = RegExp.prototype[Symbol.replace];
        RegExp.prototype[Symbol.replace] = function(str, replaceVal) {
            const originalResult = originalReplace.call(this, str, replaceVal);
            return "PROTO_" + originalResult;
        };

        const reg1 = /a/g;
        const reg2 = /b/;
        const result1 = "aa".replace(reg1, "x");
        const result2 = "bb".replace(reg2, "y");

        RegExp.prototype[Symbol.replace] = originalReplace;

        if (result1 !== "PROTO_xx" || result2 !== "PROTO_yb") {
            throw new Error(`Test027 failed: Override prototype returned ("${result1}", "${result2}") (expected "PROTO_xx", "PROTO_yb")`);
        }
        return "Test Passed: OverrideRegExpPrototypeReplaceTest027";
    },

    /**
     * 028. Empty string target with Symbol.replace.
     * Feature: Custom [Symbol.replace] correctly handles empty target string.
     */
    async test028_EmptyStringTargetReplace() {
        const emptyTargetReplacer = {
            [Symbol.replace](str, replaceVal) {
                return str === "" ? replaceVal : str;
            }
        };
        const emptyStr = "";
        const nonEmptyStr = "test";
        const replaceVal = "empty-replaced";

        const result1 = emptyStr.replace(emptyTargetReplacer, replaceVal);
        const result2 = nonEmptyStr.replace(emptyTargetReplacer, replaceVal);

        if (result1 !== "empty-replaced" || result2 !== nonEmptyStr) {
            throw new Error(`Test028 failed: Empty target returned ("${result1}", "${result2}") (expected "empty-replaced", "${nonEmptyStr}")`);
        }
        return "Test Passed: EmptyStringTargetReplaceTest028";
    },

    /**
     * 029. Subclass overrides inherited Symbol.replace.
     * Feature: Subclass instance's own [Symbol.replace] overrides prototype-inherited method.
     */
    async test029_SubclassOverrideInheritedReplace() {
        const proto = {
            [Symbol.replace](str) {
                return str.replace(/proto/g, "inherited");
            }
        };
        class ReplacerSubclass { constructor() { Object.setPrototypeOf(this, proto); } }
        const subInstance = new ReplacerSubclass();
        subInstance[Symbol.replace] = (str) => str.replace(/proto/g, "subclass");

        const result = "proto test".replace(subInstance, "");

        if (result !== "subclass test") {
            throw new Error(`Test029 failed: Subclass override returned "${result}" (expected "subclass test")`);
        }
        return "Test Passed: SubclassOverrideInheritedReplaceTest029";
    },

    /**
     * 030. Manual call to Symbol.replace method.
     * Feature: [Symbol.replace] can be called directly (not via String.replace).
     */
    async test030_ManualCallSymbolReplace() {
        const manualReplacer = {
            [Symbol.replace](str, replaceVal) {
                return str.replace(/manual/g, replaceVal);
            }
        };
        const str = "manual test";
        const replaceVal = "direct";
        const result = manualReplacer[Symbol.replace](str, replaceVal);

        if (result !== "direct test") {
            throw new Error(`Test030 failed: Manual replace returned "${result}" (expected "direct test")`);
        }
        return "Test Passed: ManualCallSymbolReplaceTest030";
    }
};