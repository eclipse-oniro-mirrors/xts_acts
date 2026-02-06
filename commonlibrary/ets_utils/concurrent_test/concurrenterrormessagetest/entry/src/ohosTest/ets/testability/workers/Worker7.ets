import { ArkTSUtils, ErrorEvent, MessageEvents, taskpool, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import testNapi from 'libentry.so';
import { throwErrorTask,normalTask,longTaskWithData, AsyncTaskWithError} from '../pages/Taskpool';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
@Concurrent
function task1() {
  setTimeout(() => {}, 50);
}

@Concurrent
function task2() {
  throw new Error('error2');
}

@Concurrent
function task3() {
  setTimeout(() => {
    throw new Error('error3');
  }, 50);
}

@Concurrent
function task4() {
  new Promise<void>(() => {
    setTimeout(() => {
      throw new Error('error4');
    }, 50);
  });
}

@Concurrent
function task5() {
  Promise.resolve().then(() => {
    throw new Error('error5');
  });
}

@Concurrent
function task6() {
  Promise.reject(new Error('origin error'))
    .catch(() => {
      throw new Error('error6');
    });
}

@Concurrent
function task7() {
  Promise.resolve()
    .finally(() => {
      throw new Error('error7');
    });
}

@Concurrent
function task8() {
  const lock = new ArkTSUtils.locks.AsyncLock();
  lock.lockAsync<void>(() => {
    throw new Error('error8');
  });
}

@Concurrent
function task9() {
  const lock = new ArkTSUtils.locks.AsyncLock();
  lock.lockAsync<void>(() => {
  }).then(() => {
    throw new Error('error9');
  });
}

@Concurrent
function task10() {
  const lock = new ArkTSUtils.locks.AsyncLock();
  lock.lockAsync<void>(() => {
    throw new Error('error10');
  }).catch(() => {
    throw new Error('error10');
  });
}

@Concurrent
function task11() {
  const conditionVariable = new ArkTSUtils.locks.ConditionVariable();
  conditionVariable.waitFor(10)
    .finally(() => {
      throw new Error('error11');
    });
}

@Concurrent
function task12() {
  const conditionVariable = new ArkTSUtils.locks.ConditionVariable();
  conditionVariable.waitFor(10).then(() => {
    throw new Error('error12');
  });
}

@Concurrent
function task13() {
  return Promise.reject(new Error('error13'));
}

@Concurrent
function task14() {
  setTimeout(() => {
    testNapi.addWithTwoNumber();
  }, 0);
}

@Concurrent
function task15() {
  let task: taskpool.Task = new taskpool.Task(AsyncTaskWithError);
  taskpool.execute(task);
}

@Concurrent
function task16() {
  let task: taskpool.Task = new taskpool.Task(normalTask);
  taskpool.execute(task).then(() => {
    throw new Error('error16');
  });
}

@Concurrent
function task17() {
  let task: taskpool.Task = new taskpool.Task(throwErrorTask);
  taskpool.execute(task).catch(() => {
    throw new Error('error17');
  });
}

@Concurrent
function task18() {
  let task: taskpool.Task = new taskpool.Task(longTaskWithData, 1);
  task.onReceiveData(()=>{
    throw new Error('error18');
  });
  taskpool.execute(task);
}

@Concurrent
function task19() {
  let myWorker = new worker.ThreadWorker('./Worker1');
}

@Concurrent
function task20() {
  let myWorker = new worker.ThreadWorker('./Worker2');
  myWorker.postMessage({ foo: 'bar' });
}

const tasks = [
  task1, task2, task3, task4, task5,
  task6, task7, task8, task9, task10,
  task11, task12, task13, task14, task15,
  task16, task17, task18, task19, task20
];
function executeTaskArray() {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  tasks.forEach(task => taskGroup.addTask(task));
  taskpool.execute(taskGroup);
}


console.log('task start');
executeTaskArray();


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



/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = async (event: MessageEvents) => {

};

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = (event: MessageEvents) => {
};

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param event error message
 */
workerPort.onerror = (event: ErrorEvent) => {
};
