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
export const SymbolMatchAllStandaloneTestUtils = {
    /**
     * 001. RegExp default Symbol.matchAll (global flag required, returns iterator).
     * Feature: RegExp.prototype[Symbol.matchAll] returns iterator for String.matchAll, requires 'g' flag.
     */
    async test001_RegExpDefaultSymbolMatchAll() {
        const reg = /ab/g;
        const str = "abxabxab";
        const matchIterator = str.matchAll(reg);
        const result = [...matchIterator];

        if (result.length !== 3 || result[0][0] !== "ab" || result[0].index !== 0 || result[2].index !== 6) {
            throw new Error(`Test001 failed: Default matchAll returned ${JSON.stringify(result)} (expected 3 matches: ["ab"@0, "ab"@2, "ab"@6])`);
        }
        return "Test Passed: RegExpDefaultSymbolMatchAllTest001";
    },

    /**
     * 002. Custom object implements Symbol.matchAll (returns custom iterator).
     * Feature: Custom objects with [Symbol.matchAll] override String.prototype.matchAll behavior.
     */
    async test002_CustomObjectSymbolMatchAll() {
        const customMatcher = {
            [Symbol.matchAll](str) {

                const matches = [];
                let index = str.indexOf("test");
                while (index !== -1) {
                    matches.push({ value: "test", index });
                    index = str.indexOf("test", index + 4);
                }

                return {
                    [Symbol.iterator]() {
                        let i = 0;
                        return {
                            next: () => (i < matches.length ? { value: matches[i++], done: false } : { done: true })
                        };
                    }
                };
            }
        };
        const str = "test1test2test3";
        const result = [...str.matchAll(customMatcher)];

        if (result.length !== 3 || result[1].index !== 5 || result[2].value !== "test") {
            throw new Error(`Test002 failed: Custom matchAll returned ${JSON.stringify(result)} (expected 3 matches: @0, @5, @10)`);
        }
        return "Test Passed: CustomObjectSymbolMatchAllTest002";
    },



    /**
     * 004. Symbol.matchAll iterator traversal (for...of loop).
     * Feature: Iterator returned by Symbol.matchAll supports for...of traversal.
     */
    async test004_SymbolMatchAllIteratorForOf() {
        const reg = /\d+/g;
        const str = "a1b2c3";
        const matchIterator = str.matchAll(reg);
        const collected = [];

        for (const match of matchIterator) {
            collected.push(match[0]);
        }

        if (JSON.stringify(collected) !== '["1","2","3"]') {
            throw new Error(`Test004 failed: for...of traversal returned ${JSON.stringify(collected)} (expected ["1","2","3"])`);
        }
        return "Test Passed: SymbolMatchAllIteratorForOfTest004";
    },

    /**
     * 005. Custom Symbol.matchAll returns non-array iterator entries.
     * Feature: Custom iterator can return non-array values (not limited to RegExp's array format).
     */
    async test005_CustomIteratorNonArrayEntries() {
        const customMatcher = {
            [Symbol.matchAll](str) {
                const matches = str.split(",").filter(item => item);
                return {
                    *[Symbol.iterator]() {
                        for (const item of matches) {
                            yield { content: item, length: item.length };
                        }
                    }
                };
            }
        };
        const str = "apple,banana,orange";
        const result = [...str.matchAll(customMatcher)];

        if (result.length !== 3 || result[1].content !== "banana" || result[2].length !== 6) {
            throw new Error(`Test005 failed: Non-array iterator returned ${JSON.stringify(result)} (expected 3 custom objects)`);
        }
        return "Test Passed: CustomIteratorNonArrayEntriesTest005";
    },


    /**
     * 007. Symbol.matchAll iterator is not reusable.
     * Feature: Iterator returned by Symbol.matchAll is single-use (traversed once, no more results).
     */
    async test007_SymbolMatchAllIteratorNonReusable() {
        const reg = /x/g;
        const str = "xxx";
        const matchIterator = str.matchAll(reg);


        const firstTraversal = [...matchIterator];

        const secondTraversal = [...matchIterator];

        if (firstTraversal.length !== 3 || secondTraversal.length !== 0) {
            throw new Error(`Test007 failed: Iterator reusable (first: ${firstTraversal.length}, second: ${secondTraversal.length}) (expected 3, 0)`);
        }
        return "Test Passed: SymbolMatchAllIteratorNonReusableTest007";
    },



    /**
     * 009. Inherited Symbol.matchAll from prototype chain.
     * Feature: Custom [Symbol.matchAll] can be inherited via prototype.
     */
    async test009_InheritedSymbolMatchAll() {
        const protoMatcher = {
            [Symbol.matchAll](str) {
                const regex = /[A-Z]/g;
                return str.matchAll(regex);
            }
        };
        const childObj = Object.create(protoMatcher);
        const str = "AbCdEf";
        const result = [...str.matchAll(childObj)];

        if (result.length !== 3 || result[0][0] !== "A" || result[2][0] !== "E") {
            throw new Error(`Test009 failed: Inherited matchAll returned ${JSON.stringify(result)} (expected 3 uppercase matches)`);
        }
        return "Test Passed: InheritedSymbolMatchAllTest009";
    },






    /**
     * 013. Custom iterator throws error (propagation to caller).
     * Feature: Errors thrown in custom [Symbol.matchAll] iterator are propagated.
     */
    async test013_CustomIteratorThrowsError() {
        const errorMatcher = {
            [Symbol.matchAll]() {
                return {
                    [Symbol.iterator]() {
                        return {
                            next: () => {
                                throw new Error("iterator-error");
                            }
                        };
                    }
                };
            }
        };
        const str = "test";
        let errorCaught = false;

        try {
            [...str.matchAll(errorMatcher)];
        } catch (e) {
            errorCaught = e.message === "iterator-error";
        }

        if (!errorCaught) {
            throw new Error(`Test013 failed: Iterator error not propagated (expected "iterator-error")`);
        }
        return "Test Passed: CustomIteratorThrowsErrorTest013";
    },






    /**
     * 017. Named capture groups in Symbol.matchAll.
     * Feature: Symbol.matchAll returns 'groups' property for named capture groups.
     */
    async test017_NamedCaptureGroups() {
        const namedReg = /(?<name>\w+):(?<value>\d+)/g;
        const str = "a:1,b:2";
        const result = [...str.matchAll(namedReg)];

        if (result[0].groups.name !== "a" || result[0].groups.value !== "1" || result[1].groups.name !== "b") {
            throw new Error(`Test017 failed: Named groups returned ${JSON.stringify(result[0].groups)} (expected {name:"a", value:"1"})`);
        }
        return "Test Passed: NamedCaptureGroupsTest017";
    },

    /**
     * 018. Sparse match results (regex matches non-consecutive positions).
     * Feature: Symbol.matchAll correctly collects sparse matches (non-consecutive indices).
     */
    async test018_SparseMatchResults() {
        const sparseReg = /\d{2}/g;
        const str = "a11b22c33d";
        const result = [...str.matchAll(sparseReg)];

        if (result.length !== 3 || result[0].index !== 1 || result[2].index !== 7) {
            throw new Error(`Test018 failed: Sparse matches returned ${result.length} (expected 3 with indices 1,4,7)`);
        }
        return "Test Passed: SparseMatchResultsTest018";
    },

    /**
     * 019. Subclass overrides inherited Symbol.matchAll.
     * Feature: Subclass instance's own [Symbol.matchAll] overrides prototype-inherited method.
     */
    async test019_SubclassOverrideInheritedMatchAll() {
        const proto = {
            [Symbol.matchAll](str) {
                return (function* () { yield "proto-match"; })();
            }
        };
        class MatcherSubclass { constructor() { Object.setPrototypeOf(this, proto); } }
        const subInstance = new MatcherSubclass();

        subInstance[Symbol.matchAll] = (str) => (function* () { yield "sub-match"; })();

        const result = [...("test".matchAll(subInstance))];

        if (result[0] !== "sub-match") {
            throw new Error(`Test019 failed: Subclass override returned ${result[0]} (expected "sub-match")`);
        }
        return "Test Passed: SubclassOverrideInheritedMatchAllTest019";
    },

    /**
     * 020. Frozen RegExp object (still supports Symbol.matchAll).
     * Feature: Frozen RegExp objects retain Symbol.matchAll functionality.
     */
    async test020_FrozenRegExpSymbolMatchAll() {
        const frozenReg = Object.freeze(/ab/g);
        const str = "abab";
        const result = [...str.matchAll(frozenReg)];

        if (result.length !== 2 || result[1].index !== 2) {
            throw new Error(`Test020 failed: Frozen RegExp returned ${result.length} matches (expected 2)`);
        }
        return "Test Passed: FrozenRegExpSymbolMatchAllTest020";
    },

    /**
     * 021. Dynamic string modification during iteration (lazy evaluation).
     * Feature: Symbol.matchAll iterator uses original string (no lazy re-evaluation of modified string).
     */
    async test021_DynamicStringModification() {
        let str = "abc";
        const reg = /./g;
        const iterator = str.matchAll(reg);


        str = "xyz";
        const result = [...iterator];


        if (result.length !== 3 || result[0][0] !== "a" || result[2][0] !== "c") {
            throw new Error(`Test021 failed: Dynamic modify returned ${JSON.stringify(result)} (expected ["a","b","c"])`);
        }
        return "Test Passed: DynamicStringModificationTest021";
    },

    /**
     * 022. Symbol.matchAll=false affects String.startsWith (non-regex mark).
     * Feature: [Symbol.matchAll]=false marks object as non-regex for String.startsWith.
     */
    async test022_SymbolMatchAllFalseWithStartsWith() {
        const nonRegexObj = { [Symbol.matchAll]: false, toString: () => "he" };
        const str = "hello";
        const result = str.startsWith(nonRegexObj);

        if (result !== true) {
            throw new Error(`Test022 failed: startsWith returned ${result} (expected true; non-regex compared to "he")`);
        }
        return "Test Passed: SymbolMatchAllFalseWithStartsWithTest022";
    },

    /**
     * 023. Custom iterator early termination (done: true before end).
     * Feature: Custom iterator can terminate early by returning done: true.
     */
    async test023_CustomIteratorEarlyTermination() {
        const earlyTermMatcher = {
            [Symbol.matchAll](str) {
                let count = 0;
                return {
                    [Symbol.iterator]() {
                        return {
                            next: () => {
                                if (count < 2) {
                                    return { value: `match-${count++}`, done: false };
                                }
                                return { done: true };
                            }
                        };
                    }
                };
            }
        };
        const str = "a,b,c,d";
        const result = [...str.matchAll(earlyTermMatcher)];

        if (result.length !== 2 || result[1] !== "match-1") {
            throw new Error(`Test023 failed: Early termination returned ${result.length} matches (expected 2)`);
        }
        return "Test Passed: CustomIteratorEarlyTerminationTest023";
    },




    /**
     * 026. this binding in custom Symbol.matchAll.
     * Feature: [Symbol.matchAll] method's `this` points to the matcher object.
     */
    async test026_SymbolMatchAllThisBinding() {
        const matcher = {
            prefix: "match-",
            [Symbol.matchAll](str) {
                const matches = str.split(",");
                return (function* () {
                    for (const m of matches) {
                        yield this.prefix + m;
                    }
                }).bind(this)();
            }
        };
        const str = "a,b";
        const result = [...str.matchAll(matcher)];

        if (result[0] !== "match-a" || result[1] !== "match-b") {
            throw new Error(`Test026 failed: This binding returned ${JSON.stringify(result)} (expected ["match-a","match-b"])`);
        }
        return "Test Passed: SymbolMatchAllThisBindingTest026";
    },







};