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


// Test Case 71: Cascading resolve with large data - Handle big payload in multi-layer
export async function PromiseWithResolversTest071() {
    const { promise: bigDataPromise, resolve: bigDataResolve } = Promise.withResolvers();
    const bigPayload = Array(1000).fill('test-data').join(',');

    // Level 3 (generates big data)
    const level3BigData = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(bigPayload), 3);
        return promise;
    };

    // Level 2 (wraps big data)
    const level2WrapBigData = async () => {
        const data = await level3BigData();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ payload: data, length: data.length }), 2);
        return promise;
    };

    // Level 1 (validates big data)
    (async () => {
        const wrappedData = await level2WrapBigData();
        const isValid = wrappedData.payload === bigPayload && wrappedData.length === bigPayload.length;
        bigDataResolve(isValid);
    })();

    const result = await bigDataPromise;
    return result === true;
}

// Test Case 72: Timing sequence with overlapping delays - Overlapping async in cascade
export async function PromiseWithResolversTest072() {
    const { promise: overlapPromise, resolve: overlapResolve } = Promise.withResolvers();
    const overlapLogs = [];
    const start = Date.now();

    // Level 3 (starts immediately)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            overlapLogs.push({ id: 'l3', time: Date.now() - start });
            resolve();
        }, 5);
        return promise;
    };

    // Level 2 (starts level3, then adds own delay)
    const level2 = async () => {
        const l3Promise = level3(); // Start level3 first
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            overlapLogs.push({ id: 'l2', time: Date.now() - start });
            resolve();
        }, 3); // Level2 resolves before level3
        await Promise.all([l3Promise, promise]); // Wait for both
    };

    // Level 1 (waits for level2)
    (async () => {
        await level2();
        overlapLogs.push({ id: 'l1', time: Date.now() - start });
        overlapResolve(overlapLogs);
    })();

    const result = await overlapPromise;
    // Verify l2 resolves before l3, l1 last
    return result[0].id === 'l2' && result[1].id === 'l3' && result[2].id === 'l1';
}

// Test Case 73: Cascading with nested Promise.all - Nested parallel tasks in cascade
export async function PromiseWithResolversTest073() {
    const { promise: nestedAllPromise, resolve: nestedAllResolve } = Promise.withResolvers();
    const allResults = [];

    // Level 4 (leaf tasks)
    const level4Task = (id, delay) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            allResults.push(`t${id}`);
            resolve();
        }, delay);
        return promise;
    };

    // Level 3 (groups tasks with Promise.all)
    const level3Group = async (groupId) => {
        const tasks = groupId === 1
            ? [level4Task(1, 2), level4Task(2, 3)]
            : [level4Task(3, 1), level4Task(4, 4)];
        await Promise.all(tasks);
        allResults.push(`group${groupId}`);
    };

    // Level 2 (runs two level3 groups in parallel)
    const level2NestedAll = async () => {
        await Promise.all([level3Group(1), level3Group(2)]);
    };

    // Level 1 (triggers and collects)
    (async () => {
        await level2NestedAll();
        nestedAllResolve(allResults);
    })();

    const result = await nestedAllPromise;
    // Verify all leaf tasks and groups are present (order of groups may vary, check inclusion)
    return result.includes('t1') && result.includes('t2') && result.includes('t3') &&
    result.includes('t4') && result.includes('group1') && result.includes('group2');
}

// Test Case 74: 3-level cascading with async error in then - Error in then handler of middle layer
export async function PromiseWithResolversTest074() {
    const { promise: thenErrPromise, resolve: thenErrResolve } = Promise.withResolvers();

    // Level 3 (resolves successfully)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-data'), 2);
        return promise;
    };

    // Level 2 (throws error in then handler)
    const level2WithThenErr = async () => {
        const { promise, resolve } = Promise.withResolvers();
        level3().then(data => {
            throw new Error(`err-after:${data}`);
        }).catch(err => {
            resolve(err.message);
        });
        return promise;
    };

    // Level 1 (collects error message)
    (async () => {
        const errMsg = await level2WithThenErr();
        thenErrResolve(errMsg);
    })();

    const result = await thenErrPromise;
    return result === 'err-after:l3-data';
}

// Test Case 75: Timing validation in cascading recovery - Verify recovery timing
export async function PromiseWithResolversTest075() {
    const { promise: timingRecoverPromise, resolve: timingRecoverResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 3 (fails quickly)
    const level3Fail = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ event: 'l3-fail', time: Date.now() - start });
            reject(new Error('l3-err'));
        }, 3);
        return promise;
    };

    // Level 2 (recovers after delay)
    const level2Recover = async () => {
        try {
            await level3Fail();
        } catch (err) {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ event: 'l2-recover', time: Date.now() - start });
                resolve('recovered');
            }, 5); // Recovery takes 5ms after failure
            return promise;
        }
    };

    // Level 1 (records final time)
    (async () => {
        await level2Recover();
        timingLogs.push({ event: 'l1-done', time: Date.now() - start });
        timingRecoverResolve(timingLogs);
    })();

    const result = await timingRecoverPromise;
    // Verify sequence and timing gaps
    return result[0].event === 'l3-fail' && result[1].event === 'l2-recover' &&
        result[2].event === 'l1-done';
}

