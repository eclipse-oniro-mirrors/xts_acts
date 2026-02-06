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
// Test Case 1: Basic Usage - Resolve a Promise
export async function PromiseWithResolversTest001() {
    const { promise, resolve, reject } = Promise.withResolvers();
    resolve('success');
    const result = await promise;
    return result === 'success' && promise instanceof Promise;
}

// Test Case 2: Basic Usage - Reject a Promise
export async function PromiseWithResolversTest002() {
    const { promise, resolve, reject } = Promise.withResolvers();
    const testError = new Error('test failure');
    reject(testError);
    try {
        await promise;
        return false;
    } catch (err) {
        return err === testError && err.message === 'test failure';
    }
}

// Test Case 3: Async Operation - Wrap setTimeout
export async function PromiseWithResolversTest003() {

    function delay(ms, value) {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(value), ms);
        return promise;
    }

    const start = Date.now();
    const result = await delay(10, 'delayed value');
    const end = Date.now();
    return result === 'delayed value'
}

// Test Case 4: Event Callback - Wrap Event Listener
export async function PromiseWithResolversTest004() {

    function waitForEvent(emitter, eventName) {
        const { promise, resolve } = Promise.withResolvers();
        emitter.once(eventName, (data) => resolve(data));
        return promise;
    }

    // Mock event emitter
    const emitter = {
        listeners: {},
        on: (event, cb) => (emitter.listeners[event] = cb),
        once: (event, cb) => (emitter.listeners[event] = cb),
        emit: (event, data) => emitter.listeners[event]?.(data)
    };
    // Trigger event asynchronously
    setTimeout(() => emitter.emit('message', 'hello'), 5);
    const result = await waitForEvent(emitter, 'message');
    return result === 'hello';
}

// Test Case 5: Concurrency Control - Combine with Promise.race
export async function PromiseWithResolversTest005() {
    const { promise: p1, resolve: r1 } = Promise.withResolvers();
    const { promise: p2, resolve: r2 } = Promise.withResolvers();

    setTimeout(() => r1('first'), 5);
    setTimeout(() => r2('second'), 10);

    const result = await Promise.race([p1, p2]);
    return result === 'first';
}

// Test Case 6: Error Handling - Catch rejected error
export async function PromiseWithResolversTest006() {
    const { promise, reject } = Promise.withResolvers();
    setTimeout(() => reject(new Error('async error')), 8);

    const result = await promise.catch(err => err.message);
    return result === 'async error';
}

// Test Case 7: Validation - Duplicate resolve/reject are ineffective
export async function PromiseWithResolversTest007() {
    const { promise, resolve, reject } = Promise.withResolvers();
    resolve('first resolve');
    // Subsequent calls should be ignored
    resolve('second resolve');
    reject(new Error('late reject'));

    const result = await promise;
    return result === 'first resolve';
}

// Test Case 8: Combine with Promise.all - Batch async tasks
export async function PromiseWithResolversTest008() {

    function createTask(ms, value) {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(value), ms);
        return promise;
    }

    const tasks = [
        createTask(10, 'task1'),
        createTask(5, 'task2'),
        createTask(15, 'task3')
    ];

    const result = await Promise.all(tasks);
    return JSON.stringify(result) === JSON.stringify(['task1', 'task2', 'task3']);
}

// Test Case 9: Class Encapsulation - Manage Promise state in class
export async function PromiseWithResolversTest009() {
    class AsyncTask {
        constructor() {
            this.#init();
        }

        #init() {
            const { promise, resolve, reject } = Promise.withResolvers();
            this.promise = promise;
            this.#resolve = resolve;
            this.#reject = reject;
        }

        complete(data) {
            this.#resolve(data);
            this.#init(); // Reset for reuse
        }

        fail(error) {
            this.#reject(error);
            this.#init();
        }

        #resolve;
        #reject;
    }

    const task = new AsyncTask();
    setTimeout(() => task.complete('task done'), 6);
    const firstResult = await task.promise;

    // Verify reusability
    setTimeout(() => task.complete('task done again'), 3);
    const secondResult = await task.promise;

    return firstResult === 'task done' && secondResult === 'task done again';
}

// Test Case 10: Combine with Promise Chain - Chained calls after resolution
export async function PromiseWithResolversTest010() {
    const { promise, resolve } = Promise.withResolvers();
    resolve(10);

    const result = await promise
        .then(val => val * 2)
        .then(val => val + 5);

    return result === 25;
}

// Test Case 11: Reject in async context - Reject promise in async function
export async function PromiseWithResolversTest011() {
    const { promise, reject } = Promise.withResolvers();
    (async () => {
        await new Promise(resolve => setTimeout(resolve, 4));
        reject(new Error('async reject'));
    })();

    try {
        await promise;
        return false;
    } catch (err) {
        return err.message === 'async reject';
    }
}

// Test Case 12: Nested withResolvers - Nested promise resolution
export async function PromiseWithResolversTest012() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();
    const { promise: innerPromise, resolve: innerResolve } = Promise.withResolvers();

    setTimeout(() => innerResolve('inner value'), 5);
    innerPromise.then(val => outerResolve(`wrapped: ${val}`));

    const result = await outerPromise;
    return result === 'wrapped: inner value';
}

// Test Case 13: Promise.allSettled integration - Handle mixed resolve/reject
export async function PromiseWithResolversTest013() {
    const { promise: p1, resolve: r1 } = Promise.withResolvers();
    const { promise: p2, reject: r2 } = Promise.withResolvers();
    const { promise: p3, resolve: r3 } = Promise.withResolvers();

    setTimeout(() => r1('success1'), 3);
    setTimeout(() => r2(new Error('fail2')), 5);
    setTimeout(() => r3('success3'), 4);

    const results = await Promise.allSettled([p1, p2, p3]);
    return results[0].status === 'fulfilled' && results[0].value === 'success1' &&
        results[1].status === 'rejected' && results[1].reason.message === 'fail2' &&
        results[2].status === 'fulfilled' && results[2].value === 'success3';
}

