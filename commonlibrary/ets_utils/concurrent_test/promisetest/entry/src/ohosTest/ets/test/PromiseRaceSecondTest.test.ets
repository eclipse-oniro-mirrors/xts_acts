/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/TestUtils';

export default function TaskpoolPromiseRaceSecondTest() {
  describe('TaskpoolPromiseRaceSecondTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info('TaskpoolPromiseRaceSecondTest beforeAll called');
    })

    beforeEach(async () => {
      await sleep(200);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      // Add delay to ensure resources from the previous test case are released
      console.info('TaskpoolPromiseRaceSecondTest beforeEach called');
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('TaskpoolPromiseRaceSecondTest afterEach called');
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info('TaskpoolPromiseRaceSecondTest afterAll called');
    })


    /**
     * @tc.name   PromiseSecondRaceTest2700
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_2700
     * @tc.desc   Test Promise.race where promise gets then handler first, then added to race, then race gets then handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest2700';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let p1ThenResult: string = '';
        let raceThenResult: string = '';

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.then attaching');
        p1.then(value => {
          executionOrder.push('p1.then executing');
          p1ThenResult = value;
          return 'p1 then processed';
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise.then attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          raceThenResult = value;
          return 'race then processed';
        });
        executionOrder.push('racePromise.then attached');

        await sleep(100);
        executionOrder.push('after wait');

        expect(p1ThenResult).assertEqual('p1 result');
        expect(raceThenResult).assertEqual('p1 result');

        const expectedOrder = [
          'p1 created',
          'p1 definition completed',
          'p1.then attaching',
          'p1.then attached',
          'race start',
          'race promise created',
          'racePromise.then attaching',
          'racePromise.then attached',
          'p1 resolving',
          'p1.then executing',
          'racePromise.then executing',
          'after wait'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest2800
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_2800
     * @tc.desc   Test Promise.race where promise gets then handler that throws exception, then added to race, then race gets then handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest2800';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let raceThenCalled = false;
        let raceCatchCalled = false;

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.then attaching');
        p1.then(_ => {
          executionOrder.push('p1.then executing');
          executionOrder.push('p1.then throwing error');
          throw new Error('Error in p1.then');
        }).catch((error: Error) => {
          executionOrder.push('p1.catch executing');
          executionOrder.push(`p1.catch error: ${error.message}`);
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then(_ => {
          executionOrder.push('racePromise.then executing');
          raceThenCalled = true;
          return 'race then processed';
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(100);
        executionOrder.push('after wait');

        expect(raceThenCalled).assertEqual(true);
        expect(raceCatchCalled).assertEqual(false);

        const expectedEvents = [
          'p1 created',
          'p1 definition completed',
          'p1.then attaching',
          'p1.then attached',
          'race start',
          'race promise created',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 resolving',
          'p1.then executing',
          'p1.then throwing error',
          'p1.catch executing',
          'p1.catch error: Error in p1.then',
          'racePromise.then executing',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const p1ThenThrowingIndex = executionOrder.indexOf('p1.then throwing error');
        const p1CatchIndex = executionOrder.indexOf('p1.catch executing');

        expect(p1ThenThrowingIndex).assertLess(p1CatchIndex);

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest2900
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_2900
     * @tc.desc   Test Promise.race where promise is added to race, then gets then handler that throws, then race gets then handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest2900';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let raceThenCalled = false;
        let raceCatchCalled = false;

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('p1.then attaching');
        p1.then(_ => {
          executionOrder.push('p1.then executing');
          executionOrder.push('p1.then throwing error');
          throw new Error('Error in p1.then');
        }).catch((error: Error) => {
          executionOrder.push('p1.catch executing');
          executionOrder.push(`p1.catch error: ${error.message}`);
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then(_ => {
          executionOrder.push('racePromise.then executing');
          raceThenCalled = true;
          return 'race then processed';
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(100);
        executionOrder.push('after wait');

        expect(raceThenCalled).assertEqual(true);
        expect(raceCatchCalled).assertEqual(false);

        const expectedEvents = [
          'p1 created',
          'p1 definition completed',
          'race start',
          'race promise created',
          'p1.then attaching',
          'p1.then attached',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 resolving',
          'p1.then executing',
          'p1.then throwing error',
          'p1.catch executing',
          'p1.catch error: Error in p1.then',
          'racePromise.then executing',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const racePromiseThenIndex = executionOrder.indexOf('racePromise.then executing');
        const p1ThenThrowingIndex = executionOrder.indexOf('p1.then throwing error');

        expect(p1ResolvingIndex).assertLess(p1ThenThrowingIndex);
        expect(p1ThenThrowingIndex).assertLess(racePromiseThenIndex);

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3000
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3000
     * @tc.desc   Test Promise.race where promise is added to race, promise gets catch handler, race gets catch handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3000';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let p1CatchCalled = false;
        let raceCatchCalled = false;

        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 rejection'));
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('p1.catch attaching');
        p1.catch((error: Error) => {
          executionOrder.push('p1.catch executing');
          executionOrder.push(`p1.catch error: ${error.message}`);
          p1CatchCalled = true;
        });
        executionOrder.push('p1.catch attached');

        executionOrder.push('racePromise.catch attaching');
        racePromise.catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise.catch attached');

        await sleep(100);
        executionOrder.push('after wait');

        expect(p1CatchCalled).assertEqual(true);
        expect(raceCatchCalled).assertEqual(true);

        const expectedEvents = [
          'p1 created',
          'p1 definition completed',
          'race start',
          'race promise created',
          'p1.catch attaching',
          'p1.catch attached',
          'racePromise.catch attaching',
          'racePromise.catch attached',
          'p1 rejecting',
          'p1.catch executing',
          'p1.catch error: p1 rejection',
          'racePromise.catch executing',
          'racePromise.catch error: p1 rejection',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const p1RejectingIndex = executionOrder.indexOf('p1 rejecting');
        const p1CatchExecutingIndex = executionOrder.indexOf('p1.catch executing');

        expect(p1RejectingIndex).assertLess(p1CatchExecutingIndex);

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3100
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3100
     * @tc.desc   Test Promise.race where promise gets catch handler first, then added to race, then race gets catch handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3100';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let p1CatchCalled = false;
        let p1CaughtErrorMsg: string = '';
        let raceCatchCalled = false;
        let raceCaughtErrorMsg: string = '';

        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 rejection first catch'));
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.catch attaching');
        p1.catch((error: Error) => {
          executionOrder.push('p1.catch executing');
          executionOrder.push(`p1.catch error: ${error.message}`);
          p1CatchCalled = true;
          p1CaughtErrorMsg = error.message;
        });
        executionOrder.push('p1.catch attached');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise.catch attaching');
        racePromise.catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
          raceCaughtErrorMsg = error.message;
        });
        executionOrder.push('racePromise.catch attached');

        await sleep(100);
        executionOrder.push('after wait');

        expect(p1CatchCalled).assertEqual(true);
        expect(raceCatchCalled).assertEqual(true);
        expect(p1CaughtErrorMsg).assertEqual('p1 rejection first catch');
        expect(raceCaughtErrorMsg).assertEqual('p1 rejection first catch');

        const expectedEvents = [
          'p1 created',
          'p1 definition completed',
          'p1.catch attaching',
          'p1.catch attached',
          'race start',
          'race promise created',
          'racePromise.catch attaching',
          'racePromise.catch attached',
          'p1 rejecting',
          'p1.catch executing',
          'p1.catch error: p1 rejection first catch',
          'racePromise.catch executing',
          'racePromise.catch error: p1 rejection first catch',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const p1RejectingIndex = executionOrder.indexOf('p1 rejecting');
        const p1CatchExecutingIndex = executionOrder.indexOf('p1.catch executing');

        expect(p1RejectingIndex).assertLess(p1CatchExecutingIndex);

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3200
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3200
     * @tc.desc   Test Promise.race where promise gets then, added to race, promise gets finally that throws, race gets then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3200';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let p1ThenCalled = false;
        let p1FinallyCalled = false;
        let p1FinallyCatchCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;

        const p1 = new Promise<string>((resolve) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result finally test');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.then attaching');
        p1.then(_ => {
          executionOrder.push('p1.then executing');
          p1ThenCalled = true;
          return 'p1 then processed';
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('p1.finally attaching');
        p1.finally(() => {
          executionOrder.push('p1.finally executing');
          p1FinallyCalled = true;
          executionOrder.push('p1.finally throwing error');
          throw new Error('Error in p1.finally');
        }).catch((error: Error) => {
          executionOrder.push('p1.finally.catch executing');
          executionOrder.push(`p1.finally.catch error: ${error.message}`);
          p1FinallyCatchCalled = true;
        });
        executionOrder.push('p1.finally attached');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          executionOrder.push(`racePromise.then value: ${value}`);
          raceThenCalled = true;
          return 'race then processed';
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(150); // Increased sleep to ensure finally and its catch execute
        executionOrder.push('after wait');

        expect(p1ThenCalled).assertEqual(true);
        expect(p1FinallyCalled).assertEqual(true);
        expect(p1FinallyCatchCalled).assertEqual(true);
        expect(raceThenCalled).assertEqual(true);
        expect(raceCatchCalled).assertEqual(false);

        const expectedEvents = [
          'p1 created',
          'p1 definition completed',
          'p1.then attaching',
          'p1.then attached',
          'race start',
          'race promise created',
          'p1.finally attaching',
          'p1.finally attached',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 resolving',
          'p1.then executing',
          'p1.finally executing',
          'p1.finally throwing error',
          'p1.finally.catch executing',
          'p1.finally.catch error: Error in p1.finally',
          'racePromise.then executing',
          'racePromise.then value: p1 result finally test',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const p1ThenIndex = executionOrder.indexOf('p1.then executing');
        const p1FinallyIndex = executionOrder.indexOf('p1.finally executing');
        const p1FinallyCatchIndex = executionOrder.indexOf('p1.finally.catch executing');
        const raceThenIndex = executionOrder.indexOf('racePromise.then executing');

        expect(p1ResolvingIndex).assertLess(p1ThenIndex);
        expect(p1ThenIndex).assertLess(p1FinallyIndex);
        expect(p1FinallyIndex).assertLess(p1FinallyCatchIndex);
        expect(p1FinallyIndex).assertLess(raceThenIndex);

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3300
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3300
     * @tc.desc   Test Promise.race where promise gets then, then finally that throws, then added to race, then race gets then handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3300';
      console.info(`${caseName} test start`);
      try {
        const executionOrder: string[] = [];
        let p1ThenCalled = false;
        let p1FinallyCalled = false;
        let p1FinallyCatchCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;
        let raceThenValue: string | null = null;

        const p1 = new Promise<string>((resolve) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result 3300');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.then attaching');
        p1.then(_ => {
          executionOrder.push('p1.then executing');
          p1ThenCalled = true;
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('p1.finally attaching');
        p1.finally(() => {
          executionOrder.push('p1.finally executing');
          p1FinallyCalled = true;
          executionOrder.push('p1.finally throwing error');
          throw new Error('Error in p1.finally 3300');
        }).catch((error: Error) => {
          executionOrder.push('p1.finally.catch executing');
          executionOrder.push(`p1.finally.catch error: ${error.message}`);
          p1FinallyCatchCalled = true;
        });
        executionOrder.push('p1.finally attached');


        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          executionOrder.push(`racePromise.then value: ${value}`);
          raceThenCalled = true;
          raceThenValue = value;
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(150);
        executionOrder.push('after wait');

        expect(p1ThenCalled).assertTrue();
        expect(p1FinallyCalled).assertTrue();
        expect(p1FinallyCatchCalled).assertTrue();
        expect(raceThenCalled).assertTrue();
        expect(raceCatchCalled).assertFalse();
        expect(raceThenValue).assertEqual('p1 result 3300');

        const expectedOrder = [
          'p1 created',
          'p1 definition completed',
          'p1.then attaching',
          'p1.then attached',
          'p1.finally attaching',
          'p1.finally attached',
          'race start',
          'race promise created',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 resolving',
          'p1.then executing',
          'p1.finally executing',
          'p1.finally throwing error',
          'p1.finally.catch executing',
          'p1.finally.catch error: Error in p1.finally 3300',
          'racePromise.then executing',
          'racePromise.then value: p1 result 3300',
          'after wait'
        ];
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3400
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3400
     * @tc.desc   Test Promise.race where promise gets then, then finally, then added to race, then race gets then handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3400';
      console.info(`${caseName} test start`);
      try {
        const executionOrder: string[] = [];
        let p1ThenCalled = false;
        let p1FinallyCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;
        let raceThenValue: string | null = null;

        const p1 = new Promise<string>((resolve) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result 3400');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.then attaching');
        p1.then(_ => {
          executionOrder.push('p1.then executing');
          p1ThenCalled = true;
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('p1.finally attaching');
        p1.finally(() => {
          executionOrder.push('p1.finally executing');
          p1FinallyCalled = true;
        });
        executionOrder.push('p1.finally attached');


        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          executionOrder.push(`racePromise.then value: ${value}`);
          raceThenCalled = true;
          raceThenValue = value;
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(150);
        executionOrder.push('after wait');

        expect(p1ThenCalled).assertTrue();
        expect(p1FinallyCalled).assertTrue();
        expect(raceThenCalled).assertTrue();
        expect(raceCatchCalled).assertFalse();
        expect(raceThenValue).assertEqual('p1 result 3400');

        const expectedOrder = [
          'p1 created',
          'p1 definition completed',
          'p1.then attaching',
          'p1.then attached',
          'p1.finally attaching',
          'p1.finally attached',
          'race start',
          'race promise created',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 resolving',
          'p1.then executing',
          'p1.finally executing',
          'racePromise.then executing',
          'racePromise.then value: p1 result 3400',
          'after wait'
        ];
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3500
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3500
     * @tc.desc   Test Promise.race where input promise p1 rejects, is added to race. The racePromise chain then has .catch -> .finally (throws error) -> .catch -> .then. Verify the final .then executes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3500';
      console.info(`${caseName} test start`);
      try {
        const executionOrder: string[] = [];
        let p1CatchCalled = false;
        let raceFinallyCalled = false;
        let raceFinallyCatchCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;

        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 rejection 3500'));
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        p1.catch((error: Error): void => {
          executionOrder.push('p1 original catch (optional)');
          console.info(`${caseName} p1 caught optional error: ${error.message}`);
          p1CatchCalled = true;
        });

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise handlers attaching');

        racePromise.catch((error: Error): Promise<void> => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
          return Promise.resolve();
        }).finally((): Promise<void> => {
          executionOrder.push('racePromise.finally executing');
          raceFinallyCalled = true;
          executionOrder.push('racePromise.finally throwing error');
          throw new Error('Error in racePromise.finally 3500');
        }).catch((error: Error): Promise<void> => {
          executionOrder.push('racePromise.finally.catch executing');
          executionOrder.push(`racePromise.finally.catch error: ${error.message}`);
          raceFinallyCatchCalled = true;
          return Promise.resolve();
        }).then((): Promise<void> => {
          executionOrder.push('racePromise.then executing');
          raceThenCalled = true;
          return Promise.resolve();
        });
        executionOrder.push('racePromise handlers attached');
        await sleep(150);
        executionOrder.push('after wait');
        expect(p1CatchCalled).assertTrue();
        expect(raceCatchCalled).assertTrue();
        expect(raceFinallyCalled).assertTrue();
        expect(raceFinallyCatchCalled).assertTrue();
        expect(raceThenCalled).assertTrue();
        const expectedOrder = [
          'p1 created',
          'p1 definition completed',
          'race start',
          'race promise created',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 rejecting',
          'p1 original catch (optional)',
          'racePromise.catch executing',
          'racePromise.catch error: p1 rejection 3500',
          'racePromise.finally executing',
          'racePromise.finally throwing error',
          'racePromise.finally.catch executing',
          'racePromise.finally.catch error: Error in racePromise.finally 3500',
          'racePromise.then executing',
          'after wait'
        ];
        expect(executionOrder.indexOf('p1 rejecting')).assertLess(executionOrder.indexOf('racePromise.catch executing'));
        expect(executionOrder.indexOf('racePromise.catch executing')).assertLess(executionOrder.indexOf('racePromise.finally executing'));
        expect(executionOrder.indexOf('racePromise.finally throwing error')).assertLess(executionOrder.indexOf('racePromise.finally.catch executing'));
        expect(executionOrder.indexOf('racePromise.finally.catch executing')).assertLess(executionOrder.indexOf('racePromise.then executing'));
        expectedOrder.forEach((event: string): void => expect(executionOrder.includes(event)).assertTrue());

      } catch (error) {
        let errorMessage = `${caseName} Test failed with unknown error type`;
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3600
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3600
     * @tc.desc   Test Promise.race where input promise p1 rejects. p1 gets a .finally handler (throws error, caught). Original p1 is added to race. Verify racePromise executes .catch reflecting p1's original rejection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3600';
      console.info(`${caseName} test start`);
      try {
        const executionOrder: string[] = [];
        let p1FinallyCalled = false;
        let p1FinallyCatchCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;
        let raceCaughtErrorMsg: string | null = null;

        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 rejection 3600'));
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.finally attaching');

        p1.finally((): Promise<void> => {
          executionOrder.push('p1.finally executing');
          p1FinallyCalled = true;
          executionOrder.push('p1.finally throwing error');
          throw new Error('Error in p1.finally 3600');
        }).catch((error: Error): Promise<void> => {
          executionOrder.push('p1.finally.catch executing');
          executionOrder.push(`p1.finally.catch error: ${error.message}`);
          p1FinallyCatchCalled = true;
          return Promise.resolve();
        });
        executionOrder.push('p1.finally attached');

        executionOrder.push('race start');

        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then((_: string): Promise<void> => {
          executionOrder.push('racePromise.then executing');
          raceThenCalled = true;
          return Promise.resolve();
        }).catch((error: Error): Promise<void> => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
          raceCaughtErrorMsg = error.message;
          return Promise.resolve();
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(150);
        executionOrder.push('after wait');

        expect(p1FinallyCalled).assertTrue();
        expect(p1FinallyCatchCalled).assertTrue();
        expect(raceThenCalled).assertFalse();
        expect(raceCatchCalled).assertTrue();
        expect(raceCaughtErrorMsg).assertEqual('p1 rejection 3600');

        const expectedOrder = [
          'p1 created',
          'p1 definition completed',
          'p1.finally attaching',
          'p1.finally attached',
          'race start',
          'race promise created',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 rejecting',

          'p1.finally executing',
          'p1.finally throwing error',
          'p1.finally.catch executing',
          'p1.finally.catch error: Error in p1.finally 3600',
          'racePromise.catch executing',
          'racePromise.catch error: p1 rejection 3600',
          'after wait'
        ];

        expect(executionOrder.indexOf('p1 rejecting')).assertLess(executionOrder.indexOf('p1.finally executing'));
        expect(executionOrder.indexOf('p1 rejecting')).assertLess(executionOrder.indexOf('racePromise.catch executing'));
        expect(executionOrder.indexOf('p1.finally throwing error')).assertLess(executionOrder.indexOf('p1.finally.catch executing'));
        expectedOrder.forEach((event: string): void => expect(executionOrder.includes(event)).assertTrue());

      } catch (error) {
        let errorMessage = `${caseName} Test failed with unknown error type`;
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3700
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3700
     * @tc.desc   Test Promise.race where promise rejects first, gets finally handler, then is added to race, then race gets then handler - verifying execution order with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3700';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let p1RejectCalled = false;
        let p1FinallyCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;
        let raceCaughtErrorMsg: string | null = null;

        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 rejection 3700'));
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.finally attaching');
        p1.finally(() => {
          executionOrder.push('p1.finally executing');
          p1FinallyCalled = true;
        });
        executionOrder.push('p1.finally attached');

        executionOrder.push('p1.catch attaching');
        p1.catch((error: Error) => {
          executionOrder.push('p1.catch executing');
          executionOrder.push(`p1.catch error: ${error.message}`);
          p1RejectCalled = true;
        });
        executionOrder.push('p1.catch attached');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          executionOrder.push(`racePromise.then value: ${value}`);
          raceThenCalled = true;
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
          raceCaughtErrorMsg = error.message;
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(150);
        executionOrder.push('after wait');

        expect(p1RejectCalled).assertTrue();
        expect(p1FinallyCalled).assertTrue();
        expect(raceThenCalled).assertFalse();
        expect(raceCatchCalled).assertTrue();
        expect(raceCaughtErrorMsg).assertEqual('p1 rejection 3700');

        const expectedEvents = [
          'p1 created',
          'p1 definition completed',
          'p1.finally attaching',
          'p1.finally attached',
          'p1.catch attaching',
          'p1.catch attached',
          'race start',
          'race promise created',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 rejecting',
          'p1.catch executing',
          'p1.catch error: p1 rejection 3700',
          'p1.finally executing',
          'racePromise.catch executing',
          'racePromise.catch error: p1 rejection 3700',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const p1RejectingIndex = executionOrder.indexOf('p1 rejecting');
        const p1CatchIndex = executionOrder.indexOf('p1.catch executing');
        const p1FinallyIndex = executionOrder.indexOf('p1.finally executing');
        const raceCatchIndex = executionOrder.indexOf('racePromise.catch executing');

        expect(p1RejectingIndex).assertLess(p1CatchIndex);
        expect(p1RejectingIndex).assertLess(p1FinallyIndex);
        expect(p1RejectingIndex).assertLess(raceCatchIndex);

      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3800
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3800
     * @tc.desc   Test Promise.race where promise resolves, then handler throws exception, then added to race, then race gets then handler - verifying execution order with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3800';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let p1ThenCalled = false;
        let p1ThenCatchCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result 3800');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('p1.then attaching');
        p1.then(value => {
          executionOrder.push('p1.then executing');
          executionOrder.push(`p1.then value: ${value}`);
          p1ThenCalled = true;
          executionOrder.push('p1.then throwing error');
          throw new Error('Error in p1.then 3800');
        }).catch((error: Error) => {
          executionOrder.push('p1.then.catch executing');
          executionOrder.push(`p1.then.catch error: ${error.message}`);
          p1ThenCatchCalled = true;
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise handlers attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          executionOrder.push(`racePromise.then value: ${value}`);
          raceThenCalled = true;
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');

        await sleep(150);
        executionOrder.push('after wait');

        expect(p1ThenCalled).assertTrue();
        expect(p1ThenCatchCalled).assertTrue();
        expect(raceThenCalled).assertTrue();
        expect(raceCatchCalled).assertFalse();

        const expectedOrder = [
          'p1 created',
          'p1 definition completed',
          'p1.then attaching',
          'p1.then attached',
          'race start',
          'race promise created',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1 resolving',
          'p1.then executing',
          'p1.then value: p1 result 3800',
          'p1.then throwing error',
          'p1.then.catch executing',
          'p1.then.catch error: Error in p1.then 3800',
          'racePromise.then executing',
          'racePromise.then value: p1 result 3800',
          'after wait'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const p1ThenIndex = executionOrder.indexOf('p1.then executing');
        const p1ThenThrowingIndex = executionOrder.indexOf('p1.then throwing error');
        const p1ThenCatchIndex = executionOrder.indexOf('p1.then.catch executing');
        const raceThenIndex = executionOrder.indexOf('racePromise.then executing');

        expect(p1ResolvingIndex).assertLess(p1ThenIndex);
        expect(p1ThenIndex).assertLess(p1ThenThrowingIndex);
        expect(p1ThenThrowingIndex).assertLess(p1ThenCatchIndex);
        expect(p1ThenIndex).assertLess(raceThenIndex);

      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest3900
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_3900
     * @tc.desc   Test Promise.race where promise resolves first, then is added to race, then promise.then throws exception, then race gets then handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest3900';
      console.info(`${caseName} test start`);
      
      try {
        const executionOrder: string[] = [];
        let p1ThenCalled = false;
        let p1ThenCatchCalled = false;
        let raceThenCalled = false;
        let raceCatchCalled = false;
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result 3900');
          }, 50);
        });
        executionOrder.push('p1 definition completed');
        
        await sleep(100);
        executionOrder.push('after p1 resolution wait');
        
        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');
        
        executionOrder.push('p1.then attaching');
        p1.then(value => {
          executionOrder.push('p1.then executing');
          executionOrder.push(`p1.then value: ${value}`);
          p1ThenCalled = true;
          executionOrder.push('p1.then throwing error');
          throw new Error('Error in p1.then 3900');
        }).catch((error: Error) => {
          executionOrder.push('p1.then.catch executing');
          executionOrder.push(`p1.then.catch error: ${error.message}`);
          p1ThenCatchCalled = true;
        });
        executionOrder.push('p1.then attached');
        
        executionOrder.push('racePromise handlers attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          executionOrder.push(`racePromise.then value: ${value}`);
          raceThenCalled = true;
        }).catch((error: Error) => {
          executionOrder.push('racePromise.catch executing');
          executionOrder.push(`racePromise.catch error: ${error.message}`);
          raceCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');
        
        await sleep(100);
        executionOrder.push('after final wait');
        
        expect(p1ThenCalled).assertTrue();
        expect(p1ThenCatchCalled).assertTrue();
        expect(raceThenCalled).assertTrue();
        expect(raceCatchCalled).assertFalse();
        
        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const racingStartIndex = executionOrder.indexOf('race start');
        const p1ThenThrowingIndex = executionOrder.indexOf('p1.then throwing error');
        const p1ThenCatchIndex = executionOrder.indexOf('p1.then.catch executing');
        
        expect(p1ResolvingIndex).assertLess(racingStartIndex);
        expect(p1ThenThrowingIndex).assertLess(p1ThenCatchIndex);
        
        const expectedEvents = [
          'p1 created',
          'p1 definition completed',
          'p1 resolving',
          'after p1 resolution wait',
          'race start',
          'race promise created',
          'p1.then attaching',
          'p1.then attached',
          'racePromise handlers attaching',
          'racePromise handlers attached',
          'p1.then executing',
          'p1.then value: p1 result 3900',
          'p1.then throwing error',
          'p1.then.catch executing',
          'p1.then.catch error: Error in p1.then 3900',
          'racePromise.then executing',
          'racePromise.then value: p1 result 3900',
          'after final wait'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest4000
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_4000
     * @tc.desc   Test Promise.race where promise resolves first, then is added to race, then race.then throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest4000';
      console.info(`${caseName} test start`);
      
      try {
        const executionOrder: string[] = [];
        let p1ThenCalled = false;
        let raceThenCalled = false;
        let raceThenCatchCalled = false;
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result 4000');
          }, 50);
        });
        executionOrder.push('p1 definition completed');
        
        await sleep(100);
        executionOrder.push('after p1 resolution wait');
        
        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');
        
        executionOrder.push('p1.then attaching');
        p1.then(value => {
          executionOrder.push('p1.then executing');
          executionOrder.push(`p1.then value: ${value}`);
          p1ThenCalled = true;
        });
        executionOrder.push('p1.then attached');
        
        executionOrder.push('racePromise handlers attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          executionOrder.push(`racePromise.then value: ${value}`);
          raceThenCalled = true;
          executionOrder.push('racePromise.then throwing error');
          throw new Error('Error in racePromise.then 4000');
        }).catch((error: Error) => {
          executionOrder.push('racePromise.then.catch executing');
          executionOrder.push(`racePromise.then.catch error: ${error.message}`);
          raceThenCatchCalled = true;
        });
        executionOrder.push('racePromise handlers attached');
        
        await sleep(100);
        executionOrder.push('after final wait');
        
        expect(p1ThenCalled).assertTrue();
        expect(raceThenCalled).assertTrue();
        expect(raceThenCatchCalled).assertTrue();
        
        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const racingStartIndex = executionOrder.indexOf('race start');
        const raceThenIndex = executionOrder.indexOf('racePromise.then executing');
        const raceThenThrowingIndex = executionOrder.indexOf('racePromise.then throwing error');
        const raceThenCatchIndex = executionOrder.indexOf('racePromise.then.catch executing');
        
        expect(p1ResolvingIndex).assertLess(racingStartIndex);
        expect(raceThenIndex).assertLess(raceThenThrowingIndex);
        expect(raceThenThrowingIndex).assertLess(raceThenCatchIndex);
        
        const expectedEvents = [
          'p1 created', 'p1 definition completed', 'p1 resolving', 'after p1 resolution wait',
          'race start', 'race promise created', 'p1.then attaching', 'p1.then attached',
          'racePromise handlers attaching', 'racePromise handlers attached', 'p1.then executing',
          'p1.then value: p1 result 4000', 'racePromise.then executing', 
          'racePromise.then value: p1 result 4000', 'racePromise.then throwing error',
          'racePromise.then.catch executing', 
          'racePromise.then.catch error: Error in racePromise.then 4000', 'after final wait'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest4100
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_4100
     * @tc.desc   Test Promise.race where two promises are added to race, promise1 resolves, race executes then/catch, then promise2 executes then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest4100';
      console.info(`${caseName} test start`);
      
      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        executionOrder.push('p1 defined');
        
        const p2 = new Promise<string>(resolve => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 resolving');
            resolve('p2 result');
          }, 100);
        });
        executionOrder.push('p2 defined');
        
        executionOrder.push('race created');
        const racePromise = Promise.race<string>([p1, p2]);
        
        await sleep(70);
        
        racePromise.then(value => {
          executionOrder.push(`race then: ${value}`);
        }).catch(() => {
          executionOrder.push('race catch');
        });
        executionOrder.push('race handlers added');
        
        p2.then(value => {
          executionOrder.push(`p2 then: ${value}`);
        });
        executionOrder.push('p2 handler added');
        
        await sleep(100);
        
        const expectedOrder = [
          'p1 created',
          'p1 defined',
          'p2 created',
          'p2 defined',
          'race created',
          'p1 resolving',
          'race handlers added',
          'p2 handler added',
          'race then: p1 result',
          'p2 resolving',
          'p2 then: p2 result'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error instanceof Error ? error.message : JSON.stringify(error)}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest4200
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_4200
     * @tc.desc   Test Promise.race where two promises are added to race, race executes then/catch handlers, then promise1 executes then, then promise2 executes catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest4200';
      console.info(`${caseName} test start`);
      
      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        executionOrder.push('p1 defined');
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 100);
        });
        executionOrder.push('p2 defined');
        
        executionOrder.push('race created');
        const racePromise = Promise.race<string>([p1, p2]);
        
        racePromise.then(value => {
          executionOrder.push(`race then: ${value}`);
        }).catch(() => {
          executionOrder.push('race catch');
        });
        executionOrder.push('race handlers added');
        
        p1.then(value => {
          executionOrder.push(`p1 then: ${value}`);
        });
        executionOrder.push('p1 handler added');
        
        p2.catch(() => {
          executionOrder.push('p2 catch');
        });
        executionOrder.push('p2 handler added');
        
        await sleep(150);
        
        const expectedOrder = [
          'p1 created',
          'p1 defined',
          'p2 created',
          'p2 defined',
          'race created',
          'race handlers added',
          'p1 handler added',
          'p2 handler added',
          'p1 resolving',
          'p1 then: p1 result',
          'race then: p1 result',
          'p2 rejecting',
          'p2 catch'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error instanceof Error ? error.message : JSON.stringify(error)}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest4300
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_4300
     * @tc.desc   Test Promise.race where two promises are added to race, then race executes then/catch handlers, then promise1 executes then, then promise2 executes catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest4300';
      console.info(`${caseName} test start`);
      
      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result 4300');
          }, 50);
        });
        executionOrder.push('p1 defined');
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error 4300'));
          }, 100);
        });
        executionOrder.push('p2 defined');
        
        executionOrder.push('race created');
        const racePromise = Promise.race<string>([p1, p2]);
        executionOrder.push('race defined');
        
        await sleep(70);
        executionOrder.push('after first sleep');
        
        executionOrder.push('race handlers attaching');
        racePromise.then(value => {
          executionOrder.push(`race then: ${value}`);
        }).catch(() => {
          executionOrder.push('race catch');
        });
        executionOrder.push('race handlers attached');
        
        executionOrder.push('p1 handler attaching');
        p1.then(value => {
          executionOrder.push(`p1 then: ${value}`);
        });
        executionOrder.push('p1 handler attached');
        
        executionOrder.push('p2 handler attaching');
        p2.catch((error: Error) => {
          executionOrder.push(`p2 catch: ${error.message}`);
        });
        executionOrder.push('p2 handler attached');
        
        await sleep(100);
        executionOrder.push('after final sleep');
        
        const expectedOrder = [
          'p1 created',
          'p1 defined',
          'p2 created',
          'p2 defined',
          'race created',
          'race defined',
          'p1 resolving',
          'after first sleep',
          'race handlers attaching',
          'race handlers attached',
          'p1 handler attaching',
          'p1 handler attached',
          'p2 handler attaching',
          'p2 handler attached',
          'race then: p1 result 4300',
          'p1 then: p1 result 4300',
          'p2 rejecting',
          'p2 catch: p2 error 4300',
          'after final sleep'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest4400
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_4400
     * @tc.desc   Test Promise.race where two promises are added to race, promise1 executes catch, race executes then/catch, promise2 executes then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest4400';
      console.info(`${caseName} test start`);
      
      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 error 4400'));
          }, 50);
        });
        executionOrder.push('p1 defined');
        
        const p2 = new Promise<string>(resolve => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 resolving');
            resolve('p2 result 4400');
          }, 100);
        });
        executionOrder.push('p2 defined');
        
        executionOrder.push('race created');
        const racePromise = Promise.race<string>([p1, p2]);
        executionOrder.push('race defined');
        
        executionOrder.push('p1 handler attaching');
        p1.catch((error: Error) => {
          executionOrder.push(`p1 catch: ${error.message}`);
        });
        executionOrder.push('p1 handler attached');
        
        await sleep(70);
        executionOrder.push('after first sleep');
        
        executionOrder.push('race handlers attaching');
        racePromise.then(value => {
          executionOrder.push(`race then: ${value}`);
        }).catch((error: Error) => {
          executionOrder.push(`race catch: ${error.message}`);
        });
        executionOrder.push('race handlers attached');
        
        executionOrder.push('p2 handler attaching');
        p2.then(value => {
          executionOrder.push(`p2 then: ${value}`);
        });
        executionOrder.push('p2 handler attached');
        
        await sleep(100);
        executionOrder.push('after final sleep');
        
        const expectedOrder = [
          'p1 created',
          'p1 defined',
          'p2 created',
          'p2 defined',
          'race created',
          'race defined',
          'p1 handler attaching',
          'p1 handler attached',
          'p1 rejecting',
          'p1 catch: p1 error 4400',
          'after first sleep',
          'race handlers attaching',
          'race handlers attached',
          'p2 handler attaching',
          'p2 handler attached',
          'race catch: p1 error 4400',
          'p2 resolving',
          'p2 then: p2 result 4400',
          'after final sleep'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseSecondRaceTest4500
     * @tc.number SUB_PROMISE_RACE_SECOND_TEST_4500
     * @tc.desc   Test Promise.race where promise1 executes catch and finally, two promises are added to race, promise2 executes then, race executes then/catch, promise2 executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSecondRaceTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseSecondRaceTest4500';
      console.info(`${caseName} test start`);
      
      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 error 4500'));
          }, 50);
        });
        executionOrder.push('p1 defined');
        
        executionOrder.push('p1 handlers attaching');
        p1.catch((error: Error) => {
          executionOrder.push(`p1 catch: ${error.message}`);
        }).finally(() => {
          executionOrder.push('p1 finally');
        });
        executionOrder.push('p1 handlers attached');
        
        const p2 = new Promise<string>(resolve => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 resolving');
            resolve('p2 result 4500');
          }, 100);
        });
        executionOrder.push('p2 defined');
        
        executionOrder.push('race created');
        const racePromise = Promise.race<string>([p1, p2]);
        executionOrder.push('race defined');
        
        await sleep(70);
        executionOrder.push('after first sleep');
        
        executionOrder.push('p2 then attaching');
        p2.then(value => {
          executionOrder.push(`p2 then: ${value}`);
        }).finally(() => {
          executionOrder.push('p2 finally');
        });
        executionOrder.push('p2 then attached');
        
        executionOrder.push('race handlers attaching');
        racePromise.then(value => {
          executionOrder.push(`race then: ${value}`);
        }).catch((error: Error) => {
          executionOrder.push(`race catch: ${error.message}`);
        });
        executionOrder.push('race handlers attached');
        
        await sleep(100);
        executionOrder.push('after final sleep');
        
        const expectedOrder = [
          'p1 created',
          'p1 defined',
          'p1 handlers attaching',
          'p1 handlers attached',
          'p2 created',
          'p2 defined',
          'race created',
          'race defined',
          'p1 rejecting',
          'p1 catch: p1 error 4500',
          'p1 finally',
          'after first sleep',
          'p2 then attaching',
          'p2 then attached',
          'race handlers attaching',
          'race handlers attached',
          'race catch: p1 error 4500',
          'p2 resolving',
          'p2 then: p2 result 4500',
          'p2 finally',
          'after final sleep'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        let errorMessage = '';
        if (error instanceof Error) {
          errorMessage = `${caseName} Test failed with error: ${error.message}`;
        } else {
          errorMessage = `${caseName} Test failed with non-Error: ${JSON.stringify(error)}`;
        }
        console.error(errorMessage);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });
  });
}