import { taskpool } from '@kit.ArkTS';
import { asyncSleep } from '../test/exportFunclist';
import { level3Task } from './TimeoutFuncList';

@Concurrent
export function timeoutDemo2 (time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return time;
}

@Concurrent
export async function demoSenddata(time: number) {
  let start = Date.now();
  let count = 1;
  while (Date.now() - start < time) {
    taskpool.Task.sendData(count);
    count++;
    await asyncSleep(100);
  }
}

@Concurrent
export function taskFunc(task: taskpool.Task) {
  return task;
}
@Concurrent
export function taskError2(time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  throw new Error('task error');
}

@Concurrent
export async function level2Task(): Promise<number> {
  return await taskpool.execute(new taskpool.Task(level3Task), {timeout: 2000}) as number;
}