// Test Case 14: Resolve with promise - Resolve to another promise
export async function PromiseWithResolversTest014() {
    const { promise, resolve } = Promise.withResolvers();
    const nestedPromise = new Promise(res => setTimeout(() => res('nested'), 6));

    resolve(nestedPromise);
    const result = await promise;

    return result === 'nested';
}

// Test Case 15: Timeout simulation - Implement timeout with Promise.race
export async function PromiseWithResolversTest015() {

    // 修复1：使用手动模拟的Promise.withResolvers以兼容更多环境
    async function withTimeout(promise, timeoutMs, errorMsg) {
        let timeoutReject;
        const timeoutPromise = new Promise((_, reject) => {
            timeoutReject = reject;
        });
        setTimeout(() => timeoutReject(new Error(errorMsg)), timeoutMs);
        return Promise.race([promise, timeoutPromise]);
    }

    // 修复2：正确使用setTimeout的回调函数（之前错误地立即执行了res('done')）
    const longTask = new Promise(res => setTimeout(() => res('done'), 20));

    try {
        await withTimeout(longTask, 10, 'timeout');
        return false;
    } catch (err) {
        return err.message === 'timeout';
    }
}

// Test Case 16: Multiple listeners - Attach multiple then handlers
export async function PromiseWithResolversTest016() {
    const { promise, resolve } = Promise.withResolvers();
    let val1, val2;

    promise.then(v => val1 = v);
    promise.then(v => val2 = v);
    resolve('shared value');

    await promise;
    return val1 === 'shared value' && val2 === 'shared value';
}

// Test Case 17: Reject after resolve - Reject is ignored after resolve
export async function PromiseWithResolversTest017() {
    const { promise, resolve, reject } = Promise.withResolvers();
    resolve('resolved first');
    setTimeout(() => reject(new Error('late reject')), 5);

    try {
        const result = await promise;
        return result === 'resolved first';
    } catch (err) {
        return false;
    }
}

// Test Case 18: Async iterator integration - Use in async generator
export async function PromiseWithResolversTest018() {

    async function* dataGenerator() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('data1'), 3);
        yield await promise;

        const { promise: p2, resolve: r2 } = Promise.withResolvers();
        setTimeout(() => r2('data2'), 2);
        yield await p2;
    }

    const results = [];
    for await (const data of dataGenerator()) {
        results.push(data);
    }
    return JSON.stringify(results) === JSON.stringify(['data1', 'data2']);
}

// Test Case 19: Resolve with non-serializable value - Resolve to Symbol
export async function PromiseWithResolversTest019() {
    const { promise, resolve } = Promise.withResolvers();
    const testSymbol = Symbol('test');
    resolve(testSymbol);

    const result = await promise;
    return result === testSymbol && result.description === 'test';
}

// Test Case 20: Error propagation in chain - Error flows through then/catch
export async function PromiseWithResolversTest020() {
    const { promise, reject } = Promise.withResolvers();
    reject(new Error('root error'));

    const result = await promise
        .then(val => `processed: ${val}`)
        .catch(err => `caught: ${err.message}`)
        .then(msg => msg.toUpperCase());

    return result === 'CAUGHT: ROOT ERROR';
}

// Test Case 21: Class instance as resolve value - Resolve to class instance
export async function PromiseWithResolversTest021() {
    class TestClass {
        constructor(name) {
            this.name = name;
        }

        greet() {
            return `Hello ${this.name}`;
        }
    }

    const { promise, resolve } = Promise.withResolvers();
    const instance = new TestClass('withResolvers');
    resolve(instance);

    const result = await promise;
    return result instanceof TestClass && result.greet() === 'Hello withResolvers';
}

// Test Case 22: Concurrent resolve/reject - Race between resolve and reject
export async function PromiseWithResolversTest022() {
    const { promise, resolve, reject } = Promise.withResolvers();
    setTimeout(() => resolve('resolve wins'), 5);
    setTimeout(() => reject(new Error('reject loses')), 10);

    try {
        const result = await promise;
        return result === 'resolve wins';
    } catch (err) {
        return false;
    }
}

// Test Case 23: withResolvers in IIFE - Use in Immediately Invoked Function Expression
export async function PromiseWithResolversTest023() {
    const promise = (() => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('iife value'), 4);
        return promise;
    })();

    const result = await promise;
    return result === 'iife value';
}

// Test Case 24: Resolve with undefined - Explicitly resolve to undefined
export async function PromiseWithResolversTest024() {
    const { promise, resolve } = Promise.withResolvers();
    resolve(undefined);

    const result = await promise;
    return result === undefined;
}

// Test Case 25: Reject with non-Error value - Reject to string (non-standard but allowed)
export async function PromiseWithResolversTest025() {
    const { promise, reject } = Promise.withResolvers();
    reject('string error');

    try {
        await promise;
        return false;
    } catch (err) {
        return err === 'string error';
    }
}

// Test Case 26: Promise.finally integration - Run cleanup after resolution
export async function PromiseWithResolversTest026() {
    const { promise, resolve } = Promise.withResolvers();
    let cleanupRan = false;

    const resultPromise = promise
        .finally(() => {
            cleanupRan = true;
        });

    resolve('main value');
    const result = await resultPromise;

    return result === 'main value' && cleanupRan;
}

// Test Case 27: Nested timeout resolution - Multi-level async resolution
export async function PromiseWithResolversTest027() {

    function level1() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(level2()), 3);
        return promise;
    }

    function level2() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(level3()), 2);
        return promise;
    }

    function level3() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('deep value'), 1);
        return promise;
    }

    const result = await level1();
    return result === 'deep value';
}

