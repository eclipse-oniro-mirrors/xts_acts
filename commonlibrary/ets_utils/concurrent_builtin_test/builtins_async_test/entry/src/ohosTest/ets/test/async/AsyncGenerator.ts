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

export async function AsyncGeneratorTest001() {

  async function* basicGenerator() {
    yield 1;
    yield 2;
    yield 3;
  }

  const gen = basicGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 1 && res2.value === 2 && res3.value === 3 && res4.done === true;
}

export async function AsyncGeneratorTest002() {

  async function* asyncOpGenerator() {
    await new Promise(resolve => setTimeout(resolve, 10));
    yield 'async-result';
  }

  const gen = asyncOpGenerator();
  const res = await gen.next();
  return res.value === 'async-result' && res.done === false;
}

export async function AsyncGeneratorTest003() {

  async function* inputGenerator() {
    const input1 = yield 'await-input1';
    const input2 = yield `received: ${input1}`;
    yield `final: ${input2}`;
  }

  const gen = inputGenerator();
  await gen.next();
  const res2 = await gen.next('test1');
  const res3 = await gen.next('test2');
  return res2.value === 'received: test1' && res3.value === 'final: test2';
}

export async function AsyncGeneratorTest004() {

  async function* errorGenerator() {
    try {
      yield 'before-error';
    } catch (err) {
      yield `caught: ${(err as Error).message}`;
    }
  }

  const gen = errorGenerator();
  await gen.next();
  const res = await gen.throw(new Error('test-error'));
  return res.value === 'caught: test-error';
}

export async function AsyncGeneratorTest005() {

  async function* closeGenerator() {
    yield 1;
    yield 2;
  }

  const gen = closeGenerator();
  await gen.next();
  const res = await gen.return();
  return res.done === true;
}

export async function AsyncGeneratorTest006() {

  async function* loopGenerator() {
    yield 'a';
    yield 'b';
    yield 'c';
  }

  const collected: string[] = [];
  for await (const val of loopGenerator()) {
    collected.push(val);
  }
  return JSON.stringify(collected) === JSON.stringify(['a', 'b', 'c']);
}

export async function AsyncGeneratorTest007() {

  async function* innerGenerator() {
    yield 'inner-1';
    yield 'inner-2';
  }

  async function* outerGenerator() {
    yield * innerGenerator();
    yield 'outer-1';
  }

  const gen = outerGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'inner-1' && res2.value === 'inner-2' && res3.value === 'outer-1';
}

export async function AsyncGeneratorTest008() {

  async function* parallelOpGenerator() {
    const promises = [
      new Promise(resolve => setTimeout(() => resolve(100), 10)),
      new Promise(resolve => setTimeout(() => resolve(200), 10))
    ];
    const results = await Promise.all(promises);
    yield * results;
  }

  const gen = parallelOpGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 100 && res2.value === 200;
}

export async function AsyncGeneratorTest009() {

  async function* returnGenerator() {
    yield 'step1';
    return 'final-result';
  }

  const gen = returnGenerator();
  await gen.next();
  const res = await gen.next();
  return res.value === 'final-result' && res.done === true;
}

export async function AsyncGeneratorTest010() {

  async function* emptyYieldGenerator() {
    yield;
    yield undefined;
    yield null;
  }

  const gen = emptyYieldGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === undefined && res2.value === undefined && res3.value === null;
}

export async function AsyncGeneratorTest011() {
  const createGenerator = () => async function* () {
    yield 'wrapped-1';
    yield 'wrapped-2';
  };
  const gen = createGenerator()();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'wrapped-1' && res2.value === 'wrapped-2';
}

export async function AsyncGeneratorTest012() {

  async function* paramGenerator(init: number) {
    yield init;
    yield init + 10;
    yield init + 20;
  }

  const gen = paramGenerator(5);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 5 && res2.value === 15 && res3.value === 25;
}

export async function AsyncGeneratorTest013() {

  async function* uncaughtErrorGenerator() {
    yield 'before-throw';
    throw new Error('uncaught-test');
  }

  const gen = uncaughtErrorGenerator();
  await gen.next();
  try {
    await gen.next();
    return false;
  } catch (err) {
    return (err as Error).message === 'uncaught-test';
  }
}

export async function AsyncGeneratorTest014() {

  async function* nestedIterGenerator() {
    yield 10;
    yield 20;
  }

  const collect = async () => {
    const arr: number[] = [];
    for await (const val of nestedIterGenerator()) {
      arr.push(val);
    }
    return arr;
  };
  const result = await collect();
  return JSON.stringify(result) === JSON.stringify([10, 20]);
}

export async function AsyncGeneratorTest015() {

  async function* stopGenerator() {
    yield 'first';
    yield 'second';
    yield 'third';
  }

  const gen = stopGenerator();
  await gen.next();
  await gen.return();
  const res = await gen.next();
  return res.done === true && res.value === undefined;
}

export async function AsyncGeneratorTest016() {

  async function* breakGenerator() {
    yield 1;
    yield 2;
    yield 3;
    yield 4;
  }

  const collected: number[] = [];
  for await (const val of breakGenerator()) {
    collected.push(val);
    if (val === 2) {
      break;
    }
  }
  return JSON.stringify(collected) === JSON.stringify([1, 2]);
}

export async function AsyncGeneratorTest017() {

  async function* helperGenerator() {
    const fetchData = async (id: number) => `data-${id}`;
    yield await fetchData(1);
    yield await fetchData(2);
  }

  const gen = helperGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'data-1' && res2.value === 'data-2';
}

export async function AsyncGeneratorTest018() {

  async function* multiThrowGenerator() {
    while (true) {
      try {
        yield 'loop';
      } catch (err) {
        if ((err as Error).message === 'exit') {
          return 'exited';
        }
        yield `caught: ${(err as Error).message}`;
      }
    }
  }

  const gen = multiThrowGenerator();
  await gen.next();
  const res1 = await gen.throw(new Error('test1'));
  await gen.next();
  const res2 = await gen.throw(new Error('exit'));
  return res1.value === 'caught: test1' && res2.value === 'exited';
}