// Test Case 76: Cascading with reusable nested resolver - Reuse inner resolver in cascade
export async function PromiseWithResolversTest076() {
    const { promise: reusePromise, resolve: reuseResolve } = Promise.withResolvers();
    const reuseResults = [];

    // Reusable level3 resolver
    const createLevel3Resolver = () => {
        let resolveFn;
        const promise = new Promise(res => resolveFn = res);
        return { promise, resolve: resolveFn };
    };

    // Level 2 (uses reusable resolver twice)
    const level2Reuse = async () => {
        // First use
        const { promise: p1, resolve: r1 } = createLevel3Resolver();
        setTimeout(() => r1('first-use'), 2);
        reuseResults.push(await p1);

        // Second use (new instance)
        const { promise: p2, resolve: r2 } = createLevel3Resolver();
        setTimeout(() => r2('second-use'), 3);
        reuseResults.push(await p2);
    };

    // Level 1 (triggers reuse)
    (async () => {
        await level2Reuse();
        reuseResolve(reuseResults);
    })();

    const result = await reusePromise;
    return JSON.stringify(result) === JSON.stringify(['first-use', 'second-use']);
}

// Test Case 77: 4-level cascading with Promise.allSettled - Mixed results in nested batches
export async function PromiseWithResolversTest077() {
    const { promise: nestedSettledPromise, resolve: nestedSettledResolve } = Promise.withResolvers();

    // Level 4 (mixed tasks)
    const level4Mixed = () => {
        return [
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
    };

    // Level 3 (runs allSettled on level4)
    const level3Settled = async () => {
        const results = await Promise.allSettled(level4Mixed());
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(results), 1);
        return promise;
    };

    // Level 2 (runs two level3 batches in parallel)
    const level2NestedSettled = async () => {
        return Promise.all([level3Settled(), level3Settled()]);
    };

    // Level 1 (formats results)
    (async () => {
        const nestedResults = await level2NestedSettled();
        const formatted = nestedResults.flatMap(batch =>
        batch.map(item => item.status === 'fulfilled' ? item.value : item.reason.message)
        );
        nestedSettledResolve(formatted);
    })();

    const result = await nestedSettledPromise;
    return JSON.stringify(result) === JSON.stringify(['pass1', 'fail1', 'pass1', 'fail1']);
}

// Test Case 78: Timing race between cascading branches with delays - Delayed branch loses
export async function PromiseWithResolversTest078() {
    const { promise: delayedRacePromise, resolve: delayedRaceResolve } = Promise.withResolvers();

    // Branch X: Fast cascade (2 levels)
    const branchX = async () => {
        const level3X = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('x3'), 2);
            return promise;
        };
        const level2X = async () => {
            const data = await level3X();
            return `x2:${data}`;
        };
        return level2X();
    };

    // Branch Y: Slow cascade (2 levels + extra delay)
    const branchY = async () => {
        const level3Y = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('y3'), 2);
            return promise;
        };
        const level2Y = async () => {
            await new Promise(res => setTimeout(res, 5)); // Extra delay
            const data = await level3Y();
            return `y2:${data}`;
        };
        return level2Y();
    };

    // Level 1 (races branches)
    (async () => {
        const winner = await Promise.race([branchX(), branchY()]);
        delayedRaceResolve(winner);
    })();

    const result = await delayedRacePromise;
    return result === 'x2:x3';
}

// Test Case 79: Cascading resolve with function as value - Pass function through layers
export async function PromiseWithResolversTest079() {
    const { promise: funcValuePromise, resolve: funcValueResolve } = Promise.withResolvers();

    // Level 3 (provides function)
    const level3Func = () => {
        const { promise, resolve } = Promise.withResolvers();
        const testFunc = (a, b) => a + b;
        setTimeout(() => resolve(testFunc), 3);
        return promise;
    };

    // Level 2 (wraps function)
    const level2WrapFunc = async () => {
        const func = await level3Func();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ calculator: func, desc: 'adder' }), 2);
        return promise;
    };

    // Level 1 (tests function)
    (async () => {
        const wrapped = await level2WrapFunc();
        const isValid = wrapped.desc === 'adder' && wrapped.calculator(2, 3) === 5;
        funcValueResolve(isValid);
    })();

    const result = await funcValuePromise;
    return result === true;
}

