import { asyncSleep } from './exportFunclist';
import { level3Task } from './TimeoutFuncList';


export function timeoutDemo2 (time: number): number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return time;
}


export async function demoSenddata(time: number) {
  let start = Date.now();
  let count: int = 1;
  while (Date.now() - start < time) {
    taskpool.Task.sendData(count);
    count++;
    await asyncSleep(100);
  }
}


export function taskError2(time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  throw new Error('task error');
}


export async function level2Task(): Promise<number> {
  let data: number = 0;
  await taskpool.execute(new taskpool.Task(level3Task), {timeout: 2000}).then((res) => {
    data = res as number;
    console.log('level2Task then')
  }).catch((e: Error) => {
    console.log('level2Task catch: ' + e.message)
    throw new Error(e.code.toString());
  });
  return data;
}