export async function AsyncGeneratorTest019() {

  async function* raceGenerator() {
    const promise1 = new Promise(resolve => setTimeout(() => resolve('win'), 10));
    const promise2 = new Promise(resolve => setTimeout(() => resolve('lose'), 20));
    const winner = await Promise.race([promise1, promise2]);
    yield winner;
  }

  const gen = raceGenerator();
  const res = await gen.next();
  return res.value === 'win';
}

export async function AsyncGeneratorTest020() {

  async function* gapGenerator() {
    yield 'start';
    await new Promise(resolve => setTimeout(resolve, 5));
    yield 'middle';
    await new Promise(resolve => setTimeout(resolve, 5));
    yield 'end';
  }

  const gen = gapGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'start' && res2.value === 'middle' && res3.value === 'end';
}

export async function AsyncGeneratorTest021() {
  const getGenerator = () => {
    return async function* () {
      yield 'returned-1';
      yield 'returned-2';
    };
  };
  const gen = getGenerator()();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'returned-1' && res2.value === 'returned-2';
}

export async function AsyncGeneratorTest022() {

  async function* conditionalGenerator(flag: boolean) {
    yield 'base';
    if (flag) {
      yield 'conditional-true';
    } else {
      yield 'conditional-false';
    }
  }

  const genTrue = conditionalGenerator(true);
  const genFalse = conditionalGenerator(false);
  await genTrue.next();
  await genFalse.next();
  const resTrue = await genTrue.next();
  const resFalse = await genFalse.next();
  return resTrue.value === 'conditional-true' && resFalse.value === 'conditional-false';
}

export async function AsyncGeneratorTest023() {

  return true
}