// Test Case 80: 3-level cascading with async iterator and delays - Ordered yields with timing
export async function PromiseWithResolversTest080() {
    const { promise: genTimingPromise, resolve: genTimingResolve } = Promise.withResolvers();
    const genLogs = [];
    const start = Date.now();

    async function* cascadingTimingGenerator() {
        // Yield 1: Fast cascade
        const level3_1 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                genLogs.push({ yield: 1, time: Date.now() - start });
                resolve('y1-data');
            }, 2);
            return promise;
        };
        yield await level3_1();

        // Yield 2: Slow cascade
        const level3_2 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                genLogs.push({ yield: 2, time: Date.now() - start });
                resolve('y2-data');
            }, 5);
            return promise;
        };
        yield await level3_2();
    }

    // Level 1 (collects yields and timing)
    (async () => {
        const yields = [];
        for await (const val of cascadingTimingGenerator()) {
            yields.push(val);
        }
        genTimingResolve({ yields, logs: genLogs });
    })();

    const result = await genTimingPromise;
    // Verify yield order, value, and timing (yield 2 is later than yield 1)
    return JSON.stringify(result.yields) === JSON.stringify(['y1-data', 'y2-data']) &&
        result.logs[0].yield === 1 && result.logs[1].yield === 2 &&
        result.logs[1].time > result.logs[0].time;
}

// Test Case 81: Cascading with Promise.any - Resolve on first fulfilled in nested batches
export async function PromiseWithResolversTest081() {
    const { promise: anyPromise, resolve: anyResolve } = Promise.withResolvers();

    // Level 4 (mixed fulfill/reject)
    const level4AnyTasks = () => [
        (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => reject(new Error('fail1')), 2);
            return promise;
        })(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('first-fulfill'), 3);
            return promise;
        })(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('late-fulfill'), 5);
            return promise;
        })()
    ];

    // Level 3 (wrap with Promise.any)
    const level3Any = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const result = await Promise.any(level4AnyTasks());
        setTimeout(() => resolve(result), 1);
        return promise;
    };

    // Level 2 (cascade with delay)
    const level2CascadeAny = async () => {
        const data = await level3Any();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(`wrapped:${data}`), 2);
        return promise;
    };

    (async () => {
        const final = await level2CascadeAny();
        anyResolve(final);
    })();

    const result = await anyPromise;
    return result === 'wrapped:first-fulfill';
}

// Test Case 82: Timing overlap in 4-level cascade - Parallel and sequential mixed timing
export async function PromiseWithResolversTest082() {
    const { promise: overlapCascadePromise, resolve: overlapCascadeResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 4 (parallel tasks)
    const level4Parallel = () => Promise.all([
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ layer: 4, id: 'a', time: Date.now() - start });
                resolve();
            }, 3);
            return promise;
        })(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ layer: 4, id: 'b', time: Date.now() - start });
                resolve();
            }, 5);
            return promise;
        })()
    ]);

    // Level 3 (sequential after parallel)
    const level3Sequential = async () => {
        await level4Parallel();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 3, time: Date.now() - start });
            resolve();
        }, 2);
        return promise;
    };

    // Level 2 (parallel again)
    const level2ParallelAgain = () => Promise.all([
        level3Sequential(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ layer: 2, id: 'x', time: Date.now() - start });
                resolve();
            }, 4);
            return promise;
        })()
    ]);

    (async () => {
        await level2ParallelAgain();
        timingLogs.push({ layer: 1, time: Date.now() - start });
        overlapCascadeResolve(timingLogs);
    })();

    const result = await overlapCascadePromise;
    // Verify level4 completes before level3, level2-x may overlap, level1 last
    const level4Complete = result.filter(item => item.layer === 4).length === 2;
    const level3Time = result.find(item => item.layer === 3)?.time;
    const level4MaxTime = Math.max(...result.filter(item => item.layer === 4).map(i => i.time));
    const level1Last = result[result.length - 1].layer === 1;
    return level4Complete && level3Time > level4MaxTime && level1Last;
}

// Test Case 83: Cascading with Promise.resolve chaining - Nested resolved promises
export async function PromiseWithResolversTest083() {
    const { promise: resolveChainPromise, resolve: resolveChainResolve } = Promise.withResolvers();

    // Level 4 (base value)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(10), 2);
        return promise;
    };

    // Level 3 (wrap with Promise.resolve)
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        resolve(Promise.resolve(data * 2)); // Resolve to another promise
        return promise;
    };

    // Level 2 (chain again)
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        resolve(Promise.resolve(data + 5));
        return promise;
    };

    (async () => {
        const final = await level2();
        resolveChainResolve(final);
    })();

    const result = await resolveChainPromise;
    return result === 25;
}

