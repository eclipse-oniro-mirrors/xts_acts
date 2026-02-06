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

export const invalidPromiseCall = () => {
    // 显式类型转换模拟错误调用，聚焦运行时错误捕获
    Promise((resolve) => resolve());
};

export const errorMessage20 = 'thenable error occurred';
const faultyThenable = {
    then: function (onFulfilled, onRejected) {
        // Throw an error instead of calling the handlers
        throw new Error(errorMessage20);
    }
};

export const promise20 = new Promise((resolve) => {
    resolve(faultyThenable);
});

class ArrayThenable {
    then(onFulfilled) {
        return new Promise((resolve) => {
            resolve(['a', 'b', 'c']);
        }).then(onFulfilled);
    }
}


class NestedThenable30 {
    // 简化then方法实现，确保正确处理回调
    then(onfulfilled) {
        // 大幅缩短延迟时间，从50ms改为10ms
        return new Promise(resolve => {
            setTimeout(() => {
                const value = 100;
                // 确保正确调用onfulfilled回调并传播其返回值
                if (typeof onfulfilled === 'function') {
                    resolve(onfulfilled(value));
                } else {
                    resolve(value);
                }
            }, 10);
        });
    }
}

export let PromiseThenTest030 = async () => {
    const result = await Promise.resolve()
        .then(() => new NestedThenable30())
        .then(value => value + 50)  // 100 + 50 = 150
        .then(value => new Promise(resolve => resolve(value * 2))); // 150 * 2 = 300
    return result
}


export class MultiCallThenable {
    constructor() {
        this.value = 10;
    }

    then(onFulfilled) {
        this.value *= 2;
        return new Promise((resolve) => {
            resolve();
        }).then(() => {
            if (onFulfilled) {
                return onFulfilled(this.value);
            }
            return undefined;
        });
    }
}

export const promise92 = new Promise((resolve) => {
    resolve(new ArrayThenable());
}).then(items => items.map(item => item.toUpperCase()));
const createNestedPromise = (value) => {
    return new Promise((resolve) => {
        resolve(new Promise((resolve) => {
            setTimeout(() => resolve(value * 2), 10);
        }));
    });
};

export const promise77 = new Promise((resolve) => {
    resolve([
        createNestedPromise(1),
        createNestedPromise(2),
        createNestedPromise(3)
    ]);
}).then((promises) => Promise.all(promises));

class SuccessThenable {
    constructor(value) {
        this.value = value;
    }

    // 符合Promise规范的then方法实现
    then(onFulfilled, onRejected) {
        // 同步处理成功回调
        if (typeof onFulfilled === 'function') {
            const result = onFulfilled(this.value);
            // 如果回调返回值是thenable，返回它以继续链式调用
            if (result && typeof result.then === 'function') {
                return result;
            }
            // 否则返回已兑现的Promise
            return Promise.resolve(result);
        }
        // 没有成功回调时，直接返回包含当前值的Promise
        return Promise.resolve(this.value);
    }
}

// 包装器thenable，用于传递值
export class WrapperThenable84 {
    constructor(initialValue) {
        this.initialValue = initialValue;
    }

    then(onFulfilled) {
        // 创建成功的thenable并传递初始值
        return new SuccessThenable(this.initialValue).then(onFulfilled);
    }
}

class InnerThenable {
    then(onFulfilled) {
        return new Promise((resolve) => {
            resolve('inner');
        }).then(onFulfilled);
    }
}

class OuterThenable {
    then(onFulfilled) {
        return new Promise((resolve) => {
            resolve(new InnerThenable());
        }).then(onFulfilled);
    }
}

export const promise75 = new Promise((resolve) => {
    resolve(new OuterThenable());
});

class StepThenable77 {
    constructor(step, delay) {
        this.step = step;
        this.delay = delay;
    }

    then(onFulfilled) {
        return new Promise((resolve) => {
            setTimeout(() => {
                const value = this.step * 10;
                resolve(onFulfilled ? onFulfilled(value) : value);
            }, this.delay);
        });
    }
}