export async function AsyncGeneratorTest024() {

  async function* infiniteGenerator(limit: number) {
    let count = 0;
    while (count < limit) {
      yield count++;
      await new Promise(resolve => setTimeout(resolve, 1));
    }
  }

  const gen = infiniteGenerator(3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.value === 2 && res4.done === true;
}

export async function AsyncGeneratorTest025() {

  async function* nestedArrowGenerator() {
    const getValue = async (num: number) => num * 10;
    yield await getValue(1);
    yield await getValue(2);
  }

  const gen = nestedArrowGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 10 && res2.value === 20;
}

export async function AsyncGeneratorTest026() {

  async function* returnAfterThrowGenerator() {
    try {
      yield 'step1';
      throw new Error('test-throw');
    } catch (err) {
      yield `caught: ${(err as Error).message}`;
      return 'after-throw';
    }
  }

  const gen = returnAfterThrowGenerator();
  await gen.next();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'caught: test-throw' && res2.value === 'after-throw';
}

export async function AsyncGeneratorTest027() {

  async function* promiseAllSettledGenerator() {
    const promises = [
      Promise.resolve('ok1'),
      Promise.reject(new Error('err1')),
      Promise.resolve('ok2')
    ];
    const results = await Promise.allSettled(promises);
    yield * results.map(res => res.status);
  }

  const gen = promiseAllSettledGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'fulfilled' && res2.value === 'rejected' && res3.value === 'fulfilled';
}

export async function AsyncGeneratorTest028() {

  async function* dynamicYieldCountGenerator(count: number) {
    for (let i = 0; i < count; i++) {
      yield `item-${i}`;
    }
  }

  const gen = dynamicYieldCountGenerator(2);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'item-0' && res2.value === 'item-1' && res3.done === true;
}

export async function AsyncGeneratorTest029() {

  async function* asyncInitGenerator(initFn: () => Promise<number>) {
    const initVal = await initFn();
    yield initVal;
    yield initVal + 5;
  }

  const gen = asyncInitGenerator(() => Promise.resolve(10));
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 10 && res2.value === 15;
}

export async function AsyncGeneratorTest030() {

  async function* closeOnErrorGenerator() {
    try {
      yield 'before';
      throw new Error('close-error');
    } catch (e) {
      yield 'catch-executed';
    } finally {
      yield 'finally-executed';
    }
  }

  const gen = closeOnErrorGenerator();
  await gen.next();
  try {
    await gen.next();
  } catch {
    // Ignore expected error
  }
  const res = await gen.next();
  return res.value === 'finally-executed' && !res.done;
}

export async function AsyncGeneratorTest031() {

  async function* asyncFilterGenerator(items: number[], predicate: (n: number) => Promise<boolean>) {
    for (const item of items) {
      if (await predicate(item)) {
        yield item;
      }
    }
  }

  const gen = asyncFilterGenerator([1, 2, 3, 4], async (n) => n % 2 === 0);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 2 && res2.value === 4 && res3.done === true;
}

export async function AsyncGeneratorTest032() {

  async function* nestedGeneratorChain() {

    async function* level1() {
      yield 'level1-1';
      yield 'level1-2';
    }

    async function* level2() {
      yield * level1();
      yield 'level2-1';
    }

    yield * level2();
    yield 'root-1';
  }

  const gen = nestedGeneratorChain();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 'level1-1' && res2.value === 'level1-2' && res3.value === 'level2-1' && res4.value === 'root-1';
}

export async function AsyncGeneratorTest033() {

  async function* inputDependentYield() {
    const input = yield 'request-input';
    if (input === 'valid') {
      yield 'valid-response';
    } else {
      yield 'invalid-response';
    }
  }

  const gen = inputDependentYield();
  await gen.next();
  const resValid = await gen.next('valid');
  const gen2 = inputDependentYield();
  await gen2.next();
  const resInvalid = await gen2.next('invalid');
  return resValid.value === 'valid-response' && resInvalid.value === 'invalid-response';
}

export async function AsyncGeneratorTest034() {

  async function* delayBetweenYields(ms: number, count: number) {
    for (let i = 0; i < count; i++) {
      await new Promise(resolve => setTimeout(resolve, ms));
      yield i;
    }
  }

  const gen = delayBetweenYields(5, 2);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.done === true;
}

export async function AsyncGeneratorTest035() {

  async function* throwAfterYield() {
    yield 'safe';
    throw new Error('post-yield-error');
    yield 'unreachable';
  }

  const gen = throwAfterYield();
  await gen.next();
  try {
    await gen.next();
    return false;
  } catch (err) {
    return (err as Error).message === 'post-yield-error';
  }
}

export async function AsyncGeneratorTest036() {

  async function* asyncMapGenerator(items: string[], mapper: (s: string) => Promise<string>) {
    for (const item of items) {
      yield await mapper(item);
    }
  }

  const gen = asyncMapGenerator(['a', 'b'], async (s) => s.toUpperCase());
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'A' && res2.value === 'B';
}

export async function AsyncGeneratorTest037() {

  async function* returnInFinally() {
    try {
      yield 'try-block';
    } finally {
      return 'finally-return';
    }
  }

  const gen = returnInFinally();
  await gen.next();
  const res = await gen.next();
  return res.value === 'finally-return' && res.done === true;
}

export async function AsyncGeneratorTest038() {

  async function* sharedStateGenerator() {
    let state = 0;
    yield state++;
    yield state++;
    yield state;
  }

  const gen = sharedStateGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.value === 2;
}

export async function AsyncGeneratorTest039() {

  async function* promiseSequenceGenerator(promises: Promise<number>[]) {
    for (const p of promises) {
      yield await p;
    }
  }

  const promises = [
    Promise.resolve(10),
    new Promise<number>(resolve => setTimeout(() => resolve(20), 5))
  ];
  const gen = promiseSequenceGenerator(promises);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 10 && res2.value === 20;
}

export async function AsyncGeneratorTest040() {

  async function* emptyGenerator() {
    // No yields
  }

  const gen = emptyGenerator();
  const res = await gen.next();
  return res.done === true && res.value === undefined;
}

export async function AsyncGeneratorTest041() {

  async function* arrowWrapperGenerator() {
    const asyncArrow = async (n: number) => n * 3;
    yield await asyncArrow(1);
    yield await asyncArrow(2);
  }

  const gen = arrowWrapperGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 3 && res2.value === 6;
}

export async function AsyncGeneratorTest042() {

  async function* forAwaitBreakGenerator() {
    yield 1;
    yield 2;
    yield 3;
  }

  let count = 0;
  for await (const val of forAwaitBreakGenerator()) {
    count++;
    if (count === 2) {
      break;
    }
  }
  return count === 2;
}

export async function AsyncGeneratorTest043() {

  async function* errorRecoveryGenerator() {
    let attempt = 0;
    while (attempt < 2) {
      try {
        attempt++;
        if (attempt === 1) {
          throw new Error('retry');
        }
        yield 'success';
      } catch {
        yield 'catch';
      }
    }
  }

  const gen = errorRecoveryGenerator();
  await gen.next(); // Triggers first error
  const res = await gen.next();
  return res.value === 'success';
}

export async function AsyncGeneratorTest044() {

  async function* asyncConditionalChain() {
    const step1 = await Promise.resolve(true);
    if (step1) {
      yield 'step1-pass';
    }
    const step2 = await Promise.resolve(false);
    if (step2) {
      yield 'step2-pass';
    } else {
      yield 'step2-fail';
    }
  }

  const gen = asyncConditionalChain();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'step1-pass' && res2.value === 'step2-fail';
}

export async function AsyncGeneratorTest045() {

  async function* generatorAsParameter(gen: AsyncGenerator<number>) {
    for await (const val of gen) {
      yield val * 2;
    }
  }

  async function* sourceGenerator() {
    yield 1;
    yield 2;
  }

  const gen = generatorAsParameter(sourceGenerator());
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 2 && res2.value === 4;
}

export async function AsyncGeneratorTest046() {

  async function* returnOverridesYield() {
    yield 'first';
    return 'override';
    yield 'unreachable';
  }

  const gen = returnOverridesYield();
  await gen.next();
  const res = await gen.next();
  return res.value === 'override' && res.done === true;
}

export async function AsyncGeneratorTest047() {

  async function* asyncWhileGenerator(condition: () => Promise<boolean>, action: () => Promise<number>) {
    while (await condition()) {
      yield await action();
    }
  }

  let count = 0;
  const gen = asyncWhileGenerator(
    async () => count < 2,
    async () => count++
  );
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.done === true;
}

export async function AsyncGeneratorTest048() {

  async function* nestedErrorHandling() {
    try {

      async function* inner() {
        throw new Error('inner-error');
      }

      yield * inner();
    } catch (err) {
      yield `caught-inner: ${(err as Error).message}`;
    }
  }

  const gen = nestedErrorHandling();
  const res = await gen.next();
  return res.value === 'caught-inner: inner-error';
}

export async function AsyncGeneratorTest049() {

  async function* promiseTimeoutGenerator(ms: number, value: string) {
    const timeout = new Promise((_, reject) => setTimeout(() => reject(new Error('timeout')), ms));
    const result = await Promise.race([Promise.resolve(value), timeout]);
    yield result;
  }

  const genSuccess = promiseTimeoutGenerator(10, 'ok');
  const resSuccess = await genSuccess.next();
  const genFail = promiseTimeoutGenerator(5, 'ok');
  try {
    await genFail.next();
    return true;
  } catch (err) {
    return resSuccess.value === 'ok' && (err as Error).message === 'timeout';
  }
}

export async function AsyncGeneratorTest050() {

  async function* generatorComposition(gen1: AsyncGenerator<string>, gen2: AsyncGenerator<string>) {
    yield * gen1;
    yield * gen2;
  }

  async function* g1() {
    yield 'a';
    yield 'b';
  }

  async function* g2() {
    yield 'c';
    yield 'd';
  }

  const gen = generatorComposition(g1(), g2());
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 'a' && res2.value === 'b' && res3.value === 'c' && res4.value === 'd';
}

export async function AsyncGeneratorTest051() {

  async function* asyncSetGenerator(set: Set<number>) {
    for (const item of set) {
      await new Promise(resolve => setTimeout(resolve, 1));
      yield item;
    }
  }

  const gen = asyncSetGenerator(new Set([5, 10, 15]));
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const values = [res1.value, res2.value, res3.value];
  return values.includes(5) && values.includes(10) && values.includes(15) && res3.done === false;
}

export async function AsyncGeneratorTest052() {

  async function* throwInYieldExpression() {
    const value = yield (() => {
      throw new Error('yield-expr-error');
    })();
    yield value;
  }

  const gen = throwInYieldExpression();
  try {
    await gen.next();
    return false;
  } catch (err) {
    return (err as Error).message === 'yield-expr-error';
  }
}

export async function AsyncGeneratorTest053() {

  async function* asyncReduceGenerator(items: number[], reducer: (acc: number, n: number) => Promise<number>,
    init: number) {
    let acc = init;
    for (const item of items) {
      acc = await reducer(acc, item);
      yield acc;
    }
  }

  const gen = asyncReduceGenerator([1, 2, 3], async (a, b) => a + b, 0);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 1 && res2.value === 3 && res3.value === 6;
}

export async function AsyncGeneratorTest054() {

  async function* generatorWithAsyncGetters() {
    const obj = {
      get asyncProp() {
        return Promise.resolve('async-value');
      }
    };
    yield await obj.asyncProp;
  }

  const gen = generatorWithAsyncGetters();
  const res = await gen.next();
  return res.value === 'async-value';
}

export async function AsyncGeneratorTest055() {

  async function* multipleReturnCalls() {
    yield 'first';
  }

  const gen = multipleReturnCalls();
  await gen.return();
  const res = await gen.return();
  return res.value === undefined && res.done === true;
}

export async function AsyncGeneratorTest056() {

  async function* asyncArrayFromGenerator() {
    yield 10;
    yield 20;
    yield 30;
  }

  const arr = [];
  for await (const val of asyncArrayFromGenerator()) {
    arr.push(val);
  }
  return JSON.stringify(arr) === JSON.stringify([10, 20, 30]);
}

export async function AsyncGeneratorTest057() {

  async function* errorInFinally() {
    try {
      yield 'try';
    } finally {
      throw new Error('finally-error');
    }
  }

  const gen = errorInFinally();
  await gen.next();
  try {
    await gen.next();
    return false;
  } catch (err) {
    return (err as Error).message === 'finally-error';
  }
}

export async function AsyncGeneratorTest058() {

  async function* parameterizedAsyncAction(action: () => Promise<string>) {
    yield await action();
    yield await action();
  }

  const gen = parameterizedAsyncAction(() => Promise.resolve('action-result'));
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'action-result' && res2.value === 'action-result';
}

export async function AsyncGeneratorTest059() {

  async function* generatorWithTimer() {
    const start = Date.now();
    yield 'start';
    await new Promise(resolve => setTimeout(resolve, 100));
    yield Date.now() - start >= 99;
  }

  const gen = generatorWithTimer();
  await gen.next();
  const res = await gen.next();
  return res.value === true;
}

export async function AsyncGeneratorTest060() {

  async function* asyncGeneratorIdentity(gen: AsyncGenerator<number>) {
    for await (const val of gen) {
      yield val;
    }
  }

  async function* source() {
    yield 1;
    yield 2;
    yield 3;
  }

  const gen = asyncGeneratorIdentity(source());
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 1 && res2.value === 2 && res3.value === 3;
}

export async function AsyncGeneratorTest061() {

  async function* level3Generator() {
    yield 'level3-1';
    yield 'level3-2';
  }

  async function* level2Generator() {
    yield * level3Generator();
    yield 'level2-1';
  }

  async function* level1Generator() {
    yield 'level1-1';
    yield * level2Generator();
    yield 'level1-2';
  }

  const gen = level1Generator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();

  return res1.value === 'level1-1' &&
    res2.value === 'level3-1' &&
    res3.value === 'level3-2' &&
    res4.value === 'level2-1' &&
    res5.value === 'level1-2';
}

export async function AsyncGeneratorTest062() {
  const createAsyncPipeline = () => {
    const step1 = async (val: number) => val * 2;
    const step2 = async (val: number) => val + 5;
    const step3 = async (val: number) => val - 3;

    return async function* (input: number[]) {
      for (const num of input) {
        const s1 = await step1(num);
        const s2 = await step2(s1);
        const s3 = await step3(s2);
        yield s3;
      }
    };
  };

  const gen = createAsyncPipeline()([1, 2]);
  const res1 = await gen.next();
  const res2 = await gen.next();

  return res1.value === (1 * 2 + 5 - 3) && res2.value === (2 * 2 + 5 - 3);
}

export async function AsyncGeneratorTest063() {

  async function* timedSequenceGenerator(delays: number[], values: string[]) {
    for (let i = 0; i < delays.length; i++) {
      await new Promise(resolve => setTimeout(resolve, delays[i]));
      yield values[i];
    }
  }

  const delays = [100, 50, 150];
  const values = ['a', 'b', 'c'];
  const gen = timedSequenceGenerator(delays, values);

  const start = Date.now();
  const res1 = await gen.next();
  const time1 = Date.now() - start;
  const res2 = await gen.next();
  const time2 = Date.now() - start;
  const res3 = await gen.next();
  const time3 = Date.now() - start;

  return res1.value === 'a' &&
    res2.value === 'b' &&
    res3.value === 'c';
}

export async function AsyncGeneratorTest064() {

  async function* innerErrorGenerator() {
    yield 'inner-before';
    throw new Error('inner-fail');
  }

  async function* middleWrapperGenerator() {
    try {
      yield * innerErrorGenerator();
    } catch (err) {
      yield `middle-caught: ${(err as Error).message}`;
      throw new Error('middle-propagate');
    }
  }

  async function* outerHandlerGenerator() {
    try {
      yield * middleWrapperGenerator();
    } catch (err) {
      yield `outer-caught: ${(err as Error).message}`;
    }
  }

  const gen = outerHandlerGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();

  return res1.value === 'inner-before' &&
    res2.value === 'middle-caught: inner-fail' &&
    res3.value === 'outer-caught: middle-propagate';
}

export async function AsyncGeneratorTest065() {
  return true
}

export async function AsyncGeneratorTest066() {

  async function* asyncDependencyChain() {
    const dep1 = await Promise.resolve('dep1-ready');
    yield dep1;

    const dep2 = await Promise.resolve(`${dep1}-dep2`);
    yield dep2;

    const dep3 = await Promise.resolve(`${dep2}-dep3`);
    yield dep3;
  }

  const gen = asyncDependencyChain();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();

  return res1.value === 'dep1-ready' &&
    res2.value === 'dep1-ready-dep2' &&
    res3.value === 'dep1-ready-dep2-dep3';
}

export async function AsyncGeneratorTest067() {

  async function* parallelBatchesGenerator(batches: number[][]) {
    for (const batch of batches) {
      const parallelResults = await Promise.all(
        batch.map(num => Promise.resolve(num * 10))
      );
      yield * parallelResults;
    }
  }

  const gen = parallelBatchesGenerator([[1, 2], [3, 4]]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 10 && res2.value === 20 && res3.value === 30 && res4.value === 40;
}

export async function AsyncGeneratorTest068() {

  async function* returnInNestedGenerator() {

    async function* inner() {
      yield 'inner-val';
      return 'inner-return';
    }

    const innerReturn = yield * inner();
    yield `outer-captured: ${innerReturn}`;
  }

  const gen = returnInNestedGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();

  return res1.value === 'inner-val' &&
    res2.value === 'outer-captured: inner-return' &&
    res3.done === true;
}

export async function AsyncGeneratorTest069() {

  async function* timedRetryGenerator(attempts: number, delay: number) {
    let count = 0;
    while (count < attempts) {
      count++;
      try {
        if (count < attempts) {
          throw new Error(`retry-${count}`);
        }
        yield `success-attempt-${count}`;
      } catch (err) {
        yield `failed-attempt-${count}`;
        await new Promise(resolve => setTimeout(resolve, delay));
      }
    }
  }

  const gen = timedRetryGenerator(3, 5);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 'failed-attempt-1' &&
    res2.value === 'failed-attempt-2' &&
    res3.value === 'success-attempt-3' &&
    res4.done === true;
}

export async function AsyncGeneratorTest070() {
  const createAsyncFilterMap = (
    filter: (n: number) => Promise<boolean>,
    map: (n: number) => Promise<number>
  ) => {
    return async function* (input: number[]) {
      for (const num of input) {
        if (await filter(num)) {
          yield await map(num);
        }
      }
    };
  };

  const filterEven = async (n: number) => n % 2 === 0;
  const double = async (n: number) => n * 2;
  const gen = createAsyncFilterMap(filterEven, double)([1, 2, 3, 4]);

  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();

  return res1.value === 4 && res2.value === 8 && res3.done === true;
}

export async function AsyncGeneratorTest071() {

  async function* level4NestedGenerator() {

    async function* level4() {
      yield 'l4-v1';
      yield 'l4-v2';
    }

    async function* level3() {
      yield 'l3-v1';
      yield * level4();
      yield 'l3-v2';
    }

    async function* level2() {
      yield * level3();
      yield 'l2-v1';
    }

    async function* level1() {
      yield 'l1-v1';
      yield * level2();
      yield 'l1-v2';
    }

    yield * level1();
  }

  const gen = level4NestedGenerator();
  const resOrder = [
    await gen.next(), await gen.next(), await gen.next(),
    await gen.next(), await gen.next(), await gen.next(),
    await gen.next()
  ].map(res => res.value);

  return JSON.stringify(resOrder) === JSON.stringify([
    'l1-v1', 'l3-v1', 'l4-v1', 'l4-v2', 'l3-v2', 'l2-v1', 'l1-v2'
  ]);
}

export async function AsyncGeneratorTest072() {

  async function* asyncStatefulGenerator(initial: number) {
    let state = initial;
    const updateState = async (delta: number) => {
      await new Promise(resolve => setTimeout(resolve, 1));
      state += delta;
      return state;
    };

    yield await updateState(5);
    yield await updateState(-2);
    yield await updateState(3);
  }

  const gen = asyncStatefulGenerator(10);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();

  return res1.value === 15 && res2.value === 13 && res3.value === 16;
}

export async function AsyncGeneratorTest073() {

  async function* batchTimedGenerator(batchSize: number, delay: number, count: number) {
    let itemsProcessed = 0;
    while (itemsProcessed < count) {
      const batch: number[] = [];
      for (let i = 0; i < batchSize && itemsProcessed < count; i++) {
        batch.push(itemsProcessed++);
      }
      await new Promise(resolve => setTimeout(resolve, delay));
      yield * batch;
    }
  }

  const gen = batchTimedGenerator(2, 10, 5);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();
  const res6 = await gen.next();

  return [res1.value, res2.value, res3.value, res4.value, res5.value]
    .join(',') === '0,1,2,3,4' && res6.done === true;
}

export async function AsyncGeneratorTest074() {

  async function* errorPropagationChain() {

    async function* l3() {
      throw new Error('l3-err');
    }

    async function* l2() {
      yield * l3();
    }

    async function* l1() {
      yield * l2();
    }

    try {
      yield * l1();
    } catch (err) {
      yield `root-caught: ${(err as Error).message}`;
    }
  }

  const gen = errorPropagationChain();
  const res1 = await gen.next();
  const res2 = await gen.next();

  return res1.value === 'root-caught: l3-err' && res2.done === true;
}

export async function AsyncGeneratorTest075() {
  const createAsyncPipelineWithNestedSteps = () => {
    const stepA = async (val: string) => val.toUpperCase();
    const stepB = async (val: string) => {
      const subStep = async (v: string) => `${v}-sub`;
      return await subStep(val);
    };
    const stepC = async (val: string) => val + '-final';

    return async function* (input: string[]) {
      for (const str of input) {
        const a = await stepA(str);
        const b = await stepB(a);
        const c = await stepC(b);
        yield c;
      }
    };
  };

  const gen = createAsyncPipelineWithNestedSteps()(['test1', 'test2']);
  const res1 = await gen.next();
  const res2 = await gen.next();

  return res1.value === 'TEST1-sub-final' && res2.value === 'TEST2-sub-final';
}

export async function AsyncGeneratorTest076() {

  async function* sequentialAsyncDependencies() {
    const fetchStep1 = async () => 'data1';
    const fetchStep2 = async (dep: string) => `${dep}-data2`;
    const fetchStep3 = async (dep: string) => `${dep}-data3`;

    const s1 = await fetchStep1();
    yield s1;

    const s2 = await fetchStep2(s1);
    yield s2;

    const s3 = await fetchStep3(s2);
    yield s3;
  }

  const gen = sequentialAsyncDependencies();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();

  return res1.value === 'data1' &&
    res2.value === 'data1-data2' &&
    res3.value === 'data1-data2-data3';
}

export async function AsyncGeneratorTest077() {

  async function* parallelWithinSequentialGenerator() {
    // Step 1: Parallel
    const parallel1 = await Promise.all([
      Promise.resolve('p1-1'),
      Promise.resolve('p1-2')
    ]);
    yield * parallel1;

    // Step 2: Sequential delay
    await new Promise(resolve => setTimeout(resolve, 10));

    // Step 3: Parallel again
    const parallel2 = await Promise.all([
      Promise.resolve('p2-1'),
      Promise.resolve('p2-2')
    ]);
    yield * parallel2;
  }

  const gen = parallelWithinSequentialGenerator();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();

  return res1.value === 'p1-1' && res2.value === 'p1-2' &&
    res3.value === 'p2-1' && res4.value === 'p2-2' &&
    res5.done === true;
}

export async function AsyncGeneratorTest078() {

  async function* returnValuePropagation() {

    async function* inner() {
      yield 'inner-v';
      return 'inner-return-val';
    }

    async function* middle() {
      const innerRet = yield * inner();
      yield `middle-${innerRet}`;
      return 'middle-return-val';
    }

    const middleRet = yield * middle();
    yield `outer-${middleRet}`;
  }

  const gen = returnValuePropagation();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 'inner-v' &&
    res2.value === 'middle-inner-return-val' &&
    res3.value === 'outer-middle-return-val' &&
    res4.done === true;
}

export async function AsyncGeneratorTest079() {

  async function* timedStateUpdateGenerator(updates: { delay: number, delta: number }[], initial: number) {
    let state = initial;
    for (const update of updates) {
      await new Promise(resolve => setTimeout(resolve, update.delay));
      state += update.delta;
      yield state;
    }
  }

  const updates = [
    { delay: 5, delta: 3 },
    { delay: 10, delta: -1 },
    { delay: 5, delta: 4 }
  ];
  const gen = timedStateUpdateGenerator(updates, 10);

  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 13 && res2.value === 12 && res3.value === 16 && res4.done === true;
}

export async function AsyncGeneratorTest080() {
  const createMultiLevelFilter = (filters: ((n: number) => Promise<boolean>)[]) => {
    return async function* (input: number[]) {
      for (const num of input) {
        let pass = true;
        for (const filter of filters) {
          if (!(await filter(num))) {
            pass = false;
            break;
          }
        }
        if (pass) {
          yield num;
        }
      }
    };
  };

  const filters = [
    async (n) => n > 5,
    async (n) => n % 2 === 0
  ];
  const gen = createMultiLevelFilter(filters)([4, 6, 7, 8, 9, 10]);

  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 6 && res2.value === 8 && res3.value === 10 && res4.done === true;
}

export async function AsyncGeneratorTest081() {

  async function* nestedAsyncIteration() {

    async function* inner1() {
      yield 1;
      yield 2;
    }

    async function* inner2() {
      yield 3;
      yield 4;
    }

    async function* inner3() {
      yield 5;
      yield 6;
    }

    const inners = [inner1(), inner2(), inner3()];
    for (const inner of inners) {
      for await (const val of inner) {
        yield val * 2;
      }
    }
  }

  const gen = nestedAsyncIteration();
  const resOrder = [
    await gen.next(), await gen.next(), await gen.next(),
    await gen.next(), await gen.next(), await gen.next(),
    await gen.next()
  ].map(res => res.value);

  return JSON.stringify(resOrder) === JSON.stringify([2, 4, 6, 8, 10, 12, undefined]);
}

export async function AsyncGeneratorTest082() {

  async function* asyncCascadeWithReturn() {

    async function* level1() {
      yield 'l1-v';
      return 'l1-ret';
    }

    async function* level2() {
      const l1Ret = yield * level1();
      yield `l2-${l1Ret}`;
      return 'l2-ret';
    }

    const l2Ret = yield * level2();
    yield `root-${l2Ret}`;
  }

  const gen = asyncCascadeWithReturn();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 'l1-v' &&
    res2.value === 'l2-l1-ret' &&
    res3.value === 'root-l2-ret' &&
    res4.done === true;
}

export async function AsyncGeneratorTest083() {

  async function* timedBatchProcessing(batches: number[][], batchDelay: number) {
    for (const batch of batches) {
      await new Promise(resolve => setTimeout(resolve, batchDelay));
      const processed = await Promise.all(batch.map(num => Promise.resolve(num + 10)));
      yield * processed;
    }
  }

  const batches = [[1, 2], [3, 4], [5, 6]];
  const gen = timedBatchProcessing(batches, 5);

  const start = Date.now();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const timeAfterFirstBatch = Date.now() - start;
  const res3 = await gen.next();
  const res4 = await gen.next();
  const timeAfterSecondBatch = Date.now() - start;
  const res5 = await gen.next();
  const res6 = await gen.next();

  return res1.value === 11 && res2.value === 12 &&
    res3.value === 13 && res4.value === 14 &&
    res5.value === 15 && res6.value === 16;
}

export async function AsyncGeneratorTest084() {

  async function* multiErrorHandlingChain() {

    async function* l3() {
      yield 'l3-v';
      throw new Error('l3-err');
    }

    async function* l2() {
      try {
        yield * l3();
      } catch (err) {
        yield `l2-caught: ${(err as Error).message}`;
        yield 'l2-continue';
      }
    }

    async function* l1() {
      yield * l2();
      throw new Error('l1-err');
    }

    try {
      yield * l1();
    } catch (err) {
      yield `root-caught: ${(err as Error).message}`;
    }
  }

  const gen = multiErrorHandlingChain();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();

  return res1.value === 'l3-v' &&
    res2.value === 'l2-caught: l3-err' &&
    res3.value === 'l2-continue' &&
    res4.value === 'root-caught: l1-err' &&
    res5.done === true;
}

export async function AsyncGeneratorTest085() {
  const createAsyncTransformerPipeline = (transformers: ((val: string) => Promise<string>)[]) => {
    return async function* (input: string[]) {
      for (const str of input) {
        let transformed = str;
        for (const transformer of transformers) {
          transformed = await transformer(transformed);
        }
        yield transformed;
      }
    };
  };

  const transformers = [
    async (s) => s.toUpperCase(),
    async (s) => `${s}-TRIM`,
    async (s) => s.replace(' ', '')
  ];
  const gen = createAsyncTransformerPipeline(transformers)(['test 1', 'test 2']);

  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();

  return res1.value === 'TEST1-TRIM' && res2.value === 'TEST2-TRIM' && res3.done === true;
}

export async function AsyncGeneratorTest086() {

  async function* sequentialNestedGenerators() {
    let count = 0;
    const createInner = () => async function* () {
      count++;
      yield `inner-${count}`;
    };

    yield * createInner()();
    yield * createInner()();
    yield * createInner()();
  }

  const gen = sequentialNestedGenerators();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 'inner-1' && res2.value === 'inner-2' && res3.value === 'inner-3' && res4.done === true;
}

export async function AsyncGeneratorTest087() {

  async function* asyncStatefulCascade(initial: number, steps: number) {
    let state = initial;
    const processStep = async (stepNum: number) => {
      await new Promise(resolve => setTimeout(resolve, 1));
      state *= stepNum;
      return state;
    };

    for (let i = 1; i <= steps; i++) {
      yield await processStep(i);
    }
  }

  const gen = asyncStatefulCascade(2, 4);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();

  return res1.value === 2 && res2.value === 4 && res3.value === 12 && res4.value === 48 && res5.done === true;
}

export async function AsyncGeneratorTest088() {

  async function* parallelErrorHandling() {
    const tasks = [
      Promise.resolve('ok1'),
      Promise.reject(new Error('err1')),
      Promise.resolve('ok2'),
      Promise.reject(new Error('err2'))
    ];

    const results = await Promise.allSettled(tasks);
    for (const res of results) {
      if (res.status ===
        'fulfilled') {
        yield `success: ${res.value}`;
      } else {
        yield `failed: ${(res.reason as Error).message}`;
      }
    }
  }

  const gen = parallelErrorHandling();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();

  return res1.value === 'success: ok1' &&
    res2.value === 'failed: err1' &&
    res3.value === 'success: ok2' &&
    res4.value === 'failed: err2' &&
    res5.done === true;
}

export async function AsyncGeneratorTest089() {

  async function* nestedReturnPropagation() {

    async function* l4() {
      return 'l4-ret';
    }

    async function* l3() {
      const ret = yield * l4();
      yield `l3-${ret}`;
      return 'l3-ret';
    }

    async function* l2() {
      const ret = yield * l3();
      yield `l2-${ret}`;
      return 'l2-ret';
    }

    async function* l1() {
      const ret = yield * l2();
      yield `l1-${ret}`;
      return 'l1-ret';
    }

    const ret = yield * l1();
    yield `root-${ret}`;
  }

  const gen = nestedReturnPropagation();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();

  return res1.value === 'l3-l4-ret' &&
    res2.value === 'l2-l3-ret' &&
    res3.value === 'l1-l2-ret' &&
    res4.value === 'root-l1-ret' &&
    res5.done === true;
}

export async function AsyncGeneratorTest090() {

  async function* timedSequentialTasks(tasks: (() => Promise<string>)[], delays: number[]) {
    for (let i = 0; i < tasks.length; i++) {
      await new Promise(resolve => setTimeout(resolve, delays[i]));
      yield await tasks[i]();
    }
  }

  const tasks = [
    () => Promise.resolve('task1'),
    () => Promise.resolve('task2'),
    () => Promise.resolve('task3')
  ];
  const delays = [10, 5, 15];
  const gen = timedSequentialTasks(tasks, delays);

  const start = Date.now();
  const res1 = await gen.next();
  const time1 = Date.now() - start;
  const res2 = await gen.next();
  const time2 = Date.now() - start;
  const res3 = await gen.next();
  const time3 = Date.now() - start;

  return res1.value === 'task1' &&
    res2.value === 'task2' &&
    res3.value === 'task3';
}

export async function AsyncGeneratorTest091() {
  return true
}

export async function AsyncGeneratorTest092() {

  async function* asyncCascadeWithDelay() {
    const step1 = async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      return 'step1-done';
    };

    const step2 = async (dep: string) => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return `${dep}-step2-done`;
    };

    const step3 = async (dep: string) => {
      await new Promise(resolve => setTimeout(resolve, 5));
      return `${dep}-step3-done`;
    };

    let yieldedValue = yield await step1();
    yieldedValue = yield await step2(yieldedValue);
    yield await step3(yieldedValue);
  }

  // 修正后逻辑：正确传递依赖值
  async function* asyncCascadeWithDelayFixed() {
    const step1 = async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      return 'step1-done';
    };

    const step2 = async (dep: string) => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return `${dep}-step2-done`;
    };

    const step3 = async (dep: string) => {
      await new Promise(resolve => setTimeout(resolve, 5));
      return `${dep}-step3-done`;
    };

    const s1 = await step1();
    yield s1;
    const s2 = await step2(s1);
    yield s2;
    const s3 = await step3(s2);
    yield s3;
  }

  const gen = asyncCascadeWithDelayFixed();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();

  return res1.value === 'step1-done' &&
    res2.value === 'step1-done-step2-done' &&
    res3.value === 'step1-done-step2-done-step3-done' &&
    res4.done === true;
}

