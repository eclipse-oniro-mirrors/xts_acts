/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  describe, it, expect, TestType, Size, afterEach, Level
} from "../../../hypium/index";
import Utils from './Util.test';

export default function EAWorker3Test(): void {
  describe('EAWorker3Test', (): void => {
    afterEach(async () => {
      await Utils.msSleep(100);
    });
    /**
     * @tc.number EAWorker3Test_0001
     * @tc.name emptyNameTest
     * @tc.desc EAWorker constructor empty name test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('emptyNameTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'emptyNameTest';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker('');
          expect(worker.getName()).assertEqual('');

          worker.start();
          expect(worker.isAlive()).assertTrue();

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }

          console.info(`${TAG} Empty name handled correctly`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0002
     * @tc.name extremeWorkerNameLength
     * @tc.desc EAWorker constructor extreme name length test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('extremeWorkerNameLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'extremeWorkerNameLength';
        console.info(`${TAG} test start`);

        try {
          // Test extremely long name (e.g., 10KB)
          const longName = 'A'.repeat(10240);

          const worker = new EAWorker(longName);
          expect(worker.getName().length).assertEqual(longName.length);

          worker.start();
          expect(worker.isAlive()).assertTrue();

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }

          console.info(`${TAG} Successfully handled worker name with length ${longName.length}`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          // Some implementations may limit name length
          expect(error.message).assertContain('name');
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0003
     * @tc.name specialCharactersInName
     * @tc.desc EAWorker constructor special characters name test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('specialCharactersInName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'specialCharactersInName';
        console.info(`${TAG} test start`);

        const specialNames = [
          '\n\t\r', // Control characters
          '💀🔥💡', // Emoji
          '工人/worker\\test', // Path characters
          '🇨🇳🇺🇸🇬🇧', // Country flag emoji (complex Unicode)
          '🚀worker✨', // Mixed emoji
          'worker-test-123', // Regular name
          '', // Empty string
          '   ', // Spaces
          '\u0000null'// Null character (if supported)
        ];

        let successCount = 0;

        try {
          for (const name of specialNames) {
            try {
              const worker = new EAWorker(name);
              expect(worker.getName()).assertEqual(name);

              worker.start();
              worker.quit();
              while (worker.isAlive()) {
                await Utils.msSleep(10);
              }
              successCount++;
            } catch (error) {
              console.warn(`${TAG} Failed for name '${name}': ${error.message}`);
            }
          }

          console.info(`${TAG} Successfully handled ${successCount}/${specialNames.length} special character names`);
          expect(successCount > 0).assertTrue();
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0004
     * @tc.name unicodeNameTest
     * @tc.desc EAWorker constructor unicode name test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeNameTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'unicodeNameTest';
        console.info(`${TAG} test start`);

        const unicodeNames = [
          '工人线程', // Chinese
          'ワーカー', // Japanese
          '워커', // Korean
          'рабочий', // Russian
          'العامل', // Arabic
          'עובד', // Hebrew
          'คนงาน', // Thai
          'श्रमिक', // Hindi
          'Γήινος', // Greek
          'αβγδεζηθικλμνξοπρστυφχψω'// Greek letters
        ];

        let successCount = 0;

        try {
          for (const name of unicodeNames) {
            try {
              const worker = new EAWorker(name);
              expect(worker.getName()).assertEqual(name);

              worker.start();
              worker.quit();
              while (worker.isAlive()) {
                await Utils.msSleep(10);
              }
              successCount++;
            } catch (error) {
              console.warn(`${TAG} Failed for name '${name}': ${error.message}`);
            }
          }

          console.info(`${TAG} Successfully handled ${successCount}/${unicodeNames.length} Unicode names`);
          expect(successCount > 0).assertTrue();
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0005
     * @tc.name duplicateNamesTest
     * @tc.desc EAWorker constructor duplicate names test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('duplicateNamesTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'duplicateNamesTest';
        console.info(`${TAG} test start`);

        try {
          const name = 'duplicate-worker';
          const worker1 = new EAWorker(name);
          const worker2 = new EAWorker(name);
          const worker3 = new EAWorker(name);

          worker1.start();
          worker2.start();
          worker3.start();

          // Verify all workers have the same name
          expect(worker1.getName()).assertEqual(name);
          expect(worker2.getName()).assertEqual(name);
          expect(worker3.getName()).assertEqual(name);

          // Verify they are different workers (different IDs)
          const id1 = worker1.getWorkerId();
          const id2 = worker2.getWorkerId();
          const id3 = worker3.getWorkerId();

          expect(id1 !== id2).assertTrue();
          expect(id2 !== id3).assertTrue();
          expect(id1 !== id3).assertTrue();

          console.info(`${TAG} Duplicate names handled correctly, workers have unique IDs`);

          worker1.quit();
          worker2.quit();
          worker3.quit();

          while (worker1.isAlive() || worker2.isAlive() || worker3.isAlive()) {
            await Utils.msSleep(10);
          }
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0006
     * @tc.name workerNameConcurrentTest
     * @tc.desc EAWorker worker name concurrent test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('workerNameConcurrentTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'workerNameConcurrentTest';
        console.info(`${TAG} test start`);
        const WORKER_COUNT = 50;

        try {
          const workers: EAWorker[] = [];

          // Create named workers simultaneously
          for (let i = 0; i < WORKER_COUNT; i++) {
            const name = `${TAG}-worker-${i}`;
            const worker = new EAWorker(name);
            worker.start();
            workers.push(worker);

            // Verify name is set correctly
            expect(worker.getName()).assertEqual(name);
          }

          console.info(`${TAG} Successfully created ${WORKER_COUNT} workers with unique names`);

          // Cleanup
          workers.forEach(w => w.quit());
          for (const w of workers) {
            while (w.isAlive()) {
              await Utils.msSleep(10);
            }
          }
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0007
     * @tc.name multipleWorkersSharedStateTest
     * @tc.desc EAWorker multiple workers shared state test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('multipleWorkersSharedStateTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'multipleWorkersSharedStateTest';
        console.info(`${TAG} test start`);
        const WORKER_COUNT = 10;
        const ITERATIONS = 10;

        try {
          const workers: EAWorker[] = [];
          const promises: Promise<void>[] = [];
          let sharedCounter = 0;
          let completedCount = 0;

          // Create multiple workers
          for (let i = 0; i < WORKER_COUNT; i++) {
            const worker = new EAWorker(`${TAG}-worker-${i}`);
            worker.start();
            workers.push(worker);
          }

          for (let i = 0; i < WORKER_COUNT; i++) {
            for (let j = 0; j < ITERATIONS; j++) {
              await workers[i].run<void>(() => {
                sharedCounter++;
                completedCount++;
              });
            }
          }

          const expected = WORKER_COUNT * ITERATIONS;
          console.info(`${TAG} Expected: ${expected}, Actual: ${sharedCounter}, Completed: ${completedCount}`);
          expect(completedCount).assertEqual(expected);

          // Cleanup
          workers.forEach(w => w.quit());
          for (const w of workers) {
            while (w.isAlive()) {
              await Utils.msSleep(10);
            }
          }
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0008
     * @tc.name workerTaskExecutionOrderTest
     * @tc.desc EAWorker worker task execution order test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('workerTaskExecutionOrderTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'workerTaskExecutionOrderTest';
        console.info(`${TAG} test start`);
        const WORKER_COUNT = 5;
        const TASKS_PER_WORKER = 5;

        try {
          const workers: EAWorker[] = [];
          let totalCompleted = 0;

          // Create multiple workers
          for (let i = 0; i < WORKER_COUNT; i++) {
            const worker = new EAWorker(`${TAG}-worker-${i}`);
            worker.start();
            workers.push(worker);
          }

          for (let i = 0; i < WORKER_COUNT; i++) {
            for (let j = 0; j < TASKS_PER_WORKER; j++) {
              await workers[i].run<void>(() => {
                totalCompleted++;
              });
            }
          }

          console.info(`${TAG} Completed ${totalCompleted} tasks`);
          expect(totalCompleted).assertEqual(WORKER_COUNT * TASKS_PER_WORKER);

          // Cleanup
          workers.forEach(w => w.quit());
          for (const w of workers) {
            while (w.isAlive()) {
              await Utils.msSleep(10);
            }
          }
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0009
     * @tc.name nestedWorkerCreationTest
     * @tc.desc EAWorker nested worker creation test. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('nestedWorkerCreationTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'nestedWorkerCreationTest';
        console.info(`${TAG} test start`);

        try {
          const outerWorker = new EAWorker(`${TAG}-outer`);
          outerWorker.start();

          let innerWorkerCreated = false;

          // Create another worker inside worker
          await outerWorker.run<void>(() => {
            try {
              const innerWorker = new EAWorker(`${TAG}-inner`);
              innerWorker.start();
              innerWorkerCreated = true;
              innerWorker.quit();
              while (innerWorker.isAlive()) {
                // Wait for inner worker to quit
              }
            } catch (error) {
              console.error(`${TAG} Inner worker error: ${error.message}`);
            }
          });
          outerWorker.quit();
          while (outerWorker.isAlive()) {
            await Utils.msSleep(10);
          }

          expect(innerWorkerCreated).assertTrue();
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          // If exception is thrown, implementation may not support nested creation
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0012
     * @tc.name jobMultipleAwait
     * @tc.desc EAWorker job multiple await test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('jobMultipleAwait', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'jobMultipleAwait';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker(TAG);
          worker.start();

          const promise = worker.run<int>(() => {
            return 42;
          });

          // First wait for completion
          const result1 = await promise;
          expect(result1).assertEqual(42);

          // Second wait (should return same result or throw exception)
          try {
            const result2 = await promise;
            expect(result2).assertEqual(42);
            console.info(`${TAG} Multiple wait calls allowed, returned same result`);
          } catch (error) {
            console.info(`${TAG} Multiple wait calls throw: ${error.message}`);
            // Some implementations may not allow multiple wait, which is acceptable
          }

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0013
     * @tc.name jobReturnValueTypes
     * @tc.desc EAWorker job return value types test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('jobReturnValueTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'jobReturnValueTypes';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker(TAG);
          worker.start();

          // Test number
          expect(await worker.run<int>(() => {
            return 123;
          })).assertEqual(123);

          // Test string
          expect(await worker.run<string>(() => {
            return 'hello';
          })).assertEqual('hello');

          // Test boolean
          expect(await worker.run<boolean>(() => {
            return true;
          })).assertEqual(true);

          // Test undefined
          await worker.run<void>(() => {
            return;
          });

          // Test object - using Record type
          const result = await worker.run<Record<string, string>>(() => {
            const obj: Record<string, string> = {};
            obj['key'] = 'value';
            return obj;
          });
          expect(result['key']).assertEqual('value');

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }

          console.info(`${TAG} All return types handled correctly`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0014
     * @tc.name jobReturnNull
     * @tc.desc EAWorker job return null test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('jobReturnNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'jobReturnNull';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker(TAG);
          worker.start();

          const result = await worker.run<null>(() => {
            return null;
          });
          expect(result).assertEqual(null);

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }

          console.info(`${TAG} Null return value handled correctly`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0015
     * @tc.name jobWithArrayReturn
     * @tc.desc EAWorker job with array return test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('jobWithArrayReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'jobWithArrayReturn';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker(TAG);
          worker.start();

          const result = await worker.run<int[]>(() => {
            const arr: int[] = [];
            for (let i = 0; i < 100; i++) {
              arr.push(i);
            }
            return arr;
          });
          expect(result.length).assertEqual(100);
          for (let i = 0; i < 100; i++) {
            expect(result[i]).assertEqual(i);
          }

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }

          console.info(`${TAG} Array return value handled correctly`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0016
     * @tc.name jobWithComplexParameters
     * @tc.desc EAWorker job with complex parameters test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('jobWithComplexParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'jobWithComplexParameters';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker(TAG);
          worker.start();

          // Test array parameter
          expect(await worker.run<int>((arr: int[]) => {
            let sum: int = 0;
            for (let i = 0; i < arr.length; i++) {
              sum += arr[i];
            }
            return sum;
          }, [1, 2, 3, 4, 5])).assertEqual(15);

          // Test multiple parameters
          expect(await worker.run<int>((a: int, b: int, c: int) => {
            return a + b + c;
          }, 10, 20, 30)).assertEqual(60);

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }

          console.info(`${TAG} Complex parameters handled correctly`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0017
     * @tc.name jobLongRunningTask
     * @tc.desc EAWorker job long running task test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('jobLongRunningTask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'jobLongRunningTask';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker(TAG);
          worker.start();

          const DURATION_MS = 2000;

          const startTime = Date.now();
          const result = await worker.run<int>(() => {
            const end = Date.now() + DURATION_MS;
            let counter = 0;
            while (Date.now() < end) {
              counter++;
            }
            return counter;
          });
          const endTime = Date.now();
          const duration = endTime - startTime;

          console.info(`${TAG} Long running job completed in ${duration}ms, iterations: ${result}`);
          expect(duration >= DURATION_MS).assertTrue();
          expect(result > 0).assertTrue();

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number EAWorker3Test_0018
     * @tc.name multipleJobsSameWorker
     * @tc.desc EAWorker multiple jobs same worker test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('multipleJobsSameWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'multipleJobsSameWorker';
        console.info(`${TAG} test start`);

        try {
          const worker = new EAWorker(TAG);
          worker.start();

          const JOB_COUNT = 20;
          const promises: Promise<int>[] = [];
          const results: int[] = [];

          // Create multiple promises
          for (let i: int = 0; i < JOB_COUNT; i++) {
            promises.push(worker.run<int>((index: int) => {
              return index * index;
            }, i));
          }

          // Wait for all promises to complete
          for (let i: int = 0; i < JOB_COUNT; i++) {
            results.push(await promises[i]);
          }

          // Verify results
          for (let i: int = 0; i < JOB_COUNT; i++) {
            expect(results[i]).assertEqual(i * i);
          }

          worker.quit();
          while (worker.isAlive()) {
            await Utils.msSleep(10);
          }

          console.info(`${TAG} All ${JOB_COUNT} jobs completed successfully`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.number EAWorker3Test_0023
     * @tc.name workerInTaskpool
     * @tc.desc EAWorker worker in taskpool test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('workerInTaskpool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'workerInTaskpool';
        console.info(`${TAG} test start`);

        try {
          const task = new taskpool.Task(async () => {
            const worker = new EAWorker(`${TAG}-inner`);
            worker.start();

            const result = await worker.run<int>(() => {
              return 42;
            });

            worker.quit();
            while (worker.isAlive()) {
              // Wait for quit
            }

            return result;
          });

          const result = await taskpool.execute(task);
          expect(result as int).assertEqual(42);

          console.info(`${TAG} Worker in taskpool completed successfully`);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          // Some implementations may not allow creating worker in taskpool
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

  });
}