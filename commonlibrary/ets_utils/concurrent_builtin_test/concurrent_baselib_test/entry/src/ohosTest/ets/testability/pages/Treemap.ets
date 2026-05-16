import { TreeMap } from '@kit.ArkTS';

@Concurrent
export function testTreeMapConstructorDefault() {
  const caseName = 'testConstructor0001';
  try {
    console.log(`${caseName} test start`);
    let treeMap: TreeMap<number, number> = new TreeMap();
    treeMap.set(111, 999);
    treeMap.set(222, 888);
    treeMap.set(333, 777);
    let length = treeMap.length;
    if (length !== 3) {
      throw new Error(`${caseName} length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeMapConstructorWithComparator() {
  const caseName = 'testConstructor0002';
  try {
    console.log(`${caseName} test start`);
    let treeMap: TreeMap<string, string> =
      new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
        return firstValue > secondValue;
      });
    treeMap.set('AAA', '111');
    treeMap.set('BBB', '222');
    treeMap.set('CCC', '333');
    let length = treeMap.length;
    if (length !== 3) {
      throw new Error(`${caseName} length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeMapIsEmpty() {
  const caseName = 'testIsEmpty0001';
  try {
    console.log(`${caseName} test start`);
    let treeMap: TreeMap<number, number> = new TreeMap();
    let result = treeMap.isEmpty();
    if (result !== true) {
      throw new Error(`${caseName} isEmpty mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeMapHasKey() {
  const caseName = 'testHasKey0005';
  try {
    console.log(`${caseName} test start`);
    let treeMap: TreeMap<string, number> = new TreeMap();
    treeMap.set('squirrel', 123);
    let result = treeMap.hasKey('squirrel');
    if (result !== true) {
      throw new Error(`${caseName} hasKey mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeMapGetFirstKey() {
  const caseName = 'testTreeMapGetFirstKey0003';
  try {
    console.log(`${caseName} test start`);
    let treeMap: TreeMap<string, number> = new TreeMap();
    treeMap.set('DEF', 123);
    treeMap.set('ABC', 356);
    let result = treeMap.getFirstKey();
    if (result !== 'ABC') {
      throw new Error(`${caseName} getFirstKey mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeMapForEach() {
  const caseName = 'testTreeMapForEach0002';
  try {
    console.log(`${caseName} test start`);
    let treeMap: TreeMap<string, number> = new TreeMap();
    treeMap.set('AAA', 123);
    treeMap.set('BBB', 456);
    treeMap.set('CCC', 789);
    treeMap.set('DDD', 666);
    treeMap.forEach((value ?: number, key ?: string): void => {
    });
    let res = treeMap.values();
    const v1:number = res.next().value;
    const v2:number = res.next().value;
    const v3:number = res.next().value;
    const v4:number = res.next().value;
    if (v1 !== 123 || v2 !== 456 || v3 !== 789 || v4 !== 666) {
      throw new Error(`${caseName} forEach traversal mismatch`);
    }
    const length = treeMap.length;
    if (length !== 4){
      throw new Error(`${caseName} length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}