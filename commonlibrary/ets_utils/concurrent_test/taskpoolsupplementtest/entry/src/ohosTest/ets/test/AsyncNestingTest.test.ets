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
import {sleep} from '../testability/pages/LazyImportUtils'
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { args, taskFunction } from '../testability/pages/AsyncLazyUtils';

export default function AsyncNestingTest() {
  describe('AsyncNestingTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_ASYNC_NESTING_TEST_0100
     * @tc.name AsyncNestingTest0100
     * @tc.desc async lazy import asyncLock three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncNestingTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncNestingTest0100"
      console.info(`${caseName}, test start`);
      let externalVariable = args;
      const lock = ArkTSUtils.locks.AsyncLock.request('exampleLock');
      await lock.lockAsync<void>(() => {
        console.log(`${externalVariable}`);
        return new Promise((resolve) => {
          setTimeout(() => {
            externalVariable = 20;
            resolve();
          }, 100);
        });
      }).then(() => {
          return lock.lockAsync<void>(() => {
            console.log(`${externalVariable}`);
            return new Promise((resolve) => {
              setTimeout(() => {
                externalVariable = 30;
                resolve();
              }, 300);
            });
          });
        }).then(() => {
          return lock.lockAsync<void>(() => {
            console.log(`${externalVariable}`);
            return new Promise((resolve) => {
              setTimeout(() => {
                externalVariable = 40;
                resolve();
              }, 500);
            });
          });
        })
        .then(() => {
          console.log(`${externalVariable}`);
        })
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 1000)
      })
      expect(40).assertEqual(externalVariable)
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     * @tc.number SUB_ASYNC_NESTING_TEST_0200
     * @tc.name AsyncNestingTest0200
     * @tc.desc async lazy import promise three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncNestingTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncNestingTest0200"
      console.info(`${caseName}, test start`);
      let sharedVariable = args;
      await new Promise<void>((resolve) => {
        console.log(`${sharedVariable}`);
        setTimeout(() => {
          sharedVariable = 1;
          resolve();
        }, 100);
      }).then(() => {
          return new Promise<void>((resolve) => {
            console.log(`${sharedVariable}`);
            setTimeout(() => {
              sharedVariable = 2;
              resolve();
            }, 100);
          });
        }).then(() => {
          return new Promise<void>((resolve) => {
            console.log(`${sharedVariable}`);
            setTimeout(() => {
              sharedVariable = 3;
              resolve();
            }, 100);
          });
        })
        .then(() => {
          console.log(`${sharedVariable}`);
        })
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 1000)
      })
      expect(3).assertEqual(sharedVariable)
      console.info(`${caseName}, test end`);
      Done();
    })




    /**
     * @tc.number SUB_ASYNC_NESTING_TEST_0300
     * @tc.name AsyncNestingTest0300
     * @tc.desc async lazy import async three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncNestingTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncNestingTest0300";
      console.info(`${caseName}, test start`);
      let sharedVariable = args;
      const  firstLayer = async ()=> {
        console.log(`${sharedVariable}`);
        await new Promise<void>((resolve) => setTimeout(resolve, 100));
        sharedVariable = 1;
        return sharedVariable;
      }
      const secondLayer = async ()=> {
        const resultFromFirst = await firstLayer();
        console.log(`${resultFromFirst}`);
        await new Promise<void>((resolve) => setTimeout(resolve, 100));
        sharedVariable = 2;
        return sharedVariable;
      }
      const thirdLayer = async ()=> {
        const resultFromSecond = await secondLayer();
        console.log(`${resultFromSecond}`);
        await new Promise<void>((resolve) => setTimeout(resolve, 100));
        sharedVariable = 3;
        return sharedVariable;
      }
      thirdLayer()
        .then(() => {
          console.log(`${sharedVariable}`);
        })
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 1000)
      })
      expect(3).assertEqual(sharedVariable)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_ASYNC_NESTING_TEST_0400
     * @tc.name AsyncNestingTest0400
     * @tc.desc async lazy import setTimeout three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncNestingTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncNestingTest0400";
      console.info(`${caseName}, test start`);
      let sharedVariable = args;
      setTimeout(() => {
        console.log('one async start');
        console.log('sharedVariable is:', sharedVariable);
        sharedVariable = 1;
        console.log('one async end');
        setTimeout(() => {
          console.log('two async star');
          console.log('sharedVariable is:', sharedVariable);
          sharedVariable = 2;
          console.log('two async end');
          setTimeout(() => {
            console.log('three async start');
            console.log('sharedVariable is:', sharedVariable);
            sharedVariable = 3;
            console.log('three async end');
            console.log('all async end');
            console.log('sharedVariable is:', sharedVariable);
          }, 1000);
        }, 500);
      }, 100);
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 2000)
      })
      expect(3).assertEqual(sharedVariable)
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     * @tc.number SUB_ASYNC_NESTING_TEST_0500
     * @tc.name AsyncNestingTest0500
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncNestingTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncNestingTest0500";
      console.info(`${caseName}, test start`);
      let sharedVariable = args;
      let task: taskpool.Task = new taskpool.Task(taskFunction, args);
      taskpool.execute(task).then((result)=>{
        console.log(`${result}`);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            console.log('async end');
            resolve(sharedVariable);
          });
        });
      })
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 1000)
      })
      expect(42).assertEqual(sharedVariable)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_ASYNC_NESTING_TEST_0700
     * @tc.name AsyncNestingTest0700
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncNestingTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncNestingTest0700";
      console.info(`${caseName}, test start`);
      let sharedVariable = args;
      const asyncLock = ArkTSUtils.locks.AsyncLock.request('Lock');
      const protectedAsyncOperation = async ()=> {
        return new Promise<number>((resolve, reject) => {
          asyncLock.lockAsync(() => {
            (async () => {
                await new Promise<void>((innerResolve) => setTimeout(innerResolve));
                sharedVariable++;
                console.log('sharedVariable is:',sharedVariable);
                resolve(sharedVariable);
            })();
          })
        });
      }
      protectedAsyncOperation()
        .then((result) => {
          console.log('Promise then start');
          setTimeout(() => {
            console.log('setTimeout', result);
          }, 500);
        })
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 1000)
      })
      expect(43).assertEqual(sharedVariable)
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     * @tc.number SUB_ASYNC_NESTING_TEST_0800
     * @tc.name AsyncNestingTest0800
     * @tc.desc async lazy import taskPool three nest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncNestingTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = "AsyncNestingTest0500";
      console.info(`${caseName}, test start`);
      let sharedVariable = args;
      let task: taskpool.Task = new taskpool.Task(taskFunction, args);
      taskpool.execute(task).then((result)=>{
        console.log('taskpool:', result);
        return new Promise<void>((innerResolve) => {
          setTimeout(() => {
            console.log('Promise then setTimeout ,result:', result);
            innerResolve();
          }, 500);
        });
      }).then(() => {
          return new Promise<void>((resolve, reject) => {
            const asyncLock = ArkTSUtils.locks.AsyncLock.request('taskLock');
            asyncLock.lockAsync(() => {
              setTimeout(() => {
                resolve();
              }, 300);
            })
          });
        }).then(() => {
          console.log('all end');
        })
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 1000)
      });
      expect(42).assertEqual(sharedVariable)
      console.info(`${caseName}, test end`);
      Done();
    })
  })
}