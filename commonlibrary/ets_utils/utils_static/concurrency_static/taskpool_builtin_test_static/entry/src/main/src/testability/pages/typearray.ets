'use static'

// -------------------- TypedArray.from -----------------------

export function testTypedArrayFrom() {
  const TAG = 'testTypedArrayFrom';
  try {
    const s = new Set<int>([1, 2, 3]);
    const value = Uint8Array.from(s);
    const json = JSON.stringify(value);
    if (json !== '{"0":1,"1":2,"2":3}') {
      throw new Error(`${TAG} invalid result: ${json}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- TypedArray.of -------------------------

export function testTypedArrayOf() {
  const TAG = 'testTypedArrayOf';
  try {
    const value = Uint8Array.of(1, 2, 3);
    const json = JSON.stringify(value);
    if (json !== '{"0":1,"1":2,"2":3}') {
      throw new Error(`${TAG} invalid result: ${json}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- copyWithin ----------------------------

export function testCopyWithin() {
  const TAG = 'testCopyWithin';
  try {
    const buffer = new ArrayBuffer(8);
    const array = new Uint8Array(buffer);
    array.set([1, 2, 3]);
    const value = array.copyWithin(1, 2);
    const json = JSON.stringify(value);
    const expectJson = '{"0":1,"1":3,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0}';
    if (json !== expectJson) {
      throw new Error(`${TAG} invalid result: ${json}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- entries -------------------------------

export function testEntries() {
  const TAG = 'testEntries';
  try {
    const arr = new Uint8Array([10, 20, 30]);
    const eArr = arr.entries();
    if (JSON.stringify(eArr.next().value) !== '[0,10]') {
      throw new Error(`${TAG} 0`);
    }
    if (JSON.stringify(eArr.next().value) !== '[1,20]') {
      throw new Error(`${TAG} 1`);
    }
    if (JSON.stringify(eArr.next().value) !== '[2,30]') {
      throw new Error(`${TAG} 2`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- fill ---------------------------------

export function testFill() {
  const TAG = 'testFill';
  try {
    const array: number[] = [1, 2, 3];
    const value = new Uint8Array(array).fill(4);
    const json = JSON.stringify(value);
    if (json !== '{"0":4,"1":4,"2":4}') {
      throw new Error(`${TAG} invalid result: ${json}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- filter -------------------------------

export function testFilter() {
  const TAG = 'testFilter';
  try {
    const array: number[] = [12, 5, 8, 130, 44];
    const value = new Uint8Array(array).filter((elem) => elem >= 10);
    const json = JSON.stringify(value);
    if (json !== '{"0":12,"1":130,"2":44}') {
      throw new Error(`${TAG} invalid result: ${json}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- find ---------------------------------

export function testFind() {
  const TAG = 'testFind';
  try {
    const isNegative = (element: number): boolean => element < 0;
    const int8 = new Int8Array([10, 0, -10, 20, -30, 40, -50]);
    const res = int8.find(isNegative);
    if (res !== -10) {
      throw new Error(`${TAG} invalid result: ${res}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- findIndex -----------------------------

export function testFindIndex() {
  const TAG = 'testFindIndex';
  try {
    const isNegative = (element: number): boolean => element < 0;
    const int8 = new Int8Array([10, 0, -10, 20, -30, 40, -50]);
    const res = int8.findIndex(isNegative);
    if (res !== 2) {
      throw new Error(`${TAG} invalid result: ${res}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- forEach ------------------------------

export function testForEach() {
  const TAG = 'testForEach';
  try {
    const uint8 = new Uint8Array([1, 2, 3, 4]);
    let count: int = 0;
    uint8.forEach(() =>{count++} );
    if (count !== 4) {
      throw new Error(`${TAG} invalid count: ${count}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- includes -----------------------------

export function testIncludes() {
  const TAG = 'testIncludes';
  try {
    const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
    if (!uint8.includes(20)) {
      throw new Error(`${TAG} should include 20`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- indexOf ------------------------------

export function testIndexOf() {
  const TAG = 'testIndexOf';
  try {
    const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
    if (uint8.indexOf(50) !== 4) {
      throw new Error(`${TAG} invalid index`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- join ---------------------------------

export function testJoin() {
  const TAG = 'testJoin';
  try {
    const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
    const str = uint8.join('-');
    if (str !== '10-20-30-40-50') {
      throw new Error(`${TAG} invalid result: ${str}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- keys ---------------------------------

export function testKeys() {
  const TAG = 'testKeys';
  try {
    const uint8 = new Uint8Array([10, 20, 30]);
    const keys = uint8.keys();
    if (keys.next().value !== 0) {
      throw new Error(`${TAG} 0`);
    }
    if (keys.next().value !== 1) {
      throw new Error(`${TAG} 1`);
    }
    if (keys.next().value !== 2) {
      throw new Error(`${TAG} 2`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- lastIndexOf --------------------------

export function testLastIndexOf() {
  const TAG = 'testLastIndexOf';
  try {
    const uint8 = new Uint8Array([10, 20, 50, 50, 50, 60]);
    const idx = uint8.lastIndexOf(50);
    if (idx !== 4) {
      throw new Error(`${TAG} invalid index: ${idx}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- map ----------------------------------

export function testMap() {
  const TAG = 'testMap';
  try {
    const uint8 = new Uint8Array([25, 36, 49]);
    const result = uint8.map(Math.sqrt).toString();
    if (result !== '5,6,7') {
      throw new Error(`${TAG} invalid result: ${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- reduce -------------------------------

export function testReduce() {
  const TAG = 'testReduce';
  try {
    const uint8 = new Uint8Array([0, 1, 2, 3]);
    const sum = uint8.reduce((a, b) => a + b);
    if (sum !== 6) {
      throw new Error(`${TAG} invalid sum: ${sum}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- reduceRight --------------------------

export function testReduceRight() {
  const TAG = 'testReduceRight';
  try {
    const uint8 = new Uint8Array([10, 20, 30]);
    const result = uint8.reduceRight((a, c) => `${a},${c}`, '').replace(new RegExp("^,"), '');
    if (result !== '30,20,10') {
      throw new Error(`${TAG} invalid result: ${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- reverse ------------------------------

export function testReverse() {
  const TAG = 'testReverse';
  try {
    const uint8 = new Uint8Array([1, 2, 3]);
    const result = uint8.reverse().toString();
    if (result !== '3,2,1') {
      throw new Error(`${TAG} invalid result: ${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- set ----------------------------------

export function testSet() {
  const TAG = 'testSet';
  try {
    const buffer = new ArrayBuffer(8);
    const uint8 = new Uint8Array(buffer);
    uint8.set([1, 2, 3], 3);
    const str = Array.from(uint8).toString();
    if (str !== '0,0,0,1,2,3,0,0') {
      throw new Error(`${TAG} invalid result: ${str}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- slice --------------------------------

export function testSlice() {
  const TAG = 'testSlice';
  try {
    const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
    const sliced = Array.from(uint8.slice(1, 3));
    if (JSON.stringify(sliced) !== JSON.stringify([20, 30])) {
      throw new Error(`${TAG} invalid slice`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- some ---------------------------------

export function testSome() {
  const TAG = 'testSome';
  try {
    const isNegative = (e: number) => e < 0;
    const int8 = new Int8Array([-10, 20, -30, 40, -50]);
    if (!int8.some(isNegative)) {
      throw new Error(`${TAG} should have negative`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- sort ---------------------------------

export function testSort() {
  const TAG = 'testSort';
  try {
    const uint8 = new Uint8Array([40, 10, 50, 20, 30]);
    uint8.sort();
    const arr = Array.from(uint8);
    if (JSON.stringify(arr) !== JSON.stringify([10, 20, 30, 40, 50])) {
      throw new Error(`${TAG} invalid sort`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- subarray -----------------------------

export function testSubarray() {
  const TAG = 'testSubarray';
  try {
    const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
    const value = Array.from(uint8.subarray(1, 3));
    if (JSON.stringify(value) !== JSON.stringify([20, 30])) {
      throw new Error(`${TAG} invalid subarray`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- .$_iterator --------------------

export function testSymbolIterator() {
  const TAG = 'testSymbolIterator';
  try {
    const uint8 = new Uint8Array([10, 20, 30]);
    const iter = uint8.$_iterator();
    if (iter.next().value !== 10) {
      throw new Error(`${TAG} 0`);
    }
    if (iter.next().value !== 20) {
      throw new Error(`${TAG} 1`);
    }
    if (iter.next().value !== 30) {
      throw new Error(`${TAG} 2`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- toLocaleString ------------------------

export function testToLocaleString() {
  const TAG = 'testToLocaleString';
  try {
    const uint32 = new Uint32Array([500, 8123, 12]);
    const str = uint32.toLocaleString();
    if (str !== '500,8,123,12') {
      throw new Error(`${TAG} invalid result: ${str}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- toString -----------------------------

export function testToString() {
  const TAG = 'testToString';
  try {
    const uint8 = new Uint8Array([10, 20, 30]);
    const str = uint8.toString();
    if (str !== '10,20,30') {
      throw new Error(`${TAG} invalid result: ${str}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -------------------- values -------------------------------

export function testValues() {
  const TAG = 'testValues';
  try {
    const uint8 = new Uint8Array([10, 20, 30]);
    const v = uint8.values();
    if (v.next().value !== 10) {
      throw new Error(`${TAG} 0`);
    }
    if (v.next().value !== 20) {
      throw new Error(`${TAG} 1`);
    }
    if (v.next().value !== 30) {
      throw new Error(`${TAG} 2`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}