export const finalResult77 = async () => {
    return await Promise.resolve(new StepThenable77(1, 10))
        .then((thenable) => thenable)
        .then((v) => new StepThenable77(v / 10 + 2, 15))
        .then((thenable) => thenable)
        .then((v) => new StepThenable77(v / 10 + 3, 20))
        .then((thenable) => thenable);
}

export const DelayedRejectThenable97 = {
    then: (onFulfilled, onRejected) => {
        setTimeout(() => {
            onRejected?.('Delayed thenable rejection');
        }, 25);
    }
};
if (!Promise.withResolvers) {
    Promise.withResolvers = () => {
        let resolve, reject;
        const promise = new Promise((res, rej) => {
            resolve = res;
            reject = rej;
        });
        return { promise, resolve, reject };
    };
}

export async function PromiseCatchTest036() {
    let caughtRejectionReason = '';
    let chainCompletionStatus = 'unfinished';
    const timingLog = [];

    // Create promise via Promise.withResolvers() (ES2022+ API)
    const { promise, reject: resolverReject } = Promise.withResolvers();

    // Simulate delayed rejection (mimics async operation failure)
    setTimeout(() => {
        const rejectTime = Date.now();
        timingLog.push(`Resolver reject triggered at ${rejectTime}`);
        resolverReject('Payment gateway timeout: Failed to process transaction');
    }, 35);

    // Chain: wait for withResolvers promise → catch rejection → update status
    await promise
        .then((val) => {
            timingLog.push(`Unexpected resolve: ${val}`);
            chainCompletionStatus = 'resolved';
        })
        .catch((reason) => {
            const catchTime = Date.now();
            timingLog.push(`Catch executed at ${catchTime}`);
            caughtRejectionReason = reason;
            chainCompletionStatus = 'rejected_and_handled';
        })
        .finally(() => {
            timingLog.push('Finally block executed');
        });

    // Verify rejection capture
    if (caughtRejectionReason != 'Payment gateway timeout: Failed to process transaction' ||
        chainCompletionStatus != 'rejected_and_handled' ||
        timingLog.length != 3 || !timingLog[0].includes('Resolver reject triggered') ||
        !timingLog[1].includes('Catch executed') ||
        !timingLog[2].includes('Finally block executed')) {
        return false
    }
    return true
}

export async function PromiseCatchTest068() {
    let caughtWithResolversErr = '';

    await Promise.resolve()
        .then(() => {
            // Nested chain using Promise.withResolvers()
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => {
                reject('Rejected via nested withResolvers');
            }, 25);
            return promise;
        })
        .then((val) => `Processed: ${val}`)// Unreachable
        .catch((err) => {
            caughtWithResolversErr = err;
        });

    return caughtWithResolversErr == 'Rejected via nested withResolvers';
}

export async function PromiseCatchTest081() {
    let loadError = null;
    let fallbackImage = null;

    const loadImage = (src) => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                reject(`Failed to load image: ${src} (404 Not Found)`);
            }, 25);
        });
    };

    await loadImage('/images/nonexistent.jpg')
        .then((img) => {
            return img.src;
        })
        .catch((err) => {
            loadError = err;
            return '/images/placeholder.png';
        })
        .then((imgSrc) => {
            fallbackImage = imgSrc;
        });

    return (
        loadError === 'Failed to load image: /images/nonexistent.jpg (404 Not Found)' &&
            fallbackImage === '/images/placeholder.png'
    );
}

export async function test007() {
    let caughtErr = new Error();
    // 使用reject来传递异步错误
    const promise = new Promise((resolve, reject) => {
        setTimeout(() => {
            reject(new Error('Async error')); // 用reject代替throw
        }, 50);
    });

    await promise.catch((err) => {
        caughtErr = err;
    });

    return caughtErr?.message
}