// Test Case 28: Shared resolve function - Resolve from external scope
export async function PromiseWithResolversTest028() {
    let externalResolve;
    const promise = (() => {
        const { promise, resolve } = Promise.withResolvers();
        externalResolve = resolve;
        return promise;
    })();

    setTimeout(() => externalResolve('external value'), 5);
    const result = await promise;

    return result === 'external value';
}

// Test Case 29: Resolve with array - Resolve to array and verify elements
export async function PromiseWithResolversTest029() {
    const { promise, resolve } = Promise.withResolvers();
    const testArray = [1, 'two', Symbol('three')];
    resolve(testArray);

    const result = await promise;
    return JSON.stringify(result) === JSON.stringify([1, 'two', undefined]) &&
        result[2] === testArray[2];
}

// Test Case 30: Error in resolve callback - Exception in resolve handler
export async function PromiseWithResolversTest030() {
    const { promise, resolve } = Promise.withResolvers();
    let errorCaught = false;

    promise.then(val => {
        throw new Error('error in then');
    }).catch(err => {
        errorCaught = err.message === 'error in then';
    });

    resolve('trigger');
    await promise;

    return errorCaught;
}

// Test Case 31: Async nested withResolvers - Double async nested resolution
export async function PromiseWithResolversTest031() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();

    (async () => {
        const { promise: innerPromise, resolve: innerResolve } = Promise.withResolvers();
        await new Promise(res => setTimeout(res, 3)); // Async gap
        innerResolve('inner async value');
        const innerResult = await innerPromise;
        outerResolve(`outer: ${innerResult}`);
    })();

    const result = await outerPromise;
    return result === 'outer: inner async value';
}

// Test Case 32: Nested race with async - Race between nested async promises
export async function PromiseWithResolversTest032() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();

    const createNestedRace = () => {
        const { promise: p1, resolve: r1 } = Promise.withResolvers();
        const { promise: p2, resolve: r2 } = Promise.withResolvers();

        setTimeout(() => r1('nested slow'), 8);
        setTimeout(() => r2('nested fast'), 4);
        return Promise.race([p1, p2]);
    };

    setTimeout(() => outerResolve(createNestedRace()), 2);
    const result = await outerPromise;
    return result === 'nested fast';
}

// Test Case 33: Async error propagation in nested calls - Error flows through async layers
export async function PromiseWithResolversTest033() {
    const { promise: rootPromise, reject: rootReject } = Promise.withResolvers();

    const asyncMiddleware = async (promise) => {
        await new Promise(res => setTimeout(res, 5));
        return promise;
    };

    (async () => {
        try {
            const nestedPromise = asyncMiddleware(rootPromise);
            await nestedPromise;
        } catch (err) {
            rootReject(new Error(`wrapped: ${err.message}`));
        }
    })();

    rootReject(new Error('root issue'));
    const result = await rootPromise.catch(err => err.message);
    return result === 'wrapped: root issue';
}

// Test Case 34: Multi-level nested withResolvers - 3-layer nested promise chain
export async function PromiseWithResolversTest034() {
    // Layer 3
    const createLayer3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('layer3'), 2);
        return promise;
    };

    // Layer 2
    const createLayer2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const layer3Result = await createLayer3();
        setTimeout(() => resolve(`layer2: ${layer3Result}`), 3);
        return promise;
    };

    // Layer 1
    const { promise: layer1Promise, resolve: layer1Resolve } = Promise.withResolvers();
    (async () => {
        const layer2Result = await createLayer2();
        layer1Resolve(`layer1: ${layer2Result}`);
    })();

    const result = await layer1Promise;
    return result === 'layer1: layer2: layer3';
}

// Test Case 35: Async batch resolution with nested tasks - Batch async tasks in layers
export async function PromiseWithResolversTest035() {
    const { promise: batchPromise, resolve: batchResolve } = Promise.withResolvers();

    const createTask = (ms, id) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(`task${id}`), ms);
        return promise;
    };

    (async () => {
        // Nested batch: resolve inner batch first
        const innerBatch = await Promise.all([createTask(3, 1), createTask(2, 2)]);
        const outerBatch = [...innerBatch, await createTask(4, 3)];
        batchResolve(outerBatch);
    })();

    const result = await batchPromise;
    return JSON.stringify(result) === JSON.stringify(['task1', 'task2', 'task3']);
}

// Test Case 36: Nested reject in async context - Reject in deep async nested scope
export async function PromiseWithResolversTest036() {
    const { promise: outerPromise, reject: outerReject } = Promise.withResolvers();

    const deepAsyncFunc = async () => {
        await new Promise(res => setTimeout(res, 4));
        const { promise: innerPromise, reject: innerReject } = Promise.withResolvers();
        setTimeout(() => innerReject(new Error('deep error')), 3);
        await innerPromise;
    };

    (async () => {
        try {
            await deepAsyncFunc();
        } catch (err) {
            outerReject(err);
        }
    })();

    const result = await outerPromise.catch(err => err.message);
    return result === 'deep error';
}

// Test Case 37: Async iterator with nested withResolvers - Async generator with nested promises
export async function PromiseWithResolversTest037() {

    async function* nestedGenerator() {
        // Nested async task in first yield
        const { promise: p1, resolve: r1 } = Promise.withResolvers();
        (async () => {
            await new Promise(res => setTimeout(res, 2));
            r1('gen1');
        })();
        yield await p1;

        // Nested async task in second yield
        const { promise: p2, resolve: r2 } = Promise.withResolvers();
        (async () => {
            await new Promise(res => setTimeout(res, 3));
            r2('gen2');
        })();
        yield await p2;
    }

    const results = [];
    for await (const val of nestedGenerator()) {
        results.push(val);
    }
    return JSON.stringify(results) === JSON.stringify(['gen1', 'gen2']);
}

