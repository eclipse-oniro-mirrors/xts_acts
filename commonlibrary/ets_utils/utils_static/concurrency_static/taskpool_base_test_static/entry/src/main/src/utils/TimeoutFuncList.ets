// 'use static'

import { asyncSleep } from './exportFunclist';
import { SendableClassTest } from './sendable';
import { level2Task, taskError2, timeoutDemo2 } from './TimeoutFunc2';


export function timeoutDemo(time: number): number {
  console.log('timeoutDemo start: ' + time)
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  console.log('timeoutDemo end: ' + time)
  return time;
}


export async function demoSenddata(time: number): Promise<void> {
  console.log('demoSenddata start')
  let start = Date.now();
  let count: int = 1;
  while (Date.now() - start < time) {
    console.log('demoSenddata count:' + count)
    taskpool.Task.sendData(count);
    count++;
    await asyncSleep(100);
  }
  console.log('demoSenddata end')
}


export function taskError(time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  throw new Error('task error');
}


export function sendableClassWithTime(classT: SendableClassTest, time: number): number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let num = classT.foo();
  num += classT.func();
  return num;
}


export function setTransferListTestWithTime(arg1: Uint8Array, arg2: Uint8Array, time: number): number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return arg1.byteLength + arg2.byteLength;
}


export function setCloneListTestWithTime(arrayBuffer: Array<number>, time: number): Int32Array {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: number[] = [5, 6, 7, 8];
  for (let i: int = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}


export async function nestedOuterTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 10 }).then((res) => {
    data = res as number;
    console.log('nestedOuterTask then')
  }).catch((e: Error) => {
    console.log('nestedOuterTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function nestedTimeoutTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedTimeoutTask then')
  }).catch((e: Error) => {
    console.log('nestedTimeoutTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function nestedDifferentTimeout(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
    data = res as number;
    console.log('nestedDifferentTimeout then')
  }).catch((e: Error) => {
    console.log('nestedDifferentTimeout catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function nestedTaskGroupTask(time: number): Promise<number[]> {
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 150);
  let data: number[] = [0];
  await taskpool.execute(innerGroup, { timeout: 50 }).then((res) => {
    data = res.map((item): number => {
      return item as number
    });
    console.log('nestedTaskGroupTask then')
  }).catch((e: Error) => {
    console.log('nestedTaskGroupTask catch: ' + e.message)
    throw new Error(e.message);
  });
  return data;
}


export async function level3Task(): Promise<number> {
  let data: number = 0;
  await taskpool.execute(new taskpool.Task(timeoutDemo2, 100), { timeout: 5000 }).then((res) => {
    data = res as number;
    console.log('level3Task then')
  }).catch((e: Error) => {
    console.log('level3Task catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function level1Task(): Promise<number> {
  let data: number = 0;
  await taskpool.execute(new taskpool.Task(level2Task), { timeout: 50 }).then((res) => {
    data = res as number;
    console.log('level1Task then')
  }).catch((e: Error) => {
    console.log('level1Task catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function outerAwaitMultipleTimeout(time: number): Promise<number[]> {
  let results: number[] = [];
  let task1 = new taskpool.Task(timeoutDemo2, 100.0);
  let task2 = new taskpool.Task(timeoutDemo2, 100.0);
  results.push(await taskpool.execute(task1, { timeout: 500 }) as number);
  results.push(await taskpool.execute(task2, { timeout: 500 }) as number);
  return results;
}


export async function asyncRunnerNestedTask(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 300.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('asyncRunnerNestedTask then')
  }).catch((e: Error) => {
    console.log('asyncRunnerNestedTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function asyncRunnerNestedGroup(): Promise<number[]> {
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 200.0);
  let data: number[] = [0];
  await taskpool.execute(innerGroup, { timeout: 100 }).then((res) => {
    data = res.map((item): number => {
      return item as number
    });
    console.log('asyncRunnerNestedGroup then')
  }).catch((e: Error) => {
    console.log('asyncRunnerNestedGroup catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function sequenceRunnerNestedTask(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 300.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('sequenceRunnerNestedTask then')
  }).catch((e: Error) => {
    console.log('sequenceRunnerNestedTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function sequenceRunnerNestedGroup(): Promise<number[]> {
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 200.0);
  let data: number[] = [0];
  await taskpool.execute(innerGroup, { timeout: 100 }).then((res) => {
    data = res.map((item): number => {
      return item as number
    });
    console.log('sequenceRunnerNestedGroup then')
  }).catch((e: Error) => {
    console.log('sequenceRunnerNestedGroup catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function workerTimeoutTask(): Promise<number> {
  let task = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(task, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('workerTimeoutTask then')
  }).catch((e: Error) => {
    console.log('workerTimeoutTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function workerTimeoutGroup(): Promise<number[]> {
  let group = new taskpool.TaskGroup();
  group.addTask(timeoutDemo2, 200.0);
  let data: number[] = [0];
  await taskpool.execute(group, { timeout: 100 }).then((res) => {
    data = res.map((item): number => {
      return item as number
    });
    console.log('workerTimeoutGroup then')
  }).catch((e: Error) => {
    console.log('workerTimeoutGroup catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function workerMultipleTimeout(): Promise<number[]> {
  let results: number[] = [];
  let task1 = new taskpool.Task(timeoutDemo2, 100.0);
  let task2 = new taskpool.Task(timeoutDemo2, 100.0);
  await taskpool.execute(task1, { timeout: 20 }).then((res) => {
    results.push(res as number);
    console.log('workerMultipleTimeout task1 then')
  }).catch((e: Error) => {
    console.log('workerMultipleTimeout task1 catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  await taskpool.execute(task2, { timeout: 200 }).then((res) => {
    results.push(res as number);
    console.log('workerMultipleTimeout task2 then')
  }).catch((e: Error) => {
    console.log('workerMultipleTimeout task2 catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return results;
}


export async function workerNestedTaskPool(): Promise<number> {
  let task = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await taskpool.execute(task, { timeout: 10 }).then((res) => {
    data = res as number;
    console.log('workerNestedTaskPool then')
  }).catch((e: Error) => {
    console.log('workerNestedTaskPool catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function delayedNestedTask(): Promise<number> {
  console.log('delayedNestedTask start')
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('delayedNestedTask then')
  }).catch((e: Error) => {
    console.log('delayedNestedTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function periodicTaskInner(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('periodicTaskInner then')
  }).catch((e: Error) => {
    console.log('periodicTaskInner catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function longTaskNestedTimeout(): Promise<number> {
  console.log('longTaskNestedTimeout start')
  let innerTask = new taskpool.Task(timeoutDemo2, 300.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('longTaskNestedTimeout then')
  }).catch((e: Error) => {
    console.log('longTaskNestedTimeout catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function longTaskNestedGroup(): Promise<number[]> {
  console.log('longTaskNestedGroup start')
  let innerGroup = new taskpool.TaskGroup();
  innerGroup.addTask(timeoutDemo2, 200.0);
  let data: number[] = [0];
  await taskpool.execute(innerGroup, { timeout: 100 }).then((res) => {
    data = res.map((item): number => {
      return item as number
    });
    console.log('longTaskNestedGroup then')
  }).catch((e: Error) => {
    console.log('longTaskNestedGroup catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function timeoutWithLongTask(): Promise<number> {
  console.log('timeoutWithLongTask start')
  let longTask = new taskpool.LongTask(timeoutDemo2, 100.0);
  let data: number = 0;
  await taskpool.execute(longTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('timeoutWithLongTask then')
  }).catch((e: Error) => {
    console.log('timeoutWithLongTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function nestedOuterCancelTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedOuterCancelTask then')
  }).catch((e: Error) => {
    console.log('nestedOuterCancelTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function nestedOuterCompleteTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await taskpool.execute(innerTask).then((res) => {
    data = res as number;
    console.log('nestedOuterCompleteTask then')
  }).catch((e: Error) => {
    console.log('nestedOuterCompleteTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function nestedInnerTimeoutTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  let terminate = false;
  taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedInnerTimeoutTask then')
    terminate = true
  }).catch((e: Error) => {
    console.log('nestedInnerTimeoutTask catch: ' + e.message)
    terminate = true
    throw new Error(e.code.toString());
  });
  setTimeout(() => {
    try {
      taskpool.cancel(innerTask);
    } catch (e) {
    }
  }, 100);
  while (!terminate) {
    await asyncSleep(100)
  }
  return data;
}


export async function nestedInnerExceptionTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(taskError2, 100.0);
  let data: number = 0;
  await taskpool.execute(innerTask).then((res) => {
    data = res as number;
    console.log('nestedInnerExceptionTask then')
  }).catch((e: Error) => {
    console.log('nestedInnerExceptionTask catch: ' + e.message)
    throw new Error(e.message);
  });
  return data;
}


export async function nestedInnerTimeout1Task(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 300.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedInnerTimeout1Task then')
  }).catch((e: Error) => {
    console.log('nestedInnerTimeout1Task catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function nestedOuterTimeoutTask(time: number): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
    data = res as number;
    console.log('nestedOuterTimeoutTask then')
  }).catch((e: Error) => {
    console.log('nestedOuterTimeoutTask catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function rejectTaskShort(time: number): Promise<number> {
  await new Promise<number>((_, reject) => {
    setTimeout(() => {
      reject(new Error('reject'))
    }, 100)
  });
  return time;
}


export async function rejectTaskLong(time: number): Promise<number> {
  await new Promise<number>((_, reject) => {
    setTimeout(() => {
      reject(new Error('reject'))
    }, 500)
  });
  return time;
}


export async function nestedInnerCancelExceptionTimeout(time: number): Promise<number> {
  let innerTask = new taskpool.Task(taskError2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('nestedInnerCancelExceptionTimeout then')
  }).catch((e: Error) => {
    console.log('nestedInnerCancelExceptionTimeout catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function asyncRunnerTaskNestedTimeout(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 10 }).then((res) => {
    data = res as number;
    console.log('asyncRunnerTaskNestedTimeout then')
  }).catch((e: Error) => {
    console.log('asyncRunnerTaskNestedTimeout catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function sequenceRunnerTaskNestedTimeout(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('sequenceRunnerTaskNestedTimeout then')
  }).catch((e: Error) => {
    console.log('sequenceRunnerTaskNestedTimeout catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function workerTaskNestedTimeout(): Promise<number> {
  let innerTask = new taskpool.Task(timeoutDemo2, 200.0);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
    data = res as number;
    console.log('workerTaskNestedTimeout then')
  }).catch((e: Error) => {
    console.log('workerTaskNestedTimeout catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskAsyncRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskAsyncRunnerInnerShortOuterLong then')
  }).catch((e: Error) => {
    console.log('taskAsyncRunnerInnerShortOuterLong catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskSequenceRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask0 = new taskpool.Task(timeoutDemo2, 100.0);
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  runner.execute(innerTask0)
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskSequenceRunnerInnerShortOuterLong then')
  }).catch((e: Error) => {
    console.log('taskSequenceRunnerInnerShortOuterLong catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskAsyncRunnerInnerLongOuterShort(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskAsyncRunnerInnerLongOuterShort then')
  }).catch((e: Error) => {
    console.log('taskAsyncRunnerInnerLongOuterShort catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskSequenceRunnerInnerLongOuterShort(): Promise<number> {
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask0 = new taskpool.Task(timeoutDemo2, 100.0);
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  runner.execute(innerTask0)
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskSequenceRunnerInnerLongOuterShort then')
  }).catch((e: Error) => {
    console.log('taskSequenceRunnerInnerLongOuterShort catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskGroupAsyncRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupAsyncRunnerInnerShortOuterLong then')
  }).catch((e: Error) => {
    console.log('taskGroupAsyncRunnerInnerShortOuterLong catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskGroupSequenceRunnerInnerShortOuterLong(): Promise<number> {
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupSequenceRunnerInnerShortOuterLong then')
  }).catch((e: Error) => {
    console.log('taskGroupSequenceRunnerInnerShortOuterLong catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskGroupAsyncRunnerInnerLongOuterShort(): Promise<number> {
  let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupAsyncRunnerInnerLongOuterShort then')
  }).catch((e: Error) => {
    console.log('taskGroupAsyncRunnerInnerLongOuterShort catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}


export async function taskGroupSequenceRunnerInnerLongOuterShort(): Promise<number> {
  console.log('taskGroupSequenceRunnerInnerLongOuterShort start.')
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  let innerTask0 = new taskpool.Task(timeoutDemo2, 100.0);
  let innerTask = new taskpool.Task(timeoutDemo2, 100.0);
  let data: number = 0;
  runner.execute(innerTask0)
  await runner.execute(innerTask).then((res) => {
    data = res as number;
    console.log('taskGroupSequenceRunnerInnerLongOuterShort then')
  }).catch((e: Error) => {
    console.log('taskGroupSequenceRunnerInnerLongOuterShort catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}