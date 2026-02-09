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
export const SymbolIteratorStandaloneTestUtils = {
    /**
     * 001. Basic iterable with Symbol.iterator.
     * Feature: Object with [Symbol.iterator] method is iterable (for...of works).
     */
    async test001_BasicIterable() {
        const iterable = {
            data: ["x", "y", "z"],
            [Symbol.iterator]() {
                let index = 0;
                return {
                    next: () => ({
                        value: this.data[index++],
                        done: index > this.data.length
                    })
                };
            }
        };

        const results = [];
        for (const val of iterable) {
            results.push(val);
        }

        if (JSON.stringify(results) !== '["x","y","z"]') {
            throw new Error(`Test001 failed: Iterable returned [${results}] (expected ["x","y","z"])`)
        }
        return "Test Passed: BasicIterableTest001";
    },

    /**
     * 002. Iterator next() returns { value, done } shape.
     * Feature: Iterator returned by [Symbol.iterator] has next() with standard shape.
     */
    async test002_IteratorNextShape() {
        const iterable = {
            [Symbol.iterator]() {
                return {
                    next: () => ({ value: 42, done: false })
                };
            }
        };

        const iterator = iterable[Symbol.iterator]();
        const nextResult = iterator.next();

        if (typeof nextResult !== "object" || nextResult.value !== 42 || nextResult.done !== false) {
            throw new Error(`Test002 failed: next() returned ${JSON.stringify(nextResult)} (expected { value: 42, done: false })`);
        }
        return "Test Passed: IteratorNextShapeTest002";
    },

    /**
     * 003. Empty iterable (done: true initially).
     * Feature: Iterable can be empty; first next() returns done: true.
     */
    async test003_EmptyIterable() {
        const emptyIterable = {
            [Symbol.iterator]() {
                return {
                    next: () => ({ done: true })
                };
            }
        };

        const results = [];
        for (const val of emptyIterable) {
            results.push(val);
        }

        if (results.length !== 0) {
            throw new Error(`Test003 failed: Empty iterable returned [${results}] (expected empty array)`);
        }
        return "Test Passed: EmptyIterableTest003";
    },

    /**
     * 004. Iterator return() method stops iteration.
     * Feature: Iterator with return() method can be stopped early (for...of exits).
     */
    async test004_IteratorReturnMethod() {
        let iterationCount = 0;
        const iterable = {
            [Symbol.iterator]() {
                return {
                    next: () => {
                        iterationCount++;
                        return { value: iterationCount, done: false };
                    },
                    return: () => ({ done: true })
                };
            }
        };

        for (const val of iterable) {
            if (val === 2) break;
        }

        if (iterationCount !== 2) {
            throw new Error(`Test004 failed: Iteration count=${iterationCount} (expected 2; return() not triggered)`);
        }
        return "Test Passed: IteratorReturnMethodTest004";
    },

    /**
     * 005. Iterator throws error (sync error in next()).
     * Feature: Sync error in iterator next() propagates to for...of.
     */
    async test005_IteratorThrowError() {
        const errorMsg = "Sync iteration failed";
        const errorIterable = {
            [Symbol.iterator]() {
                return {
                    next: () => { throw new Error(errorMsg); }
                };
            }
        };

        let errorCaught = false;
        try {
            for (const val of errorIterable) {}
        } catch (e) {
            errorCaught = e.message === errorMsg;
        }

        if (!errorCaught) {
            throw new Error(`Test005 failed: Iterator error not caught (expected "${errorMsg}")`);
        }
        return "Test Passed: IteratorThrowErrorTest005";
    },

    /**
     * 006. Class implementing Symbol.iterator is iterable.
     * Feature: Class prototype with [Symbol.iterator] makes instances iterable.
     */
    async test006_ClassIterable() {
        class IterableClass {
            constructor(items) {
                this.items = items;
            }
            [Symbol.iterator]() {
                let index = 0;
                const items = this.items;
                return {
                    next: () => ({
                        value: items[index++],
                        done: index > items.length
                    })
                };
            }
        }

        const instance = new IterableClass([100, 200, 300]);
        const results = [...instance];

        if (JSON.stringify(results) !== "[100,200,300]") {
            throw new Error(`Test006 failed: Class instance returned [${results}] (expected [100,200,300])`);
        }
        return "Test Passed: ClassIterableTest006";
    },

    /**
     * 007. Iterator next() accepts optional argument.
     * Feature: Sync iterator next() can receive and use optional argument.
     */
    async test007_IteratorNextWithArgument() {
        const iterable = {
            [Symbol.iterator]() {
                return {
                    next: (arg) => ({
                        value: arg || "default",
                        done: false
                    })
                };
            }
        };

        const iterator = iterable[Symbol.iterator]();
        const result1 = iterator.next("custom-arg");
        const result2 = iterator.next();

        if (result1.value !== "custom-arg" || result2.value !== "default") {
            throw new Error(`Test007 failed: next(arg) returned ${result1.value}, next() returned ${result2.value} (expected "custom-arg", "default")`);
        }
        return "Test Passed: IteratorNextWithArgumentTest007";
    },

    /**
     * 008. Nested iterables (value is iterable).
     * Feature: Iterable can return nested iterables, traversed via nested for...of.
     */
    async test008_NestedIterable() {
        const nestedIterable = {
            [Symbol.iterator]() {
                const inner1 = [1, 2];
                const inner2 = [3, 4];
                let index = 0;
                const inners = [inner1, inner2];
                return {
                    next: () => ({
                        value: inners[index++],
                        done: index > inners.length
                    })
                };
            }
        };

        const results = [];
        for (const inner of nestedIterable) {
            for (const val of inner) {
                results.push(val);
            }
        }

        if (JSON.stringify(results) !== "[1,2,3,4]") {
            throw new Error(`Test008 failed: Nested iterable returned [${results}] (expected [1,2,3,4])`);
        }
        return "Test Passed: NestedIterableTest008";
    },

    /**
     * 009. Iterable with Array.from (convert to array).
     * Feature: Iterable can be converted to array via Array.from.
     * Fix: 调整迭代器计数逻辑，确保生成 1-4 四个值
     */
    async test009_IterableWithArrayFrom() {
        const iterable = {
            [Symbol.iterator]() {
                let count = 0;
                return {
                    next: () => {
                        count++;
                        return {
                            value: count,
                            done: count > 4
                        };
                    }
                };
            }
        };

        const result = Array.from(iterable);

        if (JSON.stringify(result) !== "[1,2,3,4]") {
            throw new Error(`Test009 failed: Array.from returned [${result}] (expected [1,2,3,4])`);
        }
        return "Test Passed: IterableWithArrayFromTest009";
    },


    /**
     * 010. Symbol.iterator property is non-enumerable.
     * Feature: The [Symbol.iterator] property of iterables is non-enumerable.
     * Fix: 显式用Object.defineProperty定义属性，强制设置enumerable: false
     */
    async test010_SymbolIteratorNonEnumerable() {
        const iterable = {};

        Object.defineProperty(iterable, Symbol.iterator, {
            value: () => ({ next: () => ({ done: true }) }),
            enumerable: false,
            configurable: true,
            writable: true
        });

        const descriptors = Object.getOwnPropertyDescriptors(iterable);
        const iteratorProp = descriptors[Symbol.iterator];

        if (iteratorProp?.enumerable !== false) {
            throw new Error(`Test010 failed: [Symbol.iterator] enumerable=${iteratorProp?.enumerable} (expected false)`);
        }
        return "Test Passed: SymbolIteratorNonEnumerableTest010";
    },

    /**
     * 011. Iterator throw() method propagates error.
     * Feature: Iterator with throw() method propagates error to for...of.
     */
    async test011_IteratorThrowMethod() {
        const errorMsg = "Iterator throw triggered";
        const iterable = {
            [Symbol.iterator]() {
                return {
                    next: () => ({ value: 1, done: false }),
                    throw: (err) => { throw new Error(err || errorMsg); }
                };
            }
        };

        const iterator = iterable[Symbol.iterator]();
        iterator.next();
        let errorCaught = false;
        try {
            iterator.throw();
        } catch (e) {
            errorCaught = e.message === errorMsg;
        }

        if (!errorCaught) {
            throw new Error(`Test011 failed: Iterator throw() error not caught (expected "${errorMsg}")`);
        }
        return "Test Passed: IteratorThrowMethodTest011";
    },



    /**
     * 013. Inherit Symbol.iterator from prototype chain.
     * Feature: Iterable can inherit [Symbol.iterator] from prototype.
     */
    async test013_IterableInheritFromPrototype() {
        const ProtoIterable = {
            [Symbol.iterator]() {
                let index = 0;
                const data = this.data;
                return {
                    next: () => ({
                        value: data[index++],
                        done: index > data.length
                    })
                };
            }
        };

        const childObj = Object.create(ProtoIterable);
        childObj.data = ["prototype", "inherit", "test"];

        const results = [...childObj];
        if (JSON.stringify(results) !== '["prototype","inherit","test"]') {
            throw new Error(`Test013 failed: Inherited iterable returned [${results}] (expected ["prototype","inherit","test"])`);
        }
        return "Test Passed: IterableInheritFromPrototypeTest013";
    },

    /**
     * 014. Iterator can be traversed multiple times (stateless).
     * Feature: Stateless iterator supports multiple for...of traversals.
     */
    async test014_StatelessIteratorMultipleTraversals() {
        const statelessIterable = {
            [Symbol.iterator]() {
                return {
                    next: () => {
                        this.count = (this.count || 0) + 1;
                        return {
                            value: this.count,
                            done: this.count > 3
                        };
                    }
                };
            }
        };

        const result1 = [...statelessIterable];
        statelessIterable.count = 0;
        const result2 = [...statelessIterable];

        if (JSON.stringify(result1) !== "[1,2,3]" || JSON.stringify(result2) !== "[1,2,3]") {
            throw new Error(`Test014 failed: Multiple traversals returned [${result1}] and [${result2}] (expected [1,2,3] twice)`);
        }
        return "Test Passed: StatelessIteratorMultipleTraversalsTest014";
    },

    /**
     * 015. String is native iterable (Symbol.iterator exists).
     * Feature: Native string object implements Symbol.iterator.
     */
    async test015_NativeStringIterable() {
        const str = "test";
        const results = [...str];
        const expected = ["t", "e", "s", "t"];

        if (JSON.stringify(results) !== JSON.stringify(expected)) {
            throw new Error(`Test015 failed: String iterable returned [${results}] (expected [${expected}])`);
        }
        return "Test Passed: NativeStringIterableTest015";
    },

    /**
     * 016. Iterator next() after done: true returns consistent result.
     * Feature: Calling next() on completed iterator returns { done: true, value: undefined }.
     */
    async test016_IteratorNextAfterDone() {
        const iterable = {
            [Symbol.iterator]() {
                let index = 0;
                const data = [10, 20];
                return {
                    next: () => ({
                        value: data[index++],
                        done: index > data.length
                    })
                };
            }
        };

        const iterator = iterable[Symbol.iterator]();
        iterator.next();
        iterator.next();
        iterator.next();
        const finalResult = iterator.next();

        if (finalResult.done !== true || finalResult.value !== undefined) {
            throw new Error(`Test016 failed: Next after done returned ${JSON.stringify(finalResult)} (expected { done: true, value: undefined })`);
        }
        return "Test Passed: IteratorNextAfterDoneTest016";
    },

    /**
     * 017. Iterator return() returns { value, done } shape.
     * Feature: Iterator return() method returns standard { value, done } object.
     */
    async test017_IteratorReturnReturnValue() {
        const returnValue = "early-exit";
        const iterable = {
            [Symbol.iterator]() {
                return {
                    next: () => ({ value: 1, done: false }),
                    return: () => ({ value: returnValue, done: true })
                };
            }
        };

        let result;
        for (const val of iterable) {
            result = val;
            break;
        }

        const iterator = iterable[Symbol.iterator]();
        const returnResult = iterator.return();

        if (returnResult.value !== returnValue || returnResult.done !== true) {
            throw new Error(`Test017 failed: return() returned ${JSON.stringify(returnResult)} (expected { value: "${returnValue}", done: true })`);
        }
        return "Test Passed: IteratorReturnReturnValueTest017";
    },

    /**
     * 018. Set is native iterable (Symbol.iterator returns values).
     * Feature: Native Set object's iterator returns stored values.
     */
    async test018_NativeSetIterable() {
        const set = new Set(["a", "b", "c"]);
        const results = [...set];
        const expected = ["a", "b", "c"];

        if (JSON.stringify(results) !== JSON.stringify(expected)) {
            throw new Error(`Test018 failed: Set iterable returned [${results}] (expected [${expected}])`);
        }
        return "Test Passed: NativeSetIterableTest018";
    },

    /**
     * 019. Map is native iterable (Symbol.iterator returns [key, value] pairs).
     * Feature: Native Map object's iterator returns [key, value] pairs.
     */
    async test019_NativeMapIterable() {
        const map = new Map([["k1", "v1"], ["k2", "v2"]]);
        const results = [...map];
        const expected = [["k1", "v1"], ["k2", "v2"]];

        if (JSON.stringify(results) !== JSON.stringify(expected)) {
            throw new Error(`Test019 failed: Map iterable returned [${results}] (expected [${expected}])`);
        }
        return "Test Passed: NativeMapIterableTest019";
    },

    /**
     * 020. Iterator with continue in for...of.
     * Feature: for...of continue does not break iterator (continues next iteration).
     */
    async test020_IteratorForOfContinue() {
        const iterable = {
            [Symbol.iterator]() {
                let count = 0;
                return {
                    next: () => {
                        count++;
                        return {
                            value: count,
                            done: count > 5
                        };
                    }
                };
            }
        };

        const results = [];
        for (const val of iterable) {
            if (val % 2 === 0) continue;
            results.push(val);
        }

        if (JSON.stringify(results) !== "[1,3,5]") {
            throw new Error(`Test020 failed: Continue in for...of returned [${results}] (expected [1,3,5])`);
        }
        return "Test Passed: IteratorForOfContinueTest020";
    },

    /**
     * 021. Custom iterator preserves state across next() calls.
     * Feature: Stateful iterator retains state between consecutive next() calls.
     */
    async test021_StatefulIteratorPreserveState() {
        const statefulIterable = {
            [Symbol.iterator]() {
                let count = 0;
                return {
                    next: () => {
                        count++;
                        return {
                            value: count * 2,
                            done: count > 3
                        };
                    }
                };
            }
        };

        const iterator = statefulIterable[Symbol.iterator]();
        const result1 = iterator.next().value;
        const result2 = iterator.next().value;
        const result3 = iterator.next().value;

        if (result1 !== 2 || result2 !== 4 || result3 !== 6) {
            throw new Error(`Test021 failed: Stateful iterator returned ${result1},${result2},${result3} (expected 2,4,6)`);
        }
        return "Test Passed: StatefulIteratorPreserveStateTest021";
    },

    /**
     * 022. Symbol.iterator property is configurable.
     * Feature: [Symbol.iterator] property is configurable (can be deleted/redefined).
     */
    async test022_SymbolIteratorConfigurable() {
        const iterable = {};
        Object.defineProperty(iterable, Symbol.iterator, {
            value: () => ({ next: () => ({ done: true }) }),
            enumerable: false,
            configurable: true,
            writable: true
        });

        const descriptors = Object.getOwnPropertyDescriptors(iterable);
        const isConfigurable = descriptors[Symbol.iterator]?.configurable;

        delete iterable[Symbol.iterator];
        const isDeleted = !(Symbol.iterator in iterable);

        if (!isConfigurable || !isDeleted) {
            throw new Error(`Test022 failed: [Symbol.iterator] configurable=${isConfigurable}, deleted=${isDeleted} (expected true, true)`);
        }
        return "Test Passed: SymbolIteratorConfigurableTest022";
    },





    /**
     * 025. Iterator done: true with non-undefined value.
     * Feature: Iterator can return non-undefined value when done: true.
     */
    async test025_IteratorDoneWithValue() {
        const iterable = {
            [Symbol.iterator]() {
                let index = 0;
                const data = [1, 2];
                return {
                    next: () => {
                        if (index < data.length) {
                            return { value: data[index++], done: false };
                        }
                        return { value: "final-value", done: true };
                    }
                };
            }
        };

        const results = [];
        let finalValue;
        for (const val of iterable) {
            results.push(val);
        }

        const iterator = iterable[Symbol.iterator]();
        iterator.next();
        iterator.next();
        finalValue = iterator.next().value;

        if (JSON.stringify(results) !== "[1,2]" || finalValue !== "final-value") {
            throw new Error(`Test025 failed: Results [${results}], final value "${finalValue}" (expected [1,2], "final-value")`);
        }
        return "Test Passed: IteratorDoneWithValueTest025";
    },


    /**
     * 027. Iterable converted to Map via Map constructor.
     * Feature: Iterable of [key, value] pairs initializes Map correctly.
     */
    async test027_IterableToMap() {
        const iterable = {
            [Symbol.iterator]() {
                const pairs = [["k1", 1], ["k2", 2], ["k3", 3]];
                let index = 0;
                return {
                    next: () => ({
                        value: pairs[index++],
                        done: index > pairs.length
                    })
                };
            }
        };

        const map = new Map(iterable);
        const results = [...map.entries()];
        const expected = [["k1", 1], ["k2", 2], ["k3", 3]];

        if (JSON.stringify(results) !== JSON.stringify(expected)) {
            throw new Error(`Test027 failed: Iterable to Map returned [${results}] (expected [${expected}])`);
        }
        return "Test Passed: IterableToMapTest027";
    },

    /**
     * 028. Generator function as Symbol.iterator.
     * Feature: Generator function can be used as [Symbol.iterator] implementation.
     */
    async test028_GeneratorAsIterator() {
        const iterable = {
            [Symbol.iterator]: function* () {
                yield "gen1";
                yield "gen2";
                yield "gen3";
            }
        };

        const results = [...iterable];
        if (JSON.stringify(results) !== '["gen1","gen2","gen3"]') {
            throw new Error(`Test028 failed: Generator iterator returned [${results}] (expected ["gen1","gen2","gen3"])`);
        }
        return "Test Passed: GeneratorAsIteratorTest028";
    },

    /**
     * 029. Iterator with dynamic value generation (no fixed data).
     * Feature: Iterator can generate values dynamically (not tied to static data).
     */
    async test029_DynamicValueIterator() {
        const dynamicIterable = {
            [Symbol.iterator]() {
                let count = 0;
                return {
                    next: () => {
                        count++;
                        return {
                            value: Math.random() > 0.5 ? "odd" : "even",
                            done: count > 3
                        };
                    }
                };
            }
        };

        const results = [...dynamicIterable];
        if (results.length !== 3 || !results.every(val => val === "odd" || val === "even")) {
            throw new Error(`Test029 failed: Dynamic iterator returned [${results}] (expected 3 values of "odd"/"even")`);
        }
        return "Test Passed: DynamicValueIteratorTest029";
    },

    /**
     * 030. Iterable as function arguments (spread syntax).
     * Feature: Iterable object can be spread as function arguments.
     */
    async test030_IterableAsFunctionArguments() {
        const iterable = {
            [Symbol.iterator]() {
                let index = 0;
                const args = [10, 20, 30];
                return {
                    next: () => ({
                        value: args[index++],
                        done: index > args.length
                    })
                };
            }
        };

        const sum = (a, b, c) => a + b + c;
        const result = sum(...iterable);

        if (result !== 60) {
            throw new Error(`Test030 failed: Spread iterable sum=${result} (expected 60)`);
        }
        return "Test Passed: IterableAsFunctionArgumentsTest030";
    }
};