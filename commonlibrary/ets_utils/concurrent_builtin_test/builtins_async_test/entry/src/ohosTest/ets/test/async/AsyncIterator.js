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

export async function AsyncIteratorTest001() {
    const asyncIterator = (async function* () { yield 1; })();
    const result = await asyncIterator.next();
    return result.value === 1 && !result.done;
}

export async function AsyncIteratorTest002() {
    const asyncIterator = (async function* () {})();
    const result = await asyncIterator.next();
    return result.done === true && result.value === undefined;
}

export async function AsyncIteratorTest003() {
    const asyncIterator = (async function* () { yield 'a'; yield 'b'; })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    const res3 = await asyncIterator.next();
    return res1.value === 'a' && res2.value === 'b' && res3.done;
}

export async function AsyncIteratorTest004() {
    const asyncIterator = (async function* () { yield 10n; })();
    const result = await asyncIterator.next();
    return result.value === 10n && !result.done;
}

export async function AsyncIteratorTest005() {
    const asyncIterator = (async function* () { yield true; })();
    const result = await asyncIterator.next();
    return result.value === true && !result.done;
}

export async function AsyncIteratorTest006() {
    const asyncIterator = (async function* () { yield { key: 'val' }; })();
    const result = await asyncIterator.next();
    return result.value.key === 'val' && !result.done;
}