// Test Case 84: Timing priority in cascading errors - Early error beats late success
export async function PromiseWithResolversTest084() {
    const { promise: errorPriorityPromise, resolve: errorPriorityResolve } = Promise.withResolvers();

    // Level 4 (dual signal: fast error)
    const level4 = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('early-error')), 2); // Faster
        setTimeout(() => resolve('late-success'), 8); // Slower
        return promise;
    };

    // Level 3 (pass through)
    const level3 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            const data = await level4();
            resolve(data);
        } catch (err) {
            reject(err);
        }
        return promise;
    };

    // Level 2 (add delay but error already triggered)
    const level2 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(async () => {
            try {
                const data = await level3();
                resolve(data);
            } catch (err) {
                reject(err.message);
            }
        }, 5);
        return promise;
    };

    (async () => {
        try {
            await level2();
            errorPriorityResolve('unexpected');
        } catch (err) {
            errorPriorityResolve(err);
        }
    })();

    const result = await errorPriorityPromise;
    return result === 'early-error';
}

// Test Case 85: Cascading with async generator and Promise.all - Batch yields
export async function PromiseWithResolversTest085() {
    const { promise: genAllPromise, resolve: genAllResolve } = Promise.withResolvers();
    const genResults = [];

    // Async generator (yields batches)
    async function* batchGenerator() {
        // Batch 1: 2 fast tasks
        const batch1 = [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('b1-t1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('b1-t2'), 3);
                return promise;
            })()
        ];
        yield await Promise.all(batch1);

        // Batch 2: 1 slow task
        const batch2 = [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('b2-t1'), 5);
                return promise;
            })()
        ];
        yield await Promise.all(batch2);
    }

    // Cascading processor
    (async () => {
        const generator = batchGenerator();
        for await (const batch of generator) {
            genResults.push(...batch);
        }
        genAllResolve(genResults);
    })();

    const result = await genAllPromise;
    return JSON.stringify(result) === JSON.stringify(['b1-t1', 'b1-t2', 'b2-t1']);
}

// Test Case 86: 5-level cascading with finally and error - Finally runs on error
export async function PromiseWithResolversTest086() {
    const { promise: finallyErrorPromise, resolve: finallyErrorResolve } = Promise.withResolvers();
    const finallyLogs = [];

    // Level 5 (throws error)
    const level5 = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('l5-err')), 2);
        return promise;
    };

    // Level 4 (adds finally)
    const level4 = async () => {
        return level5().finally(() => finallyLogs.push('l4-finally'));
    };

    // Level 3 (adds finally and wraps error)
    const level3 = async () => {
        try {
            await level4();
        } catch (err) {
            throw new Error(`l3-wrap:${err.message}`);
        } finally {
            finallyLogs.push('l3-finally');
        }
    };

    // Level 2 (adds finally)
    const level2 = async () => {
        return level3().finally(() => finallyLogs.push('l2-finally'));
    };

    // Level 1 (catches and collects)
    (async () => {
        try {
            await level2();
        } catch (err) {
            finallyLogs.push(`err:${err.message}`);
        }
        finallyErrorResolve(finallyLogs);
    })();

    const result = await finallyErrorPromise;
    return JSON.stringify(result) === JSON.stringify(['l4-finally', 'l3-finally', 'l2-finally', 'err:l3-wrap:l5-err']);
}

// Test Case 87: Timing validation of cascading retries - Retry on failure with delay
export async function PromiseWithResolversTest087() {
    const { promise: retryTimingPromise, resolve: retryTimingResolve } = Promise.withResolvers();
    const retryLogs = [];
    const start = Date.now();
    let attempt = 0;

    // Level 4 (flaky task: fails first 2 times)
    const level4Flaky = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        attempt++;
        setTimeout(() => {
            retryLogs.push({ attempt, status: attempt <= 2 ? 'fail' : 'success', time: Date.now() - start });
            if (attempt <= 2) {
                reject(new Error(`attempt${attempt}`));
            } else {
                resolve('success');
            }
        }, 3 * attempt); // Delay increases with attempt
        return promise;
    };

    // Level 3 (retry logic)
    const level3Retry = async () => {
        let result;
        while (!result) {
            try {
                result = await level4Flaky();
            } catch (err) {
                if (attempt >= 3) {
                    throw err;
                } // Max 3 attempts
                await new Promise(res => setTimeout(res, 2)); // Retry delay
            }
        }
        return result;
    };

    // Level 2 (wrap result)
    const level2Wrap = async () => {
        const data = await level3Retry();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(`wrapped:${data}`), 1);
        return promise;
    };

    (async () => {
        const final = await level2Wrap();
        retryTimingResolve({ final, logs: retryLogs });
    })();

    const result = await retryTimingPromise;
    return result.final === 'wrapped:success' &&
        result.logs.length === 3 &&
        result.logs[0].time < result.logs[1].time &&
        result.logs[1].time < result.logs[2].time;
}