export async function PromiseFinallyTest011() {
    let thenableExecuted = false;
    const thenable = {
        then: (resolve) => {
            setTimeout(() => {
                thenableExecuted = true;
                resolve();
            }, 30);
        }
    };

    await Promise.resolve('test')
        .finally(() => thenable);

    return thenableExecuted
}

export async function PromiseAllTest054() {

    // Create an async generator function
    function* createAsyncGenerator(count) {
        for (let i = 0; i < count; i++) {
            yield new Promise(resolve =>
            setTimeout(() => resolve(i * 2), i * 10)
            );
        }
    }

    // Convert async generator to array of promises
    const promises = [];
    for await (const p of createAsyncGenerator(3)) {
        promises.push(p);
    }

    const result = await Promise.all(promises);
    return result
}

export async function PromiseAllTest095() {

    function* createAsyncGenerator(count) {
        for (let i = 0; i < count; i++) {
            yield new Promise(resolve =>
            setTimeout(() => resolve(i * 2), i * 10)
            );
        }
    }

    // 将异步生成器转换为Promise数组
    const promises = [];
    for await (const p of createAsyncGenerator(3)) {
        promises.push(p);
    }

    const result = await Promise.all(promises);
    return result
}


export async function PromiseAllTest043() {
    const nestedThenable43 = {
        then: (onFulfilled, onRejected) => {
            return new Promise((resolve) => {
                // 10ms后触发拒绝回调
                setTimeout(() => {
                    onRejected(new Error('thenable error'));
                    resolve(); // 确保内部Promise完成
                }, 10);
            });
        }
    };
    const p1 = new Promise(async (resolve) => {
        resolve(nestedThenable43);
    }).catch((err) => {
        // 捕获错误并格式化消息
        return `caught: ${err.message}`;
    });
    return p1
}

export async function PromiseAnyTest054() {

    function* promiseGenerator() {
        yield new Promise((resolve) => setTimeout(() => resolve(1), 80));
        new Promise((resolve) => setTimeout(resolve, 10));
        yield new Promise((resolve) => setTimeout(() => resolve(2), 40));
        new Promise((resolve) => setTimeout(resolve, 10));
        yield new Promise((resolve) => setTimeout(() => resolve(3), 60));
    }

    const promises = [];
    for await (const p of promiseGenerator()) {
        promises.push(p);
    }

    const result = await Promise.any(promises);
    return result
}

export async function PromiseRaceTest020() {
    const start = Date.now();

    const p1 = new Promise(resolve => {
        const check = () => {
            const elapsed = Date.now() - start;
            if (elapsed >= 50) {
                resolve(1);
            } else {
                setTimeout(check, 5);
            }
        };
        setTimeout(check, 5);
    });

    const p2 = new Promise(resolve =>
    setTimeout(() => resolve(2), 30)
    );

    const result = await Promise.race([p1, p2]);

    return result;
}

export async function PromiseAllSettledTest026() {

    function* promiseGenerator26() {
        yield new Promise((resolve) => resolve(8));
        yield new Promise((_, reject) => reject(new Error('generator error')));
        yield 99;
    }

    const results = await Promise.allSettled(promiseGenerator26());
    const resultArray = Array.from(results);

    return (resultArray[0]).value == 8 &&
        (resultArray[1]).reason.message == 'generator error' &&
        (resultArray[2]).value == 99;
}

export async function PromiseAllSettledTest037() {

    function* asyncGenerator() {
        yield new Promise((resolve) => setTimeout(() => resolve(10), 5));
        yield Promise.reject(new Error('async gen error'));
        yield 'sync value from async gen';
    }

    const results = await Promise.allSettled(asyncGenerator());
    const resultArray = Array.from(results);
    return resultArray
}

function* nestedAsyncGen44() {
    yield Promise.allSettled([
        new Promise((resolve) => setTimeout(() => resolve(10), 5)),
        Promise.reject(new Error('gen inner fail'))
    ]);
    yield new Promise((resolve) => setTimeout(() => resolve('gen outer'), 15));
}

