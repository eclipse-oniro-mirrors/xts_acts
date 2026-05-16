import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { printArgs1, printArgs28, printArgs31, printArgs34 } from './Utils';

@Concurrent
export function testTask() {
  let count = 0;
  const promises: Promise<void>[] = [];
  let task: taskpool.Task = new taskpool.Task(printArgs28, 1);
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
export function testTask1() {
  let count = 0;
  const promises: Promise<void>[] = [];
  let task: taskpool.Task = new taskpool.Task(printArgs31, 1);
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
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit exclusive lock lock2');
  }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  console.log('Exit shared lock lock1');
  promises.push(promise1);
  return count;
}


@Concurrent
export function testTask2() {
  let count = 0;
  const promises: Promise<void>[] = [];
  let task: taskpool.Task = new taskpool.Task(printArgs34, 1);
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
  const promise1 = lock1.lockAsync(async () => {
    console.log('Enter shared lock lock1');
    await lock2.lockAsync(async () => {
      console.log('Enter shared lock lock2');
      await lock3.lockAsync(() => {
        console.log('Enter shared lock lock3');
        taskpool.execute(task).then(() => {
          count++;
          console.log('taskpool success');
        })
        console.log('Exit shared lock lock3');
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit shared lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    console.log('Exit shared lock lock1');
  }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  console.log('Exit shared lock lock1');
  promises.push(promise1);
  return count;
}