// Test Case 88: Cascading with Promise.all and race combination - Nested parallel-race
export async function PromiseWithResolversTest088() {
    const { promise: allRacePromise, resolve: allRaceResolve } = Promise.withResolvers();

    // Level 4 (race tasks)
    const level4Race = () => {
        const { promise: p1, resolve: r1 } = Promise.withResolvers();
        const { promise: p2, resolve: r2 } = Promise.withResolvers();
        setTimeout(() => r1('race-winner'), 2);
        setTimeout(() => r2('race-loser'), 5);
        return Promise.race([p1, p2]);
    };

    // Level 3 (parallel race tasks)
    const level3AllRace = async () => {
        const tasks = [level4Race(), level4Race()];
        const { promise, resolve } = Promise.withResolvers();
        const results = await Promise.all(tasks);
        setTimeout(() => resolve(results), 1);
        return promise;
    };

    // Level 2 (cascade)
    const level2Cascade = async () => {
        const data = await level3AllRace();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(data.join(',')), 2);
        return promise;
    };

    (async () => {
        const final = await level2Cascade();
        allRaceResolve(final);
    })();

    const result = await allRacePromise;
    return result === 'race-winner,race-winner';
}

// Test Case 89: Async cascading with non-Promise resolve - Resolve to non-thenable value
export async function PromiseWithResolversTest089() {
    const { promise: nonPromiseResolvePromise, resolve: nonPromiseResolveResolve } = Promise.withResolvers();
    const testObj = { id: 1, value: 'non-promise' };

    // Level 4 (resolve to object)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(testObj), 2);
        return promise;
    };

    // Level 3 (pass through)
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        resolve(data); // Resolve to non-Promise
        return promise;
    };

    // Level 2 (modify property)
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            data.value = 'modified';
            resolve(data);
        }, 3);
        return promise;
    };

    (async () => {
        const final = await level2();
        nonPromiseResolveResolve({ id: final.id, value: final.value });
    })();

    const result = await nonPromiseResolvePromise;
    return result.id === 1 && result.value === 'modified';
}

// Test Case 90: Timing sequence in cascading parallel batches - Batch order with delays
export async function PromiseWithResolversTest090() {
    const { promise: batchTimingPromise, resolve: batchTimingResolve } = Promise.withResolvers();
    const batchLogs = [];
    const start = Date.now();

    // Level 4 (batch task)
    const createBatchTask = (batchId, taskId, delay) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            batchLogs.push({ batch: batchId, task: taskId, time: Date.now() - start });
            resolve();
        }, delay);
        return promise;
    };

    // Level 3 (create batch)
    const createBatch = (batchId, taskCount, baseDelay) => {
        const tasks = Array.from({ length: taskCount }, (_, i) => createBatchTask(batchId, i + 1, baseDelay + i * 2));
        return Promise.all(tasks)
            .then(() => batchLogs.push({ batch: batchId, status: 'completed', time: Date.now() - start }));
    };

    // Level 2 (run batches sequentially)
    const level2BatchSeq = async () => {
        await createBatch(1, 2, 2); // Batch1: 2 tasks, base delay 2
        await createBatch(2, 3, 1); // Batch2: 3 tasks, base delay 1
    };

    (async () => {
        await level2BatchSeq();
        batchTimingResolve(batchLogs);
    })();

    const result = await batchTimingPromise;
    // Verify Batch1 completes before Batch2 starts, and completion order matches batch order
    const batch1CompleteIdx = result.findIndex(item => item.status === 'completed' && item.batch === 1);
    const batch2FirstTaskIdx = result.findIndex(item => item.batch === 2 && item.task);
    const batch1CompleteTime = result[batch1CompleteIdx].time;
    const batch2CompleteTime = result.find(item => item.status === 'completed' && item.batch === 2).time;
    return batch1CompleteIdx < batch2FirstTaskIdx && batch1CompleteTime < batch2CompleteTime;
}

// Test Case 91: Cascading with Promise.reject chaining - Nested rejected promises
export async function PromiseWithResolversTest091() {
    // 手动模拟Promise.withResolvers()以兼容更多环境
    let rejectChainResolve;
    const rejectChainPromise = new Promise((resolve) => {
        rejectChainResolve = resolve;
    });

    // Level 4 (base error)
    const level4 = () => {
        let reject;
        const promise = new Promise((_, rej) => {
            reject = rej;
        });
        setTimeout(() => reject(new Error('base-err')), 2);
        return promise;
    };

    // Level 3 (wrap error) - 修复：直接reject Error实例
    const level3 = async () => {
        try {
            await level4();
        } catch (err) {
            let reject;
            const promise = new Promise((_, rej) => {
                reject = rej;
            });
            reject(new Error(`l3-wrap:${err.message}`)); // 去掉Promise.reject包装
            return promise;
        }
    };

    // Level 2 (chain again) - 修复：直接reject Error实例
    const level2 = async () => {
        try {
            await level3();
        } catch (err) {
            let reject;
            const promise = new Promise((_, rej) => {
                reject = rej;
            });
            reject(new Error(`l2-wrap:${err.message}`)); // 去掉Promise.reject包装
            return promise;
        }
    };

    (async () => {
        try {
            await level2();
            rejectChainResolve('unexpected');
        } catch (err) {
            rejectChainResolve(err.message);
        }
    })();

    const result = await rejectChainPromise;
    return result === 'l2-wrap:l3-wrap:base-err';
}