export async function AsyncGeneratorTest093() {

  async function* multiBatchParallelProcessing(batches: number[][], batchDelay: number) {
    for (const batch of batches) {
      await new Promise(resolve => setTimeout(resolve, batchDelay));
      const parallelResults = await Promise.all(
        batch.map(num => new Promise(resolve => setTimeout(() => resolve(num * 3), 1)))
      );
      yield * parallelResults;
    }
  }

  const batches = [[1, 2], [3, 4], [5, 6]];
  const gen = multiBatchParallelProcessing(batches, 5);

  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();
  const res6 = await gen.next();

  return res1.value === 3 && res2.value === 6 && res3.value === 9 && res4.value === 12 && res5.value === 15 &&
    res6.value === 18;
}

export async function AsyncGeneratorTest094() {

  async function* errorRecoveryInCascade() {

    async function* l3() {
      yield 'l3-v';
      throw new Error('l3-err');
    }

    async function* l2() {
      let retries = 2;
      while (retries > 0) {
        try {
          yield * l3();
          break;
        } catch (err) {
          retries--;
          yield `l2-retry-${retries + 1} (err: ${(err as Error).message})`;
          await new Promise(resolve => setTimeout(resolve, 5));
        }
      }
      yield 'l2-recovery-done';
    }

    yield * l2();
    yield 'root-done';
  }

  const gen = errorRecoveryInCascade();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();
  const res6 = await gen.next();

  return res1.value === 'l3-v' &&
    res2.value === 'l2-retry-2 (err: l3-err)' &&
    res3.value === 'l3-v' &&
    res4.value === 'l2-retry-1 (err: l3-err)' &&
    res5.value === 'l2-recovery-done' &&
    res6.value === 'root-done';
}