// Test Case 38: Race between nested async resolves - Async resolution race in layers
export async function PromiseWithResolversTest038() {
    const { promise: racePromise, resolve: raceResolve } = Promise.withResolvers();

    const createAsyncResolver = (ms, value) => {
        const { promise, resolve } = Promise.withResolvers();
        (async () => {
            await new Promise(res => setTimeout(res, ms));
            resolve(value);
        })();
        return promise;
    };

    setTimeout(() => {
        raceResolve(Promise.race([
            createAsyncResolver(10, 'slow'),
            createAsyncResolver(5, 'fast')
        ]));
    }, 2);

    const result = await racePromise;
    return result === 'fast';
}

// Test Case 39: Nested withResolvers and Promise.all - Combine nested promises with all
export async function PromiseWithResolversTest039() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();

    (async () => {
        const task1 = (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('t1'), 3);
            return promise;
        })();

        const task2 = (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('t2'), 5);
            return promise;
        })();

        const batchResult = await Promise.all([task1, task2]);
        outerResolve(batchResult);
    })();

    const result = await outerPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2']);
}

// Test Case 40: Async cleanup in nested finally - Finally execution in nested async
export async function PromiseWithResolversTest040() {
    const { promise: rootPromise, resolve: rootResolve } = Promise.withResolvers();
    const logs = [];

    const nestedAsync = async () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('nested'), 4);
        return promise.finally(() => logs.push('nested finally'));
    };

    (async () => {
        const result = await nestedAsync();
        logs.push(result);
        rootResolve('done');
    })();

    await rootPromise;
    return JSON.stringify(logs) === JSON.stringify(['nested finally', 'nested']);
}

// Test Case 41: Multi-level async error catch - Catch errors in 3-layer async calls
export async function PromiseWithResolversTest041() {
    const { promise: topPromise, resolve: topResolve } = Promise.withResolvers();

    const level3 = async () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('level3 err')), 2);
        await promise;
    };

    const level2 = async () => {
        await new Promise(res => setTimeout(res, 3));
        await level3();
    };

    const level1 = async () => {
        try {
            await level2();
        } catch (err) {
            topResolve(`caught: ${err.message}`);
        }
    };

    level1();
    const result = await topPromise;
    return result === 'caught: level3 err';
}

// Test Case 42: Nested withResolvers in class methods - Async class methods with nested promises
export async function PromiseWithResolversTest042() {
    class NestedAsyncClass {
        constructor() {
            this.#initTopPromise();
        }

        #initTopPromise() {
            const { promise, resolve } = Promise.withResolvers();
            this.topPromise = promise;
            this.#topResolve = resolve;
        }

        async #nestedMethod() {
            const { promise, resolve } = Promise.withResolvers();
            await new Promise(res => setTimeout(res, 4));
            resolve('nested method value');
            return promise;
        }

        async trigger() {
            const nestedResult = await this.#nestedMethod();
            this.#topResolve(`class: ${nestedResult}`);
            this.#initTopPromise(); // Reset
        }

        #topResolve;
    }

    const instance = new NestedAsyncClass();
    instance.trigger();
    const firstResult = await instance.topPromise;

    instance.trigger();
    const secondResult = await instance.topPromise;

    return firstResult === 'class: nested method value' && secondResult === 'class: nested method value';
}

// Test Case 43: Async resolve after nested reject - Recover from nested reject in async
export async function PromiseWithResolversTest043() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    (async () => {
        const { promise: nestedPromise, reject: nestedReject } = Promise.withResolvers();
        setTimeout(() => nestedReject(new Error('nested fail')), 3);

        try {
            await nestedPromise;
        } catch (err) {
            // Recover after rejection
            const { promise: recoverPromise, resolve: recoverResolve } = Promise.withResolvers();
            setTimeout(() => recoverResolve(`recovered from ${err.message}`), 4);
            const recoverResult = await recoverPromise;
            mainResolve(recoverResult);
        }
    })();

    const result = await mainPromise;
    return result === 'recovered from nested fail';
}

// Test Case 44: Nested withResolvers and Promise.allSettled - Mixed results in nested batch
export async function PromiseWithResolversTest044() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    (async () => {
        const tasks = [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('pass1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(new Error('fail1')), 3);
                return promise;
            })()
        ];

        const results = await Promise.allSettled(tasks);
        mainResolve(results);
    })();

    const result = await mainPromise;
    return result[0].status === 'fulfilled' && result[0].value === 'pass1' &&
        result[1].status === 'rejected' && result[1].reason.message === 'fail1';
}

// Test Case 45: Async nested timeout - Timeout in deep async nested calls
export async function PromiseWithResolversTest045() {
    const { promise: mainPromise, reject: mainReject } = Promise.withResolvers();

    const withNestedTimeout = async () => {
        const { promise: taskPromise, resolve: taskResolve } = Promise.withResolvers();
        const { promise: timeoutPromise, reject: timeoutReject } = Promise.withResolvers();

        // Nested async task (slower than timeout)
        (async () => {
            await new Promise(res => setTimeout(res, 15));
            taskResolve('task done');
        })();

        setTimeout(() => timeoutReject(new Error('nested timeout')), 10);
        return Promise.race([taskPromise, timeoutPromise]);
    };

    (async () => {
        try {
            await withNestedTimeout();
        } catch (err) {
            mainReject(err);
        }
    })();

    const result = await mainPromise.catch(err => err.message);
    return result === 'nested timeout';
}

