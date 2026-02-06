import { TreeSet } from '@kit.ArkTS';

@Concurrent
export function testTreeSetConstructorDefault() {
  const caseName = 'testConstructor0001';
  try {
    console.log(`${caseName} test start`);
    const treeSet: TreeSet<number> = new TreeSet();
    treeSet.add(65536);
    const length = treeSet.length;
    if (length !== 1) {
      throw new Error(`${caseName} length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeSetConstructorWithComparator() {
  const caseName = 'testConstructor0002';
  try {
    console.log(`${caseName} test start`);
    let treeSet: TreeSet<string> = new TreeSet<string>((firstValue: string, secondValue: string): boolean => {
      return firstValue > secondValue;
    });
    treeSet.add('AAA');
    treeSet.add('BBB');
    treeSet.add('CCC');
    const length = treeSet.length;
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
export function testTreeSetIsEmpty() {
  const caseName = 'testIsEmpty0001';
  try {
    console.log(`${caseName} test start`);
    const treeSet: TreeSet<string | number | boolean | Object> = new TreeSet();
    const result = treeSet.isEmpty();
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
export function testTreeSetHas() {
  const caseName = 'testHas0008';
  try {
    console.log(`${caseName} test start`);
    let treeSet: TreeSet<string> = new TreeSet();
    treeSet.add('squirrel');
    const result = treeSet.has('squirrel');
    if (result !== true) {
      throw new Error(`${caseName} has mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeSetGetFirstValue() {
  const caseName = 'testGetFirstValue0003';
  try {
    console.log(`${caseName} test start`);
    let treeSet: TreeSet<string> = new TreeSet();
    treeSet.add('squirrel');
    treeSet.add('sparrow');
    const result = treeSet.getFirstValue();
    if (result !== 'sparrow') {
      throw new Error(`${caseName} getFirstValue mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testTreeSetPopFirst() {
  const caseName = 'testPopFirst0002';
  try {
    console.log(`${caseName} test start`);
    let treeSet: TreeSet<string> = new TreeSet();
    treeSet.add('squirrel');
    treeSet.add('sparrow');
    treeSet.popFirst();
    const result = treeSet.has('sparrow');
    if (result !== false) {
      throw new Error(`${caseName} popFirst mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}