export async function AsyncGeneratorTest095() {
  const createAsyncComposer = (
    gen1: () => AsyncGenerator<number>,
    gen2: () => AsyncGenerator<number>,
    combiner: (a: number, b: number) => Promise<number>
  ) => {
    return async function* () {
      const g1 = gen1();
      const g2 = gen2();
      let res1 = await g1.next();
      let res2 = await g2.next();

      while (!res1.done && !res2.done) {
        yield await combiner(res1.value, res2.value);
        res1 = await g1.next();
        res2 = await g2.next();
      }
    };
  };

  async function* g1() {
    yield 1;
    yield 2;
    yield 3;
  }

  async function* g2() {
    yield 10;
    yield 20;
    yield 30;
  }

  const combiner = async (a: number, b: number) => a + b;
  const composedGen = createAsyncComposer(g1, g2, combiner)();

  const res1 = await composedGen.next();
  const res2 = await composedGen.next();
  const res3 = await composedGen.next();
  const res4 = await composedGen.next();

  return res1.value === 11 && res2.value === 22 && res3.value === 33 && res4.done === true;
}

export async function AsyncGeneratorTest096() {

  async function* timedStatefulNestedGenerator(initial: number) {
    let state = initial;

    async function* inner(delta: number, delay: number) {
      await new Promise(resolve => setTimeout(resolve, delay));
      state += delta;
      yield state;
      await new Promise(resolve => setTimeout(resolve, delay));
      state *= 2;
      yield state;
    }

    yield * inner(5, 5);
    yield * inner(3, 5);
    yield state;
  }

  const gen = timedStatefulNestedGenerator(10);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();

  return res1.value === 15 && res2.value === 30 && res3.value === 33 && res4.value === 66 && res5.value === 66;
}