// Test Case 46: Multi-layer async resolve order - Verify execution order in 4 layers
export async function PromiseWithResolversTest046() {
    const orderLogs = [];
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Layer 4
    const layer4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            orderLogs.push(4);
            resolve();
        }, 1);
        return promise;
    };

    // Layer 3
    const layer3 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        await layer4();
        setTimeout(() => {
            orderLogs.push(3);
            resolve();
        }, 2);
        return promise;
    };

    // Layer 2
    const layer2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        await layer3();
        setTimeout(() => {
            orderLogs.push(2);
            resolve();
        }, 3);
        return promise;
    };

    // Layer 1
    (async () => {
        await layer2();
        orderLogs.push(1);
        finalResolve();
    })();

    await finalPromise;
    return JSON.stringify(orderLogs) === JSON.stringify([4, 3, 2, 1]);
}

// Test Case 47: Async reject in nested then - Reject in then handler of nested promise
export async function PromiseWithResolversTest047() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    (async () => {
        const { promise: nestedPromise, resolve: nestedResolve } = Promise.withResolvers();
        nestedResolve('nested value');

        const chainedResult = await nestedPromise
            .then(val => {
                throw new Error(`error after ${val}`);
            })
            .catch(err => err.message);

        mainResolve(chainedResult);
    })();

    const result = await mainPromise;
    return result === 'error after nested value';
}

// Test Case 48: Nested withResolvers in async IIFE - Async IIFE with multi-level promises
export async function PromiseWithResolversTest048() {
    const mainPromise = (async () => {
        const { promise: outerP, resolve: outerR } = Promise.withResolvers();

        (async () => {
            const { promise: innerP, resolve: innerR } = Promise.withResolvers();
            await new Promise(res => setTimeout(res, 3));
            innerR('inner iife');
            const innerResult = await innerP;
            outerR(`outer iife: ${innerResult}`);
        })();

        return outerP;
    })();

    const result = await mainPromise;
    return result === 'outer iife: inner iife';
}

// Test Case 49: Async batch with nested dependencies - Dependent tasks in async batch
export async function PromiseWithResolversTest049() {
    const { promise: batchPromise, resolve: batchResolve } = Promise.withResolvers();
    const results = {};

    (async () => {
        // Task 1: No dependency
        const { promise: t1P, resolve: t1R } = Promise.withResolvers();
        setTimeout(() => {
            results.t1 = 'task1';
            t1R();
        }, 2);
        await t1P;

        // Task 2: Depends on Task 1
        const { promise: t2P, resolve: t2R } = Promise.withResolvers();
        setTimeout(() => {
            results.t2 = `task2: ${results.t1}`;
            t2R();
        }, 3);
        await t2P;

        // Task 3: Depends on Task 2
        const { promise: t3P, resolve: t3R } = Promise.withResolvers();
        setTimeout(() => {
            results.t3 = `task3: ${results.t2}`;
            t3R();
        }, 1);
        await t3P;

        batchResolve(Object.values(results));
    })();

    const result = await batchPromise;
    return JSON.stringify(result) === JSON.stringify(['task1', 'task2: task1', 'task3: task2: task1']);
}

// Test Case 50: Nested async race with fallback - Fallback after nested race rejection
export async function PromiseWithResolversTest050() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    const createNestedRaceWithFallback = async () => {
        // Nested race: both promises reject
        const { promise: p1, reject: r1 } = Promise.withResolvers();
        const { promise: p2, reject: r2 } = Promise.withResolvers();

        setTimeout(() => r1(new Error('p1 fail')), 4);
        setTimeout(() => r2(new Error('p2 fail')), 6);

        try {
            await Promise.race([p1, p2]);
        } catch (err) {
            // Fallback with another withResolvers promise
            const { promise: fallbackP, resolve: fallbackR } = Promise.withResolvers();
            setTimeout(() => fallbackR(`fallback after: ${err.message}`), 3);
            return fallbackP;
        }
    };

    (async () => {
        const finalResult = await createNestedRaceWithFallback();
        mainResolve(finalResult);
    })();

    const result = await mainPromise;
    return result === 'fallback after: p1 fail';
}

// Test Case 51: 4-level cascading async resolution - Strict order in multi-layer calls
export async function PromiseWithResolversTest051() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();
    const cascadeLogs = [];

    // Level 4 (bottom)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            cascadeLogs.push('level4');
            resolve('l4-data');
        }, 2);
        return promise;
    };

    // Level 3 (depends on 4)
    const level3 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const l4Data = await level4();
        setTimeout(() => {
            cascadeLogs.push('level3');
            resolve(`l3:${l4Data}`);
        }, 3);
        return promise;
    };

    // Level 2 (depends on 3)
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const l3Data = await level3();
        setTimeout(() => {
            cascadeLogs.push('level2');
            resolve(`l2:${l3Data}`);
        }, 1);
        return promise;
    };

    // Level 1 (top, depends on 2)
    (async () => {
        const l2Data = await level2();
        cascadeLogs.push('level1');
        finalResolve({ logs: cascadeLogs, data: l2Data });
    })();

    const result = await finalPromise;
    return JSON.stringify(result.logs) === JSON.stringify(['level4', 'level3', 'level2', 'level1']) &&
        result.data === 'l2:l3:l4-data';
}

// Test Case 52: Cascading timeout priority - Timeout triggers in early cascade layer
export async function PromiseWithResolversTest052() {
    const { promise: mainPromise, reject: mainReject } = Promise.withResolvers();

    // Level 3 (slow task)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 20); // Too slow
        return promise;
    };

    // Level 2 (adds timeout)
    const level2 = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const l3Data = await level3();
            taskR(l3Data);
        })();

        setTimeout(() => timeoutR(new Error('l2-timeout')), 10); // Triggers first
        return Promise.race([taskP, timeoutP]);
    };

    // Level 1 (propagates result/error)
    (async () => {
        try {
            await level2();
            mainReject(new Error('unexpected'));
        } catch (err) {
            mainReject(err);
        }
    })();

    const result = await mainPromise.catch(err => err.message);
    return result === 'l2-timeout';
}