export async function PromiseAllSettledTest044() {
    const results = await Promise.allSettled(nestedAsyncGen44());
    const resultArray = Array.from(results);
    return resultArray
}

export async function PromiseAllSettledTest047() {

    let baseDelay = 10;

    function* timingGen() {
        yield new Promise((resolve) => setTimeout(() => {
            baseDelay *= 2;
            resolve(baseDelay);
        }, baseDelay));
        yield new Promise((resolve) => setTimeout(() => resolve(baseDelay * 2), baseDelay));
    }

    const results = await Promise.allSettled(timingGen());
    const resultArray = Array.from(results);
    return resultArray
}

export async function PromiseAllSettledTest088() {

    const timeLog = [];
    const innerSet = new Set([
        new Promise((r) => setTimeout(() => {
            timeLog.push('set1');
            r('set1');
        }, 20)),
        new Promise((r) => setTimeout(() => {
            timeLog.push('set2');
            r('set2');
        }, 10))
    ]);

    function* gen() {
        yield Promise.allSettled(innerSet);
        yield new Promise((r) => setTimeout(() => {
            timeLog.push('gen1');
            r('gen1');
        }, 15));
    }

    const outer = Promise.allSettled(gen());

    const results = await outer;
    const resArr = Array.from(results);
    const setRes = (resArr[0]).value;

    if ((Array.from(setRes)[0]).value != 'set1' ||
        (Array.from(setRes)[1]).value != 'set2' ||
        (resArr[1]).value != 'gen1') {
        return []
    }
    return timeLog
}

export async function PromiseAllSettledTest093() {

    function* genWithAny() {
        const anyPromise = Promise.any([
            Promise.reject(new Error('any-1')),
            new Promise((r) => setTimeout(() => r(20), 10)),
            Promise.reject(new Error('any-2'))
        ]);
        yield Promise.allSettled([anyPromise, Promise.resolve('gen-val')]);
        yield Promise.reject(new Error('gen-fail'));
    }

    const results = await Promise.allSettled(genWithAny());
    const resArr = Array.from(results);
    const innerRes = resArr[0].status === 'fulfilled' ? resArr[0].value : resArr[0].reason;

    return (innerRes[0].value === 20) &&
        (innerRes[1].value === 'gen-val') &&
        (resArr[1].reason.message === 'gen-fail');
}

export async function PromiseAllSettledTest092() {
    const allPromise = Promise.all([
        new Promise((r) => setTimeout(() => r('all-1'), 10)),
        new Promise((r) => setTimeout(() => r('all-2'), 15))
    ]);

    const inner = Promise.allSettled([
        allPromise,
        Promise.reject(new Error('inner-reject'))
    ]);

    const outer = Promise.all([
        Promise.allSettled([inner]),
        Promise.resolve(99)
    ]);

    const results = await outer;
    const outerRes0 = results[0];
    const innerResultObj = outerRes0[0];

    if (innerResultObj.status !== 'fulfilled') {
        throw new Error('inner promise rejected');
    }
    const innerRes = innerResultObj.value;

    return (JSON.stringify(innerRes[0].value) === JSON.stringify(['all-1', 'all-2'])) &&
        (innerRes[1].reason.message === 'inner-reject') &&
        (results[1] === 99);
}

export async function PromiseAllSettledTest041() {
    // Level 3: Contains one resolving promise and one rejecting promise
    const level3 = Promise.allSettled([
        new Promise(resolve => setTimeout(() => resolve(1), 5)),
        Promise.reject(new Error('level3 error'))
    ]);

    // Level 2: Contains level3 results and a resolving string promise
    const level2 = Promise.allSettled([
        level3,
        new Promise(resolve => setTimeout(() => resolve('level2'), 10))
    ]);

    // Level 1: Contains level2 results
    const level1 = Promise.allSettled([level2]);

    // Return promise that resolves to boolean test result
    return level1.then(results => {
        try {
            // Parse nested results with status checks
            const level2Result = results[0].status === 'fulfilled' ? results[0].value : results[0].reason;
            const level3Result =
                level2Result[0].status === 'fulfilled' ? level2Result[0].value : level2Result[0].reason;

            // Perform validations and return boolean result
            return level3Result[0].status === 'fulfilled' &&
                level3Result[1].reason.message === 'level3 error' &&
                level2Result[1].value === 'level2';
        } catch (error) {
            // Return false if any error occurs during validation
            return false;
        }
    }).catch(() => false);
}