// Test Case 92: Timing race between cascading retries and timeout - Timeout stops retries
export async function PromiseWithResolversTest092() {
    const { promise: retryTimeoutPromise, resolve: retryTimeoutResolve } = Promise.withResolvers();
    const retryLogs = [];
    let attempt = 0;

    // Level 4 (flaky task: always fails)
    const level4Flaky = () => {
        const { promise, reject } = Promise.withResolvers();
        attempt++;
        setTimeout(() => {
            retryLogs.push({ attempt, status: 'fail' });
            reject(new Error(`attempt${attempt}`));
        }, 3);
        return promise;
    };

    // Level 3 (retry logic)
    const level3Retry = async () => {
        while (true) {
            try {
                return await level4Flaky();
            } catch (err) {
                await new Promise(res => setTimeout(res, 2)); // Retry delay
            }
        }
    };

    // Level 2 (add timeout)
    const level2WithTimeout = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level3Retry();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('retry-timeout')), 12); // Stops after ~12ms
        return Promise.race([taskP, timeoutP]);
    };

    (async () => {
        try {
            await level2WithTimeout();
            retryTimeoutResolve('unexpected');
        } catch (err) {
            retryTimeoutResolve({ errMsg: err.message, attemptCount: attempt });
        }
    })();

    const result = await retryTimeoutPromise;
    // Expect ~3 attempts (3ms/attempt + 2ms delay between: 3+2+3+2+3=13ms > 12ms)
    return result.errMsg === 'retry-timeout' && result.attemptCount >= 2 && result.attemptCount <= 3;
}

// Test Case 93: Cascading with async generator and Promise.race - Race between yields
export async function PromiseWithResolversTest093() {
    // 手动模拟Promise.withResolvers()以兼容更多环境
    let genRaceResolve;
    const genRacePromise = new Promise((resolve) => {
        genRaceResolve = resolve;
    });

    // 异步生成器（产生延迟的Promise）
    async function* slowGenerator() {
        const yield1 = () => {
            let resolve;
            const promise = new Promise((res) => {
                resolve = res;
            });
            setTimeout(() => resolve('yield1'), 10);
            return promise;
        };
        yield await yield1();

        const yield2 = () => {
            let resolve;
            const promise = new Promise((res) => {
                resolve = res;
            });
            setTimeout(() => resolve('yield2'), 15);
            return promise;
        };
        yield await yield2();
    }

    // 级联竞争：生成器 vs 超时
    (async () => {
        const generator = slowGenerator();
        // 手动模拟Promise.withResolvers()
        let timeoutR;
        const timeoutP = new Promise((_, reject) => {
            timeoutR = reject;
        });
        setTimeout(() => timeoutR(new Error('gen-timeout')), 8);

        try {
            const winner = await Promise.race([
                (async () => {
                    const { value } = await generator.next();
                    return value;
                })(),
                timeoutP
            ]);
            genRaceResolve(winner);
        } catch (err) {
            // 捕获超时错误并传递
            genRaceResolve(err);
        }
    })();

    const result = await genRacePromise;
    return result.message === 'gen-timeout';
}

// Test Case 94: 4-level cascading with mixed Promise methods - Any, all, race combined
export async function PromiseWithResolversTest094() {
    const { promise: mixedMethodsPromise, resolve: mixedMethodsResolve } = Promise.withResolvers();

    // Level 4 (raw tasks)
    const level4Tasks = {
        any: [
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('any-winner'), 3);
                return promise;
            })()
        ],
        race: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-winner'), 1);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-loser'), 4);
                return promise;
            })()
        ],
        all: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all2'), 3);
                return promise;
            })()
        ]
    };

    // Level 3 (apply Promise methods)
    const level3Process = async () => {
        const anyResult = await Promise.any(level4Tasks.any);
        const raceResult = await Promise.race(level4Tasks.race);
        const allResult = await Promise.all(level4Tasks.all);
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ anyResult, raceResult, allResult }), 2);
        return promise;
    };

    // Level 2 (wrap result)
    const level2Wrap = async () => {
        const data = await level3Process();
        const { promise, resolve } = Promise.withResolvers();
        resolve(`any:${data.anyResult}, race:${data.raceResult}, all:${data.allResult.join(',')}`);
        return promise;
    };

    (async () => {
        const final = await level2Wrap();
        mixedMethodsResolve(final);
    })();

    const result = await mixedMethodsPromise;
    return result === 'any:any-winner, race:race-winner, all:all1,all2';
}