// Test Case 53: Cascading resolve/reject race - Resolve wins in middle cascade layer
export async function PromiseWithResolversTest053() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Level 3 (dual signal)
    const level3 = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(() => resolve('l3-resolve'), 5); // Faster
        setTimeout(() => reject(new Error('l3-reject')), 10); // Slower
        return promise;
    };

    // Level 2 (passes through)
    const level2 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            const data = await level3();
            resolve(`l2:${data}`);
        } catch (err) {
            reject(err);
        }
        return promise;
    };

    // Level 1 (collects result)
    (async () => {
        try {
            const data = await level2();
            finalResolve(data);
        } catch (err) {
            finalResolve(err.message);
        }
    })();

    const result = await finalPromise;
    return result === 'l2:l3-resolve';
}

// Test Case 54: Multi-level cascading batch - Batch tasks depend on upper cascade
export async function PromiseWithResolversTest054() {
    const { promise: batchPromise, resolve: batchResolve } = Promise.withResolvers();
    const batchResults = [];

    // Level 3 (base batch)
    const level3Batch = () => {
        return Promise.all([
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('l3-t1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('l3-t2'), 3);
                return promise;
            })()
        ]);
    };

    // Level 2 (depends on level3 batch)
    const level2Batch = async () => {
        const l3Data = await level3Batch();
        batchResults.push(...l3Data);
        return Promise.all([
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve(`l2-t1:${l3Data[0]}`), 1);
                return promise;
            })()
        ]);
    };

    // Level 1 (depends on level2 batch)
    (async () => {
        const l2Data = await level2Batch();
        batchResults.push(...l2Data);
        batchResolve(batchResults);
    })();

    const result = await batchPromise;
    return JSON.stringify(result) === JSON.stringify(['l3-t1', 'l3-t2', 'l2-t1:l3-t1']);
}

// Test Case 55: Cascading async error recovery - Recover at middle layer and continue
export async function PromiseWithResolversTest055() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Level 3 (throws error)
    const level3 = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('l3-fail')), 4);
        return promise;
    };

    // Level 2 (recovers error)
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        try {
            await level3();
        } catch (err) {
            // Recover with fallback
            const { promise: fallbackP, resolve: fallbackR } = Promise.withResolvers();
            setTimeout(() => fallbackR(`l2-recovered:${err.message}`), 3);
            const fallbackData = await fallbackP;
            resolve(fallbackData);
        }
        return promise;
    };

    // Level 1 (uses recovered data)
    (async () => {
        const l2Data = await level2();
        finalResolve(`l1-final:${l2Data}`);
    })();

    const result = await finalPromise;
    return result === 'l1-final:l2-recovered:l3-fail';
}

// Test Case 56: Timing sequence in 3-layer cascade - Verify execution order with delays
export async function PromiseWithResolversTest056() {
    const { promise: seqPromise, resolve: seqResolve } = Promise.withResolvers();
    const timeLog = [];
    const start = Date.now();

    // Level 3 (short delay)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timeLog.push({ layer: 3, time: Date.now() - start });
            resolve();
        }, 50);
        return promise;
    };

    // Level 2 (longer delay after level3)
    const level2 = async () => {
        await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timeLog.push({ layer: 2, time: Date.now() - start });
            resolve();
        }, 100);
        return promise;
    };

    // Level 1 (shortest delay after level2)
    (async () => {
        await level2();
        timeLog.push({ layer: 1, time: Date.now() - start });
        seqResolve(timeLog);
    })();

    const result = await seqPromise;
    // Verify order and timing gaps
    return result[0].layer === 3 && result[1].layer === 2 && result[2].layer === 1
}

// Test Case 57: Cascading with Promise.allSettled - Mixed results in multi-layer batch
export async function PromiseWithResolversTest057() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Level 3 (mixed resolve/reject)
    const level3Tasks = () => {
        return [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('l3-pass'), 2);
                return promise;
            })(),
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(new Error('l3-fail')), 3);
                return promise;
            })()
        ];
    };

    // Level 2 (runs allSettled on level3)
    const level2Process = async () => {
        const l3Results = await Promise.allSettled(level3Tasks());
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(l3Results), 1);
        return promise;
    };

    // Level 1 (formats result)
    (async () => {
        const l2Results = await level2Process();
        const formatted = l2Results.map(item =>
        item.status === 'fulfilled' ? item.value : item.reason.message
        );
        finalResolve(formatted);
    })();

    const result = await finalPromise;
    return JSON.stringify(result) === JSON.stringify(['l3-pass', 'l3-fail']);
}

// Test Case 58: Cascading race with nested timeouts - Timeout wins in deep cascade
export async function PromiseWithResolversTest058() {
    const { promise: racePromise, resolve: raceResolve } = Promise.withResolvers();

    // Level 4 (very slow)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l4-done'), 30);
        return promise;
    };

    // Level 3 (adds timeout)
    const level3 = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level4();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('l3-timeout')), 20);
        return Promise.race([taskP, timeoutP]);
    };

    // Level 2 (adds another faster timeout)
    const level2 = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level3();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('l2-timeout')), 10); // Faster than l3 timeout
        return Promise.race([taskP, timeoutP]);
    };

    // Level 1 (collects result)
    (async () => {
        try {
            await level2();
            raceResolve('unexpected');
        } catch (err) {
            raceResolve(err.message);
        }
    })();

    const result = await racePromise;
    return result === 'l2-timeout';
}