export async function PromiseRejectTest074() {
    const timeLog = [];

    // Level 3 async generator
    function* level3() {
        yield new Promise((resolve) => setTimeout(() => {
            timeLog.push('L3-resolve(5ms)');
            resolve(10);
        }, 5));
        yield new Promise((_, reject) => setTimeout(() => {
            timeLog.push('L3-reject(15ms)');
            reject('L3-fail'); // Simplified rejection
        }, 15));
    }

    // Level 2 async generator
    function* level2() {
        yield Promise.allSettled(level3());
        yield new Promise((_, reject) => setTimeout(() => {
            timeLog.push('L2-reject(25ms)');
            reject('L2-unreachable');
        }, 25));
    }

    try {
        const gen = level2();
        const step1 = await gen.next();
        const step2 = await gen.next();
        const l3Results = await step1.value;

        // Validate results
        const validation1 = l3Results[0].status === 'fulfilled' && l3Results[0].value === 10;
        const validation2 = l3Results[1].status === 'rejected' && l3Results[1].reason === 'L3-fail';

        // Check if step2 rejects correctly
        let validation3 = false;
        try {
            await step2.value;
        } catch (err) {
            validation3 = err === 'L2-unreachable';
        }

        // Validate time log order
        const validation4 = JSON.stringify(timeLog) === JSON.stringify([
            'L3-resolve(5ms)',
            'L3-reject(15ms)',
            'L2-reject(25ms)'
        ]);

        return validation1 && validation2 && validation3 && validation4;
    } catch (error) {
        return false;
    }
}

export async function PromiseRejectTest024() {

    function* gen() {
        yield new Promise((resolve) => resolve('First'));
        yield new Promise((_, reject) => {
            reject(new Error('Gen reject'));
        });
        yield new Promise((resolve) => resolve('Unreachable'));
    }

    const generator = gen();
    // 处理第一个yield
    const step1Result = generator.next();
    const step1 = await step1Result.value;

    // 处理第二个yield，正确捕获错误
    const step2Result = generator.next();
    let step2;
    try {
        step2 = await step2Result.value;
    } catch (err) {
        step2 = { value: err, done: false };
    }

    return step1 === 'First';
}

export async function PromiseRejectTest033() {

    function* innerGen() {
        yield new Promise(resolve => setTimeout(resolve, 5, 10));
        yield new Promise((_, reject) =>
        // 修复1：移除嵌套的Promise.reject，直接reject原始值
        setTimeout(() => reject('Inner gen fail'), 10)
        );
    }

    function* outerGen() {
        yield Promise.allSettled(innerGen());
        yield new Promise((_, reject) => reject('Outer gen unreachable'));
    }

    const gen = outerGen();
    const step1 = await gen.next();
    // 修复2：等待step1.value的Promise完成，获取实际结果数组
    const innerResults = await step1.value;
    const step2 = await gen.next();

    // 修复3：添加状态检查，确保验证的是正确状态的结果
    return innerResults[0].status === 'fulfilled' &&
        innerResults[0].value === 10 &&
        innerResults[1].status === 'rejected' &&
        innerResults[1].reason === 'Inner gen fail';
}