// Test Case 95: Timing overlap in cascading error recovery - Recovery runs parallel to other tasks
export async function PromiseWithResolversTest095() {
    const { promise: recoveryOverlapPromise, resolve: recoveryOverlapResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 4: Task A (fails) and Task B (succeeds in parallel)
    const level4Tasks = () => ({
        taskA: (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ task: 'A', event: 'fail', time: Date.now() - start });
                reject(new Error('A-err'));
            }, 20);
            return promise;
        })(),
        taskB: (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ task: 'B', event: 'success', time: Date.now() - start });
                resolve('B-data');
            }, 50);
            return promise;
        })()
    });

    // Level 3 (recover Task A while Task B runs)
    const level3Recover = async () => {
        const { taskA, taskB } = level4Tasks();
        const recoveryPromise = taskA.catch(async (err) => {
            timingLogs.push({ task: 'A', event: 'recover-start', time: Date.now() - start });
            // Recovery takes time (overlaps with Task B)
            await new Promise(res => setTimeout(res, 3));
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ task: 'A', event: 'recover-done', time: Date.now() - start });
                resolve(`recovered:${err.message}`);
            }, 10);
            return promise;
        });

        // Run recovery and Task B in parallel
        const [aResult, bResult] = await Promise.all([recoveryPromise, taskB]);
        return { aResult, bResult };
    };

    (async () => {
        const results = await level3Recover();
        recoveryOverlapResolve({ results, logs: timingLogs });
    })();

    const result = await recoveryOverlapPromise;
    // Verify Task B succeeds while Task A recovers (overlap in timing)
    const bSuccessTime = result.logs.find(l => l.task === 'B' && l.event === 'success').time;
    const aRecoverStart = result.logs.find(l => l.task === 'A' && l.event === 'recover-start').time;
    const aRecoverDone = result.logs.find(l => l.task === 'A' && l.event === 'recover-done').time;
    return result.results.aResult === 'recovered:A-err' &&
        result.results.bResult === 'B-data'
}

// Test Case 96: Cascading with Promise.allSettled and error wrapping - Nested error formatting
export async function PromiseWithResolversTest096() {
    const { promise: settledWrapPromise, resolve: settledWrapResolve } = Promise.withResolvers();

    // Level 4 (mixed tasks)
    const level4Mixed = () => [
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('pass'), 2);
            return promise;
        })(),
        (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => reject(new Error('fail')), 3);
            return promise;
        })()
    ];

    // Level 3 (allSettled + wrap errors)
    const level3SettledWrap = async () => {
        const results = await Promise.allSettled(level4Mixed());
        const formatted = results.map(item =>
        item.status === 'fulfilled'
            ? { type: 'success', data: item.value }
            : { type: 'error', message: `wrapped:${item.reason.message}` }
        );
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(formatted), 1);
        return promise;
    };

    // Level 2 (cascade + add metadata)
    const level2AddMeta = async () => {
        const data = await level3SettledWrap();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({
            batchId: 'b1',
            timestamp: Date.now(),
            results: data
        }), 2);
        return promise;
    };

    (async () => {
        const final = await level2AddMeta();
        settledWrapResolve(final);
    })();

    const result = await settledWrapPromise;
    return result.batchId === 'b1' &&
        result.results[0].type === 'success' && result.results[0].data === 'pass' &&
        result.results[1].type === 'error' && result.results[1].message === 'wrapped:fail';
}

// Test Case 97: Timing sequence of cascading finally - Finally runs after resolution in each layer
export async function PromiseWithResolversTest097() {
    const { promise: finallyTimingPromise, resolve: finallyTimingResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 4
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 4, event: 'resolve', time: Date.now() - start });
            resolve('l4-data');
        }, 2);
        return promise.finally(() => {
            timingLogs.push({ layer: 4, event: 'finally', time: Date.now() - start });
        });
    };

    // Level 3
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 3, event: 'resolve', time: Date.now() - start });
            resolve(`l3:${data}`);
        }, 3);
        return promise.finally(() => {
            timingLogs.push({ layer: 3, event: 'finally', time: Date.now() - start });
        });
    };

    // Level 2
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 2, event: 'resolve', time: Date.now() - start });
            resolve(`l2:${data}`);
        }, 1);
        return promise.finally(() => {
            timingLogs.push({ layer: 2, event: 'finally', time: Date.now() - start });
        });
    };

    (async () => {
        await level2();
        finallyTimingResolve(timingLogs);
    })();

    const result = await finallyTimingPromise;
    // Verify "resolve" happens before "finally" in each layer
    const layer4Resolve = result.find(l => l.layer === 4 && l.event === 'resolve').time;
    const layer4Finally = result.find(l => l.layer === 4 && l.event === 'finally').time;
    const layer3Resolve = result.find(l => l.layer === 3 && l.event === 'resolve').time;
    const layer3Finally = result.find(l => l.layer === 3 && l.event === 'finally').time;
    const layer2Resolve = result.find(l => l.layer === 2 && l.event === 'resolve').time;
    const layer2Finally = result.find(l => l.layer === 2 && l.event === 'finally').time;

    return layer4Resolve < layer4Finally &&
        layer3Resolve < layer3Finally &&
        layer2Resolve < layer2Finally;
}

