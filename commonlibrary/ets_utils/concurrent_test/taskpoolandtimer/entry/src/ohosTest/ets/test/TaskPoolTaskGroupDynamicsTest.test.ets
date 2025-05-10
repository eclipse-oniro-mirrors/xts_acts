/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';

import {
  sleep,
  taskFunction1,
  taskFunction10,
  taskFunction11,
  taskFunction2,
  taskFunction3,
  taskFunction4,
  taskFunction5,
  taskFunction6,
  taskFunction7,
  taskFunction8,
  taskFunction9,
  WorkerSrc,
} from '../testability/pages/Utils';
import { BusinessError } from '@kit.BasicServicesKit';
import { WorkerSrc1 } from '../testability/pages/WorkerSrc1';
import { WorkerSrc2 } from '../testability/pages/WorkerSrc2';

export default function TaskPoolTaskDynamicsTest() {
  describe('TaskPoolTaskDynamicsTest', () => {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0100
     * @tc.name TaskPoolTaskDynamicsTest0100
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction1, index);
          taskPromises.push(taskPromise);
        }
        await Promise.all(taskPromises).then((results) => {
          console.info(`所有任务的计算结果: ${results}`);
          results.forEach((result, index) => {
            console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
            expect(result).assertEqual(index + 2);
          });
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0200
     * @tc.name TaskPoolTaskDynamicsTest0200
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction2, index);
          taskPromises.push(taskPromise);
        }
        const results = await Promise.all(taskPromises);
        console.info(`所有任务的计算结果: ${results}`);
        results.forEach((result, index) => {
          console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
          expect(result).assertEqual(index + 4);
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0300
     * @tc.name TaskPoolTaskDynamicsTest0300
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction3, index);
          taskPromises.push(taskPromise);
        }
        const results = await Promise.all(taskPromises);
        console.info(`所有任务的计算结果: ${results}`);
        results.forEach((result, index) => {
          console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
          expect(result).assertEqual(index + 1);
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0400
     * @tc.name TaskPoolTaskDynamicsTest0400
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction4, index);
          taskPromises.push(taskPromise);
        }
        const results = await Promise.all(taskPromises);
        console.info(`所有任务的计算结果: ${results}`);

        results.forEach((result, index) => {
          console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
          expect(result).assertEqual(index + 2);
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0500
     * @tc.name TaskPoolTaskDynamicsTest0500
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction5, index);
          taskPromises.push(taskPromise);
        }
        const results = await Promise.all(taskPromises);
        results.forEach((result, index) => {
          console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
          expect(result).assertEqual(index + 2);
          console.info(`任务 ${index} 的断言成功，结果符合预期`);
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0600
     * @tc.name TaskPoolTaskDynamicsTest0600
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction6, index);
          taskPromises.push(taskPromise);
        }
        const results = await Promise.all(taskPromises);
        results.forEach((result, index) => {
          console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
          expect(result).assertEqual(index + 2);
          console.info(`任务 ${index} 的断言成功，结果符合预期`);
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0700
     * @tc.name TaskPoolTaskDynamicsTest0700
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction7, index);
          taskPromises.push(taskPromise);
        }
        const results = await Promise.all(taskPromises);
        results.forEach((result, index) => {
          console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
          expect(result).assertEqual(index + 1);
          console.info(`任务 ${index} 的断言成功，结果符合预期`);
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0800
     * @tc.name TaskPoolTaskDynamicsTest0800
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const taskPromises: Promise<object>[] = [];
        for (let index = 0; index < 10; index++) {
          const taskPromise = taskpool.execute(taskFunction8, index);
          taskPromises.push(taskPromise);
        }
        const results = await Promise.all(taskPromises);
        results.forEach((result, index) => {
          console.info(`任务 ${index} 的结果验证：预期与计算结果一致，实际结果为 ${result}`);
          expect(result).assertEqual(index + 2);
          console.info(`任务 ${index} 的断言成功，结果符合预期`);
        });
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_0900
     * @tc.name TaskPoolTaskDynamicsTest0900
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          totalExpected += index + 2;
          task.onEnqueued(async () => {
            await new Promise<void>((resolve) => setTimeout(resolve, 1000));
            console.log(`Task ${index} waited for 1 second`);
            const dynamicModule = await import('../testability/pages/TaskPoolMethod');
            const dynamicFunction = dynamicModule.calculate;
            const result = await dynamicFunction(index);
            totalCalculated += result;
            console.log(`Task ${index} result from dynamic function: ${result}`);
            await new Promise<void>((resolve) => {
              taskpool.execute(taskFunction9, index).then((res) => {
                console.log(`Task ${index} executed again, result: ${res}`);
                resolve();
              });
            });
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1000
     * @tc.name TaskPoolTaskDynamicsTest1000
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          task.onEnqueued(async () => {
            try {
              await new Promise<void>((resolve: () => void) => setTimeout(resolve, 1000));
              totalExpected += index + 1;
              console.log(`Task ${index} waited for 1 second`);
              const dynamicModule = await import('../testability/pages/TaskPoolMethod');
              const dynamicFunction = dynamicModule.asyncCalculate1;
              const result = await dynamicFunction(index);
              totalCalculated += result;
              console.log(`Task ${index} result from dynamic function: ${result}`);
              await new Promise<void>((resolve: () => void) => {
                taskpool.execute(taskFunction9, index).then((res) => {
                  console.log(`Task ${index} executed again, result: ${res}`);
                  resolve();
                });
              });
            } catch (error) {
              if (error instanceof Error) {
                console.error(`Task ${index} encountered an error:`, error.message);
              } else {
                console.error(`Task ${index} encountered an unknown error:`, error);
              }
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1100
     * @tc.name TaskPoolTaskDynamicsTest0900
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          task.onStartExecution(async () => {
            try {
              totalExpected += index + 2;
              await new Promise<void>((resolve) => {
                import('../testability//pages/TaskPoolMethod')
                  .then((module) => {
                    const calculationFunction = module.calculate;
                    const result = calculationFunction(index);
                    totalCalculated += result;
                    console.log(`Task ${index} result from dynamic function: ${result}`);
                    resolve();
                  })
                  .catch((error: BusinessError) => {
                    console.error(`Task ${index} error while importing calculation function:`, error);
                    resolve();
                  });
              });
              new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} completed promise callback.`);
                  resolve();
                }, 500);
              });
            } catch (error) {
              console.error(`Task ${index} encountered an error:`, error);
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1200
     * @tc.name TaskPoolTaskDynamicsTest1200
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          task.onStartExecution(async () => {
            try {
              totalExpected += index + 1;
              const existingPromise = new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} is in existing promise`);
                  resolve();
                }, 500);
              });
              await new Promise<void>(async (resolve) => {
                const calculationModel = await import('../testability/pages/TaskPoolMethod');
                const calculationFunction = calculationModel.asyncCalculate1
                const result = await calculationFunction(index);
                totalCalculated += result;
                console.log(`Task ${index} result from dynamic function: ${result}`);
                resolve();
              });
              await existingPromise;
              console.log(`Task ${index} completed existing promise callback.`);
            } catch (error) {
              console.error(`Task ${index} encountered an error:`, error);
            }
          });

          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1300
     * @tc.name TaskPoolTaskDynamicsTest1300
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction10, index);
          task.onExecutionFailed(async (error) => {
            console.error(`Task ${index} failed with error:`, error);
            try {
              totalExpected += index + 2;
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} waiting in the first promise`);
                  resolve();
                }, 500);
              });
              const promiseToAwait = new Promise<void>((resolve) => {
                import('../testability//pages/TaskPoolMethod')
                  .then(async (module) => {
                    const calculationFunction = module.calculate;
                    const result = await calculationFunction(index);
                    totalCalculated += result;
                    console.log(`Task ${index} result from dynamic function: ${result}`);
                    resolve();
                  })
                  .catch((error: BusinessError) => {
                    console.error(`Task ${index} error importing calculation function:`, error);
                    resolve();
                  });
              });
              await promiseToAwait;
              console.log(`Task ${index} completed operations in failed callback`);
            } catch (error) {
              console.error(`Task ${index} encountered an error:`, error);
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1400
     * @tc.name TaskPoolTaskDynamicsTest1400
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction10, index);
          task.onExecutionFailed(async (error) => {
            console.error(`Task ${index} failed with error:`, error);
            try {
              totalExpected += index + 1;
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} waiting in the first promise after failure`);
                  resolve();
                }, 1000);
              });
              const promiseToAwait = new Promise<void>((resolve) => {
                import('../testability/pages/TaskPoolMethod')
                  .then(async (module) => {
                    const calculationFunction = module.asyncCalculate1;
                    const result = await calculationFunction(index);
                    totalCalculated += result
                    console.log(`Task ${index} result from dynamic function: ${result}`);
                    resolve();
                  })
                  .catch((importError: BusinessError) => {
                    console.error(`Task ${index} error importing calculation function:`, importError);
                    resolve();
                  });
              });
              await promiseToAwait;
              console.log(`Task ${index} completed operations after failed promise callback`);
            } catch (innerError) {
              console.error(`Task ${index} encountered an error in onExecutionFailed:`, innerError);
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1500
     * @tc.name TaskPoolTaskDynamicsTest1500
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          task.onExecutionSucceeded(async () => {
            try {
              totalExpected += index + 2;
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} waiting in the first promise after success`);
                  resolve();
                }, 1000);
              });
              const promiseToAwait = new Promise<void>((resolve, reject) => {
                reject(new Error(`Simulated error for task ${index}`));
              });
              await promiseToAwait
                .catch(async (error: BusinessError) => {
                  import('../testability/pages/TaskPoolMethod')
                    .then(async (module) => {
                      const calculationFunction = module.calculate;
                      const result = await calculationFunction(index);
                      totalCalculated += result
                      console.log(`Task ${index} result from dynamic function: ${result}`);
                    })
                    .catch((importError: BusinessError) => {
                      console.error(`Task ${index} error importing calculation function:`, importError);
                    });
                });
              console.log(`Task ${index} completed operations after success promise callback`);
            } catch (innerError) {
              console.error(`Task ${index} encountered an error in onExecutionSucceeded:`, innerError);
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1600
     * @tc.name TaskPoolTaskDynamicsTest1600
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          task.onExecutionSucceeded(async () => {
            try {
              totalExpected += index + 1;
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  console.log(`Task ${index} waiting in the first promise after success`);
                  resolve();
                }, 1000);
              });
              const promiseToAwait = new Promise<void>((resolve, reject) => {
                reject(new Error(`Simulated error for task ${index}`));
              });
              await promiseToAwait
                .catch(async (error: BusinessError) => {
                  import('../testability/pages/TaskPoolMethod')
                    .then(async (module) => {
                      const calculationFunction = module.asyncCalculate1;
                      const result = await calculationFunction(index);
                      totalCalculated += result
                      console.log(`Task ${index} result from dynamic function: ${result}`);
                    })
                    .catch((importError: BusinessError) => {
                      console.error(`Task ${index} error importing calculation function:`, importError);
                    });
                });
              console.log(`Task ${index} completed operations after success promise callback`);
            } catch (innerError) {
              console.error(`Task ${index} encountered an error in onExecutionSucceeded:`, innerError);
            }
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1700
     * @tc.name TaskPoolTaskDynamicsTest1700
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          task.onReceiveData(() => {
            (async () => {
              try {
                totalExpected += index + 2;
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log(`Task ${index} waiting in the first promise in onReceiveData`);
                    resolve();
                  }, 1000);
                });
                const promiseToAwait = new Promise<void>((resolve, reject) => {
                  resolve();
                });
                await promiseToAwait
                  .finally(async () => {
                    const calculationModel = await import('../testability/pages/TaskPoolMethod');
                    const calculationFunction = calculationModel.calculate
                    const result = await calculationFunction(index);
                    totalCalculated += result;
                    console.log(`Task ${index} result from dynamic async function: ${result}`);
                  });
                console.log(`Task ${index} completed operations in onReceiveData`);
              } catch (error) {
                console.error(`Task ${index} encountered an error in onReceiveData:`, error);
              }
            })();
          });
          taskpool.execute(task);
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1800
     * @tc.name TaskPoolTaskDynamicsTest1800
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated1 = 0;
        let totalCalculated2 = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          taskpool.execute(task).then(() => {
            (async () => {
              try {
                totalExpected += index + 2;
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log(`Task ${index} waiting in the first promise`);
                    import('../testability/pages/TaskPoolMethod')
                      .then((module) => {
                        const calculationFunction = module.calculate;
                        const result1 = calculationFunction(index);
                        totalCalculated1 += result1
                        console.log(`Task ${index} result from first dynamic function: ${result1}`);
                        resolve();
                      })
                      .catch((error: BusinessError) => {
                        console.error(`Task ${index} error importing in first promise:`, error);
                        resolve();
                      });
                  }, 100);
                });
                const promiseToAwait = new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log(`Task ${index} waiting in the second promise`);
                    resolve();
                  }, 500);
                });
                await promiseToAwait.then(() => {
                  import('../testability/pages/TaskPoolMethod')
                    .then((module) => {
                      const calculationFunction = module.calculate;
                      const result2 = calculationFunction(index);
                      totalCalculated2 += result2
                      console.log(`Task ${index} result from second dynamic function: ${result2}`);
                    })
                    .catch((error: BusinessError) => {
                      console.error(`Task ${index} error importing in second promise:`, error);
                    });
                });
                console.log(`Task ${index} completed all operations`);
              } catch (error) {
                console.error(`Task ${index} encountered an overall error:`, error);
              }
            })();
          });
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated1}`);
        console.info(`${totalCalculated2}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated1);
        expect(totalExpected).assertEqual(totalCalculated2);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_1900
     * @tc.name TaskPoolTaskDynamicsTest1900
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated1 = 0;
        let totalCalculated2 = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction9, index);
          taskpool.execute(task).then(() => {
            (async () => {
              try {
                totalExpected += index + 1;
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log(`Task ${index} waiting in the first promise`);
                    resolve();
                  }, 100);
                }).finally(async () => {
                  const calculationModel = await import('../testability/pages/TaskPoolMethod');
                  const calculationFunction = calculationModel.asyncCalculate1;
                  const result1 = await calculationFunction(index);
                  totalCalculated1 += result1;
                  console.log(`Task ${index} result from first dynamic async function: ${result1}`);
                });
                const promiseToAwait = new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log(`Task ${index} waiting in the second promise`);
                    resolve();
                  }, 500);
                });
                await promiseToAwait.finally(async () => {
                  const calculationModel = await import('../testability/pages/TaskPoolMethod');
                  const calculationFunction = calculationModel.asyncCalculate1;
                  const result2 = await calculationFunction(index);
                  totalCalculated2 += result2;
                  console.log(`Task ${index} result from second dynamic async function: ${result2}`);
                });
                console.log(`Task ${index} completed all operations`);
              } catch (error) {
                console.error(`Task ${index} encountered an error:`, error);
              }
            })();
          });
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated1}`);
        console.info(`${totalCalculated2}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated1);
        expect(totalExpected).assertEqual(totalCalculated2);
        Done();
      })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_2000
     * @tc.name TaskPoolTaskDynamicsTest2000
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction11, index);
          taskpool.execute(task)
            .then(() => {
              console.log(`Task ${index} executed successfully`);
            })
            .catch(async (error: BusinessError) => {
              try {
                totalExpected += index + 1;
                console.log(`Task ${index} caught an error:`, error.message);
                await new Promise<void>(async (resolve) => {
                  const calculationModel = await import('../testability/pages/TaskPoolMethod');
                  const calculationFunction = calculationModel.asyncCalculate1;
                  const result = await calculationFunction(index);
                  totalCalculated += result;
                  console.log(`Task ${index} result from dynamic async function: ${result}`);
                  resolve();
                });
                console.log(`Task ${index} completed operations in catch callback`);
              } catch (innerError) {
                console.error(`Task ${index} encountered an error in catch operation:`, innerError);
              }
            });
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_2100
     * @tc.name TaskPoolTaskDynamicsTest2100
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          const task = new taskpool.Task(taskFunction11, index);
          taskpool.execute(task)
            .then(() => {
              console.log(`Task ${index} executed successfully`);
            })
            .catch((error: BusinessError) => {
              console.error(`Task ${index} encountered an error:`, error);
            })
            .finally(async () => {
              try {
                totalExpected += index + 1;
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log(`Task ${index} waiting in the first promise in finally`);
                    resolve();
                  }, 1000);
                });
                const calculationModel = await import('../testability/pages/TaskPoolMethod');
                const calculationFunction = calculationModel.asyncCalculate1;
                const result = await calculationFunction(index);
                totalCalculated += result;
                console.log(`Task ${index} result from dynamic async function: ${result}`);
                new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log(`Task ${index} completed operations in finally with promise callback`);
                    resolve();
                  }, 1000);
                });
              } catch (innerError) {
                console.error(`Task ${index} encountered an error in finally block:`, innerError);
              }
            });
        }
        await new Promise<void>((resolve) => setTimeout(resolve, 2000));
        console.info(`${totalCalculated}`);
        console.info(`${totalExpected}`);
        expect(totalExpected).assertEqual(totalCalculated);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_2200
     * @tc.name TaskPoolTaskDynamicsTest2200
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          console.log('即将发送的 index 值:', index);
          let work = new worker.ThreadWorker("../testability/pages/workers/Worker");
          work.postMessage(index);
          work.onmessage = (e: MessageEvents): void => {
            const result: number = e.data;
            totalExpected += result;
            totalCalculated += index + 1;
            console.log(`=====${totalCalculated}`);
            console.log(`=====${totalExpected}`);
            console.log(`main thread received result: ${result} from worker ${index}`);
            work.terminate();
          };
          work.onerror = (err: ErrorEvent) => {
            console.log(`main error message: ${err.message}`);
          };
        }
        expect(totalCalculated).assertEqual(totalExpected);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_2300
     * @tc.name TaskPoolTaskDynamicsTest2300
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          console.log('即将发送的 index 值:', index);
          let work = new worker.ThreadWorker("../testability/pages/workers/Worker1");
          work.postMessage(index);
          work.onmessage = (e: MessageEvents): void => {
            const result: number = e.data;
            totalExpected += result;
            totalCalculated += index + 2;
            console.log(`=====${totalCalculated}`);
            console.log(`=====${totalExpected}`);
            console.log(`main thread received result: ${result} from worker ${index}`);
            work.terminate();
          };
          work.onerror = (err: ErrorEvent) => {
            console.log(`main error message: ${err.message}`);
          };
        }
        expect(totalCalculated).assertEqual(totalExpected);
        Done();
      })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_Dynamic_TEST_2400
     * @tc.name TaskPoolTaskDynamicsTest2400
     * @tc.desc create 10 taskPool threads,dynamics import
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTaskDynamicsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let totalCalculated = 0;
        let totalExpected = 0;
        for (let index = 0; index < 10; index++) {
          console.log('即将发送的 index 值:', index);
          let work = new worker.ThreadWorker("../testability/pages/workers/Worker2");
          work.postMessage(index);
          work.onmessage = (e: MessageEvents): void => {
            const result: number = e.data;
            totalExpected += result;
            totalCalculated += index + 2;
            console.log(`=====${totalCalculated}`);
            console.log(`=====${totalExpected}`);
            console.log(`main thread received result: ${result} from worker ${index}`);
            work.terminate();
          };
          work.onerror = (err: ErrorEvent) => {
            console.log(`main error message: ${err.message}`);
          };
        }
        expect(totalCalculated).assertEqual(totalExpected);
        Done();
      })

  })
}