export async function PromiseRejectTest050() {

    function* level4() {
        yield new Promise((resolve) => setTimeout(() => resolve(1), 5));
        yield new Promise((_, reject) => setTimeout(() => {
            // 修复1：直接reject原始错误信息，避免嵌套Promise.reject
            reject('L4 fail');
        }, 10));
    }

    function* level3() {
        yield Promise.allSettled(level4());
        yield new Promise((_, reject) => reject('L3 unreachable'));
    }

    function* level2() {
        yield Promise.allSettled(level3());
        yield new Promise((_, reject) => reject('L2 unreachable'));
    }

    const gen = level2();
    const step1 = await gen.next();
    // 修复2：等待step1.value的Promise完成，获取实际结果
    const l2Results = await step1.value;
    const step2 = await gen.next();

    // 修复3：正确获取各级结果的层次结构
    const l3Results = l2Results[0];
    const l4Results = await l3Results.value; // 等待level3中allSettled的结果

    // 修复4：添加状态检查，确保结果验证的严谨性
    return l4Results[0].status === 'fulfilled' &&
        l4Results[0].value === 1 &&
        l4Results[1].status === 'rejected' &&
        l4Results[1].reason === 'L4 fail';
}

export async function PromiseRejectTest063() {
    const timeLog = [];

    function* level3() {
        yield new Promise((resolve) => setTimeout(() => {
            timeLog.push('L3-resolve(5ms)');
            resolve(10);
        }, 5));
        yield new Promise((_, reject) => setTimeout(() => {
            timeLog.push('L3-reject(15ms)');
            reject('L3-fail');
        }, 15));
    }

    function* level2() {
        yield Promise.allSettled(level3());
        yield new Promise((_, reject) => setTimeout(() => {
            timeLog.push('L2-reject(25ms)');
            reject('L2-unreachable');
        }, 25));
    }

    const gen = level2();
    const step1 = await gen.next();
    const l3Results = await step1.value;

    // 修复错误处理逻辑，正确处理第二个yield返回的Promise
    try {
        const step2Result = gen.next(); // 获取包含Promise的结果对象
        await step2Result.value; // 显式等待Promise完成
    } catch (err) {
        // 现在可以正确捕获L2的拒绝
    }

    if (l3Results[0].status === 'fulfilled' &&
        l3Results[0].value === 10 &&
        l3Results[1].status === 'rejected' &&
        l3Results[1].reason === 'L3-fail') {
        return timeLog;
    }
    return [];
}

export async function PromiseRejectTest084() {
    const iterLog = [];

    function* dataGen() {
        yield new Promise((resolve) => setTimeout(() => {
            iterLog.push('Yield1-resolve(8ms)');
            resolve(10);
        }, 8));
        yield new Promise((_, reject) => setTimeout(() => {
            iterLog.push('Yield2-reject(15ms)');
            reject('Gen-err');
        }, 15));
        yield new Promise((resolve) => setTimeout(() => {
            iterLog.push('Yield3-resolve(20ms)');
            resolve(20);
        }, 20));
    }

    const gen = dataGen();
    // 正确处理第一个yield
    const step1Result = gen.next();
    const step1Value = await step1Result.value;

    // 正确处理第二个yield的错误
    const step2Result = gen.next();
    let step2Value;
    try {
        step2Value = await step2Result.value;
    } catch (err) {
        step2Value = err; // 捕获错误信息
    }

    // 处理第三个yield
    const step3Result = gen.next();

    if (step1Value === 10 &&
        step2Value === 'Gen-err' &&
        step3Result.done === false) {
        return iterLog;
    }
    return [];
}

export async function PromiseRejectTest094() {
    let rejectGen = [
        Promise.resolve(10),
        new Promise((_, reject) => reject('Gen Reject 1')),
        new Promise((resolve) => setTimeout(() => resolve(20), 10)),
        new Promise((_, reject) => setTimeout(() => reject('Gen Reject 2'), 5))
    ];

    const iterResults = [];
    // 正确处理：使用Promise.allSettled确保捕获所有状态
    for (const p of rejectGen) {
        const result = await Promise.allSettled([p]);
        iterResults.push(result);
    }

    return (iterResults.length === 4) &&
        (iterResults[0][0].status === 'fulfilled' && iterResults[0][0].value === 10) &&
        (iterResults[1][0].status === 'rejected' && iterResults[1][0].reason === 'Gen Reject 1') &&
        (iterResults[2][0].status === 'fulfilled' && iterResults[2][0].value === 20) &&
        (iterResults[3][0].status === 'rejected' && iterResults[3][0].reason === 'Gen Reject 2');
}