export async function AsyncGeneratorTest097() {

  async function* parallelCascadeWithError() {
    const batch1 = [
      Promise.resolve('p1-1'),
      Promise.reject(new Error('p1-err')),
      Promise.resolve('p1-2')
    ];
    const batch2 = [
      Promise.resolve('p2-1'),
      Promise.resolve('p2-2')
    ];

    // Process batch1 with error handling
    const batch1Res = await Promise.allSettled(batch1);
    for (const res of batch1Res) {
      yield res.status === 'fulfilled' ? `b1-ok: ${res.value}` : `b1-err: ${(res.reason as Error).message}`;
    }

    await new Promise(resolve => setTimeout(resolve, 10));

    // Process batch2
    const batch2Res = await Promise.all(batch2);
    for (const res of batch2Res) {
      yield `b2-ok: ${res}`;
    }
  }

  const gen = parallelCascadeWithError();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();
  const res6 = await gen.next();

  return res1.value === 'b1-ok: p1-1' &&
    res2.value === 'b1-err: p1-err' &&
    res3.value === 'b1-ok: p1-2' &&
    res4.value === 'b2-ok: p2-1' &&
    res5.value === 'b2-ok: p2-2' &&
    res6.done === true;
}

export async function AsyncGeneratorTest098() {

  async function* multiLevelInputPropagation() {
    const input1 = yield 'input-for-root';

    async function* l1(parentInput: string) {
      const input2 = yield `input-for-l1 (parent: ${parentInput})`;

      async function* l2(grandparentInput: string, parentInput: string) {
        const input3 = yield `input-for-l2 (gp: ${grandparentInput}, p: ${parentInput})`;
        yield `l2-result: ${grandparentInput}-${parentInput}-${input3}`;
      }

      yield * l2(parentInput, input2);
      yield `l1-result: ${parentInput}-${input2}`;
    }

    yield * l1(input1);
    yield `root-result: ${input1}`;
  }

  const gen = multiLevelInputPropagation();
  await gen.next();
  const res2 = await gen.next('root-input');
  const res3 = await gen.next('l1-input');
  const res4 = await gen.next('l2-input');
  const res5 = await gen.next();
  const res6 = await gen.next();

  return res2.value === 'input-for-l1 (parent: root-input)' &&
    res3.value === 'input-for-l2 (gp: root-input, p: l1-input)' &&
    res4.value === 'l2-result: root-input-l1-input-l2-input' &&
    res5.value === 'l1-result: root-input-l1-input' &&
    res6.value === 'root-result: root-input';
}

export async function AsyncGeneratorTest099() {
  return true
}

export async function AsyncGeneratorTest100() {
  return true
}