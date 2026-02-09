'use static'
import { ArrayList, buffer,  Deque, HashMap, HashSet, LightWeightMap,
  LightWeightSet,
  util } from '@kit.ArkTS';
import { List } from '@kit.ArkTS'


export function testLRUCachePut1() {
  let TAG = 'testLRUCachePut1'
  try {
    let pro: util.LRUCache<string, string> = new util.LRUCache<string, string>(1);
    pro.put('key1', 'value1');
    let result: string | undefined = pro.get('key1');
    if (result !== 'value1') {
      throw new Error(`${TAG} LRUCache put method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheGet1() {
  let TAG = 'testLRUCacheGet1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
    pro.put(1, 100);
    let result: number | undefined = pro.get(1);
    if (result !== 100) {
      throw new Error(`${TAG} LRUCache get method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheRemove1() {
  let TAG = 'testLRUCacheRemove1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
    pro.put(1, 100);
    let result: number | undefined = pro.remove(1);
    if (result !== 100) {
      throw new Error(`${TAG} LRUCache remove method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheContains1() {
  let TAG = 'testLRUCacheContains1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
    pro.put(1, 100);
    let result: boolean = pro.contains(1);
    if (!result) {
      throw new Error(`${TAG} LRUCache contains method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheUpdateCapacity1() {
  let TAG = 'testLRUCacheUpdateCapacity1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
    pro.updateCapacity(2);
    let result: int = pro.getCapacity();
    if (result !== 2) {
      throw new Error(`${TAG} LRUCache updateCapacity method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheGetCapacity1() {
  let TAG = 'testLRUCacheGetCapacity1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(64);
    let result: int = pro.getCapacity();
    if (result !== 64) {
      throw new Error(`${TAG} LRUCache getCapacity method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheClear1() {
  let TAG = 'testLRUCacheClear1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
    pro.put(1, 100);
    pro.clear();
    let result: boolean = pro.isEmpty();
    if (!result) {
      throw new Error(`${TAG} LRUCache clear method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheKeys1() {
  let TAG = 'testLRUCacheKeys1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(2);
    pro.put(1, 100);
    pro.put(2, 200);
    let keys: number[] = pro.keys();
    if (keys.length !== 2) {
      throw new Error(`${TAG} LRUCache keys method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheValues1() {
  let TAG = 'testLRUCacheValues1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(2);
    pro.put(1, 100);
    pro.put(2, 200);
    let values: number[] = pro.values();
    if (values.length !== 2) {
      throw new Error(`${TAG} LRUCache values method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheEntries1() {
  let TAG = 'testLRUCacheEntries1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(2);
    pro.put(1, 100);
    pro.put(2, 200);
    let entries: IterableIterator<[number, number]> = pro.entries();
    let entriesArray: [number, number][] = Array.from(entries);
    if (entriesArray.length !== 2) {
      throw new Error(`${TAG} LRUCache entries method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheIsEmpty1() {
  let TAG = 'testLRUCacheIsEmpty1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
    let result: boolean = pro.isEmpty();
    if (!result) {
      throw new Error(`${TAG} LRUCache isEmpty method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLRUCacheCreateDefault1() {
  let TAG = 'testLRUCacheCreateDefault1'
  try {
    let pro: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
    let result: number | undefined = pro.createDefault(1);
    if (result !== undefined) {
      throw new Error(`${TAG} LRUCache createDefault method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListConstructor1() {
  let TAG = 'testListConstructor1'
  try {
    let list: List<number> = new List<number>();
    if (list.length !== 0) {
      throw new Error(`${TAG} List constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListAdd1() {
  let TAG = 'testListAdd1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    if (list.length !== 2) {
      throw new Error(`${TAG} List add method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListInsert1() {
  let TAG = 'testListInsert1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.insert(2, 0);
    if (list.get(0) !== 2) {
      throw new Error(`${TAG} List insert method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListHas1() {
  let TAG = 'testListHas1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    if (!list.has(1)) {
      throw new Error(`${TAG} List has method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListGet1() {
  let TAG = 'testListGet1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    if (list.get(0) !== 1) {
      throw new Error(`${TAG} List get method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListGetIndexOf1() {
  let TAG = 'testListGetIndexOf1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    if (list.getIndexOf(2) !== 1) {
      throw new Error(`${TAG} List getIndexOf method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListGetLastIndexOf1() {
  let TAG = 'testListGetLastIndexOf1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    list.add(2);
    if (list.getLastIndexOf(2) !== 2) {
      throw new Error(`${TAG} List getLastIndexOf method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListRemoveByIndex1() {
  let TAG = 'testListRemoveByIndex1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    let removed: number | undefined = list.removeByIndex(0);
    if (removed !== 1) {
      throw new Error(`${TAG} List removeByIndex method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListRemove1() {
  let TAG = 'testListRemove1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    let removed: boolean | undefined = list.remove(1);
    if (removed !== true) {
      throw new Error(`${TAG} List remove method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListSet1() {
  let TAG = 'testListSet1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    let value: number | undefined = list.set(0, 3);
    if (value !== 3 || list.get(0) !== 3) {
      throw new Error(`${TAG} List set method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListClear1() {
  let TAG = 'testListClear1'
  try {
    let list: List<number> = new List<number>();
    list.add(1);
    list.add(2);
    list.clear();
    if (list.length !== 0) {
      throw new Error(`${TAG} List clear method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testListSort1() {
  let TAG = 'testListSort1'
  try {
    let list: List<number> = new List<number>();
    list.add(3);
    list.add(1);
    list.add(2);
    list.sort((a: number, b: number) => a - b);
    if (list.get(0) !== 1 || list.get(1) !== 2 || list.get(2) !== 3) {
      throw new Error(`${TAG} List sort method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListConstructor1() {
  let TAG = 'testArrayListConstructor1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    if (arrayList.length !== 0) {
      throw new Error(`${TAG} ArrayList constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListAdd1() {
  let TAG = 'testArrayListAdd1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    if (arrayList.length !== 2) {
      throw new Error(`${TAG} ArrayList add method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListInsert1() {
  let TAG = 'testArrayListInsert1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.insert(2, 0);
    if (arrayList.getIndexOf(2) !== 0) {
      throw new Error(`${TAG} ArrayList insert method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListHas1() {
  let TAG = 'testArrayListHas1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    if (!arrayList.has(1)) {
      throw new Error(`${TAG} ArrayList has method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListGetIndexOf1() {
  let TAG = 'testArrayListGetIndexOf1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    if (arrayList.getIndexOf(2) !== 1) {
      throw new Error(`${TAG} ArrayList getIndexOf method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListGetLastIndexOf1() {
  let TAG = 'testArrayListGetLastIndexOf1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(2);
    if (arrayList.getLastIndexOf(2) !== 2) {
      throw new Error(`${TAG} ArrayList getLastIndexOf method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListRemoveByIndex1() {
  let TAG = 'testArrayListRemoveByIndex1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    let removed: number | undefined = arrayList.removeByIndex(0);
    if (removed !== 1) {
      throw new Error(`${TAG} ArrayList removeByIndex method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListRemove1() {
  let TAG = 'testArrayListRemove1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    let removed: boolean | undefined = arrayList.remove(1);
    if (removed !== true) {
      throw new Error(`${TAG} ArrayList remove method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListRemoveByRange1() {
  let TAG = 'testArrayListRemoveByRange1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(3);
    arrayList.add(4);
    arrayList.removeByRange(1, 3);
    if (arrayList.length !== 2) {
      throw new Error(`${TAG} ArrayList removeByRange method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListReplaceAllElements1() {
  let TAG = 'testArrayListReplaceAllElements1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(3);
    arrayList.replaceAllElements((value: number): number => {
      return value * 2;
    });
    if (arrayList.getIndexOf(2) !== 0) {
      throw new Error(`${TAG} ArrayList replaceAllElements method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListForEach1() {
  let TAG = 'testArrayListForEach1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(3);
    let count: int = 0;
    arrayList.forEach((value: number) => {
      count++;
    });
    if (count !== 3) {
      throw new Error(`${TAG} ArrayList forEach method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListSort1() {
  let TAG = 'testArrayListSort1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.sort((a: number, b: number) => a - b);
    if (arrayList.getIndexOf(1) !== 0) {
      throw new Error(`${TAG} ArrayList sort method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListSubArrayList1() {
  let TAG = 'testArrayListSubArrayList1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(3);
    arrayList.add(4);
    if (arrayList.subArrayList(1, 3).length !== 2) {
      throw new Error(`${TAG} ArrayList subArrayList method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListClear1() {
  let TAG = 'testArrayListClear1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    arrayList.clear();
    if (arrayList.length !== 0) {
      throw new Error(`${TAG} ArrayList clear method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListClone1() {
  let TAG = 'testArrayListClone1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    let cloned: ArrayList<number> = arrayList.clone();
    if (cloned.length !== arrayList.length) {
      throw new Error(`${TAG} ArrayList clone method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListGetCapacity1() {
  let TAG = 'testArrayListGetCapacity1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    let capacity: int = arrayList.getCapacity();
    if (capacity < arrayList.length) {
      throw new Error(`${TAG} ArrayList getCapacity method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListConvertToArray1() {
  let TAG = 'testArrayListConvertToArray1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    let array: number[] = arrayList.convertToArray();
    if (array.length !== 2) {
      throw new Error(`${TAG} ArrayList convertToArray method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testArrayListIsEmpty1() {
  let TAG = 'testArrayListIsEmpty1'
  try {
    let arrayList: ArrayList<number> = new ArrayList<number>();
    if (!arrayList.isEmpty()) {
      throw new Error(`${TAG} ArrayList isEmpty method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleDebug1() {
  let TAG = 'testConsoleDebug1'
  try {
    let num: int = 1;
    let str = 'str';
    console.debug('count: %d', num);
    console.debug('count: %d');
    console.debug(num.toString());
    console.debug('count: %d', str);
    console.debug('count: %d');
    console.debug(str);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleLog1() {
  let TAG = 'testConsoleLog1'
  try {
    let num: int = 1;
    let str = 'str';
    console.log('count: %d', num);
    console.log('count: %d');
    console.log(num.toString());
    console.log('count: %d', str);
    console.log('count: %d');
    console.log(str);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleInfo1() {
  let TAG = 'testConsoleInfo1'
  try {
    let num: int = 1;
    let str = 'str';
    console.info('count: %d', num);
    console.info('count: %d');
    console.info(num.toString());
    console.info('count: %d', str);
    console.info('count: %d');
    console.info(str);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleWarn1() {
  let TAG = 'testConsoleWarn1'
  try {
    let num: int = 1;
    let str = 'str';
    console.warn('count: %d', num);
    console.warn('count: %d');
    console.warn(num.toString());
    console.warn('count: %d', str);
    console.warn('count: %d');
    console.warn(str);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleError1() {
  let TAG = 'testConsoleError1'
  try {
    let num: int = 1;
    let str = 'str';
    console.error('count: %d', num);
    console.error('count: %d');
    console.error(num.toString());
    console.error('count: %d', str);
    console.error('count: %d');
    console.error(str);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleAssert1() {
  let TAG = 'testConsoleAssert1'
  try {
    console.assert(true, 'does nothing');
    console.assert(2 % 1 == 0, 'does nothing');
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleCount1() {
  let TAG = 'testConsoleCount1'
  try {
    console.count();
    console.count('abc');
    console.count('default');
    console.count('abc');
    console.count('abc');
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleCountReset1() {
  let TAG = 'testConsoleCountReset1'
  try {
    console.count();
    console.countReset();
    console.count();
    console.count('abc');
    console.countReset('abc');
    console.count('abc');
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
class Bar {
  public a: number = 1;
}

export function testConsoleDir1() {
  let TAG = 'testConsoleDir1'
  try {

    let a: Bar = new Bar();
    console.dir(a);

    const buffer1 = buffer.from('Hello World');
    console.dir(buffer1);
    let arrayList: number[] = [1, 2, 3];
    console.dir(arrayList);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleTable1() {
  let TAG = 'testConsoleTable1'
  try {
    console.table([1, 2, 3]);
    
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleTime1() {
  let TAG = 'testConsoleTime1'
  try {
    console.time('testConsoleTime1');
    console.time();
    console.time('default');
    console.time('abc');
    console.time('NaN');
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleTimeEnd1() {
  let TAG = 'testConsoleTimeEnd1'
  try {
    console.time('testConsoleTimeEnd1');
    console.timeEnd('testConsoleTimeEnd1');

    console.time();
    console.timeEnd();

    console.time('default');
    console.timeEnd('default');

    console.time('abc');
    console.timeEnd('abc');
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testConsoleTimeLog1() {
  let TAG = 'testConsoleTimeLog1'
  try {
    const str = 'testConsoleTimeLog1';
    console.time(str);
    console.timeLog(str);
    console.timeEnd(str);

    console.time();
    console.timeLog();
    console.timeEnd();

    const str2 = 'default';
    console.time(str2);
    console.timeLog(str2);
    console.timeEnd(str2);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequeInsertFront1() {
  let TAG = 'testDequeInsertFront1'
  try {
    let deque: Deque<string> = new Deque<string>();
    deque.insertFront('a')
    deque.insertFront('b')
    deque.insertFront('c')
    let result = deque.getFirst();
    if (result !== 'c') {
      throw new Error(`${TAG} Deque insertFront method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequeInsertEnd1() {
  let TAG = 'testDequeInsertEnd1'
  try {
    let deque: Deque<string> = new Deque<string>();
    deque.insertEnd('a')
    deque.insertEnd('b')
    deque.insertEnd('c')
    let result = deque.getLast();
    if (result !== 'c') {
      throw new Error(`${TAG} Deque insertEnd method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequeHas1() {
  let TAG = 'testDequeHas1'
  try {
    let deque: Deque<string> = new Deque<string>();
    deque.insertFront('a')
    let result = deque.has('a');
    if (result !== true) {
      throw new Error(`${TAG} Deque has method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequePopFirst1() {
  let TAG = 'testDequePopFirst1'
  try {
    let deque: Deque<number> = new Deque<number>();
    deque.insertFront(1);
    deque.insertFront(2)
    deque.insertEnd(3);
    deque.insertFront(4)
    deque.popFirst()
    let result = deque.getFirst();
    if (result !== 2) {
      throw new Error(`${TAG} Deque popFirst method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequePopLast1() {
  let TAG = 'testDequePopLast1'
  try {
    let deque: Deque<number> = new Deque<number>();
    deque.insertFront(1);
    deque.insertFront(2);
    deque.insertEnd(4);
    deque.insertFront(3);
    deque.popLast();
    let result = deque.getLast();
    if (result !== 1) {
      throw new Error(`${TAG} Deque popLast method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequeGetFirst1() {
  let TAG = 'testDequeGetFirst1'
  try {
    let deque: Deque<number> = new Deque<number>();
    deque.insertFront(1);
    deque.insertFront(2);
    deque.insertEnd(4);
    deque.insertFront(3);
    let result = deque.getFirst();
    if (result !== 3) {
      throw new Error(`${TAG} Deque getFirst method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequeGetLast1() {
  let TAG = 'testDequeGetLast1'
  try {
    let deque: Deque<number> = new Deque<number>();
    deque.insertFront(1);
    deque.insertFront(2);
    deque.insertEnd(4);
    deque.insertFront(3);
    let result = deque.getLast();
    if (result !== 4) {
      throw new Error(`${TAG} Deque getLast method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDequeForEach1() {
  let TAG = 'testDequeForEach1'
  try {
    let deque: Deque<number> = new Deque<number>();
    deque.insertEnd(1);
    deque.insertEnd(2);
    deque.insertEnd(3);
    let count: int = 0;
    deque.forEach((item, index: int) => {
      count++;
      if (index !== undefined && item !== index + 1) {
        throw new Error(`${TAG} Deque forEach method failed`)
      }
    })
    if (count !== 3) {
      throw new Error(`${TAG} Deque forEach method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapConstructor1() {
  let TAG = 'testHashMapConstructor1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    if (hashMap.length !== 0) {
      throw new Error(`${TAG} HashMap constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapSet1() {
  let TAG = 'testHashMapSet1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    hashMap.set('key2', 2);
    if (hashMap.length !== 2) {
      throw new Error(`${TAG} HashMap set method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapGet1() {
  let TAG = 'testHashMapGet1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    let result: number | undefined = hashMap.get('key1');
    if (result !== 1) {
      throw new Error(`${TAG} HashMap get method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapHasKey1() {
  let TAG = 'testHashMapHasKey1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    if (!hashMap.hasKey('key1')) {
      throw new Error(`${TAG} HashMap hasKey method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapHasValue1() {
  let TAG = 'testHashMapHasValue1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    if (!hashMap.hasValue(1)) {
      throw new Error(`${TAG} HashMap hasValue method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapRemove1() {
  let TAG = 'testHashMapRemove1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    let result: number | undefined = hashMap.remove('key1');
    if (result !== 1 || hashMap.length !== 0) {
      throw new Error(`${TAG} HashMap remove method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapClear1() {
  let TAG = 'testHashMapClear1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    hashMap.set('key2', 2);
    hashMap.clear();
    if (hashMap.length !== 0) {
      throw new Error(`${TAG} HashMap clear method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapReplace1() {
  let TAG = 'testHashMapReplace1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    let result: boolean = hashMap.replace('key1', 2);
    if (!result || hashMap.get('key1') !== 2) {
      throw new Error(`${TAG} HashMap replace method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapSetAll1() {
  let TAG = 'testHashMapSetAll1'
  try {
    const hashMap1: HashMap<string, number> = new HashMap<string, number>();
    const hashMap2: HashMap<string, number> = new HashMap<string, number>();
    hashMap1.set('key1', 1);
    hashMap2.set('key2', 2);
    hashMap1.setAll(hashMap2);
    if (hashMap1.length !== 2) {
      throw new Error(`${TAG} HashMap setAll method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapForEach1() {
  let TAG = 'testHashMapForEach1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    hashMap.set('key2', 2);
    let count: int = 0;
    hashMap.forEach((value?: number, key?: string) => {
      count++;
    });
    if (count !== 2) {
      throw new Error(`${TAG} HashMap forEach method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapKeys1() {
  let TAG = 'testHashMapKeys1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    hashMap.set('key2', 2);
    let keys: IterableIterator<string> = hashMap.keys();
    let count: int = 0;
    let temp = keys.next();
    while (!temp.done) {
      count++;
      temp = keys.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} HashMap keys method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapValues1() {
  let TAG = 'testHashMapValues1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    hashMap.set('key2', 2);
    let values: IterableIterator<number> = hashMap.values();
    let count: int = 0;
    let temp = values.next();
    while (!temp.done) {
      count++;
      temp = values.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} HashMap values method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapEntries1() {
  let TAG = 'testHashMapEntries1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    hashMap.set('key1', 1);
    hashMap.set('key2', 2);
    let entries: IterableIterator<[string, number]> = hashMap.entries();
    let count: int = 0;
    let temp = entries.next();
    while (!temp.done) {
      count++;
      temp = entries.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} HashMap entries method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashMapIsEmpty1() {
  let TAG = 'testHashMapIsEmpty1'
  try {
    const hashMap: HashMap<string, number> = new HashMap<string, number>();
    if (!hashMap.isEmpty()) {
      throw new Error(`${TAG} HashMap isEmpty method failed`)
    }
    hashMap.set('key1', 1);
    if (hashMap.isEmpty()) {
      throw new Error(`${TAG} HashMap isEmpty method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetConstructor1() {
  let TAG = 'testHashSetConstructor1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    if (hashSet.length !== 0) {
      throw new Error(`${TAG} HashSet constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetAdd1() {
  let TAG = 'testHashSetAdd1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    hashSet.add(1);
    hashSet.add(2);
    if (hashSet.length !== 2) {
      throw new Error(`${TAG} HashSet add method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetHas1() {
  let TAG = 'testHashSetHas1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    hashSet.add(1);
    if (!hashSet.has(1)) {
      throw new Error(`${TAG} HashSet has method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetRemove1() {
  let TAG = 'testHashSetRemove1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    hashSet.add(1);
    let result: boolean = hashSet.remove(1);
    if (!result || hashSet.length !== 0) {
      throw new Error(`${TAG} HashSet remove method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetClear1() {
  let TAG = 'testHashSetClear1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    hashSet.add(1);
    hashSet.add(2);
    hashSet.clear();
    if (hashSet.length !== 0) {
      throw new Error(`${TAG} HashSet clear method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetIsEmpty1() {
  let TAG = 'testHashSetIsEmpty1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    if (!hashSet.isEmpty()) {
      throw new Error(`${TAG} HashSet isEmpty method failed`)
    }
    hashSet.add(1);
    if (hashSet.isEmpty()) {
      throw new Error(`${TAG} HashSet isEmpty method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetForEach1() {
  let TAG = 'testHashSetForEach1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    hashSet.add(1);
    hashSet.add(2);
    let count: int = 0;
    hashSet.forEach((value?: number) => {
      count++;
    });
    if (count !== 2) {
      throw new Error(`${TAG} HashSet forEach method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetValues1() {
  let TAG = 'testHashSetValues1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    hashSet.add(1);
    hashSet.add(2);
    let values: IterableIterator<number> = hashSet.values();
    let count: int = 0;
    let temp = values.next();
    while (!temp.done) {
      count++;
      temp = values.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} HashSet values method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testHashSetEntries1() {
  let TAG = 'testHashSetEntries1'
  try {
    const hashSet: HashSet<number> = new HashSet<number>();
    hashSet.add(1);
    hashSet.add(2);
    let entries: IterableIterator<[number, number]> = hashSet.entries();
    let count: int = 0;
    let temp = entries.next();
    while (!temp.done) {
      count++;
      temp = entries.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} HashSet entries method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapConstructor1() {
  let TAG = 'testLightWeightMapConstructor1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    if (!lightWeightMap) {
      throw new Error(`${TAG} LightWeightMap constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapSet1() {
  let TAG = 'testLightWeightMapSet1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 1);
    lightWeightMap.set('key2', 2);
    if (lightWeightMap.length !== 2) {
      throw new Error(`${TAG} LightWeightMap set method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapGet1() {
  let TAG = 'testLightWeightMapGet1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    let result: number | undefined = lightWeightMap.get('key1');
    if (result !== 100) {
      throw new Error(`${TAG} LightWeightMap get method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapHasKey1() {
  let TAG = 'testLightWeightMapHasKey1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    let result: boolean = lightWeightMap.hasKey('key1');
    if (!result) {
      throw new Error(`${TAG} LightWeightMap hasKey method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapHasValue1() {
  let TAG = 'testLightWeightMapHasValue1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    let result: boolean = lightWeightMap.hasValue(100);
    if (!result) {
      throw new Error(`${TAG} LightWeightMap hasValue method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapRemove1() {
  let TAG = 'testLightWeightMapRemove1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    lightWeightMap.set('key2', 200);
    let result: number | undefined = lightWeightMap.remove('key1');
    if (result !== 100) {
      throw new Error(`${TAG} LightWeightMap remove method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapClear1() {
  let TAG = 'testLightWeightMapClear1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    lightWeightMap.set('key2', 200);
    lightWeightMap.clear();
    if (!lightWeightMap.isEmpty()) {
      throw new Error(`${TAG} LightWeightMap clear method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapForEach1() {
  let TAG = 'testLightWeightMapForEach1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    lightWeightMap.set('key2', 200);
    let count: int = 0;
    lightWeightMap.forEach((value: number, key: string) => {
      count++;
      if (value !== 100 && value !== 200) {
        throw new Error(`${TAG} LightWeightMap forEach method failed`)
      }
    })
    if (count !== 2) {
      throw new Error(`${TAG} LightWeightMap forEach method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapKeys1() {
  let TAG = 'testLightWeightMapKeys1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    lightWeightMap.set('key2', 200);
    let keys: IterableIterator<string> = lightWeightMap.keys();
    let count: int = 0;
    let temp: IteratorResult<string> = keys.next();
    while (!temp.done) {
      count++;
      temp = keys.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} LightWeightMap keys method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapValues1() {
  let TAG = 'testLightWeightMapValues1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    lightWeightMap.set('key2', 200);
    let values: IterableIterator<number> = lightWeightMap.values();
    let count: int = 0;
    let temp: IteratorResult<number> = values.next();
    while (!temp.done) {
      count++;
      temp = values.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} LightWeightMap values method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapEntries1() {
  let TAG = 'testLightWeightMapEntries1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    lightWeightMap.set('key1', 100);
    lightWeightMap.set('key2', 200);
    let entries: IterableIterator<[string, number]> = lightWeightMap.entries();
    let count: int = 0;
    let temp: IteratorResult<[string, number]> = entries.next();
    while (!temp.done) {
      count++;
      temp = entries.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} LightWeightMap entries method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightMapIsEmpty1() {
  let TAG = 'testLightWeightMapIsEmpty1'
  try {
    let lightWeightMap: LightWeightMap<string, number> = new LightWeightMap<string, number>();
    if (!lightWeightMap.isEmpty()) {
      throw new Error(`${TAG} LightWeightMap isEmpty method failed`)
    }
    lightWeightMap.set('key1', 100);
    if (lightWeightMap.isEmpty()) {
      throw new Error(`${TAG} LightWeightMap isEmpty method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetConstructor1() {
  let TAG = 'testLightWeightSetConstructor1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    if (!lightWeightSet) {
      throw new Error(`${TAG} LightWeightSet constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetAdd1() {
  let TAG = 'testLightWeightSetAdd1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    let result: boolean = lightWeightSet.add(1);
    if (!result) {
      throw new Error(`${TAG} LightWeightSet add method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetHas1() {
  let TAG = 'testLightWeightSetHas1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    lightWeightSet.add(100);
    let result: boolean = lightWeightSet.has(100);
    if (!result) {
      throw new Error(`${TAG} LightWeightSet has method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetRemove1() {
  let TAG = 'testLightWeightSetRemove1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    lightWeightSet.add(100);
    lightWeightSet.add(200);
    let result: number | undefined = lightWeightSet.remove(100);
    if (result !== 100) {
      throw new Error(`${TAG} LightWeightSet remove method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetClear1() {
  let TAG = 'testLightWeightSetClear1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    lightWeightSet.add(100);
    lightWeightSet.add(200);
    lightWeightSet.clear();
    if (!lightWeightSet.isEmpty()) {
      throw new Error(`${TAG} LightWeightSet clear method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetIsEmpty1() {
  let TAG = 'testLightWeightSetIsEmpty1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    if (!lightWeightSet.isEmpty()) {
      throw new Error(`${TAG} LightWeightSet isEmpty method failed`)
    }
    lightWeightSet.add(100);
    if (lightWeightSet.isEmpty()) {
      throw new Error(`${TAG} LightWeightSet isEmpty method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetForEach1() {
  let TAG = 'testLightWeightSetForEach1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    lightWeightSet.add(100);
    lightWeightSet.add(200);
    let count: int = 0;
    lightWeightSet.forEach((value: number) => {
      count++;
      if (value !== 100 && value !== 200) {
        throw new Error(`${TAG} LightWeightSet forEach method failed`)
      }
    })
    if (count !== 2) {
      throw new Error(`${TAG} LightWeightSet forEach method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetValues1() {
  let TAG = 'testLightWeightSetValues1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    lightWeightSet.add(100);
    lightWeightSet.add(200);
    let values: IterableIterator<number> = lightWeightSet.values();
    let count: int = 0;
    let temp: IteratorResult<number> = values.next();
    while (!temp.done) {
      count++;
      temp = values.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} LightWeightSet values method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetEntries1() {
  let TAG = 'testLightWeightSetEntries1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    lightWeightSet.add(100);
    lightWeightSet.add(200);
    let entries: IterableIterator<[number, number]> = lightWeightSet.entries();
    let count: int = 0;
    let temp: IteratorResult<[number, number]> = entries.next();
    while (!temp.done) {
      count++;
      temp = entries.next();
    }
    if (count !== 2) {
      throw new Error(`${TAG} LightWeightSet entries method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLightWeightSetToArray1() {
  let TAG = 'testLightWeightSetToArray1'
  try {
    let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
    lightWeightSet.add(100);
    lightWeightSet.add(200);
    let array: number[] = lightWeightSet.toArray();
    if (array.length !== 2) {
      throw new Error(`${TAG} LightWeightSet toArray method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}