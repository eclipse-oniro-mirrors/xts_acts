import { timeoutDemo2 } from './TimeoutFunc2';
import { periodicTaskInner } from './TimeoutFuncList';


export async function level3Task(): Promise<number> {

  let result = await taskpool.execute(new taskpool.Task(timeoutDemo2, 100.0), { timeout: 5000 }) as number;
  return result;
}


export async function nestPeriodicTaskInner(): Promise<number> {
  let innerTask = new taskpool.Task(periodicTaskInner);
  let data: number = 0;
  await taskpool.execute(innerTask, { timeout: 500 }).then((res) => {
    data = res as number;
    console.log('periodicTaskInner then')
  }).catch((e: Error) => {
    console.log('periodicTaskInner catch: ' + e)
    throw new Error(e.code.toString());
  });
  return data;
}