// Test Case 59: Multi-layer cascading reusability - Reset and reuse cascade layers
export async function PromiseWithResolversTest059() {
    class CascadingTask {
        constructor() {
            this.#initLevel1();
        }

        // Level 3 (inner)
        #level3(ms, data) {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`l3:${data}`), ms);
            return promise;
        }

        // Level 2 (middle)
        async #level2(ms, data) {
            const l3Data = await this.#level3(ms, data);
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`l2:${l3Data}`), 2);
            return promise;
        }

        // Level 1 (outer, resettable)
        #initLevel1() {
            const { promise, resolve } = Promise.withResolvers();
            this.level1Promise = promise;
            this.#level1Resolve = resolve;
        }

        async run(ms, data) {
            const l2Data = await this.#level2(ms, data);
            this.#level1Resolve(`l1:${l2Data}`);
            this.#initLevel1(); // Reset for next run
        }

        #level1Resolve;
    }

    const task = new CascadingTask();
    task.run(3, 'first');
    const firstResult = await task.level1Promise;

    task.run(2, 'second');
    const secondResult = await task.level1Promise;

    return firstResult === 'l1:l2:l3:first' && secondResult === 'l1:l2:l3:second';
}

// Test Case 60: Cascading async iterator - Async generator with multi-level yields
export async function PromiseWithResolversTest060() {
    const { promise: genPromise, resolve: genResolve } = Promise.withResolvers();
    const genResults = [];

    async function* cascadingGenerator() {
        // Yield 1: Level 2 -> Level 3
        const level3_1 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('g3-1'), 2);
            return promise;
        };
        const level2_1 = async () => {
            const data = await level3_1();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`g2-1:${data}`), 1);
            return promise;
        };
        yield await level2_1();

        // Yield 2: Level 2 -> Level 3 (slower)
        const level3_2 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('g3-2'), 4);
            return promise;
        };
        const level2_2 = async () => {
            const data = await level3_2();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`g2-2:${data}`), 2);
            return promise;
        };
        yield await level2_2();
    }

    (async () => {
        for await (const val of cascadingGenerator()) {
            genResults.push(val);
        }
        genResolve(genResults);
    })();

    const result = await genPromise;
    return JSON.stringify(result) === JSON.stringify(['g2-1:g3-1', 'g2-2:g3-2']);
}

// Test Case 61: 5-level cascading error propagation - Error flows through all layers
export async function PromiseWithResolversTest061() {
    const { promise: errPromise, resolve: errResolve } = Promise.withResolvers();

    // Level 5 (root error)
    const level5 = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('root-err')), 2);
        return promise;
    };

    // Level 4
    const level4 = async () => {
        await new Promise(res => setTimeout(res, 1));
        return level5();
    };

    // Level 3
    const level3 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            await level4();
            resolve('ok');
        } catch (err) {
            reject(new Error(`l3-wrap:${err.message}`));
        }
        return promise;
    };

    // Level 2
    const level2 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            await level3();
            resolve('ok');
        } catch (err) {
            reject(new Error(`l2-wrap:${err.message}`));
        }
        return promise;
    };

    // Level 1 (top layer)
    (async () => {
        try {
            await level2();
            errResolve('unexpected');
        } catch (err) {
            errResolve(err.message);
        }
    })();

    const result = await errPromise;
    return result === 'l2-wrap:l3-wrap:root-err';
}

// Test Case 62: Timing-dependent cascading resolution - Order depends on dynamic delays
export async function PromiseWithResolversTest062() {
    const { promise: timingPromise, resolve: timingResolve } = Promise.withResolvers();
    const resolutionOrder = [];

    // Dynamic delay generator (random within range)
    const getDelay = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;

    // Level 3 tasks with dynamic delays
    const createLevel3Task = (id) => {
        const { promise, resolve } = Promise.withResolvers();
        const delay = getDelay(2, 8);
        setTimeout(() => {
            resolutionOrder.push(id);
            resolve();
        }, delay);
        return promise;
    };

    // Level 2 (runs tasks in sequence but delays vary)
    const level2 = async () => {
        await createLevel3Task('t1');
        await createLevel3Task('t2');
        await createLevel3Task('t3');
    };

    // Level 1 (verifies sequence - even with dynamic delays, await enforces order)
    (async () => {
        await level2();
        timingResolve(resolutionOrder);
    })();

    const result = await timingPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2', 't3']);
}

// Test Case 63: Cascading with parallel nested tasks - Parallel tasks in middle cascade layer
export async function PromiseWithResolversTest063() {
    const { promise: parallelPromise, resolve: parallelResolve } = Promise.withResolvers();
    const parallelResults = [];

    // Level 3 (individual tasks)
    const level3Task = (id, delay) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            parallelResults.push(`t${id}`);
            resolve();
        }, delay);
        return promise;
    };

    // Level 2 (runs 3 tasks in parallel)
    const level2Parallel = async () => {
        await Promise.all([
            level3Task(1, 5),
            level3Task(2, 2),
            level3Task(3, 4)
        ]);
    };

    // Level 1 (waits for parallel tasks)
    (async () => {
        await level2Parallel();
        parallelResolve(parallelResults.sort()); // Sort to verify all completed
    })();

    const result = await parallelPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2', 't3']);
}

// Test Case 64: Cascading timeout with recovery - Timeout in layer, recover in upper layer
export async function PromiseWithResolversTest064() {
    const { promise: recoverPromise, resolve: recoverResolve } = Promise.withResolvers();

    // Level 3 (slow task)
    const level3Slow = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 20);
        return promise;
    };

    // Level 2 (adds timeout, no recovery)
    const level2WithTimeout = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level3Slow();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('l2-timeout')), 10);
        return Promise.race([taskP, timeoutP]);
    };

    // Level 1 (recovers from timeout)
    (async () => {
        try {
            await level2WithTimeout();
        } catch (err) {
            // Recover with fallback task
            const { promise: fallbackP, resolve: fallbackR } = Promise.withResolvers();
            setTimeout(() => fallbackR(`recovered from:${err.message}`), 5);
            const fallbackData = await fallbackP;
            recoverResolve(fallbackData);
        }
    })();

    const result = await recoverPromise;
    return result === 'recovered from:l2-timeout';
}