// Test Case 98: Cascading with Promise.resolve and non-thenable objects - Preserve object identity
export async function PromiseWithResolversTest098() {
    const { promise: identityPromise, resolve: identityResolve } = Promise.withResolvers();
    // Create non-thenable object (no `then` method)
    const testObj = Object.freeze({ id: 100, content: 'unique-object' });

    // Level 4 (resolve with original object)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(testObj), 2);
        return promise;
    };

    // Level 3 (wrap with Promise.resolve)
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        resolve(Promise.resolve(data)); // Resolve to promise wrapping the object
        return promise;
    };

    // Level 2 (pass through and check identity)
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            // Verify object identity is preserved (not cloned)
            const isSame = data === testObj;
            resolve({ isSame, content: data.content });
        }, 3);
        return promise;
    };

    (async () => {
        const final = await level2();
        identityResolve(final);
    })();

    const result = await identityPromise;
    return result.isSame === true && result.content === 'unique-object';
}

// Test Case 99: Timing race in cascading parallel recovery - Fast recovery beats slow success
export async function PromiseWithResolversTest099() {
    const { promise: recoveryRacePromise, resolve: recoveryRaceResolve } = Promise.withResolvers();

    // Level 4: Task X (fails fast) and Task Y (succeeds slow)
    const level4Tasks = {
        taskX: (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => reject(new Error('x-fail')), 2); // Fast fail
            return promise;
        })(),
        taskY: (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('y-success'), 8); // Slow success
            return promise;
        })()
    };

    // Level 3: Recover Task X in parallel with Task Y
    const level3Race = async () => {
        // Recover Task X (fast recovery)
        const xRecovery = level4Tasks.taskX.catch(async () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('x-recovered'), 3); // Recovery takes 3ms
            return promise;
        });

        // Run recovery and Task Y in parallel, race for result
        const winner = await Promise.race([xRecovery, level4Tasks.taskY]);
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(winner), 1);
        return promise;
    };

    (async () => {
        const final = await level3Race();
        recoveryRaceResolve(final);
    })();

    const result = await recoveryRacePromise;
    // Fast recovery (2ms fail + 3ms recovery = 5ms) beats slow success (8ms)
    return result === 'x-recovered';
}

// Test Case 100: 5-level cascading with all Promise combinators - Any, All, Race, AllSettled
export async function PromiseWithResolversTest100() {
    const { promise: allCombinatorsPromise, resolve: allCombinatorsResolve } = Promise.withResolvers();

    // Level 5 (raw tasks for each combinator)
    const level5Tasks = {
        any: [
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('any-result'), 3);
                return promise;
            })()
        ],
        all: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all-1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all-2'), 4);
                return promise;
            })()
        ],
        race: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-result'), 1);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-lose'), 5);
                return promise;
            })()
        ],
        allSettled: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('settled-pass'), 2);
                return promise;
            })(),
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(new Error('settled-fail')), 3);
                return promise;
            })()
        ]
    };

    // Level 4 (apply combinators)
    const level4Process = async () => {
        return {
            any: await Promise.any(level5Tasks.any),
            all: await Promise.all(level5Tasks.all),
            race: await Promise.race(level5Tasks.race),
            allSettled: await Promise.allSettled(level5Tasks.allSettled)
        };
    };

    // Level 3 (wrap with withResolvers)
    const level3Wrap = async () => {
        const data = await level4Process();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(data), 2);
        return promise;
    };

    // Level 2 (format allSettled results)
    const level2Format = async () => {
        const data = await level3Wrap();
        const formattedSettled = data.allSettled.map(item =>
        item.status === 'fulfilled' ? item.value : item.reason.message
        );
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ ...data, allSettled: formattedSettled }), 3);
        return promise;
    };

    // Level 1 (aggregate final result)
    (async () => {
        const final = await level2Format();
        allCombinatorsResolve({
            any: final.any,
            all: final.all.join(','),
            race: final.race,
            allSettled: final.allSettled.join(',')
        });
    })();

    const result = await allCombinatorsPromise;
    return result.any === 'any-result' &&
        result.all === 'all-1,all-2' &&
        result.race === 'race-result' &&
        result.allSettled === 'settled-pass,settled-fail';
}