export async function AsyncIteratorTest007() {
    const asyncIterator = (async function* () {
        for (let i = 0; i < 3; i++) yield i;
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[0,1,2]';
}

export async function AsyncIteratorTest008() {
    const asyncIterator = (async function* () { yield 1; yield 2; })();
    const iterable = asyncIterator[Symbol.asyncIterator]();
    return iterable === asyncIterator;
}

export async function AsyncIteratorTest009() {
    const asyncIterator = (async function* () {
        await new Promise(resolve => setTimeout(resolve, 1));
        yield 3;
    })();
    const result = await asyncIterator.next();
    return result.value === 3 && !result.done;
}

export async function AsyncIteratorTest010() {
    const asyncIterator = (async function* () {
        try {
            yield 1;
            throw new Error('test');
        } catch {
            yield 2;
        }
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 1 && res2.value === 2;
}

export async function AsyncIteratorTest011() {
    const asyncIterator = (async function* (a, b) {
        yield a + b;
        yield a * b;
    })(2, 3);
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 5 && res2.value === 6;
}

export async function AsyncIteratorTest012() {
    const asyncIterator = (async function* () {
        yield* (async function* () { yield 'nested'; })();
    })();
    const result = await asyncIterator.next();
    return result.value === 'nested' && !result.done;
}

export async function AsyncIteratorTest013() {
    const asyncIterator = (async function* () {
        let count = 0;
        while (count < 2) yield count++;
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    const res3 = await asyncIterator.next();
    return res1.value === 0 && res2.value === 1 && res3.done;
}

export async function AsyncIteratorTest014() {
    const asyncIterator = (async function* () { yield null; })();
    const result = await asyncIterator.next();
    return result.value === null && !result.done;
}

export async function AsyncIteratorTest015() {
    const asyncIterator = (async function* () { yield undefined; })();
    const result = await asyncIterator.next();
    return result.value === undefined && !result.done;
}

export async function AsyncIteratorTest016() {
    const asyncIterator = (async function* () {
        const arr = [10, 20, 30];
        for (const item of arr) yield item;
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[10,20,30]';
}

export async function AsyncIteratorTest017() {
    const asyncIterator = (async function* () {
        yield await Promise.resolve(42);
    })();
    const result = await asyncIterator.next();
    return result.value === 42 && !result.done;
}

export async function AsyncIteratorTest018() {
    const asyncIterator = (async function* () {
        yield 1;
        return 'returnVal';
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 1 && res2.value === 'returnVal' && res2.done;
}

export async function AsyncIteratorTest019() {
    const asyncIterator = (async function* () {
        for await (const val of (async function* () { yield 5; yield 6; })()) {
            yield val * 2;
        }
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[10,12]';
}

export async function AsyncIteratorTest020() {
    const asyncIterator = (async function* () {
        if (false) yield 1;
        yield 2;
    })();
    const result = await asyncIterator.next();
    return result.value === 2 && !result.done;
}

export async function AsyncIteratorTest021() {
    const asyncIterator = (async function* () {
        let i = 0;
        while (true) {
            if (i >= 2) break;
            yield i++;
        }
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    const res3 = await asyncIterator.next();
    return res1.value === 0 && res2.value === 1 && res3.done;
}

export async function AsyncIteratorTest022() {
    const asyncIterator = (async function* () {
        yield 'first';
        await new Promise(resolve => setTimeout(resolve, 2));
        yield 'second';
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 'first' && res2.value === 'second';
}

export async function AsyncIteratorTest023() {
    const asyncIterator = (async function* () {
        yield* [7, 8, 9];
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[7,8,9]';
}

export async function AsyncIteratorTest024() {
    const asyncIterator = (async function* () {
        try {
            yield 1;
            throw new Error('err');
        } finally {
            yield 3;
        }
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 1 && res2.value === 3;
}

export async function AsyncIteratorTest025() {
    const asyncIterator = (async function* (arr) {
        for (const item of arr) yield item.toUpperCase();
    })(['a', 'b', 'c']);
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '["A","B","C"]';
}

export async function AsyncIteratorTest026() {
    const asyncIterator = (async function* () {
        yield 1n;
        yield 2n;
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 1n && res2.value === 2n;
}

export async function AsyncIteratorTest027() {
    const asyncIterator = (async function* () {
        yield { prop: 1 };
        yield { prop: 2 };
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value.prop === 1 && res2.value.prop === 2;
}

export async function AsyncIteratorTest028() {
    const asyncIterator = (async function* () {
        await new Promise(resolve => setTimeout(resolve, 0));
        yield 'delayed';
    })();
    const result = await asyncIterator.next();
    return result.value === 'delayed' && !result.done;
}

export async function AsyncIteratorTest029() {
    const asyncIterator = (async function* () {
        for (let i = 3; i > 0; i--) yield i;
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[3,2,1]';
}

export async function AsyncIteratorTest030() {
    const asyncIterator = (async function* () {
        yield 1;
        yield* (async function* () {
            yield* (async function* () { yield 2; })();
        })();
        yield 3;
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[1,2,3]';
}
export async function AsyncIteratorTest031() {
    const asyncIterator = (async function* () { yield* [1, 2, 3]; })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[1,2,3]';
}

export async function AsyncIteratorTest032() {
    const asyncIterator = (async function* (x) { yield x * 2; yield x * 3; })(5);
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 10 && res2.value === 15;
}

export async function AsyncIteratorTest033() {
    const asyncIterator = (async function* () {
        await new Promise(resolve => setTimeout(resolve, 1));
        yield 'delayed';
    })();
    const result = await asyncIterator.next();
    return result.value === 'delayed' && !result.done;
}

export async function AsyncIteratorTest034() {
    const asyncIterator = (async function* () {
        try {
            yield 1;
            throw new Error();
        } catch {
            yield 2;
        }
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 1 && res2.value === 2;
}

export async function AsyncIteratorTest035() {
    const asyncIterator = (async function* () {
        let i = 0;
        while (i < 2) yield i++;
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    const res3 = await asyncIterator.next();
    return res1.value === 0 && res2.value === 1 && res3.done;
}

export async function AsyncIteratorTest036() {
    const asyncIterator = (async function* () { yield null; yield undefined; })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === null && res2.value === undefined;
}

export async function AsyncIteratorTest037() {
    const asyncIterator = (async function* () {
        yield await Promise.resolve(42);
    })();
    const result = await asyncIterator.next();
    return result.value === 42 && !result.done;
}

export async function AsyncIteratorTest038() {
    const asyncIterator = (async function* () {
        yield 1;
        return 'returnVal';
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res2.value === 'returnVal' && res2.done;
}

export async function AsyncIteratorTest039() {
    const asyncIterator = (async function* () {
        for await (const val of (async function* () { yield 5; yield 6; })()) {
            yield val * 2;
        }
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[10,12]';
}

export async function AsyncIteratorTest040() {
    const asyncIterator = (async function* () {
        if (false) yield 1;
        yield 2;
    })();
    const result = await asyncIterator.next();
    return result.value === 2 && !result.done;
}

export async function AsyncIteratorTest041() {
    const asyncIterator = (async function* () {
        let i = 3;
        do {
            yield i;
            i--;
        } while (i >= 1);
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[3,2,1]';
}

export async function AsyncIteratorTest042() {
    const asyncIterator = (async function* () {
        yield 'a';
        await new Promise(resolve => setTimeout(resolve, 2));
        yield 'b';
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 'a' && res2.value === 'b';
}

export async function AsyncIteratorTest043() {
    const asyncIterator = (async function* () {
        yield* new Set([4, 5, 6]);
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values.sort()) === '[4,5,6]';
}

export async function AsyncIteratorTest044() {
    const asyncIterator = (async function* () {
        try {
            yield 1;
            throw new Error('test-err');
        } catch (err) {
            yield err.message;
        }
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 1 && res2.value === 'test-err';
}

export async function AsyncIteratorTest045() {
    const asyncIterator = (async function* () {
        yield 'long'.repeat(5);
    })();
    const result = await asyncIterator.next();
    return result.value === 'longlonglonglonglong' && !result.done;
}

export async function AsyncIteratorTest046() {
    const asyncIterator = (async function* (nums) {
        for (const num of nums) yield num * num;
    })([2, 3, 4]);
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[4,9,16]';
}

export async function AsyncIteratorTest047() {
    const asyncIterator = (async function* () {
        try {
            yield 1;
        } finally {
            yield 'finally-val';
        }
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 1 && res2.value === 'finally-val';
}

export async function AsyncIteratorTest048() {
    const asyncIterator = (async function* () {
        yield BigInt(999);
    })();
    const result = await asyncIterator.next();
    return result.value === 999n && !result.done;
}

export async function AsyncIteratorTest049() {
    const asyncIterator = (async function* () {
        yield* [true, false, true];
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[true,false,true]';
}

export async function AsyncIteratorTest050() {
    const asyncIterator = (async function* () {
        yield 1;
        if (true) yield 2;
        yield 3;
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    const res3 = await asyncIterator.next();
    return res1.value === 1 && res2.value === 2 && res3.value === 3;
}

export async function AsyncIteratorTest051() {
    const asyncIterator = (async function* () {
        const promise = Promise.resolve('promise-val');
        yield await promise;
    })();
    const result = await asyncIterator.next();
    return result.value === 'promise-val' && !result.done;
}

export async function AsyncIteratorTest052() {
    const asyncIterator = (async function* () {
        yield { prop: 'test' };
    })();
    const result = await asyncIterator.next();
    return result.value.prop === 'test' && !result.done;
}

export async function AsyncIteratorTest053() {
    const asyncIterable = {
        [Symbol.asyncIterator]: () => {
            let count = 0;
            return {
                next: async () => {
                    count++;
                    return count <= 2 ? { value: count, done: false } : { done: true };
                }
            };
        }
    };
    const res1 = await asyncIterable[Symbol.asyncIterator]().next();
    const res2 = await asyncIterable[Symbol.asyncIterator]().next();
    return res1.value === 1 && res2.value === 1;
}

export async function AsyncIteratorTest054() {
    const asyncIterator = (async function* () {
        yield 'x';
        yield 'y';
        return 'return-result';
    })();
    const res3 = await asyncIterator.next();
    const res4 = await asyncIterator.next();
    const res5 = await asyncIterator.next();
    return res5.value === 'return-result' && res5.done;
}

export async function AsyncIteratorTest055() {
    const asyncIterator = (async function* () {
        await new Promise(resolve => setTimeout(resolve, 2));
        yield 5;
        await new Promise(resolve => setTimeout(resolve, 2));
        yield 6;
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 5 && res2.value === 6;
}

export async function AsyncIteratorTest056() {
    const asyncIterator = (async function* (str) {
        for (const char of str) yield char.toUpperCase();
    })('hello');
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '["H","E","L","L","O"]';
}

export async function AsyncIteratorTest057() {
    const asyncIterator = (async function* () {
        yield null;
        yield 0;
        yield '';
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    const res3 = await asyncIterator.next();
    return res1.value === null && res2.value === 0 && res3.value === '';
}

export async function AsyncIteratorTest058() {
    const asyncIterator = (async function* () {
        const arr = [true, 123, 'test'];
        for (const item of arr) yield item;
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[true,123,"test"]';
}

export async function AsyncIteratorTest059() {
    const asyncIterator = (async function* () {
        try {
            yield 1;
            throw new Error();
        } catch {
            yield 'caught';
            throw new Error('rethrow');
        }
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    let errorThrown = false;
    try { await asyncIterator.next(); } catch { errorThrown = true; }
    return res1.value === 1 && res2.value === 'caught' && errorThrown;
}

export async function AsyncIteratorTest060() {
    const asyncIterator = (async function* () {
        yield* (async function* () { yield 1; yield 2; })();
        yield 3;
        yield* (async function* () { yield 4; })();
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[1,2,3,4]';
}
export async function AsyncIteratorTest061() {
    // Async iterator with nested async arrow function and timing control
    const createTimedIterator = () => (async function* () {
        const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));
        await delay(1);
        yield 'first';
        await delay(2);
        yield 'second';
    })();
    const iterator = createTimedIterator();
    const res1 = await iterator.next();
    const res2 = await iterator.next();
    return res1.value === 'first' && res2.value === 'second';
}

export async function AsyncIteratorTest062() {
    // Nested async iterators with state sharing via closure
    const createStatefulIterator = (initial) => {
        let state = initial;
        return (async function* () {
            const nested = (async function* (val) {
                yield val * 2;
                state += val; // Modify outer closure state
                yield val * 3;
            })(state);
            yield* nested;
            yield state;
        })();
    };
    const iterator = createStatefulIterator(3);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[6,9,6]';
}

export async function AsyncIteratorTest063() {
    // Async iterator with conditional timing and promise chaining
    const asyncIterator = (async function* () {
        const fetchData = async (val) => new Promise(resolve =>
        setTimeout(() => resolve(val + 10), val % 2 === 0 ? 200 : 100)
        );
        yield await fetchData(5);
        yield await fetchData(8);
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 15 && res2.value === 18;
}

export async function AsyncIteratorTest064() {
    // Multi-level nested async iterators (3 levels)
    const level3 = (async function* () { yield 'deep'; })();
    const level2 = (async function* () { yield* level3; })();
    const level1 = (async function* () { yield* level2; })();
    const result = await level1.next();
    return result.value === 'deep' && !result.done;
}

export async function AsyncIteratorTest065() {
    // Async iterator with dynamic delay based on previous value
    const asyncIterator = (async function* () {
        let prev = 1;
        while (prev < 4) {
            await new Promise(resolve => setTimeout(resolve, prev * 2));
            yield prev;
            prev++;
        }
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[1,2,3]';
}

export async function AsyncIteratorTest066() {
    // Async iterator with closure tracking execution count
    const createCountedIterator = () => {
        let count = 0;
        return (async function* () {
            while (count < 3) {
                yield count;
                count++;
                await new Promise(resolve => setTimeout(resolve, 1));
            }
        })();
    };
    const iterator = createCountedIterator();
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[0,1,2]';
}

export async function AsyncIteratorTest067() {
    // Nested async iterator with error handling in inner generator
    const asyncIterator = (async function* () {
        const inner = (async function* () {
            try {
                yield 1;
                throw new Error();
            } catch {
                yield 2;
            }
        })();
        yield* inner;
        yield 3;
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[1,2,3]';
}

export async function AsyncIteratorTest068() {
    // Async iterator with sequential promise resolution
    const asyncIterator = (async function* () {
        const promises = [
            Promise.resolve(10),
            new Promise(resolve => setTimeout(() => resolve(20), 20)),
            Promise.resolve(30)
        ];
        for (const p of promises) yield await p;
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[10,20,30]';
}

export async function AsyncIteratorTest069() {
    // Async iterator with nested arrow function for value transformation
    const transform = (val) => async () => val * 5;
    const asyncIterator = (async function* () {
        yield await transform(4)();
        yield await transform(6)();
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 20 && res2.value === 30;
}

export async function AsyncIteratorTest070() {
    // Async iterator with timing race between yield and delay
    const asyncIterator = (async function* () {
        const fastDelay = new Promise(resolve => setTimeout(resolve, 100));
        const slowYield = () => new Promise(resolve => setTimeout(() => resolve('win'), 200));
        yield await Promise.race([fastDelay.then(() => 'lose'), slowYield()]);
    })();
    const result = await asyncIterator.next();
    return result.value === 'lose' && !result.done;
}

export async function AsyncIteratorTest071() {
    // Multi-nested async iterators with parameter passing
    const createNestedIterator = (a) => (async function* () {
        const inner = (b) => (async function* () {
            yield a + b;
            yield a * b;
        })(5);
        yield* inner();
    })();
    const iterator = createNestedIterator(3);
    const values = [];
    for await (const val of iterator) values.push(val);
    return values.length === 2;
}

export async function AsyncIteratorTest072() {
    // Async iterator with stateful transformation via closure
    const createTransformIterator = (factor) => {
        let total = 0;
        return (async function* (nums) {
            for (const num of nums) {
                const transformed = num * factor;
                total += transformed;
                await new Promise(resolve => setTimeout(resolve, 1));
                yield transformed;
            }
            yield total;
        });
    };
    const iterator = createTransformIterator(2)([1, 2, 3]);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[2,4,6,12]';
}

export async function AsyncIteratorTest073() {
    // Async iterator with nested error recovery
    const asyncIterator = (async function* () {
        const riskyInner = (async function* () {
            yield 1;
        })();
        for await (const val of riskyInner) yield val;
        yield 'recovered';
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[1,"recovered"]';
}

export async function AsyncIteratorTest074() {
    // Async iterator with dynamic yield based on async condition
    const checkCondition = async () => new Promise(resolve =>
    setTimeout(() => resolve(true), 100)
    );
    const asyncIterator = (async function* () {
        if (await checkCondition()) yield 'condition met';
        yield 'done';
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 'condition met' && res2.value === 'done';
}

export async function AsyncIteratorTest075() {
    // Async iterator with closure maintaining async counter
    const createAsyncCounter = () => {
        let count = 0;
        const increment = async () => {
            await new Promise(resolve => setTimeout(resolve, 1));
            count++;
            return count;
        };
        return (async function* () {
            yield await increment();
            yield await increment();
        })();
    };
    const iterator = createAsyncCounter();
    const res1 = await iterator.next();
    const res2 = await iterator.next();
    return res1.value === 1 && res2.value === 2;
}

export async function AsyncIteratorTest076() {
    // Nested async iterators with sequential timing
    const asyncIterator = (async function* () {
        yield* (async function* () {
            await new Promise(resolve => setTimeout(resolve, 2));
            yield 'nested-1';
        })();
        yield* (async function* () {
            await new Promise(resolve => setTimeout(resolve, 1));
            yield 'nested-2';
        })();
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '["nested-1","nested-2"]';
}

export async function AsyncIteratorTest077() {
    // Async iterator with promise chaining in nested function
    const asyncIterator = (async function* () {
        const chain = async (val) => val
            .then(v => v + 5)
            .then(v => new Promise(resolve => setTimeout(() => resolve(v * 2), 100)));
        yield await chain(Promise.resolve(3));
    })();
    const result = await asyncIterator.next();
    return result.value === 16 && !result.done;
}

export async function AsyncIteratorTest078() {
    // Async iterator with state reset via closure method
    const createResetableIterator = () => {
        let state = 0;
        return {
            iterator: (async function* () {
                while (state < 2) {
                    yield state;
                    state++;
                    await new Promise(resolve => setTimeout(resolve, 1));
                }
            })(),
            reset: () => { state = 0; }
        };
    };
    const { iterator, reset } = createResetableIterator();
    const values1 = [];
    for await (const val of iterator) values1.push(val);
    reset();
    const values2 = [];
    const newIterator = createResetableIterator().iterator;
    for await (const val of newIterator) values2.push(val);
    return JSON.stringify(values1) === '[0,1]' && JSON.stringify(values2) === '[0,1]';
}

export async function AsyncIteratorTest079() {
    // Nested async iterator with conditional yield based on timing
    const asyncIterator = (async function* () {
        const inner = (async function* () {
            const start = Date.now();
            await new Promise(resolve => setTimeout(resolve, 30));
            const duration = Date.now() - start;
            yield duration >= 29 ? 'timed' : 'fast';
        })();
        yield* inner;
    })();
    const result = await asyncIterator.next();
    return result.value === 'timed' && !result.done;
}

export async function AsyncIteratorTest080() {
    // Async iterator with batch async processing in nested function
    const processBatch = async (items) => Promise.all(
        items.map(item => new Promise(resolve => setTimeout(() => resolve(item * 3), 100)))
    );
    const asyncIterator = (async function* () {
        const batches = [[1, 2], [3, 4]];
        for (const batch of batches) yield await processBatch(batch);
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[[3,6],[9,12]]';
}

export async function AsyncIteratorTest081() {
    // Multi-level nested async iterators with state propagation
    const level1 = (a) => (async function* () {
        const level2 = (b) => (async function* () {
            const level3 = (c) => (async function* () { yield c * 10; })(b + 2);
            yield* level3();
        })(a + 3);
        yield* level2();
    })();
    const iterator = level1(1);
    const result = await iterator.next();
    return !result.done;
}

export async function AsyncIteratorTest082() {
    // Async iterator with closure tracking async operation status
    const createStatusIterator = () => {
        let isComplete = false;
        return (async function* () {
            yield 'pending';
            await new Promise(resolve => setTimeout(() => {
                isComplete = true;
                resolve();
            }, 200));
            yield isComplete ? 'complete' : 'failed';
        })();
    };
    const iterator = createStatusIterator();
    const res1 = await iterator.next();
    const res2 = await iterator.next();
    return res1.value === 'pending' && res2.value === 'complete';
}

export async function AsyncIteratorTest083() {
    // Async iterator with nested error thrown and caught in outer
    const asyncIterator = (async function* () {
        try {
            yield* (async function* () {
                yield 1;
                throw new Error('nested err');
            })();
        } catch {
            yield 'caught';
        }
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '[1,"caught"]';
}

export async function AsyncIteratorTest084() {
    // Async iterator with dynamic delay using nested arrow function
    const getDelay = (val) => () => new Promise(resolve => setTimeout(resolve, val));
    const asyncIterator = (async function* () {
        yield 'start';
        await getDelay(2)();
        yield 'middle';
        await getDelay(1)();
        yield 'end';
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '["start","middle","end"]';
}

export async function AsyncIteratorTest085() {
    // Async iterator with closure maintaining cumulative sum
    const createSumIterator = (nums) => {
        let sum = 0;
        return (async function* () {
            for (const num of nums) {
                await new Promise(resolve => setTimeout(resolve, 1));
                sum += num;
                yield sum;
            }
        })();
    };
    const iterator = createSumIterator([2, 3, 5]);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[2,5,10]';
}

export async function AsyncIteratorTest086() {
    // Nested async iterators with parallel promise resolution
    const asyncIterator = (async function* () {
        const parallelTasks = [
            new Promise(resolve => setTimeout(() => resolve('p1'), 200)),
            new Promise(resolve => setTimeout(() => resolve('p2'), 100))
        ];
        yield await Promise.all(parallelTasks);
    })();
    const result = await asyncIterator.next();
    return JSON.stringify(result.value.sort()) === '["p1","p2"]' && !result.done;
}

export async function AsyncIteratorTest087() {
    // Async iterator with conditional nested iterator selection
    const createConditionalIterator = (flag) => (async function* () {
        const iterA = (async function* () { yield 'A'; })();
        const iterB = (async function* () { yield 'B'; })();
        yield* flag ? iterA : iterB;
    })();
    const iterator1 = createConditionalIterator(true);
    const iterator2 = createConditionalIterator(false);
    const res1 = await iterator1.next();
    const res2 = await iterator2.next();
    return res1.value === 'A' && res2.value === 'B';
}

export async function AsyncIteratorTest088() {
    // Async iterator with async closure initialization
    const createInitIterator = async (initVal) => {
        const initialized = await new Promise(resolve =>
        setTimeout(() => resolve(initVal * 2), 100)
        );
        return (async function* () {
            yield initialized;
        })();
    };
    const iterator = await createInitIterator(5);
    const result = await iterator.next();
    return result.value === 10 && !result.done;
}
export async function AsyncIteratorTest089() {
    // Async iterator with async closure initialization and nested yield
    const createInitIterator = async (initVal) => {
        // Async closure initialization (simulate async config load)
        const initialized = await new Promise(resolve =>
        setTimeout(() => resolve(initVal * 3), 200)
        );
        return (async function* () {
            const nested = (async function* (val) {
                await new Promise(resolve => setTimeout(resolve, 1));
                yield val + 5;
            })(initialized);
            yield* nested;
            yield initialized;
        })();
    };
    const iterator = await createInitIterator(4);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[17,12]';
}

export async function AsyncIteratorTest090() {
    // Async iterator with time-dependent state synchronization
    const createSyncIterator = () => {
        let syncState = 0;
        // Simulate external async state update
        const updateState = async () => {
            await new Promise(resolve => setTimeout(resolve, 3));
            syncState = 10;
        };
        updateState(); // Start async state update
        return (async function* () {
            yield syncState; // Yield initial state (0)
            await new Promise(resolve => setTimeout(resolve, 4)); // Wait for state update
            yield syncState; // Yield synchronized state (10)
        })();
    };
    const iterator = createSyncIterator();
    const res1 = await iterator.next();
    const res2 = await iterator.next();
    return res1.value === 0 && res2.value === 10;
}

export async function AsyncIteratorTest091() {
    // 4-level nested async iterators with parameter propagation
    const level4 = (val) => (async function* () {
        await new Promise(resolve => setTimeout(resolve, 1));
        yield val * 4;
    });
    const level3 = (val) => (async function* () { yield* level4(val + 3)(); });
    const level2 = (val) => (async function* () { yield* level3(val + 2)(); });
    const level1 = (val) => (async function* () { yield* level2(val + 1)(); });
    const iterator = level1(2)();
    const result = await iterator.next();
    return result.value === 32 && !result.done;
}

export async function AsyncIteratorTest092() {
    // Async iterator with conditional async error and recovery
    const createErrorProneIterator = (shouldThrow) => (async function* () {
        yield 'start';
        const inner = (async function* () {
            if (shouldThrow) {
                await new Promise(resolve => setTimeout(resolve, 2));
                throw new Error('test');
            }
            yield 'inner';
        })();
        try {
            yield* inner;
        } catch {
            yield 'recovered';
        }
        yield 'end';
    })();
    const iterator = createErrorProneIterator(true);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '["start","recovered","end"]';
}

export async function AsyncIteratorTest093() {
    // Async iterator with closure tracking nested async call count
    const createCallTrackIterator = () => {
        let callCount = 0;
        const nestedAsync = async () => {
            await new Promise(resolve => setTimeout(resolve, 1));
            callCount++;
            return callCount;
        };
        return (async function* () {
            yield await nestedAsync();
            yield await nestedAsync();
            yield callCount;
        })();
    };
    const iterator = createCallTrackIterator();
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[1,2,2]';
}

export async function AsyncIteratorTest094() {
    // Async iterator with sequential nested timing (delay increases)
    const asyncIterator = (async function* () {
        const delayedYield = (ms, val) => new Promise(resolve =>
        setTimeout(() => resolve(val), ms)
        );
        yield await delayedYield(100, 'a');
        yield await delayedYield(200, 'b');
        yield await delayedYield(300, 'c');
    })();
    const values = [];
    for await (const val of asyncIterator) values.push(val);
    return JSON.stringify(values) === '["a","b","c"]';
}

export async function AsyncIteratorTest095() {
    // Async iterator with async predicate for yield condition
    const createPredicateIterator = (nums) => {
        const isEven = async (num) => {
            await new Promise(resolve => setTimeout(resolve, 1));
            return num % 2 === 0;
        };
        return (async function* () {
            for (const num of nums) {
                if (await isEven(num)) yield num;
            }
        })();
    };
    const iterator = createPredicateIterator([1, 2, 3, 4, 5, 6]);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[2,4,6]';
}

export async function AsyncIteratorTest096() {
    // Nested async iterators with shared closure state
    const createSharedStateIterator = () => {
        let shared = 0;
        const iter1 = (async function* () {
            await new Promise(resolve => setTimeout(resolve, 2));
            shared += 5;
            yield shared;
        })();
        const iter2 = (async function* () {
            await new Promise(resolve => setTimeout(resolve, 1));
            shared += 3;
            yield shared;
        })();
        return { iter1, iter2 };
    };
    const { iter1, iter2 } = createSharedStateIterator();
    const res1 = await iter2.next(); // Runs first (shorter delay)
    const res2 = await iter1.next();
    return res1.value === 3 && res2.value === 8;
}

export async function AsyncIteratorTest097() {
    // Async iterator with promise.race in nested function
    const asyncIterator = (async function* () {
        const raceTask = async () => {
            const taskA = new Promise(resolve => setTimeout(() => resolve('A'), 300));
            const taskB = new Promise(resolve => setTimeout(() => resolve('B'), 200));
            return Promise.race([taskA, taskB]);
        };
        yield await raceTask();
        yield await raceTask();
    })();
    const res1 = await asyncIterator.next();
    const res2 = await asyncIterator.next();
    return res1.value === 'B' && res2.value === 'B';
}

export async function AsyncIteratorTest098() {
    // Async iterator with closure-based value caching
    const createCachedIterator = (items) => {
        const cache = new Map();
        const fetchAndCache = async (item) => {
            await new Promise(resolve => setTimeout(resolve, 1));
            const value = item.toUpperCase();
            cache.set(item, value);
            return value;
        };
        return (async function* () {
            for (const item of items) {
                yield cache.has(item) ? cache.get(item) : await fetchAndCache(item);
            }
            yield cache.size;
        })();
    };
    const iterator = createCachedIterator(['a', 'b', 'a', 'c']);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '["A","B","A","C",3]';
}

export async function AsyncIteratorTest099() {
    // Multi-nested async iterators with async transformation
    const createTransformNestedIterator = () => (async function* () {
        const level1 = (async function* () {
            const level2 = (async function* () {
                yield 'test';
            })();
            for await (const val of level2) {
                const transform = async (v) => {
                    await new Promise(resolve => setTimeout(resolve, 1));
                    return v.repeat(2);
                };
                yield await transform(val);
            }
        })();
        yield* level1;
    })();
    const iterator = createTransformNestedIterator();
    const result = await iterator.next();
    return result.value === 'testtest' && !result.done;
}

export async function AsyncIteratorTest100() {
    // Complex async workflow: init → process → sync → yield
    const createWorkflowIterator = async (initial) => {
        // Step 1: Async initialization
        const init = await new Promise(resolve =>
        setTimeout(() => resolve(initial + 10), 200)
        );
        // Step 2: Async processing with nested iterator
        const process = (val) => (async function* () {
            await new Promise(resolve => setTimeout(resolve, 10));
            yield val * 2;
            yield val * 3;
        })();
        // Step 3: Sync state after processing
        let syncVal = 0;
        const sync = async (val) => {
            await new Promise(resolve => setTimeout(resolve, 10));
            syncVal = val;
        };
        return (async function* () {
            const processor = process(init);
            for await (const val of processor) {
                yield val;
                await sync(val);
            }
            yield syncVal;
        })();
    };
    const iterator = await createWorkflowIterator(5);
    const values = [];
    for await (const val of iterator) values.push(val);
    return JSON.stringify(values) === '[30,45,45]';
}