export async function PromiseResolveTest005() {
    const nestedThenable = {
        then(resolve) {
            resolve({
                then(resolveInner) {
                    resolveInner({
                        then(resolveDeep) {
                            resolveDeep(100);
                        }
                    });
                }
            });
        }
    };

    const promise = Promise.resolve(nestedThenable);
    const result = await promise;
    return result;
}
export async function PromiseResolveTest048() {
    const testLog = [];
    let finalResult = true;

    // 测试1: 基本值的resolve
    const test1 = Promise.resolve('test1-value')
        .then(value => {
            testLog.push(`Test1 resolved with: ${value}`);
            return value;
        });

    // 测试2: resolve另一个Promise
    const innerPromise = new Promise(resolve => {
        setTimeout(() => resolve('inner-value'), 10);
    });
    const test2 = Promise.resolve(innerPromise)
        .then(value => {
            testLog.push(`Test2 resolved with inner value: ${value}`);
            return value;
        });

    // 测试3: resolve thenable对象
    const thenable = {
        then: function(resolve) {
            setTimeout(() => resolve('thenable-value'), 15);
        }
    };
    const test3 = Promise.resolve(thenable)
        .then(value => {
            testLog.push(`Test3 resolved with thenable value: ${value}`);
            return value;
        });

    // 测试4: 链式resolve
    const test4 = Promise.resolve(10)
        .then(value => {
            testLog.push(`Test4 step1: ${value}`);
            return Promise.resolve(value * 2);
        })
        .then(value => {
            testLog.push(`Test4 step2: ${value}`);
            return value * 2;
        });

    // 等待所有测试完成
    const results = await Promise.all([test1, test2, test3, test4]);

    // 验证结果
    if (results[0] !== 'test1-value') {
        testLog.push('Test1 failed: 结果不匹配');
        finalResult = false;
    }

    if (results[1] !== 'inner-value') {
        testLog.push('Test2 failed: 结果不匹配');
        finalResult = false;
    }

    if (results[2] !== 'thenable-value') {
        testLog.push('Test3 failed: 结果不匹配');
        finalResult = false;
    }

    if (results[3] !== 40) {
        testLog.push('Test4 failed: 结果不匹配');
        finalResult = false;
    }

    testLog.push(`测试完成: ${finalResult ? '全部通过' : '存在失败'}`);
    return finalResult
}
export async function PromiseResolveTest054() {
    const timeLog = [];

    function* level4Gen() {
        // 移除多余的Promise.resolve嵌套
        yield new Promise(resolve => setTimeout(() => {
            timeLog.push('L4: 5ms');
            resolve(1);
        }, 5));
    }

    function* level3Gen() {
        // 移除多余的Promise.resolve
        yield Promise.allSettled(level4Gen());
        // 移除多余的Promise.resolve嵌套
        yield new Promise(resolve => setTimeout(() => {
            timeLog.push('L3: 10ms');
            resolve(2);
        }, 10));
    }

    function* level2Gen() {
        // 移除多余的Promise.resolve嵌套
        yield Promise.allSettled(level3Gen());
        // 移除多余的Promise.resolve嵌套
        yield new Promise(resolve => setTimeout(() => {
            timeLog.push('L2: 15ms');
            resolve(3);
        }, 15));
    }

    const results = [];
    for await (const p of level2Gen()) {
        results.push(await p);
    }

    // 简化类型解析，适配JavaScript
    const l3Results = results[0];
    const l3FirstResult = l3Results[0];
    const l4Results = l3FirstResult.value;
    const l4FirstResult = l4Results[0];

    // 验证条件
    if (l4FirstResult.value === 1 && results[1] === 3) {
        return timeLog;
    }
    return [];
}










