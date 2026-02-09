/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function promise1Test() {
  describe('promise1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   promise1Test001
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const promise: Promise<string> = new Promise((resolve, reject) => resolve('success'));
      await promise.then((value) => list.add(value));
      expect(JSON.stringify(list)).assertEqual('{"0":"success"}')
    });

    /**
     * @tc.name   promise1Test002
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const promise: Promise<string> = new Promise((resolve, reject) => reject(new Error('fail')));
      await promise.catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"fail"}')
    });

    /**
     * @tc.name   promise1Test003
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0300
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<number>();
      new Promise<number>((resolve, reject) => resolve(1))
        .then((num) => num + 1)
        .then((num) => list.add(num));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":2}')
    });

    /**
     * @tc.name   promise1Test004
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<number>();
      new Promise<number>((resolve, reject) => resolve(2))
        .then((num) => new Promise <number>((resolve) => setTimeout(() => resolve(num * 2), 100)))
        .then((num) => list.add(num));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":4}')
    });

    /**
     * @tc.name   promise1Test005
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      let errorMsg: Error;
      new Promise<string>((resolve, reject) => reject('error'))
        .then(null, (err: Error) => {
          errorMsg = err;
        })
        .finally(() => list.add(errorMsg));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"error"}')
    });

    /**
     * @tc.name   promise1Test006
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      list.add(await getValue())
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"async success"}')
    });

    /**
     * @tc.name   promise1Test007
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = await handleError();
      expect(JSON.stringify(list)).assertEqual('{"0":"async error"}')
    });

    /**
     * @tc.name   promise1Test008
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0800
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await returnPromise().then((value) => list.add(value));
      expect(JSON.stringify(list)).assertEqual('{"0":"async return"}')
    });

    /**
     * @tc.name   promise1Test009
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_0900
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<number[]>();
      const p1 = Promise.resolve(1);
      const p2 = Promise.resolve(2);
      await Promise.all([p1, p2]).then((values) => list.add(values));
      expect(JSON.stringify(list)).assertEqual('{"0":[1,2]}')
    });

    /**
     * @tc.name   promise1Test010
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1000
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      const p1 = Promise.resolve(1);
      const p2 = Promise.reject('all error');
      await Promise.all([p1, p2]).catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"all error"}')
    });

    /**
     * @tc.name   promise1Test011
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<[]>();
      await Promise.all([]).then((values) => list.add(values));
      expect(JSON.stringify(list)).assertEqual('{"0":[]}')
    });

    /**
     * @tc.name   promise1Test012
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<("fulfilled" | "rejected")[]>();
      const p1 = Promise.resolve(1);
      const p2 = Promise.reject('settled error');
      await Promise.allSettled([p1, p2]).then((results) => {
        list.add(results.map(r => r.status));
      });
      expect(JSON.stringify(list)).assertEqual('{"0":["fulfilled","rejected"]}')
    });

    /**
     * @tc.name   promise1Test013
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1300
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<number>();
      const p1 = new Promise<number>((resolve) => setTimeout(() => resolve(1), 200));
      const p2 = new Promise<number>((resolve) => setTimeout(() => resolve(2), 100));
      sleep(500);
      await Promise.any([p1, p2]).then((value) => list.add(value));
      expect(JSON.stringify(list)).assertEqual('{"0":2}')
    });

    /**
     * @tc.name   promise1Test014
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const p1 = Promise.reject('any error 1');
      const p2 = Promise.reject('any error 2');
      await Promise.any([p1, p2]).catch((err: AggregateError) => {
        list.add(JSON.stringify(err.errors));
      });
      expect(JSON.stringify(list)).assertEqual('{"0":"[\\"any error 1\\",\\"any error 2\\"]"}')
    });

    /**
     * @tc.name   promise1Test015
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      const p1 = new Promise<number>((resolve) => setTimeout(() => resolve(1), 100));
      const p2 = new Promise<string>((reject) => setTimeout(() => reject('race error'), 50));
      await sleep(60);
      await Promise.race([p1, p2]).catch((err: Error) => list.add(err));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{}')
    });

    /**
     * @tc.name   promise1Test016
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const p1 = new Promise<string>((resolve) => setTimeout(() => resolve('race success'), 50));
      const p2 = new Promise<string>((reject) => setTimeout(() => reject('race error'), 100));
      await Promise.race([p1, p2]).then((value) => list.add(value));
      expect(JSON.stringify(list)).assertEqual('{"0":"race success"}')
    });

    /**
     * @tc.name   promise1Test017
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<boolean>();
      let start = Date.now();
      await delay(200).then(() => {
        list.add(Date.now() - start >= 200);
      });
      expect(JSON.stringify(list)).assertEqual('{"0":true}')
    });

    /**
     * @tc.name   promise1Test018
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1800
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await riskyDelay(100).catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"delay error"}')
    });

    /**
     * @tc.name   promise1Test019
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_1900
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      new Promise<void>((resolve) => resolve()).then(() => list.add('promise microtask'));
      setTimeout(() => list.add('timeout macrotask'), 0);
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"promise microtask","1":"timeout macrotask"}')
    });

    /**
     * @tc.name   promise1Test020
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2000
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const promise = Promise.resolve('order');
      promise.then((v) => list.add(v + 1));
      promise.then((v) => list.add(v + 2));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"order1","1":"order2"}')
    });
    /**
     * @tc.name   promise1Test021
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await new Promise<number>((resolve) => resolve(3))
        .then((num) => {
          list.add("start");
          throw new Error(`num is ${num}`);
        })
        .then((num) => list.add('unreachable'))
        .catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"start","1":"num is 3"}')

    });

    /**
     * @tc.name   promise1Test022
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | boolean | Error>();
      await new Promise<string>((resolve, reject) => reject('chain error'))
        .then((v) => list.add(v))
        .then((v) => list.add(v))
        .catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"chain error"}')
    });

    /**
     * @tc.name   promise1Test023
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2300
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | boolean | Error>();
      await new Promise<string>((resolve) => resolve('outer'))
        .then((outerVal) => {
          return new Promise<string>((resolve) => resolve(outerVal))
            .then((innerVal) => {
              throw new Error('inner error');
            })
            .catch((innerErr: Error) => {
              console.log('inner catch:', innerErr.message);
              list.add(innerErr.message)
              return outerVal;
            });
        })
        .then((val) => list.add('after inner:' + val))
        .catch((outerErr: Error) => list.add('outer catch:' + outerErr.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"inner error","1":"after inner:outer"}')
    });

    /**
     * @tc.name   promise1Test024
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await new Promise<string>((resolve, reject) => reject('catch then error'))
        .catch((err: Error) => {
          list.add('caught:' + err);
          return 'recovered';
        })
        .then((val) => list.add('after catch:' + val));
      expect(JSON.stringify(list)).assertEqual('{"0":"caught:catch then error","1":"after catch:recovered"}');
    });

    /**
     * @tc.name   promise1Test025
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await new Promise<string>((resolve, reject) => reject('first error'))
        .catch((err: Error) => {
          list.add('first catch:' + err);
          throw new Error('second error');
        })
        .then((val) => list.add('unreachable'))
        .catch((err: Error) => list.add('second catch:' + err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"first catch:first error","1":"second catch:second error"}');
    });

    /**
     * @tc.name   promise1Test026
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      await new Promise<string>((resolve, reject) => reject('only success then error'))
        .then((val) => list.add(val))
        .catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"only success then error"}');
    });

    /**
     * @tc.name   promise1Test027
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await Promise.resolve('direct resolve').then((val) => list.add(val));
      expect(JSON.stringify(list)).assertEqual('{"0":"direct resolve"}');
    });

    /**
     * @tc.name   promise1Test028
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2800
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      await Promise.reject('direct reject').catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"direct reject"}');
    });

    /**
     * @tc.name   promise1Test029
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_2900
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error | string>();
      await asyncThrow().catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"async throw error"}');
    });

    /**
     * @tc.name   promise1Test030
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_3000
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      flag = 0;
      await sequential();
      expect(flag).assertEqual(2);
    });


    /**
     * @tc.name   promise1Test032
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_3200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error | string>();
      await new Promise<void>((resolve, reject) => {
        throw new Error('executor sync error');
      }).catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"executor sync error"}');
    });

    /**
     * @tc.name   promise1Test034
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_3400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finallyExecuted = false;
      let list = new ArrayList<boolean>();
      await new Promise<string>((resolve) => resolve('finally success'))
        .then((val) => console.log(val))
        .finally(() => finallyExecuted = true);
      setTimeout(() => list.add(finallyExecuted), 0);
      await sleep(300);
      expect(JSON.stringify(list)).assertEqual('{"0":true}');
      expect(finallyExecuted).assertEqual(true);
    });

    /**
     * @tc.name   promise1Test035
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_3500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | number>();
      await new Promise<number>((resolve) => resolve(5))
        .finally(() => list.add('finally run'))
        .then((num) => list.add(num * 2));
      expect(JSON.stringify(list)).assertEqual('{"0":"finally run","1":10}');
    });

    /**
     * @tc.name   promise1Test036
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_3600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      await new Promise<void>((resolve, reject) => reject('finally error'))
        .finally(() => console.log('finally run'))
        .catch((err: string) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"finally error"}');
    });


    /**
     * @tc.name   promise1Test040
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4000
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<boolean>();
      await new Promise<string>((resolve) => resolve('has value'))
        .then((val) => {
        })
        .then((val) => list.add(val === undefined));
      expect(JSON.stringify(list)).assertEqual('{"0":true}');
    });

    /**
     * @tc.name   promise1Test041
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<number>();
      await new Promise<number>((resolve) => resolve(10))
        .then()
        .then((num) => num * 3)
        .then((num) => list.add(num));
      expect(JSON.stringify(list)).assertEqual('{"0":30}');
    });

    /**
     * @tc.name   promise1Test042
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<number[]>();
      const p1 = new Promise<number>((resolve) => setTimeout(() => resolve(1), 150));
      const p2 = new Promise<number>((resolve) => setTimeout(() => resolve(2), 100));
      const p3 = new Promise<number>((resolve) => setTimeout(() => resolve(3), 50));
      await Promise.all([p1, p2, p3]).then((values) => list.add(values));
      expect(JSON.stringify(list)).assertEqual('{"0":[1,2,3]}');
    });


    /**
     * @tc.name   promise1Test044
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const p1 = Promise.reject('any reject 1');
      const p2 = new Promise<string>((resolve) => setTimeout(() => resolve('any resolve'), 100));
      const p3 = Promise.reject('any reject 2');
      await Promise.any([p1, p2, p3]).then((val) => list.add(val));
      expect(JSON.stringify(list)).assertEqual('{"0":"any resolve"}');
    });


    /**
     * @tc.name   promise1Test046
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const p1 = Promise.resolve('immediate race');
      const p2 = new Promise<string>((resolve) => setTimeout(() => resolve('delayed race'), 100));
      await Promise.race([p1, p2]).then((val) => list.add(val));
      expect(JSON.stringify(list)).assertEqual('{"0":"immediate race"}');
    });

    /**
     * @tc.name   promise1Test047
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | boolean>();
      await new Promise<string>((resolve) => {
        resolve('resolved first');
        throw new Error('error after resolve');
      }).catch((err: Error) => list.add('caught:' + err.message))
        .then((val) => list.add(val));
      expect(JSON.stringify(list)).assertEqual('{"0":"resolved first"}');
    });

    /**
     * @tc.name   promise1Test048
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4800
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | boolean | Error>();
      await new Promise<string>((resolve, reject) => {
        reject('rejected first');
        resolve('resolve after reject');
      }).catch((err: Error) => list.add(err))
        .then((val) => list.add(val === undefined));
      expect(JSON.stringify(list)).assertEqual('{"0":"rejected first","1":false}');
    });

    /**
     * @tc.name   promise1Test049
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_4900
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | boolean | Error>();
      await new Promise<string>((resolve) => resolve('outer'))
        .then((outerVal) => {
          return new Promise<string>((resolve) => resolve(outerVal))
            .then((innerVal) => {
              throw new Error('inner uncaught error');
            });
        })
        .then((val) => list.add('unreachable'))
        .catch((outerErr: Error) => list.add(outerErr.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"inner uncaught error"}');
    });


    /**
     * @tc.name   promise1Test051
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const promise = new Promise<string>((resolve) => {
        setTimeout(() => resolve('done'), 100);
      });
      await promise.then(() => list.add('status: fulfilled'));
      expect(JSON.stringify(list)).assertEqual('{"0":"status: fulfilled"}');
    });

    /**
     * @tc.name   promise1Test052
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const promise = new Promise<void>((_, reject) => {
        setTimeout(() => reject('error'), 100);
      });
      await promise.catch(() => list.add('rejected'));
      expect(JSON.stringify(list)).assertEqual('{"0":"rejected"}');
    });

    /**
     * @tc.name   promise1Test053
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5300
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<number>();
      await new Promise<number>((resolve) => resolve(1))
        .then((num) => new Promise<number>((resolve) => setTimeout(() => resolve(num * 3), 150)))
        .then((result) => list.add(result));
      expect(JSON.stringify(list)).assertEqual('{"0":3}');
    });

    /**
     * @tc.name   promise1Test054
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await new Promise<string>((resolve) => resolve('hello'))
        .then((str) => str + ' world')
        .then((result) => list.add(result));
      expect(JSON.stringify(list)).assertEqual('{"0":"hello world"}');
    });

    /**
     * @tc.name   promise1Test055
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await new Promise<number>((resolve) => resolve(5))
        .then((num) => {
          if (num < 10) {
            throw new Error('error');
          }
          return num;
        })
        .catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"error"}');
    });

    /**
     * @tc.name   promise1Test056
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      await new Promise<number>((resolve) => resolve(20))
        .then((num) => {
          if (num > 15) {
            return Promise.reject('error');
          }
          return num;
        })
        .catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"error"}');
    });

    /**
     * @tc.name   promise1Test057
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = await sequentialAwait57();
      expect(JSON.stringify(list)).assertEqual('{"0":"first","1":"second"}');
    });

    /**
     * @tc.name   promise1Test058
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5800
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await getAsyncValue().then((val) => list.add(val));
      expect(JSON.stringify(list)).assertEqual('{"0":"async return value"}');
    });

    /**
     * @tc.name   promise1Test059
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_5900
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await throwAsyncError().catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"async function error"}');
    });

    /**
     * @tc.name   promise1Test060
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_6000
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr = [1, 'test', true];
      let list = new ArrayList<(string | number | boolean)[]>();
      await Promise.all(arr).then((values) => list.add(values));
      expect(JSON.stringify(list)).assertEqual('{"0":[1,"test",true]}');
    });

    /**
     * @tc.name   promise1Test061
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_6100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      const p1 = new Promise<number>((resolve) => setTimeout(() => resolve(1), 200));
      const p2 = new Promise<number>((res, reject) => setTimeout(() => reject('all error'), 100));
      await Promise.all([p1, p2]).catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"all error"}');
    });

    /**
     * @tc.name   promise1Test062
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_6200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<[]>();
      await Promise.allSettled([]).then((results) => list.add(results));
      expect(JSON.stringify(list)).assertEqual('{"0":[]}');
    });


    /**
     * @tc.name   promise1Test065
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_6500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const p1 = new Promise<string>((resolve) => setTimeout(() => resolve('p1 success'), 300));
      const p2 = new Promise<string>((resolve) => setTimeout(() => resolve('p2 success'), 100));
      const p3 = new Promise<string>((resolve) => setTimeout(() => resolve('p3 success'), 200));
      await sleep(500);
      await Promise.any([p1, p2, p3]).then((val) => list.add(val));
      expect(JSON.stringify(list)).assertEqual('{"0":"p1 success"}');
    });

    /**
     * @tc.name   promise1Test066
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_6600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<AggregateError | Array<string>>();
      const p1 = new Promise<void>((res, reject) => setTimeout(() => reject('p1 error'), 100));
      const p2 = new Promise<void>((res, reject) => setTimeout(() => reject('p2 error'), 200));
      await Promise.any([p1, p2]).catch((err: AggregateError) => {
        list.add(err.errors);
      });
      expect(JSON.stringify(list)).assertEqual('{"0":["p1 error","p2 error"]}');
    });

    /**
     * @tc.name   promise1Test067
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_6700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      const p1 = Promise.reject('immediate race error');
      const p2 = new Promise<string>((resolve) => setTimeout(() => resolve('race success'), 100));
      await Promise.race([p1, p2]).catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"immediate race error"}');
    });

    /**
     * @tc.name   promise1Test068
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_6800
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      const p1 = new Promise<string>((resolve) => setTimeout(() => resolve('race success'), 150));
      const p2 = new Promise<string>((res, reject) => setTimeout(() => reject('race error'), 100));
      await Promise.race([p1, p2]).catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"race error"}');
    });


    /**
     * @tc.name   promise1Test071
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await new Promise<void>((resolve) => {
        list.add('Promise step1');
        resolve();
      }).then(() => list.add('Promise step2'));
      expect(JSON.stringify(list)).assertEqual('{"0":"Promise step1","1":"Promise step2"}');
    });

    /**
     * @tc.name   promise1Test072
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let order = new Array<number>();
      let list = new ArrayList<string>();
      new Promise<void>((resolve) => resolve()).then(() => order.push(1));
      new Promise<void>((resolve) => resolve()).then(() => order.push(2));
      new Promise<void>((resolve) => resolve()).then(() => order.push(3));
      setTimeout(() => list.add(order.join(', ')), 0);
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"1, 2, 3"}');
    });

    /**
     * @tc.name   promise1Test073
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7300
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      await new Promise<number>((resolve) => resolve(10))
        .then((num) => num + 5)
        .then((num) => {
          throw new Error(`number is ${num}`);
        })
        .then((num) => list.add('jump'))
        .catch((err: Error) => list.add(err.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"number is 15"}');
    });

    /**
     * @tc.name   promise1Test074
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      await new Promise<void>((res, reject) => reject('error'))
        .catch((err: Error) => {
          list.add(err);
          return 'step2';
        })
        .then((val) => list.add('step3' + val));
      expect(JSON.stringify(list)).assertEqual('{"0":"error","1":"step3step2"}')
    });

    /**
     * @tc.name   promise1Test075
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      await new Promise<string>((resolve) => resolve('out values'))
        .then((outerVal) => {
          return new Promise<string>((resolve) => resolve(outerVal))
            .then((innerVal) => innerVal + ' inner values')
            .then((innerVal) => {
              throw new Error(`innererror: ${innerVal}`);
            });
        })
        .catch((outerErr: Error) => list.add('outsideerror:' + outerErr.message));
      expect(JSON.stringify(list)).assertEqual('{"0":"outsideerror:innererror: out values inner values"}');
    });

    /**
     * @tc.name   promise1Test076
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      await new Promise<string>((resolve) => resolve('key'))
        .then((outerVal) => {
          return new Promise<string>((resolve) => resolve(outerVal))
            .then((innerVal) => {
              throw new Error('inner error');
            })
            .catch((innerErr: Error) => {
              list.add('inner catch:' + innerErr.message);
              return outerVal + 'success';
            });
        })
        .then((val) => list.add('outside then:' + val));
      expect(JSON.stringify(list)).assertEqual('{"0":"inner catch:inner error","1":"outside then:keysuccess"}');
    });

    /**
     * @tc.name   promise1Test077
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      await new Promise<string>((res, reject) => reject('first1'))
        .catch((err: Error) => {
          list.add(err);
          return Promise.reject('second error');
        })
        .catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"first1","1":"second error"}');
    });

    /**
     * @tc.name   promise1Test078
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7800
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | Error>();
      await new Promise<string>((res, reject) => reject('test error'))
        .then(null, (err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"test error"}');
    });

    /**
     * @tc.name   promise1Test079
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_7900
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<boolean>();
      let res = "";
      const originalPromise = new Promise<string>((resolve) => resolve('Promise1'));
      const resolvedPromise = Promise.resolve(originalPromise);
      list.add(originalPromise === resolvedPromise);
      await resolvedPromise.then((val) => res = val);
      expect(res).assertEqual('Promise1');
      expect(JSON.stringify(list)).assertEqual('{"0":true}');
    });

    /**
     * @tc.name   promise1Test081
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_8100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      await unhandledAwaitError().catch((err: Error) => list.add(err));
      expect(JSON.stringify(list)).assertEqual('{"0":"await error"}');
    });


    /**
     * @tc.name   promise1Test085
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_8500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | number>();
      await new Promise<number>((resolve) => resolve(100))
        .finally(() => list.add('finally exce'))
        .then((num) => list.add(num * 2));
      expect(JSON.stringify(list)).assertEqual('{"0":"finally exce","1":200}');
    });

    /**
     * @tc.name   promise1Test086
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_8600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | number>();
      new Promise<string>((resolve) => resolve('start flag'))
        .finally(() => new Promise<string>((resolve) => setTimeout(() => resolve('finally '), 100)))
        .then((val) => list.add(val));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"start flag"}');
    });

    /**
     * @tc.name   promise1Test087
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_8700
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | number>();
      new Promise<string>((resolve) => resolve('sucessful'))
        .finally(() => {
          throw new Error('finally');
        })
        .then((val) => list.add('no exce'))
        .catch((err: Error) => list.add('catch finally error:' + err.message));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"catch finally error:finally"}');
    });

    /**
     * @tc.name   promise1Test091
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_9100
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | number>();
      await new Promise<string>((resolve) => resolve('start1'))
        .then((val) => {
          list.add('before:' + val);
          return undefined;
        })
        .then((val) => list.add('after:' + (val === undefined)));
      expect(JSON.stringify(list)).assertEqual('{"0":"before:start1","1":"after:true"}');
    });

    /**
     * @tc.name   promise1Test092
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_9200
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | number>();
      await new Promise<number>((resolve) => resolve(5))
        .then((num) => list.add('before:' + num))
        .then((val) => list.add('after:' + (val === undefined)));
      expect(JSON.stringify(list)).assertEqual('{"0":"before:5","1":"after:false"}');
    });

    /**
     * @tc.name   promise1Test093
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_9300
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string | number>();
      new Promise<string>((resolve) => resolve('start'))
        .then()
        .then()
        .then((val) => list.add('final' + val));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"finalstart"}');
    });

    /**
     * @tc.name   promise1Test094
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_9400
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<Error>();
      const p1 = Promise.resolve('success');
      const p2 = Promise.reject('failed');
      Promise.all([p1, p2]).catch((err: Error) => list.add(err));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"failed"}');
    });

    /**
     * @tc.name   promise1Test095
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_9500
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const p1 = new Promise<string>((resolve) => setTimeout(() => resolve('p1 success'), 100));
      const p2 = new Promise<string>((res, reject) => setTimeout(() => reject('p2 failed'), 200));
      Promise.allSettled([p1, p2]).then((results) => {
        list.add('p1 status:' + results[0].status);
        list.add('p2 status:' + results[1].status);
      });
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"p1 status:fulfilled","1":"p2 status:rejected"}');
    });

    /**
     * @tc.name   promise1Test096
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_9600
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      const p1 = Promise.resolve('start');
      const p2 = new Promise<void>((res, reject) => setTimeout(() => reject('failed'), 100));
      Promise.any([p1, p2]).then((val) => list.add('call:' + val));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"call:start"}');
    });

    /**
     * @tc.name   promise1Test099
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_9900
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      new Promise<string>((resolve) => {
        resolve('first resolve');
        resolve('second resolve');
        resolve('third resolve');
      }).then((val) => list.add('call:' + val));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"call:first resolve"}');
    });

    /**
     * @tc.name   promise1Test100
     * @tc.number SUB_BUILTINS_PROMISE1_TEST_10000
     * @tc.desc   test promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promise1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new ArrayList<string>();
      new Promise<string>((resolve, reject) => {
        resolve('resolve');
        reject('reject');
      }).then((val) => list.add('re:' + val))
        .catch((err: Error) => list.add('noPass:' + err));
      await sleep(500);
      expect(JSON.stringify(list)).assertEqual('{"0":"re:resolve"}');
    });


  })
}

async function getValue() {
  let value = await new Promise<string>((resolve) => resolve('async success'));
  return value;
}

async function handleError() {
  let list = new ArrayList<string>();
  try {
    await new Promise<string>((resolve, reject) => reject('async error'));
  } catch (err) {
    list.add(err);
  }
  return list;
}

async function returnPromise() {
  return 'async return';
}

function delay(ms: number) {
  return new Promise<void>((resolve, res) => setTimeout(resolve, ms));
}

function riskyDelay(ms: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      const error = new Error('delay error');
      reject(error);
    }, ms);
  });
}


async function asyncThrow() {
  throw new Error('async throw error');
}

let flag = 0;

function delayLog(ms: number, msg: string) {
  return new Promise<void>((resolve) => setTimeout(() => {
    flag++;
    resolve();
  }, ms));
}

async function sequential() {
  await delayLog(100, 'seq1');
  await delayLog(100, 'seq2');
}


function delay57(ms: number, val: string) {
  return new Promise<string>((resolve) => setTimeout(() => resolve(val), ms));
}

async function sequentialAwait57() {
  let list = new ArrayList<string>();
  const res1 = await delay57(100, 'first');
  const res2 = await delay57(50, 'second');
  list.add(res1);
  list.add(res2);
  return list;
}

async function getAsyncValue() {
  return 'async return value';
}

async function throwAsyncError() {
  throw new Error('async function error');
}

async function unhandledAwaitError() {
  await Promise.reject('await error');
}

