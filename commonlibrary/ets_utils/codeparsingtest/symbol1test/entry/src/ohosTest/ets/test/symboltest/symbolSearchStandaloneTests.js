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
export const SymbolSearchStandaloneTestUtils = {
    /**
     * 001. RegExp default Symbol.search (returns first match index, ignores 'g' flag).
     * Feature: RegExp.prototype[Symbol.search] is called by String.search(), returns first match index (ignores 'g').
     */
    async test001_RegExpDefaultSymbolSearch() {
        const reg = /a/g;
        const str = "abab";
        const result = str.search(reg);

        if (result !== 0) {
            throw new Error(`Test001 failed: Default search returned ${result} (expected 0, first 'a' at index 0)`);
        }
        return "Test Passed: RegExpDefaultSymbolSearchTest001";
    },





    /**
     * 004. Symbol.search receives target string as argument.
     * Feature: [Symbol.search] method is called with the target string as its only argument.
     */
    async test004_SymbolSearchReceivesTarget() {
        let receivedStr = "";
        const searcher = {
            [Symbol.search](str) {
                receivedStr = str;
                return -1;
            }
        };
        const testStr = "target-string-123";

        testStr.search(searcher);

        if (receivedStr !== testStr) {
            throw new Error(`Test004 failed: Symbol.search received "${receivedStr}" (expected "${testStr}")`);
        }
        return "Test Passed: SymbolSearchReceivesTargetTest004";
    },

    /**
     * 005. No match returns -1 (consistent with RegExp behavior).
     * Feature: [Symbol.search] returns -1 to indicate no match (aligns with RegExp default).
     */
    async test005_NoMatchReturnsMinusOne() {

        const regNoMatch = /z/;
        const str1 = "abc";
        const result1 = str1.search(regNoMatch);


        const customNoMatch = { [Symbol.search](str) { return str.includes("xyz") ? 0 : -1; } };
        const str2 = "abc";
        const result2 = str2.search(customNoMatch);

        if (result1 !== -1 || result2 !== -1) {
            throw new Error(`Test005 failed: No-match returned (${result1}, ${result2}) (expected -1, -1)`);
        }
        return "Test Passed: NoMatchReturnsMinusOneTest005";
    },


    /**
     * 007. Inherited Symbol.search from prototype chain.
     * Feature: Custom [Symbol.search] can be inherited via prototype.
     */
    async test007_InheritedSymbolSearch() {
        const protoSearcher = {
            [Symbol.search](str) {

                return str.search(/\d/);
            }
        };
        const childObj = Object.create(protoSearcher);
        const str1 = "abc123";
        const str2 = "abcdef";

        const result1 = str1.search(childObj);
        const result2 = str2.search(childObj);

        if (result1 !== 3 || result2 !== -1) {
            throw new Error(`Test007 failed: Inherited search returned (${result1}, ${result2}) (expected 3, -1)`);
        }
        return "Test Passed: InheritedSymbolSearchTest007";
    },



    /**
     * 010. Empty string target (match vs no match).
     * Feature: Symbol.search correctly handles empty target string.
     */
    async test010_EmptyStringTargetSearch() {

        const regEmptyMatch = /^/;
        const emptyStr1 = "";
        const result1 = emptyStr1.search(regEmptyMatch);


        const regEmptyNoMatch = /a/;
        const emptyStr2 = "";
        const result2 = emptyStr2.search(regEmptyNoMatch);


        const customEmpty = { [Symbol.search](str) { return str === "" ? 999 : -1; } };
        const emptyStr3 = "";
        const result3 = emptyStr3.search(customEmpty);

        if (result1 !== 0 || result2 !== -1 || result3 !== 999) {
            throw new Error(`Test010 failed: Empty target returned (${result1}, ${result2}, ${result3}) (expected 0, -1, 999)`);
        }
        return "Test Passed: EmptyStringTargetSearchTest010";
    },



    /**
     * 012. Errors in custom Symbol.search (propagation to caller).
     * Feature: Errors thrown in [Symbol.search] are propagated to String.search caller.
     */
    async test012_ErrorPropagationInSearch() {
        const errorSearcher = {
            [Symbol.search]() {
                throw new Error("search-error-012");
            }
        };
        const str = "test";
        let errorCaught = false;

        try {
            str.search(errorSearcher);
        } catch (e) {
            errorCaught = e.message === "search-error-012";
        }

        if (!errorCaught) {
            throw new Error(`Test012 failed: Search error not propagated (expected "search-error-012")`);
        }
        return "Test Passed: ErrorPropagationInSearchTest012";
    },

    /**
     * 013. Frozen searcher object (still supports Symbol.search).
     * Feature: Frozen objects retain [Symbol.search] functionality (method callable).
     */
    async test013_FrozenSearcherSymbolSearch() {
        const frozenSearcher = Object.freeze({
            [Symbol.search](str) {
                return str.includes("frozen") ? str.indexOf("frozen") : -1;
            }
        });
        const str1 = "test-frozen-123";
        const str2 = "no-match";
        const result1 = str1.search(frozenSearcher);
        const result2 = str2.search(frozenSearcher);

        if (result1 !== 5 || result2 !== -1) {
            throw new Error(`Test013 failed: Frozen searcher returned (${result1}, ${result2}) (expected 5, -1)`);
        }
        return "Test Passed: FrozenSearcherSymbolSearchTest013";
    },


    /**
     * 015. Dynamic searcher property (affects search logic).
     * Feature: Dynamic properties of searcher object influence [Symbol.search] behavior.
     */
    async test015_DynamicSearcherProperty() {
        const dynamicSearcher = {
            target: "old",
            [Symbol.search](str) {
                return str.indexOf(this.target);
            }
        };
        const str = "old-new-old";
        const result1 = str.search(dynamicSearcher);

        dynamicSearcher.target = "new";
        const result2 = str.search(dynamicSearcher);

        if (result1 !== 0 || result2 !== 4) {
            throw new Error(`Test015 failed: Dynamic property returned (${result1}, ${result2}) (expected 0, 4)`);
        }
        return "Test Passed: DynamicSearcherPropertyTest015";
    },

    /**
     * 016. Unicode character search (correct index calculation).
     * Feature: Symbol.search correctly calculates indices for multi-byte Unicode characters.
     */
    async test016_UnicodeCharacterSearch() {
        const unicodeSearcher = {
            [Symbol.search](str) {
                return str.indexOf("𝌆");
            }
        };
        const str1 = "a𝌆b";
        const str2 = "abc";
        const result1 = str1.search(unicodeSearcher);
        const result2 = str2.search(unicodeSearcher);

        if (result1 !== 1 || result2 !== -1) {
            throw new Error(`Test016 failed: Unicode search returned (${result1}, ${result2}) (expected 1, -1)`);
        }
        return "Test Passed: UnicodeCharacterSearchTest016";
    },







    /**
     * 022. Regex metacharacters as raw text (custom search).
     * Feature: Custom [Symbol.search] treats regex metacharacters as raw text (no regex parsing).
     */
    async test022_RegexMetacharactersRawText() {
        const metaSearcher = {
            [Symbol.search](str) {
                return str.indexOf(".");
            }
        };
        const str1 = "test.txt";
        const str2 = "testtxt";
        const result1 = str1.search(metaSearcher);
        const result2 = str2.search(metaSearcher);

        if (result1 !== 4 || result2 !== -1) {
            throw new Error(`Test022 failed: Metachar search returned (${result1}, ${result2}) (expected 4, -1)`);
        }
        return "Test Passed: RegexMetacharactersRawTextTest022";
    },

    /**
     * 023. Multiple matches but returns first index (consistent with MDN).
     * Feature: Even with multiple matches, [Symbol.search] returns only the first index (per MDN definition).
     */
    async test023_MultipleMatchesReturnFirst() {
        const multiSearcher = {
            [Symbol.search](str) {
                const matches = [];
                let index = str.indexOf("a");
                while (index !== -1) {
                    matches.push(index);
                    index = str.indexOf("a", index + 1);
                }
                return matches.length > 0 ? matches[0] : -1;
            }
        };
        const str = "aaabbb";
        const result = str.search(multiSearcher);

        if (result !== 0) {
            throw new Error(`Test023 failed: Multiple matches returned ${result} (expected 0)`);
        }
        return "Test Passed: MultipleMatchesReturnFirstTest023";
    },



    /**
     * 025. Inherited from RegExp subclass (custom Symbol.search).
     * Feature: Subclass of RegExp can override [Symbol.search] and be inherited.
     */
    async test025_RegExpSubclassInheritedSearch() {
        class RegSubclass extends RegExp {
            [Symbol.search](str) {
                const index = super[Symbol.search](str);
                return index !== -1 ? index + 100 : -1;
            }
        }
        const subReg = new RegSubclass("a");
        const str = "ab";
        const result = str.search(subReg);

        if (result !== 100) {
            throw new Error(`Test025 failed: RegExp subclass returned ${result} (expected 100)`);
        }
        return "Test Passed: RegExpSubclassInheritedSearchTest025";
    },


    /**
     * 027. Empty match at string end (e.g., /$/).
     * Feature: Symbol.search returns correct index for empty match at string end (e.g., /$/).
     */
    async test027_EmptyMatchAtStringEnd() {
        const endSearcher = {
            [Symbol.search](str) {
                return str.search(/$/);
            }
        };
        const str1 = "abc";
        const str2 = "";
        const result1 = str1.search(endSearcher);
        const result2 = str2.search(endSearcher);

        if (result1 !== 3 || result2 !== 0) {
            throw new Error(`Test027 failed: Empty end match returned (${result1}, ${result2}) (expected 3, 0)`);
        }
        return "Test Passed: EmptyMatchAtStringEndTest027";
    },

    /**
     * 028. Override RegExp.prototype[Symbol.search] (global effect).
     * Feature: Rewriting RegExp's prototype [Symbol.search] affects all RegExp instances.
     */
    async test028_OverrideRegExpPrototypeSearch() {
        const originalSearch = RegExp.prototype[Symbol.search];

        RegExp.prototype[Symbol.search] = function(str) {
            const original = originalSearch.call(this, str);
            return original !== -1 ? original + 10 : -1;
        };

        const reg1 = /a/;
        const reg2 = /z/;
        const result1 = "a".search(reg1);
        const result2 = "a".search(reg2);


        RegExp.prototype[Symbol.search] = originalSearch;

        if (result1 !== 10 || result2 !== -1) {
            throw new Error(`Test028 failed: Override prototype returned (${result1}, ${result2}) (expected 10, -1)`);
        }
        return "Test Passed: OverrideRegExpPrototypeSearchTest028";
    },


    /**
     * 030. This binding in custom Symbol.search.
     * Feature: [Symbol.search] method's `this` points to the searcher object.
     */
    async test030_SymbolSearchThisBinding() {
        const bindingSearcher = {
            offset: 5,
            [Symbol.search](str) {
                const index = str.indexOf("test");
                return index !== -1 ? index + this.offset : -1;
            }
        };
        const str = "test-this";
        const result = str.search(bindingSearcher);

        if (result !== 5) {
            throw new Error(`Test030 failed: This binding returned ${result} (expected 5)`);
        }
        return "Test Passed: SymbolSearchThisBindingTest030";
    }
};