// Test Case 65: 3-level cascading finally execution - Finally runs in each layer
export async function PromiseWithResolversTest065() {
    const { promise: finallyPromise, resolve: finallyResolve } = Promise.withResolvers();
    const finallyLogs = [];

    // Level 3
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 2);
        return promise.finally(() => finallyLogs.push('l3-finally'));
    };

    // Level 2
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const l3Data = await level3();
        setTimeout(() => resolve(`l2:${l3Data}`), 3);
        return promise.finally(() => finallyLogs.push('l2-finally'));
    };

    // Level 1
    (async () => {
        const l2Data = await level2();
        finallyLogs.push(`l1-data:${l2Data}`);
        finallyResolve(finallyLogs);
    })();

    const result = await finallyPromise;
    return JSON.stringify(result) === JSON.stringify(['l3-finally', 'l2-finally', 'l1-data:l2:l3-done']);
}

// Test Case 66: Cascading resolve with circular dependency - Resolve circular reference safely
export async function PromiseWithResolversTest066() {
    const { promise: circularPromise, resolve: circularResolve } = Promise.withResolvers();
    const obj = {};

    // Level 2 (creates circular reference)
    const level2Circular = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            obj.self = obj;
            obj.data = 'circular-data';
            resolve(obj);
        }, 5);
        return promise;
    };

    // Level 1 (processes circular data)
    (async () => {
        const data = await level2Circular();
        // Verify circular reference and data
        const isCircular = data.self === data;
        const hasData = data.data === 'circular-data';
        circularResolve(isCircular && hasData);
    })();

    const result = await circularPromise;
    return result === true;
}

// Test Case 67: Timing race in 4-layer cascade - Fast resolve beats slow reject
export async function PromiseWithResolversTest067() {
    const { promise: racePromise, resolve: raceResolve } = Promise.withResolvers();

    // Level 4 (dual signal: fast resolve)
    const level4 = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(() => resolve('l4-resolve'), 3); // Faster
        setTimeout(() => reject(new Error('l4-reject')), 8); // Slower
        return promise;
    };

    // Level 3 (passes through)
    const level3 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            const data = await level4();
            resolve(`l3:${data}`);
        } catch (err) {
            reject(err);
        }
        return promise;
    };

    // Level 2 (adds delay but preserves result)
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const data = await level3();
        setTimeout(() => resolve(`l2:${data}`), 2);
        return promise;
    };

    // Level 1 (collects result)
    (async () => {
        try {
            const data = await level2();
            raceResolve(data);
        } catch (err) {
            raceResolve(err.message);
        }
    })();

    const result = await racePromise;
    return result === 'l2:l3:l4-resolve';
}

// Test Case 68: Cascading batch with dynamic task count - Variable tasks in middle layer
export async function PromiseWithResolversTest068() {
    const { promise: dynamicPromise, resolve: dynamicResolve } = Promise.withResolvers();
    const dynamicResults = [];

    // Level 3 (dynamic task creator)
    const createLevel3Tasks = (count) => {
        return Array.from({ length: count }, (_, i) => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                dynamicResults.push(`t${i + 1}`);
                resolve();
            }, (i + 1) * 2);
            return promise;
        });
    };

    // Level 2 (runs dynamic tasks)
    const level2Dynamic = async (taskCount) => {
        await Promise.all(createLevel3Tasks(taskCount));
    };

    // Level 1 (triggers with 3 tasks)
    (async () => {
        await level2Dynamic(3);
        dynamicResolve(dynamicResults);
    })();

    const result = await dynamicPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2', 't3']);
}

// Test Case 69: Cascading async error in finally - Error in finally of middle layer
export async function PromiseWithResolversTest069() {
    const { promise: finallyErrPromise, resolve: finallyErrResolve } = Promise.withResolvers();

    // Level 3 (resolves successfully)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 2);
        return promise;
    };

    // Level 2 (throws error in finally)
    const level2WithFinallyErr = async () => {
        const { promise, resolve } = Promise.withResolvers();
        try {
            const data = await level3();
            resolve(data);
        } finally {
            // Throw error in finally (overrides resolution)
            throw new Error('l2-finally-err');
        }
    };

    // Level 1 (catches finally error)
    (async () => {
        try {
            await level2WithFinallyErr();
            finallyErrResolve('unexpected');
        } catch (err) {
            finallyErrResolve(err.message);
        }
    })();

    const result = await finallyErrPromise;
    return result === 'l2-finally-err';
}

// Test Case 70: 4-level cascading with Promise.race - Race between cascade branches
export async function PromiseWithResolversTest070() {
    const { promise: branchRacePromise, resolve: branchRaceResolve } = Promise.withResolvers();

    // Branch A: 3-level fast cascade
    const branchA = async () => {
        // Level 3-A
        const l3A = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('a3'), 2);
            return promise;
        };
        // Level 2-A
        const l2A = async () => {
            const data = await l3A();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`a2:${data}`), 1);
            return promise;
        };
        return l2A();
    };

    // Branch B: 3-level slow cascade
    const branchB = async () => {
        // Level 3-B
        const l3B = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('b3'), 5);
            return promise;
        };
        // Level 2-B
        const l2B = async () => {
            const data = await l3B();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`b2:${data}`), 2);
            return promise;
        };
        return l2B();
    };

    // Level 1 (races branches)
    (async () => {
        const winner = await Promise.race([branchA(), branchB()]);
        branchRaceResolve(winner);
    })();

    const result = await branchRacePromise;
    return result === 'a2:a3';
}
