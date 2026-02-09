import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { TaskFun30, TaskFun33, TaskFun36 } from './Utils2';


@Concurrent
export function TaskTest() {
  let count = 0;
  const promises: Promise<void>[] = [];
  let task: taskpool.Task = new taskpool.Task(TaskFun30, 1);
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promise1 = lock1.lockAsync(async () => {
    console.log('Enter shared lock lock1');
    await lock2.lockAsync(() => {
      console.log('Enter exclusive lock lock2');
      taskpool.execute(task).then(() => {
        count++;
        console.log('taskpool success');
      })
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    console.log('Exit exclusive lock lock2');
  }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  console.log('Exit shared lock lock1');
  promises.push(promise1);
  return count;
}

@Concurrent
export function TaskTest1() {
  let count = 0;
  const promises: Promise<void>[] = [];
  let task: taskpool.Task = new taskpool.Task(TaskFun33, 1);
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promise1 = lock1.lockAsync(async () => {
    console.log('Enter EXCLUSIVE lock lock1');
    await lock2.lockAsync(() => {
      console.log('Enter SHARED lock lock2');
      taskpool.execute(task).then(() => {
        count++;
        console.log('taskpool success');
      })
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    console.log('Exit SHARED lock lock2');
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  console.log('Exit EXCLUSIVE lock lock1');
  promises.push(promise1);
  return count;
}

@Concurrent
export function TaskTest2() {
  let count = 0;
  const promises: Promise<void>[] = [];
  let task: taskpool.Task = new taskpool.Task(TaskFun36, 1);
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
  const promise1 = lock1.lockAsync(async () => {
    console.log('Enter EXCLUSIVE lock lock1');
    await lock2.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock2');
      await lock3.lockAsync(() => {
        console.log('Enter EXCLUSIVE lock lock3');
        taskpool.execute(task).then(() => {
          count++;
          console.log('taskpool success');
        })
        console.log('Exit EXCLUSIVE lock lock3');
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  console.log('Exit EXCLUSIVE lock lock1');
  promises.push(promise1);
  return count;
}