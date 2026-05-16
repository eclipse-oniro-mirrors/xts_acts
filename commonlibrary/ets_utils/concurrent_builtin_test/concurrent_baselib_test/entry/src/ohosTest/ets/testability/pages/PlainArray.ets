
import { PlainArray } from '@kit.ArkTS';

// 01: constructor
@Concurrent
export function testPlainArrayConstructor001() {
  const TAG = 'testPlainArrayConstructor0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    if (plainArray.length !== 0) {
      throw new Error(`${TAG} length mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 02: isEmpty
@Concurrent
export function testPlainArrayIsEmpty002() {
  const TAG = 'testPlainArrayIsEmpty0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    if (plainArray.isEmpty() !== true) {
      throw new Error(`${TAG} isEmpty mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 03: has
@Concurrent
export function testPlainArrayHas003() {
  const TAG = 'testPlainArrayHas0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    let result = plainArray.has(1);
    if (result !== true) {
      throw new Error(`${TAG} has mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 04: get
@Concurrent
export function testPlainArrayGet004() {
  const TAG = 'testPlainArrayGet0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let result = plainArray.get(1);
    if (result !== 'squirrel') {
      throw new Error(`${TAG} get mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 05: getIndexOfKey
@Concurrent
export function testPlainArrayGetIndexOfKey005() {
  const TAG = 'testPlainArrayGetIndexOfKey0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, '');
    let result = plainArray.getIndexOfKey(2);
    if (result !== 1) {
      throw new Error(`${TAG} getIndexOfKey mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 06: getIndexOfValue
@Concurrent
export function testPlainArrayGetIndexOfValue006() {
  const TAG = 'testPlainArrayGetIndexOfValue0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, '');
    let result = plainArray.getIndexOfValue('');
    if (result !== 1) {
      throw new Error(`${TAG} getIndexOfValue mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 07: getKeyAt
@Concurrent
export function testPlainArrayGetKeyAt007() {
  const TAG = 'testPlainArrayGetKeyAt0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let result = plainArray.getKeyAt(3);
    if (result !== undefined) {
      throw new Error(`${TAG} getKeyAt out of bounds mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 08: getValueAt
@Concurrent
export function testPlainArrayGetValueAt008() {
  const TAG = 'testPlainArrayGetValueAt0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    try {
      plainArray.getValueAt(2);
    } catch (err) {
      if (err.code !== 10200001) {
        throw new Error(`${TAG} getValueAt out of bounds error code mismatch`);
      }
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 09: clone
@Concurrent
export function testPlainArrayClone009() {
  const TAG = 'testPlainArrayClone0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let newPlainArray = plainArray.clone();
    if (newPlainArray.length !== plainArray.length) {
      throw new Error(`${TAG} clone length mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 10: add
@Concurrent
export function testPlainArrayAdd010() {
  const TAG = 'testPlainArrayAdd0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    let param = 'a'.repeat(5120);
    plainArray.add(1, param);
    if (plainArray.length !== 1) {
      throw new Error(`${TAG} add length mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 11: remove
@Concurrent
export function testPlainArrayRemove011() {
  const TAG = 'testPlainArrayRemove0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let result = plainArray.remove(2);
    if (result !== 'sparrow') {
      throw new Error(`${TAG} remove return mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 12: removeAt
@Concurrent
export function testPlainArrayRemoveAt012() {
  const TAG = 'testPlainArrayRemoveAt0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let result = plainArray.removeAt(1);
    if (result !== 'sparrow') {
      throw new Error(`${TAG} removeAt return mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 13: removeRangeFrom
@Concurrent
export function testPlainArrayRemoveRangeFrom013() {
  const TAG = 'testPlainArrayRemoveRangeFrom0002';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let result = plainArray.removeRangeFrom(1, 3);
    if (result !== 1) {
      throw new Error(`${TAG} removeRangeFrom return mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 14: setValueAt
@Concurrent
export function testPlainArraySetValueAt014() {
  const TAG = 'testPlainArraySetValueAt0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string | number> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    plainArray.setValueAt(1, 3546);
    if (plainArray.getValueAt(1) !== 3546) {
      throw new Error(`${TAG} setValueAt mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 15: toString
@Concurrent
export function testPlainArrayToString015() {
  const TAG = 'testPlainArrayToString0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string | number> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let result = plainArray.toString();
    if (result !== '1:squirrel,2:sparrow') {
      throw new Error(`${TAG} toString mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 16: clear
@Concurrent
export function testPlainArrayClear016() {
  const TAG = 'testPlainArrayClear0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string | number | boolean> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    plainArray.clear();
    if (plainArray.length !== 0) {
      throw new Error(`${TAG} clear length mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 17: forEach
@Concurrent
export function testPlainArrayForEach017() {
  const TAG = 'testPlainArrayForEach0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    plainArray.forEach((value: string, index?: number) => {
      if (plainArray.get(index) !== value) {
        throw new Error(`${TAG} forEach mismatch at index ${index}`);
      }
    });
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 18: Symbol.iterator
@Concurrent
export function testPlainArraySymbolIterator018() {
  const TAG = 'testPlainArraySymbolIterator0001';
  try {
    console.log(`${TAG} test start`);
    let plainArray: PlainArray<string> = new PlainArray();
    plainArray.add(1, 'squirrel');
    plainArray.add(2, 'sparrow');
    let iter = plainArray[Symbol.iterator]();
    let temp: IteratorResult<Object[]> = iter.next();
    while (!temp.done) {
      let key = temp.value[0] as number;
      let value = temp.value[1] as string;
      if (plainArray.get(key) !== value) {
        throw new Error(`${TAG} Symbol.iterator mismatch at key ${key}`);
      }
      temp = iter.next();
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}