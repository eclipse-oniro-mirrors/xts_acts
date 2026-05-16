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
export const SymbolAsyncIteratorStandaloneTestUtils = {
    /**
     * 001. Basic async iterable with Symbol.asyncIterator.
     * Feature: Object with [Symbol.asyncIterator] method is async iterable (for await...of works).
     */
    async test001_BasicAsyncIterable() {
        const asyncIterable = {
            data: [1, 2, 3],
            [Symbol.asyncIterator]() {
                let index = 0;
                return {
                    next: () => Promise.resolve({
                        value: this.data[index++],
                        done: index > this.data.length
                    })
                };
            }
        };

        const results = [];
        for await (const val of asyncIterable) {
            results.push(val);
        }

        if (JSON.stringify(results) !== "[1,2,3]") {
            throw new Error(`Test001 failed: Async iterable returned [${results}] (expected [1,2,3])`);
        }
        return "Test Passed: BasicAsyncIterableTest001";
    },

    /**
     * 002. Async iterator next() returns Promise with { value, done }.
     * Feature: Iterator returned by [Symbol.asyncIterator] has next() returning Promise of standard shape.
     */
    async test002_AsyncIteratorNextShape() {
        const asyncIterable = {
            [Symbol.asyncIterator]() {
                return {
                    next: () => Promise.resolve({ value: "test", done: false })
                };
            }
        };

        const iterator = asyncIterable[Symbol.asyncIterator]();
        const nextResult = await iterator.next();

        if (typeof nextResult !== "object" || nextResult.value !== "test" || nextResult.done !== false) {
            throw new Error(`Test002 failed: next() returned ${JSON.stringify(nextResult)} (expected { value: "test", done: false })`);
        }
        return "Test Passed: AsyncIteratorNextShapeTest002";
    },

    /**
     * 003. Empty async iterable (done: true initially).
     * Feature: Async iterable can be empty; first next() returns done: true.
     */
    async test003_EmptyAsyncIterable() {
        const emptyIterable = {
            [Symbol.asyncIterator]() {
                return {
                    next: () => Promise.resolve({ done: true })
                };
            }
        };

        const results = [];
        for await (const val of emptyIterable) {
            results.push(val);
        }

        if (results.length !== 0) {
            throw new Error(`Test003 failed: Empty iterable returned [${results}] (expected empty array)`);
        }
        return "Test Passed: EmptyAsyncIterableTest003";
    },

    /**
     * 004. Async iterator return() method stops iteration.
     * Feature: Iterator with return() method can be stopped early (for await...of exits).
     */
    async test004_AsyncIteratorReturnMethod() {
        let iterationCount = 0;
        const asyncIterable = {
            [Symbol.asyncIterator]() {
                return {
                    next: () => {
                        iterationCount++;
                        return Promise.resolve({ value: iterationCount, done: false });
                    },
                    return: () => Promise.resolve({ done: true })
                };
            }
        };

        for await (const val of asyncIterable) {
            if (val === 2) break;
        }

        if (iterationCount !== 2) {
            throw new Error(`Test004 failed: Iteration count=${iterationCount} (expected 2; return() not triggered)`);
        }
        return "Test Passed: AsyncIteratorReturnMethodTest004";
    },

    /**
     * 005. Async iterator throws error (rejected Promise).
     * Feature: Iterator next() returning rejected Promise propagates error.
     */
    async test005_AsyncIteratorThrowError() {
        const errorMsg = "Iteration failed";
        const errorIterable = {
            [Symbol.asyncIterator]() {
                return {
                    next: () => Promise.reject(new Error(errorMsg))
                };
            }
        };

        let errorCaught = false;
        try {
            for await (const val of errorIterable) {}
        } catch (e) {
            errorCaught = e.message === errorMsg;
        }

        if (!errorCaught) {
            throw new Error(`Test005 failed: Async iterator error not caught (expected "${errorMsg}")`);
        }
        return "Test Passed: AsyncIteratorThrowErrorTest005";
    },

    /**
     * 006. Class implementing Symbol.asyncIterator is async iterable.
     * Feature: Class prototype with [Symbol.asyncIterator] makes instances async iterable.
     */
    async test006_ClassAsyncIterable() {
        class AsyncIterableClass {
            constructor(data) {
                this.data = data;
            }
            [Symbol.asyncIterator]() {
                let index = 0;
                return {
                    next: () => Promise.resolve({
                        value: this.data[index++],
                        done: index > this.data.length
                    })
                };
            }
        }

        const instance = new AsyncIterableClass(["a", "b", "c"]);
        const results = [];
        for await (const val of instance) {
            results.push(val);
        }

        if (JSON.stringify(results) !== '["a","b","c"]') {
            throw new Error(`Test006 failed: Class instance returned [${results}] (expected ["a","b","c"])`);
        }
        return "Test Passed: ClassAsyncIterableTest006";
    },

    /**
     * 007. Async iterator next() accepts optional argument.
     * Feature: next() method of async iterator can receive and use optional argument.
     */
    async test007_AsyncIteratorNextWithArgument() {
        const asyncIterable = {
            [Symbol.asyncIterator]() {
                return {
                    next: (arg) => Promise.resolve({
                        value: arg || "default",
                        done: false
                    })
                };
            }
        };

        const iterator = asyncIterable[Symbol.asyncIterator]();
        const result1 = await iterator.next("custom");
        const result2 = await iterator.next();

        if (result1.value !== "custom" || result2.value !== "default") {
            throw new Error(`Test007 failed: next() with arg returned ${result1.value}, without arg returned ${result2.value} (expected "custom", "default")`);
        }
        return "Test Passed: AsyncIteratorNextWithArgumentTest007";
    },


};