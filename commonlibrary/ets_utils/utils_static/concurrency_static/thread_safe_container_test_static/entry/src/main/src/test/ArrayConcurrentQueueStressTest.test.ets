import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

export default function ArrayConcurrentQueueStressTest() {
  describe('ArrayConcurrentQueueStressTest', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_BLOCKING_QUEUE_PUSH_BLOCKING_0100
    * @tc.name Array_Concurrent_Queue_Push_Blocking_When_Full_static_0100
    * @tc.desc Verify that ArrayConcurrentQueue push method blocks when queue is full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Array_Concurrent_Queue_Push_Blocking_When_Full_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        let queue: containers.stackless.ArrayConcurrentQueue<number> = new containers.stackless.ArrayConcurrentQueue<number>(1);
        await queue.push(1);

        let pushTask: taskpool.Task = new taskpool.Task(async (q: containers.stackless.ArrayConcurrentQueue<number>): Promise<number> => {
          let val: number = 999;
          await q.push(val);
          return val;
        }, queue);

        let pushPromise: Promise<Any> = taskpool.execute(pushTask);

        await queue.pop();
        let pushValue: number = await pushPromise as number;

        expect(pushValue).assertEqual(999);
        expect(queue.size).assertEqual(1);
        expect(await queue.pop()).assertEqual(999);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_BLOCKING_QUEUE_POP_BLOCKING_0200
    * @tc.name Array_Concurrent_Queue_Pop_Blocking_When_Empty_static_0200
    * @tc.desc Verify that ArrayConcurrentQueue pop method blocks when queue is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Array_Concurrent_Queue_Pop_Blocking_When_Empty_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        let queue: containers.stackless.ArrayConcurrentQueue<number> = new containers.stackless.ArrayConcurrentQueue<number>(10);

        let popTask: taskpool.Task = new taskpool.Task(async (q: containers.stackless.ArrayConcurrentQueue<number>): Promise<number> => {
          return await q.pop();
        }, queue);

        let popPromise: Promise<Any> = taskpool.execute(popTask);

        await queue.push(888);

        let popValue: number = await popPromise as number;

        expect(popValue).assertEqual(888);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_BLOCKING_QUEUE_PRODUCER_CONSUMER_0300
    * @tc.name Array_Concurrent_Queue_Producer_Consumer_static_0300
    * @tc.desc Test ConcurrentQueue correctness in producer-consumer pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Array_Concurrent_Queue_Producer_Consumer_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        let queue: containers.stackless.ArrayConcurrentQueue<number> = new containers.stackless.ArrayConcurrentQueue<number>(50);
        let producerCount: number = 10;
        let consumerCount: number = 10;
        let itemsPerProducer: number = 100;
        let totalProduced: number = 0;
        let totalConsumed: number = 0;

        let tasks: taskpool.Task[] = [];
        let workers: EAWorker[] = [];
        let jobs: Promise<Promise<number>>[] = [];

        for (let i: number = 0; i < producerCount; i++) {
          let eaw = new EAWorker()
          eaw.start()
          workers.push(eaw)
          let job = eaw.run<Promise<number>>(async (q: containers.stackless.ArrayConcurrentQueue<number>, id: number, count: number): Promise<number> => {
            let produced: number = 0;
            for (let j: number = 0; j < count; j++) {
              await q.push(id * count + j);
              produced++;
            }
            return produced;
          }, queue, i, itemsPerProducer)
          jobs.push(job);
        }

        for (let i: number = 0; i < consumerCount; i++) {
          let eaw = new EAWorker()
          eaw.start()
          workers.push(eaw)
          let job = eaw.run<Promise<number>>(async (q: containers.stackless.ArrayConcurrentQueue<number>, count: number): Promise<number> => {
            let consumed: number = 0;
            for (let j: number = 0; j < count; j++) {
              await q.pop();
              consumed++;
            }
            return consumed;
          }, queue, Math.floor(itemsPerProducer * producerCount / consumerCount));
          jobs.push(job);
        }

        let results: number[] = []
        for (let i = 0; i < jobs.length; i++) {
          let res = await jobs[i];
          results.push(res);
        }
        for (let i: int = 0; i < producerCount; i++) {
          totalProduced += results[i] as number;
        }
        for (let i: int = producerCount.toInt(); i < (producerCount + consumerCount).toInt(); i++) {
          totalConsumed += results[i] as number;
        }
        workers.forEach((eaw: EAWorker) => {
          eaw.join()
        })

        expect(totalProduced).assertEqual(producerCount * itemsPerProducer);
        expect(totalConsumed).assertEqual(producerCount * itemsPerProducer);
        expect(queue.size).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_BLOCKING_QUEUE_STRESS_CONCURRENT_0700
    * @tc.name Array_Concurrent_Queue_Concurrent_Operations_static_0700
     * @tc.desc Verify thread safety of concurrent push/pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Array_Concurrent_Queue_Concurrent_Operations_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        let queue: containers.stackless.ArrayConcurrentQueue<number> = new containers.stackless.ArrayConcurrentQueue<number>(100);
        let threadCount: number = 10;
        let operationsPerThread: number = 100;
        let totalOperations: number = 0;

        let tasks: Promise<Promise<number>>[] = [];
        let workers: EAWorker[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          let eaw = new EAWorker()
          eaw.start()
          workers.push(eaw)
          let task: Promise<Promise<number>> = eaw.run<Promise<number>>(async (q: containers.stackless.ArrayConcurrentQueue<number>): Promise<number> => {
            let ops: number = 0;
            for (let j: number = 0; j < 100; j++) {
              await q.push(j);
              ops++;
              await q.pop();
              ops++;
            }
            return ops;
          }, queue);
          tasks.push(task);
        }
        let results: number[] = []
        for (let i = 0; i < tasks.length; i++) {
          let res = await tasks[i];
          results.push(res);
        }
        workers.forEach((eaw) => {
          eaw.quit();
        })

        for (let i: int = 0; i < results.length; i++) {
          totalOperations += results[i] as number;
        }

        expect(totalOperations).assertEqual(threadCount * operationsPerThread * 2);
        expect(queue.size >= 0).assertTrue();
        expect(queue.size <= 100).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_BLOCKING_QUEUE_STRESS_ALTERNATING_1300
    * @tc.name Array_Concurrent_Queue_Alternating_Push_Pop_static_1300
     * @tc.desc Verify alternating push and pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Array_Concurrent_Queue_Alternating_Push_Pop_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        let queue: containers.stackless.ArrayConcurrentQueue<number> = new containers.stackless.ArrayConcurrentQueue<number>(500);
        let threadCount: number = 10;
        let totalPushOps: number = 0;
        let totalPollOps: number = 0;

        let tasks: Promise<Promise<number>>[] = [];
        let workers: EAWorker[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          let eaw = new EAWorker()
          eaw.start()
          workers.push(eaw)
          let task: Promise<Promise<number>> = eaw.run<Promise<number>>(async (q: containers.stackless.ArrayConcurrentQueue<number>, id: number): Promise<number> => {
            let ops: number = 0;
            for (let j: number = 0; j < 50; j++) {
              await q.push(id * 50 + j);
              ops++;
              if (j % 2 === 0) {
                q.poll();
              }
            }
            return ops;
          }, queue, i);
          tasks.push(task);
        }
        let results: number[] = []
        for (let i = 0; i < tasks.length; i++) {
          let res = await tasks[i];
          results.push(res);
        }
        workers.forEach((eaw) => {
          eaw.quit();
        })

        for (let i: int = 0; i < results.length; i++) {
          totalPushOps += results[i] as number;
        }
        totalPollOps = Math.floor(totalPushOps / 2);

        expect(totalPushOps).assertEqual(500);
        expect(totalPollOps).assertEqual(250);
        expect(queue.size == 250).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_BLOCKING_QUEUE_CONCURRENT_DATA_INTEGRITY_1700
    * @tc.name Array_Concurrent_Queue_Concurrent_Data_Integrity_static_1700
     * @tc.desc Verify data integrity in concurrent scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it("Array_Concurrent_Queue_Concurrent_Data_Integrity_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        let queue: containers.stackless.ArrayConcurrentQueue<number> = new containers.stackless.ArrayConcurrentQueue<number>(100);
        let itemCount: number = 1000;
        let sumProduced: number = 0;
        let sumConsumed: number = 0;
        let eaw = new EAWorker()
        eaw.start()
        let producerTask: Promise<Promise<number>> =
          eaw.run<Promise<number>>(async (q: containers.stackless.ArrayConcurrentQueue<number>, count: number): Promise<number> => {
            let sum: number = 0;
            for (let i: number = 0; i < count; i++) {
              await q.push(i);
              sum += i;
            }
            return sum;
          }, queue, itemCount);

        let eaw2 = new EAWorker()
        eaw2.start()
        let consumerTask: Promise<Promise<number>> =
          eaw.run<Promise<number>>(async (q: containers.stackless.ArrayConcurrentQueue<number>, count: number): Promise<number> => {
            let sum: number = 0;
            for (let i: number = 0; i < count; i++) {
              let val: number = await q.pop();
              sum += val;
            }
            return sum;
          }, queue, itemCount);

        sumProduced = await producerTask;
        sumConsumed = await consumerTask;
        await eaw.join();
        await eaw2.join();

        expect(sumProduced).assertEqual(sumConsumed);
        expect(queue.size).assertEqual(0);
      });
  });
}