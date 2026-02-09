'use static'

import { Queue } from '@kit.ArkTS';


export function testQueueAddNumber() {
  const caseName = 'testQueueAddNumber';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<number> = new Queue<number>();
    const result = queue.add(1);
    if (result !== true) { throw new Error(`${caseName} add number failed`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testQueueAddString() {
  const caseName = 'testQueueAddString';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<string> = new Queue<string>();
    const result = queue.add('a');
    if (result !== true) { throw new Error(`${caseName} add string failed`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testQueueAddUndefined() {
  const caseName = 'testQueueAddUndefined';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<Any> = new Queue<Any>();
    const result = queue.add(undefined);
    if (result !== true) { throw new Error(`${caseName} add undefined failed`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}
class C1 {
  public name: string = ''
  public age: string = ''
}

export function testQueuePop() {
  const caseName = 'testQueuePop';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<number | string | object> = new Queue<number | string | object>();
    let a: C1 = {
      name: 'Dylon', age: '13'
    };
    queue.add(a);
    queue.add('a');
    queue.add(1);
    const result = queue.pop();
    if (result !== a) { throw new Error(`${caseName} pop mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testQueuePopEmpty() {
  const caseName = 'testQueuePopEmpty';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<number | string | object> = new Queue<number | string | object>();
    const result = queue.pop();
    if (result !== undefined) { throw new Error(`${caseName} pop empty mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testQueueGetFirst() {
  const caseName = 'testQueueGetFirst';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<number | string | object> = new Queue<number | string | object>();
    const a : C1 = { name: 'Dylon', age: '13' };
    queue.add(a);
    queue.add('a');
    queue.add(1);
    const result = queue.getFirst();
    if (result !== a) { throw new Error(`${caseName} getFirst mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testQueueGetFirstEmpty() {
  const caseName = 'testQueueGetFirstEmpty';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<number | string | object> = new Queue<number | string | object>();
    const result = queue.getFirst();
    if (result !== undefined) { throw new Error(`${caseName} getFirst empty mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testQueueForEach() {
  const caseName = 'testQueueForEach';
  try {
    console.log(`${caseName} test start`);
    const queue: Queue<number | string | object> = new Queue<number | string | object>();
    const a: C1 = { name: 'Dylon', age: '13' };
    queue.add(a);
    queue.add('a');
    queue.add(1);
    queue.forEach((value, index): void => {
      // 原逻辑：expect(value).assertEqual(value); 恒成立，保留形式判断
      if (value !== value) { throw new Error(`${caseName} forEach value mismatch`); }
      if (index !== index) { throw new Error(`${caseName} forEach index mismatch`); }
    });
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err}`);
    throw new Error(`${caseName} failed.`);
  }
}
