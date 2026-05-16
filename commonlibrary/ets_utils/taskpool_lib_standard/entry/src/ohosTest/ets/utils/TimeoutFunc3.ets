import { taskpool } from '@kit.ArkTS';
import { timeoutDemo2 } from './TimeoutFunc2';
import { periodicTaskInner } from './TimeoutFuncList';

@Concurrent
export async function level3Task(): Promise<number> {
  return await taskpool.execute(new taskpool.Task(timeoutDemo2, 100), {timeout: 5000}) as number;
}

@Concurrent
export async function nestPeriodicTaskInner(): Promise<number> {
  let innerTask = new taskpool.Task(periodicTaskInner);
  let data = 0;
  await taskpool.execute(innerTask, { timeout: 500 }).then((res) => {
    data = res as number;
    console.log('periodicTaskInner then')
  }).catch((e: BusinessError) => {
    console.log('periodicTaskInner catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}