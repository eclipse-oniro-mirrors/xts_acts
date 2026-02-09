import { ArkTSUtils, collections, HashMap, lang } from '@kit.ArkTS';
import { ChildLRUCache } from './sendableclass';


@Concurrent
export async function test_sendable_0100(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.updateCapacity(1000);
    pro.put(2, 10);
    pro.put(1, 10);
  })
}

@Concurrent
export async function test_sendable_0200(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let res = index
    pro.updateCapacity(50);
    pro.get(2);
    pro.get(3);
    pro.put(2, 10);
    pro.put(1, 10);
    res++;
    pro.updateCapacity(50 + res);
  })
}

@Concurrent
export async function test_sendable_0300(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.get(2);
    pro.get(3);
    pro.put(2, 10);
    pro.put(1, 10);
    pro.updateCapacity(0);
  })
}

@Concurrent
export async function test_sendable_0500(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.updateCapacity(100);
    pro.put(2, 10);
    pro.get(3);
    pro.put(1, 10);
    pro.clear();
  })
}

@Concurrent
export async function test_sendable_0600(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    const baseKey = index * 1000;
    pro.put(baseKey + 2, 10);
    pro.get(baseKey + 3);
    pro.get(baseKey + 5);
    let lru = new ChildLRUCache();
    lru.put(baseKey + 2, 10);
    lru.get(baseKey + 3);
    lru.get(baseKey + 5);
    let res = lru.getCreateCount();
    res++;
    const currentCapacity = pro.getCapacity();
    pro.updateCapacity(currentCapacity + res);
  })
}

@Concurrent
export async function test_sendable_0700(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.put(2, 10);
    pro.get(3);
    pro.get(5);
    pro.get(1002);
    pro.get(1003)
    pro.get(1004);
    pro.get(1005);
  })
}

@Concurrent
export async function test_sendable_0800(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.put(2, 10);
    pro.put(50, 22);
    pro.put(50, 22);
    pro.updateCapacity(1000 - index);
  })
}

@Concurrent
export async function test_sendable_0900(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.put(2, 10);
    pro.get(2);
    pro.put(3, 10);
    pro.get(3);
    pro.put(index, 10);
    pro.get(index);
  })
}

@Concurrent
export async function test_sendable_1000(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.put(2, 10);
    pro.put(2, 1);
    pro.put(index, index);
  })
}

@Concurrent
export async function test_sendable_1400(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.put(index, index);
    pro.remove(index);
  })
}

@Concurrent
export async function test_sendable_1600(pro: ArkTSUtils.SendableLruCache<number, number>, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.put(index, index);
    pro.get(2,);
    let pair: Iterable<Object[]> = pro.entries();
    let arrayValue = Array.from(pair);
    arrayValue.push([index, index]);
    pro.updateCapacity(arrayValue.length + index)
  })
}

@Concurrent
export async function test_sendable_1700(pro: collections.Map<string, string>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.set('ha', 'a');
    pro.set('sh', 'b');
    pro.set('map', 'c');
    let a: number = index
    pro.set(`${a}`, `${a}`);
  })
}

@Concurrent
export async function test_sendable_1800(pro: collections.Map<string, string>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    pro.set('send','a');
    pro.set('able','b');
    pro.set('map','c');
    let a: number = index
    pro.set(`${a}`, `${a}`);
    let jsonString: string = ArkTSUtils.ASON.stringify(pro);
    console.info(`${pro} Serialized JSON: ${jsonString}`);
    let parsedSendable: lang.ISendable | null = ArkTSUtils.ASON.parse(jsonString)
  })
}
