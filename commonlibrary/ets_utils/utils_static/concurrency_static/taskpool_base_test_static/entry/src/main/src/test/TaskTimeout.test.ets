/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import hilog from '@ohos.hilog';

function returnAbc(): string {
    return 'abc';
}

function returnInt(num: int):int {
    return num;
}

function longFunc(duration: int): string {
    let t = Date.now();
    while ((Date.now() - t) < duration) {
        continue;
    }
    return 'success';
}

function throwErrorFunc(): string {
    throw new Error('task error');
}

function longFuncAndError(duration: int): string {
    let t = Date.now();
    while ((Date.now() - t) < duration) {
        continue;
    }
    throw new Error('long task error');
}

export function sleep(time: int): Promise<number> {
  return new Promise<number>((re, je): void => {
    setTimeout(() => {
      re(1)
    }, time)
  })
}

export default function taskTimeoutTest() {
  describe('TaskTimeoutTest', (): void => {
    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0100
     * @tc.name TaskTimeoutTest001
     * @tc.desc execute without configs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskTimeoutTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest001';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, {});
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0200
     * @tc.name TaskTimeoutTest002
     * @tc.desc execute with priority only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskTimeoutTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest002';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { priority: taskpool.Priority.HIGH });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0300
     * @tc.name TaskTimeoutTest003
     * @tc.desc configs with only timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest003';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.execute(task, { timeout: 100 }).then((res) => {
          expect(res as string).assertEqual('abc');
        }).catch((err) => {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        });
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0400
     * @tc.name TaskTimeoutTest004
     * @tc.desc configs with priority and timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest004';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.execute(task, { priority: taskpool.Priority.HIGH, timeout: 100 }).then((res) => {
          expect(res as string).assertEqual('abc');
        }).catch((err) => {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        });
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0500
     * @tc.name TaskTimeoutTest005
     * @tc.desc timeout equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest005';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(longFunc, 1000);
          let res = await taskpool.execute(task, { timeout: 0 });
          expect(res as string).assertEqual('success');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0600
     * @tc.name TaskTimeoutTest006
     * @tc.desc timeout equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest006';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: -1 });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0700
     * @tc.name TaskTimeoutTest007
     * @tc.desc timeout equals -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest007';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: -100 });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0800
     * @tc.name TaskTimeoutTest008
     * @tc.desc timeout with decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest008';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.execute(task, { timeout: 1000.5 }).then((res) => {
          expect(res as string).assertEqual('abc');
        }).catch((err) => {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        });
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_0900
     * @tc.name TaskTimeoutTest009
     * @tc.desc timeout equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest009';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: NaN });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1000
     * @tc.name TaskTimeoutTest010
     * @tc.desc timeout equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest010';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: Infinity });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1100
     * @tc.name TaskTimeoutTest011
     * @tc.desc timeout equals -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest011';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: -Infinity });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1200
     * @tc.name TaskTimeoutTest012
     * @tc.desc timeout equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest012';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: undefined });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1300
     * @tc.name TaskTimeoutTest013
     * @tc.desc timeout not set with priority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest013';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { priority: taskpool.Priority.HIGH });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1400
     * @tc.name TaskTimeoutTest014
     * @tc.desc priority equals MEDIUM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest014';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { priority: taskpool.Priority.MEDIUM, timeout: 1000 });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1500
     * @tc.name TaskTimeoutTest015
     * @tc.desc priority equals LOW
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest015';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.execute(task, { priority: taskpool.Priority.LOW, timeout: 1000 }).then((res) => {
          expect(res as string).assertEqual('abc');
        }).catch((err) => {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        });
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1600
     * @tc.name TaskTimeoutTest016
     * @tc.desc priority equals IDLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest016';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.execute(task, { priority: taskpool.Priority.IDLE, timeout: 1000 }).then((res) => {
          expect(res as string).assertEqual('abc');
        }).catch((err) => {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        });
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1700
     * @tc.name TaskTimeoutTest017
     * @tc.desc priority equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest017';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.execute(task, { priority: undefined, timeout: 1000 }).then((res) => {
          expect(res as string).assertEqual('abc');
        }).catch((err) => {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        });
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_1900
     * @tc.name TaskTimeoutTest019
     * @tc.desc timeout equals 1ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest019';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(longFunc, 100);
        try {
          await taskpool.execute(task, { timeout: 1 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2000
     * @tc.name TaskTimeoutTest020
     * @tc.desc timeout equals uint32 max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest020';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: 4294967295 });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2100
     * @tc.name TaskTimeoutTest021
     * @tc.desc timeout equals uint32 max plus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest021';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: 4294967296 });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2200
     * @tc.name TaskTimeoutTest022
     * @tc.desc timeout equals MAX SAFE INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest022';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: Number.MAX_SAFE_INTEGER });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2300
     * @tc.name TaskTimeoutTest023
     * @tc.desc timeout equals MIN SAFE INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest023';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: Number.MIN_SAFE_INTEGER });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2400
     * @tc.name TaskTimeoutTest024
     * @tc.desc timeout equals task duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest024';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(longFunc, 1000);
        try {
          let res = await taskpool.execute(task, { timeout: 1000 });
          expect(res as string).assertEqual('success');
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2500
     * @tc.name TaskTimeoutTest025
     * @tc.desc timeout greater than task duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest025';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(longFunc, 1000);
          let res = await taskpool.execute(task, { timeout: 1100 });
          expect(res as string).assertEqual('success');
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2600
     * @tc.name TaskTimeoutTest026
     * @tc.desc timeout less than task duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest026';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(longFunc, 1000);
        try {
          await taskpool.execute(task, { timeout: 900 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2700
     * @tc.name TaskTimeoutTest027
     * @tc.desc timeout equals MIN VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest027';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: Number.MIN_VALUE });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2800
     * @tc.name TaskTimeoutTest028
     * @tc.desc task completes immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest028';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: 1000 });
          expect(res as string).assertEqual('abc');
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_2900
     * @tc.name TaskTimeoutTest029
     * @tc.desc task duration much less than timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest029';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(longFunc, 100);
          let res = await taskpool.execute(task, { timeout: 10000 });
          expect(res as string).assertEqual('success');
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3000
     * @tc.name TaskTimeoutTest030
     * @tc.desc task duration much greater than timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest030';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(longFunc, 5000);
        try {
          await taskpool.execute(task, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3200
     * @tc.name TaskTimeoutTest032
     * @tc.desc periodic task with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest032';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        taskpool.executePeriodically(1000, task);
        try {
          await taskpool.execute(task, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: the periodicTask cannot execute again');
        }
        taskpool.cancel(task);
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3300
     * @tc.name TaskTimeoutTest033
     * @tc.desc executed task with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest033';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.execute(task, { timeout: 1000 });
        try {
          await taskpool.execute(task, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: timeout task cannot be executed again');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3400
     * @tc.name TaskTimeoutTest034
     * @tc.desc executed taskGroup with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest034';
        console.info(`${TAG} test start`);
        let group = new taskpool.TaskGroup();
        let task = new taskpool.Task(returnAbc);
        group.addTask(task);
        await taskpool.execute(group, { timeout: 1000 });
        try {
          await taskpool.execute(group, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: the taskGroup cannot be executed again, taskGroup cannot be set timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3500
     * @tc.name TaskTimeoutTest035
     * @tc.desc taskGroup timeout with slow task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest035';
        console.info(`${TAG} test start`);
        let group = new taskpool.TaskGroup();
        let task = new taskpool.Task(longFunc, 500);
        group.addTask(task);
        try {
          await taskpool.execute(group, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task group has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3600
     * @tc.name TaskTimeoutTest036
     * @tc.desc task throws exception before timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest036';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(throwErrorFunc);
        try {
          await taskpool.execute(task, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('task error');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3700
     * @tc.name TaskTimeoutTest037
     * @tc.desc task throws exception after timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest037';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(longFuncAndError, 500);
        try {
          await taskpool.execute(task, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3800
     * @tc.name TaskTimeoutTest038
     * @tc.desc taskGroup with exception and timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest038';
        console.info(`${TAG} test start`);
        let group = new taskpool.TaskGroup();
        let task1 = new taskpool.Task(throwErrorFunc);
        let task2 = new taskpool.Task(longFunc, 50);
        group.addTask(task1);
        group.addTask(task2);
        try {
          await taskpool.execute(group, { timeout: 2000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('task error');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_3900
     * @tc.name TaskTimeoutTest039
     * @tc.desc task completes before timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest039';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(longFunc, 500);
          let res = await taskpool.execute(task, { timeout: 2000 });
          expect(res as string).assertEqual('success');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4000
     * @tc.name TaskTimeoutTest040
     * @tc.desc task exceeds timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest040';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(longFunc, 5000);
        try {
          await taskpool.execute(task, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4200
     * @tc.name TaskTimeoutTest042
     * @tc.desc task continues after timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest042';
        console.info(`${TAG} test start`);
        let taskStarted = false;
        let taskdone = 0;
        let task = new taskpool.Task((): void => {
          let start = Date.now();
          while ((Date.now() - start) < 500) {
            continue;
          }
          taskdone = 1;
        });

        task.onStartExecution(() => {
          taskStarted = true;
        });

        try {
          await taskpool.execute(task, { timeout: 200 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }

        if (taskStarted) {
          while (taskdone < 1) {
            await sleep(100);
          }
          expect(taskdone).assertEqual(1);
        } else {
          expect(taskdone).assertEqual(0);
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4400
     * @tc.name TaskTimeoutTest044
     * @tc.desc async task timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest044';
        console.info(`${TAG} test start`);
        let asyncFunc = async (): Promise<string> => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined);
            }, 2000);
          });
          return 'async success';
        };

        let task = new taskpool.Task(asyncFunc);
        await taskpool.execute(task, { timeout: 1000 }).then((res) => {
          expect(false).assertFail();
        }).catch((err) => {
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        });
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4500
     * @tc.name TaskTimeoutTest045
     * @tc.desc taskGroup all tasks complete before timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest045';
        console.info(`${TAG} test start`);
        try {
          let group = new taskpool.TaskGroup();
          let task1 = new taskpool.Task(returnAbc);
          let task2 = new taskpool.Task(returnAbc);
          let task3 = new taskpool.Task(returnAbc);
          group.addTask(task1);
          group.addTask(task2);
          group.addTask(task3);
          let results = await taskpool.execute(group, { timeout: 5000 });
          expect(results.length).assertEqual(3);
          expect(results[0] as string).assertEqual('abc');
          expect(results[1] as string).assertEqual('abc');
          expect(results[2] as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4600
     * @tc.name TaskTimeoutTest046
     * @tc.desc taskGroup partial tasks timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest046';
        console.info(`${TAG} test start`);
        let group = new taskpool.TaskGroup();
        let task1 = new taskpool.Task(returnAbc);
        let task2 = new taskpool.Task(longFunc, 5000);
        group.addTask(task1);
        group.addTask(task2);
        try {
          await taskpool.execute(group, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task group has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4700
     * @tc.name TaskTimeoutTest047
     * @tc.desc taskGroup all tasks timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest047';
        console.info(`${TAG} test start`);
        let group = new taskpool.TaskGroup();
        let task1 = new taskpool.Task(longFunc, 5000);
        let task2 = new taskpool.Task(longFunc, 5000);
        group.addTask(task1);
        group.addTask(task2);
        try {
          await taskpool.execute(group, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task group has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4800
     * @tc.name TaskTimeoutTest048
     * @tc.desc empty taskGroup with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest048';
        console.info(`${TAG} test start`);
        try {
          let group = new taskpool.TaskGroup();
          let results = await taskpool.execute(group, { timeout: 1000 });
          expect(results.length).assertEqual(0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_4900
     * @tc.name TaskTimeoutTest049
     * @tc.desc taskGroup result order validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest049';
        console.info(`${TAG} test start`);
        try {
          let group = new taskpool.TaskGroup();
          let task1 = new taskpool.Task(returnInt, 100);
          let task2 = new taskpool.Task(returnInt, 200);
          let task3 = new taskpool.Task(returnInt, 300);
          group.addTask(task1);
          group.addTask(task2);
          group.addTask(task3);
          let results = await taskpool.execute(group, { timeout: 5000 });
          expect(results[0] as int).assertEqual(100);
          expect(results[1] as int).assertEqual(200);
          expect(results[2] as int).assertEqual(300);
        } catch (err) {
          err = err as Error;
          expect(err.message).assertEqual('taskpool:: task group has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5000
     * @tc.name TaskTimeoutTest050
     * @tc.desc taskGroup timeout error validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest050';
        console.info(`${TAG} test start`);
        let group = new taskpool.TaskGroup();
        let task = new taskpool.Task(longFunc, 5000);
        group.addTask(task);
        try {
          await taskpool.execute(group, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task group has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5100
     * @tc.name TaskTimeoutTest051
     * @tc.desc timeout task executed again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest051';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(longFunc, 200);
        try {
          await taskpool.execute(task, { timeout: 20 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }

        try {
          await taskpool.execute(task, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: timeout task cannot be executed again');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5200
     * @tc.name TaskTimeoutTest052
     * @tc.desc delayed task with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest052';
        console.info(`${TAG} test start`);
        let task = new taskpool.Task(returnAbc);
        await taskpool.executeDelayed(100, task);
        try {
          await taskpool.execute(task, { timeout: 50 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been executed');
        }
        taskpool.cancel(task);
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5300
     * @tc.name TaskTimeoutTest053
     * @tc.desc task with dependency and timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest053';
        console.info(`${TAG} test start`);
        let task1 = new taskpool.Task(returnAbc);
        let task2 = new taskpool.Task(returnAbc);
        task2.addDependency(task1);
        try {
          await taskpool.execute(task2, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: timeout task with dependency cannot execute');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5400
     * @tc.name TaskTimeoutTest054
     * @tc.desc dependency task with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest054';
        console.info(`${TAG} test start`);
        let task1 = new taskpool.Task(returnAbc);
        let task2 = new taskpool.Task(returnAbc);
        task2.addDependency(task1);
        try {
          await taskpool.execute(task1, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: timeout task with dependency cannot execute');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5500
     * @tc.name TaskTimeoutTest055
     * @tc.desc executed taskGroup with timeout again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest055';
        console.info(`${TAG} test start`);
        let group = new taskpool.TaskGroup();
        let task = new taskpool.Task(returnAbc);
        group.addTask(task);
        await taskpool.execute(group);
        try {
          await taskpool.execute(group, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: the taskGroup cannot be executed again, taskGroup cannot be set timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5600
     * @tc.name TaskTimeoutTest056
     * @tc.desc LongTask with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest056';
        console.info(`${TAG} test start`);
        try {
          let longTask = new taskpool.LongTask(longFunc, 100);
          let res = await taskpool.execute(longTask, { timeout: 1000 });
          expect(res as string).assertEqual('success');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5700
     * @tc.name TaskTimeoutTest057
     * @tc.desc LongTask with timeout greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest057';
        console.info(`${TAG} test start`);
        let longTask = new taskpool.LongTask(longFunc, 2000);
        try {
          await taskpool.execute(longTask, { timeout: 1000 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5800
     * @tc.name TaskTimeoutTest058
     * @tc.desc task with timeout 0 is repeatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest058';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res1 = await taskpool.execute(task, { timeout: 0 });
          expect(res1 as string).assertEqual('abc');
          let res2 = await taskpool.execute(task, { timeout: 0 });
          expect(res2 as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_5900
     * @tc.name TaskTimeoutTest059
     * @tc.desc executed task with timeout 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest059';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res1 = await taskpool.execute(task);
          expect(res1 as string).assertEqual('abc');
          let res2 = await taskpool.execute(task, { timeout: 0 });
          expect(res2 as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6000
     * @tc.name TaskTimeoutTest060
     * @tc.desc task without timeout is repeatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest060';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res1 = await taskpool.execute(task, { priority: taskpool.Priority.HIGH });
          expect(res1 as string).assertEqual('abc');
          let res2 = await taskpool.execute(task, { priority: taskpool.Priority.HIGH });
          expect(res2 as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6100
     * @tc.name TaskTimeoutTest061
     * @tc.desc delayed task with timeout 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest061';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { timeout: 0 });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6200
     * @tc.name TaskTimeoutTest062
     * @tc.desc task with dependency and timeout 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest062';
        console.info(`${TAG} test start`);
        try {
          let task1 = new taskpool.Task(returnAbc);
          let task2 = new taskpool.Task(returnAbc);
          task2.addDependency(task1);
          let res1 = await taskpool.execute(task1, { timeout: 0 });
          expect(res1 as string).assertEqual('abc');
          let res2 = await taskpool.execute(task2, { timeout: 0 });
          expect(res2 as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6300
     * @tc.name TaskTimeoutTest063
     * @tc.desc dependency task with timeout 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest063';
        console.info(`${TAG} test start`);
        try {
          let task1 = new taskpool.Task(returnAbc);
          let task2 = new taskpool.Task(returnAbc);
          task2.addDependency(task1);
          let res1 = await taskpool.execute(task1, { timeout: 0 });
          expect(res1 as string).assertEqual('abc');
          let res2 = await taskpool.execute(task2, { timeout: 0 });
          expect(res2 as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6400
     * @tc.name TaskTimeoutTest064
     * @tc.desc taskGroup with timeout 0 is repeatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest064';
        console.info(`${TAG} test start`);
        try {
          let group = new taskpool.TaskGroup();
          let task = new taskpool.Task(returnAbc);
          group.addTask(task);
          let results1 = await taskpool.execute(group, { timeout: 0 });
          expect(results1[0] as string).assertEqual('abc');
          let results2 = await taskpool.execute(group, { timeout: 0 });
          expect(results2[0] as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6500
     * @tc.name TaskTimeoutTest065
     * @tc.desc taskGroup without timeout is repeatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest065';
        console.info(`${TAG} test start`);
        try {
          let group = new taskpool.TaskGroup();
          let task = new taskpool.Task(returnAbc);
          group.addTask(task);
          let results1 = await taskpool.execute(group, { priority: taskpool.Priority.HIGH });
          expect(results1[0] as string).assertEqual('abc');
          let results2 = await taskpool.execute(group, { priority: taskpool.Priority.HIGH });
          expect(results2[0] as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6600
     * @tc.name TaskTimeoutTest066
     * @tc.desc task with negative timeout is repeatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest066';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res1 = await taskpool.execute(task, { timeout: -1 });
          expect(res1 as string).assertEqual('abc');
          let res2 = await taskpool.execute(task, { timeout: -1 });
          expect(res2 as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6700
     * @tc.name TaskTimeoutTest067
     * @tc.desc task with empty configs is repeatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest067';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res1 = await taskpool.execute(task, {});
          expect(res1 as string).assertEqual('abc');
          let res2 = await taskpool.execute(task, {});
          expect(res2 as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6800
     * @tc.name TaskTimeoutTest068
     * @tc.desc onExecutionFailed not triggered on timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest068';
        console.info(`${TAG} test start`);
        let onFailedCalled = false;
        let task = new taskpool.Task(longFunc, 500);
        task.onExecutionFailed((e: Error) => {
          onFailedCalled = true;
        });
        try {
          await taskpool.execute(task, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        expect(onFailedCalled).assertEqual(false);
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_6900
     * @tc.name TaskTimeoutTest069
     * @tc.desc sendData not triggered on timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest069';
        console.info(`${TAG} test start`);
        let dataReceived: string = '';
        let task = new taskpool.Task((): void => {
          let start = Date.now();
          while ((Date.now() - start) < 500) {
            continue;
          }
          try {
            taskpool.Task.sendData('data');
          } catch (e) {
            e = e as Error;
            expect(e.message).assertEqual('taskpool:: task has been timeout');
          }
        });

        task.onReceiveData((data: string) => {
          dataReceived = data;
        });

        try {
          await taskpool.execute(task, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }

        expect(dataReceived).assertEqual('');
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_7000
     * @tc.name TaskTimeoutTest070
     * @tc.desc onExecutionSucceeded triggered on success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest070';
        console.info(`${TAG} test start`);
        let onSucceededCalled = false;
        let task = new taskpool.Task(returnAbc);
        task.onExecutionSucceeded(() => {
          onSucceededCalled = true;
        });
        let res = await taskpool.execute(task, { timeout: 2000 });
        expect(res as string).assertEqual('abc');
        while (!onSucceededCalled) {
          await sleep(100);
        }
        expect(onSucceededCalled).assertEqual(true);
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_7100
     * @tc.name TaskTimeoutTest071
     * @tc.desc sendData triggered on success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest071';
        console.info(`${TAG} test start`);
        let dataReceived: string = '';
        let task = new taskpool.Task((): void => {
          taskpool.Task.sendData('test data');
        });

        task.onReceiveData((data: string) => {
          dataReceived = data;
        });

        await taskpool.execute(task, { timeout: 2000 });
        while (dataReceived === '') {
          await sleep(100);
        }
        expect(dataReceived).assertEqual('test data');
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_7200
     * @tc.name TaskTimeoutTest072
     * @tc.desc onEnqueued triggered on timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest072';
        console.info(`${TAG} test start`);
        let onEnqueuedCalled = false;
        let task = new taskpool.Task(longFunc, 500);
        task.onEnqueued(() => {
          onEnqueuedCalled = true;
        });
        try {
          await taskpool.execute(task, { timeout: 100 });
          expect(false).assertFail();
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('taskpool:: task has been timeout');
        }
        expect(onEnqueuedCalled).assertEqual(true);
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_7400
     * @tc.name TaskTimeoutTest074
     * @tc.desc HIGH priority with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest074';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(returnAbc);
          let res = await taskpool.execute(task, { priority: taskpool.Priority.HIGH, timeout: 1000 });
          expect(res as string).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_7500
     * @tc.name TaskTimeoutTest075
     * @tc.desc LOW priority with long timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest075';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(longFunc, 50);
          let res = await taskpool.execute(task, { priority: taskpool.Priority.LOW, timeout: 10000 });
          expect(res as string).assertEqual('success');
        } catch (err) {
          err = err as Error;
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_7600
     * @tc.name TaskTimeoutTest076
     * @tc.desc IDLE priority with timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest076';
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(longFunc, 50);
          let res = await taskpool.execute(task, { priority: taskpool.Priority.IDLE, timeout: 5000 });
          expect(res as string).assertEqual('success');
        } catch (err) {
          err = err as Error;
          expect(err.message).assertEqual('taskpool:: task has been timeout');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TIMEOUT_TEST_7700
     * @tc.name TaskTimeoutTest077
     * @tc.desc multiple tasks with different priorities and same timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskTimeoutTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTimeoutTest077';
        console.info(`${TAG} test start`);
        let str = '';
        try {
          let task1 = new taskpool.Task(longFunc, 500);
          let task2 = new taskpool.Task(longFunc, 500);
          let task3 = new taskpool.Task(longFunc, 500);

          let res1 = taskpool.execute(task1, { priority: taskpool.Priority.HIGH, timeout: 200 }).catch((err: Error) => {
 	          str += 'a';
 	          expect(err.message).assertEqual('taskpool:: task has been timeout');
 	        });
          let res2 = taskpool.execute(task2, { priority: taskpool.Priority.MEDIUM, timeout: 200 }).catch((err: Error) => {
 	          str += 'b';
 	          expect(err.message).assertEqual('taskpool:: task has been timeout');
 	        });
          let res3 = taskpool.execute(task3, { priority: taskpool.Priority.LOW, timeout: 200 }).catch((err: Error) => {
 	          str += 'c';
 	          expect(err.message).assertEqual('taskpool:: task has been timeout');
 	        });

          await Promise.all([res1, res2, res3]);
          expect(str).assertEqual('abc');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
  });
}
