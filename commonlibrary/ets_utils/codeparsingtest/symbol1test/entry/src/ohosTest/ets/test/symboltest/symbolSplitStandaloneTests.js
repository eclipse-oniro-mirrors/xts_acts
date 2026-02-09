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
export const SymbolSplitStandaloneTestUtils = {
    /**
     * 001. RegExp default Symbol.split (splits at regex matches).
     * Feature: RegExp.prototype[Symbol.split] is called by String.split(), splits at regex matches.
     */
    async test001_RegExpDefaultSymbolSplit() {
        const reg = /,/g;
        const str = "a,b,c,d";
        const result = str.split(reg);

        if (JSON.stringify(result) !== '["a","b","c","d"]') {
            throw new Error(`Test001 failed: Default split returned ${JSON.stringify(result)} (expected ["a","b","c","d"])`);
        }
        return "Test Passed: RegExpDefaultSymbolSplitTest001";
    },

    /**
     * 002. Custom object implements Symbol.split (override split logic).
     * Feature: Custom objects with [Symbol.split] override String.prototype.split() behavior.
     */
    async test002_CustomObjectSymbolSplit() {
        const reverseSplitter = {
            [Symbol.split](str) {

                return str.split(" ").reverse();
            }
        };
        const str = "hello world test";
        const result = str.split(reverseSplitter);

        if (JSON.stringify(result) !== '["test","world","hello"]') {
            throw new Error(`Test002 failed: Custom split returned ${JSON.stringify(result)} (expected ["test","world","hello"])`);
        }
        return "Test Passed: CustomObjectSymbolSplitTest002";
    },


    /**
     * 004. Symbol.split receives limit parameter.
     * Feature: [Symbol.split] method receives split limit as second argument.
     */
    async test004_SymbolSplitReceivesLimit() {
        let receivedLimit = null;
        const limitSplitter = {
            [Symbol.split](str, limit) {
                receivedLimit = limit;
                return str.split(" ", limit);
            }
        };
        const str = "1 2 3 4";
        const limit = 2;
        const result = str.split(limitSplitter, limit);

        if (receivedLimit !== limit || JSON.stringify(result) !== '["1","2"]') {
            throw new Error(`Test004 failed: Limit parameter received ${receivedLimit}, result ${JSON.stringify(result)} (expected ${limit}, ["1","2"])`);
        }
        return "Test Passed: SymbolSplitReceivesLimitTest004";
    },

    /**
     * 005. No match returns array with original string.
     * Feature: [Symbol.split] returns [originalStr] when no matches (consistent with RegExp).
     */
    async test005_NoMatchReturnsOriginalArray() {

        const regNoMatch = /x/g;
        const str1 = "abc";
        const result1 = str1.split(regNoMatch);


        const customNoMatch = { [Symbol.split](str) { return str.includes("x") ? str.split("x") : [str]; } };
        const str2 = "abc";
        const result2 = str2.split(customNoMatch);

        if (JSON.stringify(result1) !== '["abc"]' || JSON.stringify(result2) !== '["abc"]') {
            throw new Error(`Test005 failed: No-match returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["abc"], ["abc"])`);
        }
        return "Test Passed: NoMatchReturnsOriginalArrayTest005";
    },


    /**
     * 007. Inherited Symbol.split from prototype chain.
     * Feature: Custom [Symbol.split] can be inherited via prototype.
     */
    async test007_InheritedSymbolSplit() {
        const protoSplitter = {
            [Symbol.split](str) {

                return str.split(/\d/);
            }
        };
        const childObj = Object.create(protoSplitter);
        const str1 = "a1b2c";
        const str2 = "abc";

        const result1 = str1.split(childObj);
        const result2 = str2.split(childObj);

        if (JSON.stringify(result1) !== '["a","b","c"]' || JSON.stringify(result2) !== '["abc"]') {
            throw new Error(`Test007 failed: Inherited split returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["a","b","c"], ["abc"])`);
        }
        return "Test Passed: InheritedSymbolSplitTest007";
    },





    /**
     * 010. Manual call to Symbol.split (not via String.split).
     * Feature: [Symbol.split] can be called directly (independent of String.split).
     */
    async test010_ManualCallSymbolSplit() {
        const manualSplitter = {
            [Symbol.split](str) {
                return str.split("|");
            }
        };
        const str1 = "a|b|c";
        const str2 = "abc";
        const result1 = manualSplitter[Symbol.split](str1);
        const result2 = manualSplitter[Symbol.split](str2);

        if (JSON.stringify(result1) !== '["a","b","c"]' || JSON.stringify(result2) !== '["abc"]') {
            throw new Error(`Test010 failed: Manual split returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["a","b","c"], ["abc"])`);
        }
        return "Test Passed: ManualCallSymbolSplitTest010";
    },


    /**
     * 012. Errors in custom Symbol.split (propagation to caller).
     * Feature: Errors thrown in [Symbol.split] are propagated to String.split caller.
     */
    async test012_ErrorPropagationInSplit() {
        const errorSplitter = {
            [Symbol.split]() {
                throw new Error("split-error-012");
            }
        };
        const str = "test";
        let errorCaught = false;

        try {
            str.split(errorSplitter);
        } catch (e) {
            errorCaught = e.message === "split-error-012";
        }

        if (!errorCaught) {
            throw new Error(`Test012 failed: Split error not propagated (expected "split-error-012")`);
        }
        return "Test Passed: ErrorPropagationInSplitTest012";
    },

    /**
     * 013. Frozen splitter object (still supports Symbol.split).
     * Feature: Frozen objects retain [Symbol.split] functionality.
     */
    async test013_FrozenSplitterSymbolSplit() {
        const frozenSplitter = Object.freeze({
            [Symbol.split](str) {
                return str.split(/\s+/);
            }
        });
        const str = "hello world test";
        const expected = ["hello", "world", "test"];
        const result = str.split(frozenSplitter);

        if (JSON.stringify(result) !== JSON.stringify(expected)) {
            throw new Error(`Test013 failed: Frozen splitter returned ${JSON.stringify(result)} (expected ${JSON.stringify(expected)})`);
        }
        return "Test Passed: FrozenSplitterSymbolSplitTest013";
    },

    /**
     * 014. Unicode multi-byte character split (correct index calculation).
     * Feature: Symbol.split correctly calculates indices for multi-byte Unicode characters.
     */
    async test014_UnicodeMultiByteSplit() {
        const unicodeSplitter = {
            [Symbol.split](str) {
                return str.split("𝌆");
            }
        };
        const str1 = "a𝌆b𝌆c";
        const str2 = "abc";
        const result1 = str1.split(unicodeSplitter);
        const result2 = str2.split(unicodeSplitter);

        if (JSON.stringify(result1) !== '["a","b","c"]' || JSON.stringify(result2) !== '["abc"]') {
            throw new Error(`Test014 failed: Unicode split returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["a","b","c"], ["abc"])`);
        }
        return "Test Passed: UnicodeMultiByteSplitTest014";
    },

    /**
     * 015. Dynamic splitter property (affects split logic).
     * Feature: Dynamic properties of splitter influence [Symbol.split] behavior.
     */
    async test015_DynamicSplitterProperty() {
        const dynamicSplitter = {
            separator: ",",
            [Symbol.split](str) {
                return str.split(this.separator);
            }
        };
        const str = "a,b;c,d";
        const result1 = str.split(dynamicSplitter);
        dynamicSplitter.separator = ";";
        const result2 = str.split(dynamicSplitter);

        if (JSON.stringify(result1) !== '["a","b;c","d"]' || JSON.stringify(result2) !== '["a,b","c,d"]') {
            throw new Error(`Test015 failed: Dynamic property returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["a","b;c","d"], ["a,b","c,d"])`);
        }
        return "Test Passed: DynamicSplitterPropertyTest015";
    },

    /**
     * 016. Named capture groups in split (retains group info).
     * Feature: Custom [Symbol.split] can retain named capture group info in results.
     */
    async test016_NamedCaptureGroupsSplit() {
        const namedSplitter = {
            [Symbol.split](str) {
                const reg = /(?<sep>-|;)/g;
                const results = [];
                let lastIndex = 0;
                let match;
                while ((match = reg.exec(str)) !== null) {
                    results.push(str.slice(lastIndex, match.index));
                    results.push({ group: match.groups.sep, index: match.index });
                    lastIndex = reg.lastIndex;
                }
                results.push(str.slice(lastIndex));
                return results;
            }
        };
        const str = "a-b;c";
        const expected = ["a", { group: "-", index: 1 }, "b", { group: ";", index: 3 }, "c"];
        const result = str.split(namedSplitter);

        if (JSON.stringify(result) !== JSON.stringify(expected)) {
            throw new Error(`Test016 failed: Named capture split returned ${JSON.stringify(result)} (expected ${JSON.stringify(expected)})`);
        }
        return "Test Passed: NamedCaptureGroupsSplitTest016";
    },

    /**
     * 017. Iterative split (returns iterator instead of array).
     * Feature: Custom [Symbol.split] can return iterator (instead of array) for lazy split.
     */
    async test017_IterativeSplitReturnIterator() {
        const iterSplitter = {
            [Symbol.split](str) {
                const separator = " ";
                let index = 0;
                return {
                    [Symbol.iterator]() {
                        return {
                            next() {
                                if (index > str.length) return { done: true };
                                const nextIndex = str.indexOf(separator, index);
                                const value = nextIndex === -1 ? str.slice(index) : str.slice(index, nextIndex);
                                index = nextIndex === -1 ? str.length + 1 : nextIndex + 1;
                                return { value, done: false };
                            }
                        };
                    }
                };
            }
        };
        const str = "lazy split test";
        const result = [...str.split(iterSplitter)];
        const expected = ["lazy", "split", "test"];

        if (JSON.stringify(result) !== JSON.stringify(expected)) {
            throw new Error(`Test017 failed: Iterative split returned ${JSON.stringify(result)} (expected ${JSON.stringify(expected)})`);
        }
        return "Test Passed: IterativeSplitReturnIteratorTest017";
    },

    /**
     * 018. Empty string target split (handles empty input).
     * Feature: Symbol.split correctly processes empty target string.
     */
    async test018_EmptyStringTargetSplit() {
        const emptySplitter = {
            [Symbol.split](str) {
                return str === "" ? ["empty"] : str.split(",");
            }
        };
        const str1 = "";
        const str2 = ",";
        const result1 = str1.split(emptySplitter);
        const result2 = str2.split(emptySplitter);

        if (JSON.stringify(result1) !== '["empty"]' || JSON.stringify(result2) !== '["",""]') {
            throw new Error(`Test018 failed: Empty target split returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected ["empty"], ["",""])`);
        }
        return "Test Passed: EmptyStringTargetSplitTest018";
    },



    /**
     * 020. Subclass overrides inherited Symbol.split.
     * Feature: Subclass instance's own [Symbol.split] overrides prototype-inherited method.
     */
    async test020_SubclassOverrideInheritedSplit() {
        const protoSplitter = {
            [Symbol.split](str) {
                return str.split("-");
            }
        };
        class SplitterSubclass { constructor() { Object.setPrototypeOf(this, protoSplitter); } }
        const subInstance = new SplitterSubclass();

        subInstance[Symbol.split] = (str) => str.split(";");

        const str = "a-b;c-d";
        const result = str.split(subInstance);

        if (JSON.stringify(result) !== '["a-b","c-d"]') {
            throw new Error(`Test020 failed: Subclass override returned ${JSON.stringify(result)} (expected ["a-b","c-d"])`);
        }
        return "Test Passed: SubclassOverrideInheritedSplitTest020";
    },

    /**
     * 021. Repeated split calls (consistent behavior).
     * Feature: Multiple calls to split with same splitter return consistent results.
     */
    async test021_RepeatedSplitCalls() {
        const consistentSplitter = {
            [Symbol.split](str) {
                return str.split(/\d/);
            }
        };
        const str = "a1b2c3d";
        const result1 = str.split(consistentSplitter);
        const result2 = str.split(consistentSplitter);
        const expected = ["a", "b", "c", "d"];

        if (JSON.stringify(result1) !== JSON.stringify(expected) || JSON.stringify(result2) !== JSON.stringify(expected)) {
            throw new Error(`Test021 failed: Repeated split returned inconsistent results (${JSON.stringify(result1)}, ${JSON.stringify(result2)})`);
        }
        return "Test Passed: RepeatedSplitCallsTest021";
    },

    /**
     * 022. Empty separator split (splits into individual characters).
     * Feature: Empty string as separator splits string into individual characters.
     */
    async test022_EmptySeparatorSplit() {
        const emptySepSplitter = {
            [Symbol.split](str) {
                return str.split("");
            }
        };
        const str = "abc";
        const expected = ["a", "b", "c"];
        const result = str.split(emptySepSplitter);

        if (JSON.stringify(result) !== JSON.stringify(expected)) {
            throw new Error(`Test022 failed: Empty separator split returned ${JSON.stringify(result)} (expected ${JSON.stringify(expected)})`);
        }
        return "Test Passed: EmptySeparatorSplitTest022";
    },

    /**
     * 023. Regex metacharacters as separator (treated as raw text).
     * Feature: Custom [Symbol.split] treats regex metacharacters as raw text.
     */
    async test023_RegexMetacharactersAsSeparator() {
        const metaSplitter = {
            [Symbol.split](str) {
                return str.split(".");
            }
        };
        const str = "file.txt.doc";
        const expected = ["file", "txt", "doc"];
        const result = str.split(metaSplitter);

        if (JSON.stringify(result) !== JSON.stringify(expected)) {
            throw new Error(`Test023 failed: Metacharacter split returned ${JSON.stringify(result)} (expected ${JSON.stringify(expected)})`);
        }
        return "Test Passed: RegexMetacharactersAsSeparatorTest023";
    },

    /**
     * 024. Multi-level inheritance split priority.
     * Feature: Split follows prototype chain priority (subclass > parent > grandparent).
     */
    async test024_MultiLevelInheritanceSplit() {
        class GrandParentSplitter {
            static [Symbol.split](str) {
                return str.split("g");
            }
        }
        class ParentSplitter extends GrandParentSplitter {
            static [Symbol.split](str) {
                return str.split("p");
            }
        }
        class ChildSplitter extends ParentSplitter {
            static [Symbol.split](str) {
                return str.split("c");
            }
        }
        const str = "gcpcg";
        const result = str.split(ChildSplitter);

        if (JSON.stringify(result) !== '["g","p","g"]') {
            throw new Error(`Test024 failed: Multi-level split returned ${JSON.stringify(result)} (expected ["g","p","g"])`);
        }
        return "Test Passed: MultiLevelInheritanceSplitTest024";
    },

    /**
     * 025. Custom split returns non-array value.
     * Feature: [Symbol.split] can return non-array values (propagated to caller).
     */
    async test025_NonArrayReturnFromSplit() {
        const nonArraySplitter = {
            [Symbol.split](str) {

                return str.split(",").length;
            }
        };
        const str1 = "a,b,c";
        const str2 = "x";
        const result1 = str1.split(nonArraySplitter);
        const result2 = str2.split(nonArraySplitter);

        if (result1 !== 3 || result2 !== 1) {
            throw new Error(`Test025 failed: Non-array split returned (${result1}, ${result2}) (expected 3, 1)`);
        }
        return "Test Passed: NonArrayReturnFromSplitTest025";
    },



    /**
     * 027. Sparse string split (handles empty slots).
     * Feature: Symbol.split correctly processes sparse strings (from array with empty slots).
     */
    async test027_SparseStringSplit() {
        const sparseArr = ["a", , "b", , "c"];
        const sparseStr = sparseArr.join(",");
        const sparseSplitter = {
            [Symbol.split](str) {
                return str.split(",");
            }
        };
        const expected = ["a", "", "b", "", "c"];
        const result = sparseStr.split(sparseSplitter);

        if (JSON.stringify(result) !== JSON.stringify(expected)) {
            throw new Error(`Test027 failed: Sparse split returned ${JSON.stringify(result)} (expected ${JSON.stringify(expected)})`);
        }
        return "Test Passed: SparseStringSplitTest027";
    },

    /**
     * 028. Dynamic string modification during split (uses original string).
     * Feature: Split uses original string (no lazy re-evaluation of modified string).
     */
    async test028_DynamicStringModification() {
        let str = "a,b,c";
        const dynamicSplitter = {
            [Symbol.split](s) {
                str = "x,y,z";
                return s.split(",");
            }
        };
        const result = str.split(dynamicSplitter);

        if (JSON.stringify(result) !== '["a","b","c"]') {
            throw new Error(`Test028 failed: Dynamic modify split returned ${JSON.stringify(result)} (expected ["a","b","c"])`);
        }
        return "Test Passed: DynamicStringModificationTest028";
    },

    /**
     * 029. Closure-based splitter (retains context).
     * Feature: Splitter with closure retains context for split logic.
     */
    async test029_ClosureBasedSplitter() {
        const createSplitter = (prefix) => ({
            [Symbol.split](str) {
                return str.split(",").map(item => `${prefix}${item}`);
            }
        });
        const splitter = createSplitter("pre-");
        const str = "a,b,c";
        const expected = ["pre-a", "pre-b", "pre-c"];
        const result = str.split(splitter);

        if (JSON.stringify(result) !== JSON.stringify(expected)) {
            throw new Error(`Test029 failed: Closure split returned ${JSON.stringify(result)} (expected ${JSON.stringify(expected)})`);
        }
        return "Test Passed: ClosureBasedSplitterTest029";
    },


};