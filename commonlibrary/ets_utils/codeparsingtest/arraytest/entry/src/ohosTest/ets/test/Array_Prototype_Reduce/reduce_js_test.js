/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * Test reduce with Symbol initial value
 * @returns {Object} test result
 */
export function testSymbolInitialValue() {
  const sym = Symbol('init');
  const arr = [1, 2, 3];
  const result = arr.reduce((acc, cur) => {
    return typeof acc === 'symbol' ? cur : acc + cur;
  }, sym);

  return {
    result: result,
    expected: 6
  };
}

/**
 * Test reduce on sparse array
 * @returns {Object} test result
 */
export function testSparseArray() {
  const arr = [1, , , 4];
  const result = arr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 5
  };
}

/**
 * Test reduce with sparse array vs undefined
 * @returns {Object} test result
 */
export function testSparseArrayVsUndefined() {
  const sparseArr = [1, , , 4];
  const undefinedArr = [1, undefined, undefined, 4];
  const sparseResult = sparseArr.reduce((acc, cur) => acc + cur, 0);
  const undefinedResult = undefinedArr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: sparseResult,
    expected: 5
  };
}

/**
 * Test reduce with undefined array result is NaN
 * @returns {Object} test result
 */
export function testUndefinedArrayResult() {
  const undefinedArr = [1, undefined, undefined, 4];
  const undefinedResult = undefinedArr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: Number.isNaN(undefinedResult),
    expected: true
  };
}

/**
 * Test reduce on sparse array indices
 * @returns {Object} test result
 */
export function testSparseArrayIndices() {
  const arr = [1, , , 4];
  const indices = [];
  arr.reduce((acc, cur, idx) => {
    indices.push(idx);
    return acc + cur;
  }, 0);

  return {
    result: indices.length,
    expected: 2
  };
}

/**
 * Test reduce on sparse array first index
 * @returns {Object} test result
 */
export function testSparseArrayFirstIndex() {
  const arr = [1, , , 4];
  const indices = [];
  arr.reduce((acc, cur, idx) => {
    indices.push(idx);
    return acc + cur;
  }, 0);

  return {
    result: indices[0],
    expected: 0
  };
}

/**
 * Test reduce on sparse array last index
 * @returns {Object} test result
 */
export function testSparseArrayLastIndex() {
  const arr = [1, , , 4];
  const indices = [];
  arr.reduce((acc, cur, idx) => {
    indices.push(idx);
    return acc + cur;
  }, 0);

  return {
    result: indices[1],
    expected: 3
  };
}

/**
 * Test reduce on sparse array with empty slots at beginning
 * @returns {Object} test result
 */
export function testSparseArrayBeginning() {
  const arr = [, , 3, 4];
  const result = arr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 7
  };
}

/**
 * Test reduce on sparse array with empty slots at end
 * @returns {Object} test result
 */
export function testSparseArrayEnd() {
  const arr = [1, 2, , ,];
  const result = arr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 3
  };
}

/**
 * Test reduce on sparse array with empty slots in middle
 * @returns {Object} test result
 */
export function testSparseArrayMiddle() {
  const arr = [1, , 3, , 5];
  const result = arr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 9
  };
}

/**
 * Test reduce on all empty slots without initial value
 * @returns {Object} test result
 */
export function testAllEmptySlotsNoInitial() {
  const arr = new Array(5);
  let errorOccurred = false;
  try {
    arr.reduce((acc, cur) => acc + cur);
  } catch (e) {
    errorOccurred = e instanceof TypeError;
  }

  return {
    result: errorOccurred,
    expected: true
  };
}

/**
 * Test reduce on all empty slots with initial value
 * @returns {Object} test result
 */
export function testAllEmptySlotsWithInitial() {
  const arr = new Array(5);
  const result = arr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 0
  };
}

/**
 * Test reduce on sparse array length
 * @returns {Object} test result
 */
export function testSparseArrayLength() {
  const arr = [1, , , 4];

  return {
    result: arr.length,
    expected: 4
  };
}

/**
 * Test reduce on sparse array visited count
 * @returns {Object} test result
 */
export function testSparseArrayVisitedCount() {
  const arr = [1, , , 4];
  const visited = [];
  arr.reduce((acc, cur, idx) => {
    visited.push(idx);
    return acc + cur;
  }, 0);

  return {
    result: visited.length,
    expected: 2
  };
}

/**
 * Test reduce on dynamically created sparse array
 * @returns {Object} test result
 */
export function testDynamicSparseArray() {
  const arr = new Array(10);
  arr[0] = 1;
  arr[9] = 10;
  const result = arr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 11
  };
}

/**
 * Test reduce on sparse object array
 * @returns {Object} test result
 */
export function testSparseObjectArray() {
  const arr = [{ x: 1 }, , , { x: 4 }];
  const result = arr.reduce((acc, cur) => acc + cur.x, 0);

  return {
    result: result,
    expected: 5
  };
}

/**
 * Test reduce on sparse array filter
 * @returns {Object} test result
 */
export function testSparseArrayFilter() {
  const arr = [1, , , 4, , 6];
  const result = arr.reduce((acc, cur) => {
    if (cur !== undefined && cur > 2) {
      acc.push(cur);
    }
    return acc;
  }, []);

  return {
    result: result.length,
    expected: 2
  };
}

/**
 * Test reduce on sparse array filter first element
 * @returns {Object} test result
 */
export function testSparseArrayFilterFirst() {
  const arr = [1, , , 4, , 6];
  const result = arr.reduce((acc, cur) => {
    if (cur !== undefined && cur > 2) {
      acc.push(cur);
    }
    return acc;
  }, []);

  return {
    result: result[0],
    expected: 4
  };
}

/**
 * Test reduce on sparse array filter second element
 * @returns {Object} test result
 */
export function testSparseArrayFilterSecond() {
  const arr = [1, , , 4, , 6];
  const result = arr.reduce((acc, cur) => {
    if (cur !== undefined && cur > 2) {
      acc.push(cur);
    }
    return acc;
  }, []);

  return {
    result: result[1],
    expected: 6
  };
}

/**
 * Test reduce on sparse array count
 * @returns {Object} test result
 */
export function testSparseArrayCount() {
  const arr = [1, , , 4, , 6];
  const count = arr.reduce((acc, cur) => acc + 1, 0);

  return {
    result: count,
    expected: 3
  };
}

/**
 * Test reduce on sparse array vs null array
 * @returns {Object} test result
 */
export function testSparseArrayVsNullArray() {
  const sparseArr = [1, , 3];
  const nullArr = [1, null, 3];
  const sparseCount = sparseArr.reduce((acc, cur) => acc + 1, 0);
  const nullCount = nullArr.reduce((acc, cur) => acc + 1, 0);

  return {
    result: sparseCount,
    expected: 2
  };
}

/**
 * Test reduce on null array count
 * @returns {Object} test result
 */
export function testNullArrayCount() {
  const nullArr = [1, null, 3];
  const nullCount = nullArr.reduce((acc, cur) => acc + 1, 0);

  return {
    result: nullCount,
    expected: 3
  };
}

/**
 * Test reduce with spread operator object merge
 * @returns {Object} test result
 */
export function testSpreadObjectMerge() {
  const arr = [{ a: 1 }, { b: 2 }, { c: 3 }];
  const result = arr.reduce((acc, cur) => ({ ...acc, ...cur }), {});

  return {
    result: result.a,
    expected: 1
  };
}

/**
 * Test reduce with spread operator object merge second property
 * @returns {Object} test result
 */
export function testSpreadObjectMergeSecond() {
  const arr = [{ a: 1 }, { b: 2 }, { c: 3 }];
  const result = arr.reduce((acc, cur) => ({ ...acc, ...cur }), {});

  return {
    result: result.b,
    expected: 2
  };
}

/**
 * Test reduce with spread operator object merge third property
 * @returns {Object} test result
 */
export function testSpreadObjectMergeThird() {
  const arr = [{ a: 1 }, { b: 2 }, { c: 3 }];
  const result = arr.reduce((acc, cur) => ({ ...acc, ...cur }), {});

  return {
    result: result.c,
    expected: 3
  };
}

/**
 * Test reduce with spread operator array deduplication
 * @returns {Object} test result
 */
export function testSpreadArrayDeduplication() {
  const arr = [1, 2, 2, 3, 3, 3, 4];
  const result = arr.reduce((acc, cur) => {
    if (!acc.includes(cur)) {
      return [...acc, cur];
    }
    return acc;
  }, []);

  return {
    result: result.length,
    expected: 4
  };
}

/**
 * Test reduce with spread operator array deduplication values
 * @returns {Object} test result
 */
export function testSpreadArrayDeduplicationValues() {
  const arr = [1, 2, 2, 3, 3, 3, 4];
  const result = arr.reduce((acc, cur) => {
    if (!acc.includes(cur)) {
      return [...acc, cur];
    }
    return acc;
  }, []);

  return {
    result: result[0],
    expected: 1
  };
}

/**
 * Test reduce with spread operator multi-dimensional array flatten
 * @returns {Object} test result
 */
export function testSpreadMultiDimensionalFlatten() {
  const arr = [[1, [2, 3]], [4, [5, 6]]];
  function flatten(acc, cur) {
    if (Array.isArray(cur)) {
      return cur.reduce(flatten, acc);
    }
    return [...acc, cur];
  }
  const result = arr.reduce(flatten, []);

  return {
    result: result.length,
    expected: 6
  };
}

/**
 * Test reduce with spread operator multi-dimensional array flatten values
 * @returns {Object} test result
 */
export function testSpreadMultiDimensionalFlattenValues() {
  const arr = [[1, [2, 3]], [4, [5, 6]]];
  function flatten(acc, cur) {
    if (Array.isArray(cur)) {
      return cur.reduce(flatten, acc);
    }
    return [...acc, cur];
  }
  const result = arr.reduce(flatten, []);

  return {
    result: result[0],
    expected: 1
  };
}

/**
 * Test reduce on arguments object
 * @returns {Object} test result
 */
export function testArgumentsObject() {
  function sum() {
    return Array.prototype.reduce.call(arguments, (acc, cur) => acc + cur, 0);
  }

  return {
    result: sum(1, 2, 3, 4),
    expected: 10
  };
}

/**
 * Test reduce on custom array-like object
 * @returns {Object} test result
 */
export function testCustomArrayLike() {
  const arrayLike = {
    length: 3,
    0: 'a',
    1: 'b',
    2: 'c'
  };
  const result = Array.prototype.reduce.call(arrayLike, (acc, cur) => acc + cur, '');

  return {
    result: result,
    expected: 'abc'
  };
}

/**
 * Test reduce on array-like object with length mismatch
 * @returns {Object} test result
 */
export function testArrayLikeLengthMismatch() {
  const arrayLike = {
    length: 2,
    0: 'a',
    1: 'b',
    2: 'c'
  };
  const result = Array.prototype.reduce.call(arrayLike, (acc, cur) => acc + cur, '');

  return {
    result: result,
    expected: 'ab'
  };
}

/**
 * Test reduce on array-like object with zero length
 * @returns {Object} test result
 */
export function testArrayLikeZeroLength() {
  const arrayLike = {
    length: 0,
    0: 'a'
  };
  const result = Array.prototype.reduce.call(arrayLike, (acc, cur) => acc + cur, 'empty');

  return {
    result: result,
    expected: 'empty'
  };
}

/**
 * Test reduce on array-like object with negative length
 * @returns {Object} test result
 */
export function testArrayLikeNegativeLength() {
  const arrayLike = {
    length: -1,
    0: 'a',
    1: 'b'
  };
  const result = Array.prototype.reduce.call(arrayLike, (acc, cur) => acc + cur, 'empty');

  return {
    result: result,
    expected: 'empty'
  };
}

/**
 * Test reduce on string object
 * @returns {Object} test result
 */
export function testStringObject() {
  const str = 'hello';
  const result = Array.prototype.reduce.call(str, (acc, cur) => acc + cur.charCodeAt(0), 0);

  return {
    result: result,
    expected: 532
  };
}

/**
 * Test reduce on array-like object with dynamic length
 * @returns {Object} test result
 */
export function testArrayLikeDynamicLength() {
  const arrayLike = {
    length: 3,
    0: 1,
    1: 2,
    2: 3
  };
  const visited = [];
  Array.prototype.reduce.call(arrayLike, (acc, cur, idx) => {
    visited.push(idx);
    if (idx === 0) {
      arrayLike.length = 2;
    }
    return acc + cur;
  }, 0);

  return {
    result: visited.length,
    expected: 3
  };
}

/**
 * Test reduce in strict mode this value
 * @returns {Object} test result
 */
export function testStrictModeThis() {
  let thisValue;
  const arr = [1, 2, 3];
  arr.reduce(function (acc, cur) {
    thisValue = this;
    return acc + cur;
  }, 0);

  return {
    result: thisValue,
    expected: undefined
  };
}

/**
 * Test reduce on Proxy wrapped array
 * @returns {Object} test result
 */
export function testProxyArray() {
  const arr = [1, 2, 3];
  const proxy = new Proxy(arr, {
    get(target, prop) {
      return target[prop];
    }
  });
  const result = proxy.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 6
  };
}

/**
 * Test reduce on Proxy with modified length
 * @returns {Object} test result
 */
export function testProxyModifiedLength() {
  const arr = [1, 2, 3];
  const proxy = new Proxy(arr, {
    get(target, prop) {
      if (prop === 'length') return 2;
      return target[prop];
    }
  });
  const result = Array.prototype.reduce.call(proxy, (acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 3
  };
}

/**
 * Test reduce with callback deleting element
 * @returns {Object} test result
 */
export function testCallbackDeleteElement() {
  const arr = [1, 2, 3, 4, 5];
  const values = [];
  arr.reduce((acc, cur, idx, array) => {
    values.push(cur);
    if (idx === 1) {
      delete array[2];
    }
    return acc + cur;
  }, 0);

  return {
    result: values.length,
    expected: 4
  };
}

/**
 * Test reduce with callback deleting element values
 * @returns {Object} test result
 */
export function testCallbackDeleteElementValues() {
  const arr = [1, 2, 3, 4, 5];
  const values = [];
  arr.reduce((acc, cur, idx, array) => {
    values.push(cur);
    if (idx === 1) {
      delete array[2];
    }
    return acc + cur;
  }, 0);

  return {
    result: values[0],
    expected: 1
  };
}

/**
 * Test reduce with callback adding element
 * @returns {Object} test result
 */
export function testCallbackAddElement() {
  const arr = [1, 2, 3];
  const values = [];
  arr.reduce((acc, cur, idx, array) => {
    values.push(cur);
    if (idx === 0) {
      array.push(4);
    }
    return acc + cur;
  }, 0);

  return {
    result: values.length,
    expected: 3
  };
}

/**
 * Test reduce with callback modifying element
 * @returns {Object} test result
 */
export function testCallbackModifyElement() {
  const arr = [1, 2, 3, 4];
  const values = [];
  arr.reduce((acc, cur, idx, array) => {
    values.push(cur);
    if (idx === 0) {
      array[2] = 10;
    }
    return acc + cur;
  }, 0);

  return {
    result: values[2],
    expected: 10
  };
}

/**
 * Test reduce on empty array without initial value
 * @returns {Object} test result
 */
export function testEmptyArrayNoInitial() {
  const arr = [];
  let errorOccurred = false;
  try {
    arr.reduce((acc, cur) => acc + cur);
  } catch (e) {
    errorOccurred = e instanceof TypeError;
  }

  return {
    result: errorOccurred,
    expected: true
  };
}

/**
 * Test reduce on empty array error message
 * @returns {Object} test result
 */
export function testEmptyArrayErrorMessage() {
  const arr = [];
  let errorOccurred = false;
  try {
    arr.reduce((acc, cur) => acc + cur);
  } catch (e) {
    errorOccurred = e.message.includes('empty') && e.message.includes('initialValue');
  }

  return {
    result: errorOccurred,
    expected: true
  };
}

/**
 * Test reduce on large array
 * @returns {Object} test result
 */
export function testLargeArray() {
  const arr = Array(100000).fill(1);
  const result = arr.reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 100000
  };
}

/**
 * Test reduce with Promise return
 * @returns {Object} test result
 */
export function testPromiseReturn() {
  const arr = [1, 2, 3];
  const result = arr.reduce((acc, cur) => {
    return Promise.resolve(acc).then(val => val + cur);
  }, Promise.resolve(0));

  return result.then(results => ({
    result: results,
    expected: 6
  }));
}

/**
 * Test reduce depth first traversal
 * @returns {Object} test result
 */
export function testDepthFirstTraversal() {
  const tree = {
    value: 1,
    children: [
      { value: 2, children: [{ value: 4 }, { value: 5 }] },
      { value: 3, children: [{ value: 6 }] }
    ]
  };
  function dfs(node) {
    return [node.value, ...node.children.reduce((acc, child) => acc.concat(dfs(child)), [])];
  }
  const result = dfs(tree);

  return {
    result: result.length,
    expected: 6
  };
}

/**
 * Test reduce depth first traversal first value
 * @returns {Object} test result
 */
export function testDepthFirstTraversalFirst() {
  const tree = {
    value: 1,
    children: [
      { value: 2, children: [{ value: 4 }, { value: 5 }] },
      { value: 3, children: [{ value: 6 }] }
    ]
  };
  function dfs(node) {
    return [node.value, ...node.children.reduce((acc, child) => acc.concat(dfs(child)), [])];
  }
  const result = dfs(tree);

  return {
    result: result[0],
    expected: 1
  };
}

/**
 * Test reduce factorial
 * @returns {Object} test result
 */
export function testFactorial() {
  function factorial(n) {
    return Array.from({ length: n }, (_, i) => i + 1).reduce((acc, cur) => acc * cur, 1);
  }

  return {
    result: factorial(5),
    expected: 120
  };
}

/**
 * Test reduce fibonacci
 * @returns {Object} test result
 */
export function testFibonacci() {
  function fibonacci(n) {
    return Array.from({ length: n }).reduce((acc) => {
      const next = acc[acc.length - 1] + acc[acc.length - 2];
      acc.push(next);
      return acc;
    }, [0, 1]).slice(0, n);
  }
  const result = fibonacci(10);

  return {
    result: result.length,
    expected: 10
  };
}

/**
 * Test reduce fibonacci first value
 * @returns {Object} test result
 */
export function testFibonacciFirst() {
  function fibonacci(n) {
    return Array.from({ length: n }).reduce((acc) => {
      const next = acc[acc.length - 1] + acc[acc.length - 2];
      acc.push(next);
      return acc;
    }, [0, 1]).slice(0, n);
  }
  const result = fibonacci(10);

  return {
    result: result[0],
    expected: 0
  };
}

/**
 * Test reduce on null object
 * @returns {Object} test result
 */
export function testReduceOnNull() {
  let errorOccurred = false;
  try {
    Array.prototype.reduce.call(null, (acc, cur) => acc + cur, 0);
  } catch (e) {
    errorOccurred = e instanceof TypeError;
  }

  return {
    result: errorOccurred,
    expected: true
  };
}

/**
 * Test reduce on undefined object
 * @returns {Object} test result
 */
export function testReduceOnUndefined() {
  let errorOccurred = false;
  try {
    Array.prototype.reduce.call(undefined, (acc, cur) => acc + cur, 0);
  } catch (e) {
    errorOccurred = e instanceof TypeError;
  }

  return {
    result: errorOccurred,
    expected: true
  };
}

/**
 * Test reduce on number object
 * @returns {Object} test result
 */
export function testReduceOnNumber() {
  let errorOccurred = false;
  try {
    Array.prototype.reduce.call(42, (acc, cur) => acc + cur, 0);
  } catch (e) {
    errorOccurred = e instanceof TypeError;
  }

  return {
    result: errorOccurred,
    expected: true
  };
}

/**
 * Test reduce on boolean object
 * @returns {Object} test result
 */
export function testReduceOnBoolean() {
  let errorOccurred = false;
  try {
    Array.prototype.reduce.call(true, (acc, cur) => acc + cur, 0);
  } catch (e) {
    errorOccurred = e instanceof TypeError;
  }

  return {
    result: errorOccurred,
    expected: true
  };
}

/**
 * Test reduce with Object.keys
 * @returns {Object} test result
 */
export function testObjectKeys() {
  const obj = { a: 1, b: 2, c: 3 };
  const result = Object.keys(obj).reduce((acc, key) => acc + obj[key], 0);

  return {
    result: result,
    expected: 6
  };
}

/**
 * Test reduce with Object.values
 * @returns {Object} test result
 */
export function testObjectValues() {
  const obj = { a: 1, b: 2, c: 3 };
  const result = Object.values(obj).reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 6
  };
}

/**
 * Test reduce with Object.entries
 * @returns {Object} test result
 */
export function testObjectEntries() {
  const obj = { a: 1, b: 2, c: 3 };
  const result = Object.entries(obj).reduce((acc, [key, value]) => {
    acc[key] = value * 2;
    return acc;
  }, {});

  return {
    result: result.a,
    expected: 2
  };
}

/**
 * Test reduce with Set deduplication
 * @returns {Object} test result
 */
export function testSetDeduplication() {
  const arr = [1, 2, 2, 3, 3, 3, 4];
  const uniqueSet = arr.reduce((acc, cur) => {
    if (!acc.has(cur)) {
      acc.add(cur);
    }
    return acc;
  }, new Set());
  const result = [...uniqueSet];

  return {
    result: result.length,
    expected: 4
  };
}

/**
 * Test reduce with Map conversion
 * @returns {Object} test result
 */
export function testMapConversion() {
  const arr = [['a', 1], ['b', 2], ['c', 3]];
  const map = arr.reduce((acc, [key, value]) => {
    acc.set(key, value);
    return acc;
  }, new Map());

  return {
    result: map.get('a'),
    expected: 1
  };
}

/**
 * Test reduce with function composition
 * @returns {Object} test result
 */
export function testFunctionComposition() {
  const double = x => x * 2;
  const addOne = x => x + 1;
  const square = x => x * x;
  const funcs = [double, addOne, square];
  const piped = funcs.reduce((acc, fn) => fn(acc), 3);

  return {
    result: piped,
    expected: 49
  };
}

/**
 * Test reduce with currying
 * @returns {Object} test result
 */
export function testCurrying() {
  function curry(fn) {
    return function curried(...args) {
      if (args.length >= fn.length) {
        return fn(...args);
      }
      return (...moreArgs) => curried(...args, ...moreArgs);
    };
  }
  const add = (a, b, c) => a + b + c;
  const curriedAdd = curry(add);

  return {
    result: curriedAdd(1)(2)(3),
    expected: 6
  };
}

/**
 * Test reduce implementing map
 * @returns {Object} test result
 */
export function testReduceImplementMap() {
  const arr = [1, 2, 3, 4];
  const mapped = arr.reduce((acc, cur) => {
    acc.push(cur * 2);
    return acc;
  }, []);

  return {
    result: mapped.length,
    expected: 4
  };
}

/**
 * Test reduce implementing map values
 * @returns {Object} test result
 */
export function testReduceImplementMapValues() {
  const arr = [1, 2, 3, 4];
  const mapped = arr.reduce((acc, cur) => {
    acc.push(cur * 2);
    return acc;
  }, []);

  return {
    result: mapped[0],
    expected: 2
  };
}

/**
 * Test reduce with map chain
 * @returns {Object} test result
 */
export function testMapChain() {
  const arr = [1, 2, 3, 4];
  const result = arr.map(x => x * 2).reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 20
  };
}

/**
 * Test reduce implementing filter
 * @returns {Object} test result
 */
export function testReduceImplementFilter() {
  const arr = [1, 2, 3, 4, 5, 6];
  const filtered = arr.reduce((acc, cur) => {
    if (cur % 2 === 0) {
      acc.push(cur);
    }
    return acc;
  }, []);

  return {
    result: filtered.length,
    expected: 3
  };
}

/**
 * Test reduce with filter chain
 * @returns {Object} test result
 */
export function testFilterChain() {
  const arr = [1, 2, 3, 4, 5, 6];
  const result = arr.filter(x => x > 3).reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 15
  };
}

/**
 * Test reduce implementing filter and map
 * @returns {Object} test result
 */
export function testReduceFilterAndMap() {
  const arr = [1, 2, 3, 4, 5, 6];
  const result = arr.reduce((acc, cur) => {
    if (cur % 2 === 0) {
      acc.push(cur * 10);
    }
    return acc;
  }, []);

  return {
    result: result.length,
    expected: 3
  };
}

/**
 * Test reduce implementing filter and map values
 * @returns {Object} test result
 */
export function testReduceFilterAndMapValues() {
  const arr = [1, 2, 3, 4, 5, 6];
  const result = arr.reduce((acc, cur) => {
    if (cur % 2 === 0) {
      acc.push(cur * 10);
    }
    return acc;
  }, []);

  return {
    result: result[0],
    expected: 20
  };
}

/**
 * Test reduce implementing forEach
 * @returns {Object} test result
 */
export function testReduceImplementForEach() {
  const arr = [1, 2, 3, 4];
  const log = [];
  arr.reduce((acc, cur) => {
    log.push(cur);
    return acc;
  }, null);

  return {
    result: log.length,
    expected: 4
  };
}

/**
 * Test reduce implementing find
 * @returns {Object} test result
 */
export function testReduceImplementFind() {
  const arr = [1, 2, 3, 4, 5];
  const found = arr.reduce((acc, cur) => {
    if (acc === undefined && cur > 3) {
      return cur;
    }
    return acc;
  }, undefined);

  return {
    result: found,
    expected: 4
  };
}

/**
 * Test reduce implementing some
 * @returns {Object} test result
 */
export function testReduceImplementSome() {
  const arr = [1, 2, 3, 4, 5];
  const hasEven = arr.reduce((acc, cur) => acc || cur % 2 === 0, false);

  return {
    result: hasEven,
    expected: true
  };
}

/**
 * Test reduce implementing every
 * @returns {Object} test result
 */
export function testReduceImplementEvery() {
  const arr = [2, 4, 6, 8];
  const allEven = arr.reduce((acc, cur) => acc && cur % 2 === 0, true);

  return {
    result: allEven,
    expected: true
  };
}

/**
 * Test reduce implementing flat
 * @returns {Object} test result
 */
export function testReduceImplementFlat() {
  const arr = [[1, 2], [3, 4], [5, 6]];
  const flattened = arr.reduce((acc, cur) => acc.concat(cur), []);

  return {
    result: flattened.length,
    expected: 6
  };
}

/**
 * Test reduce implementing flatMap
 * @returns {Object} test result
 */
export function testReduceImplementFlatMap() {
  const arr = [1, 2, 3];
  const flatMapped = arr.reduce((acc, cur) => {
    return acc.concat([cur, cur * 2]);
  }, []);

  return {
    result: flatMapped.length,
    expected: 6
  };
}

/**
 * Test reduce implementing sort
 * @returns {Object} test result
 */
export function testReduceImplementSort() {
  const arr = [3, 1, 4, 1, 5, 9, 2, 6];
  const sorted = arr.reduce((acc, cur) => {
    let inserted = false;
    for (let i = 0; i < acc.length; i++) {
      if (cur < acc[i]) {
        acc.splice(i, 0, cur);
        inserted = true;
        break;
      }
    }
    if (!inserted) {
      acc.push(cur);
    }
    return acc;
  }, []);

  return {
    result: sorted.length,
    expected: 8
  };
}

/**
 * Test reduce with sort chain
 * @returns {Object} test result
 */
export function testSortChain() {
  const arr = [3, 1, 4, 1, 5, 9, 2, 6];
  const result = arr.sort((a, b) => a - b).reduce((acc, cur, idx) => {
    if (idx % 2 === 0) {
      acc.push(cur);
    }
    return acc;
  }, []);

  return {
    result: result.length,
    expected: 4
  };
}

/**
 * Test reduce implementing slice
 * @returns {Object} test result
 */
export function testReduceImplementSlice() {
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const chunks = arr.reduce((acc, cur, idx) => {
    const chunkIndex = Math.floor(idx / 3);
    if (!acc[chunkIndex]) {
      acc[chunkIndex] = [];
    }
    acc[chunkIndex].push(cur);
    return acc;
  }, []);

  return {
    result: chunks.length,
    expected: 4
  };
}

/**
 * Test reduce implementing concat
 * @returns {Object} test result
 */
export function testReduceImplementConcat() {
  const arr = [[1, 2], [3, 4], [5, 6]];
  const concatenated = arr.reduce((acc, cur) => acc.concat(cur), []);

  return {
    result: concatenated.length,
    expected: 6
  };
}

/**
 * Test reduce implementing multi-level concat
 * @returns {Object} test result
 */
export function testReduceImplementMultiLevelConcat() {
  function flatten(acc, cur) {
    if (Array.isArray(cur)) {
      return cur.reduce(flatten, acc);
    }
    acc.push(cur);
    return acc;
  }
  const arr = [[1], [[2, 3]], [[[4]]]];
  const flattened = arr.reduce(flatten, []);

  return {
    result: flattened.length,
    expected: 4
  };
}

/**
 * Test reduce left to right order
 * @returns {Object} test result
 */
export function testReduceLeftToRight() {
  const arr = [1, 2, 3];
  const order = [];
  arr.reduce((acc, cur) => {
    order.push(cur);
    return acc + cur;
  }, 0);

  return {
    result: order.length,
    expected: 3
  };
}

/**
 * Test reduce left to right first value
 * @returns {Object} test result
 */
export function testReduceLeftToRightFirst() {
  const arr = [1, 2, 3];
  const order = [];
  arr.reduce((acc, cur) => {
    order.push(cur);
    return acc + cur;
  }, 0);

  return {
    result: order[0],
    expected: 1
  };
}

/**
 * Test reduceRight right to left order
 * @returns {Object} test result
 */
export function testReduceRightRightToLeft() {
  const arr = [1, 2, 3];
  const order = [];
  arr.reduceRight((acc, cur) => {
    order.push(cur);
    return acc + cur;
  }, 0);

  return {
    result: order.length,
    expected: 3
  };
}

/**
 * Test reduceRight right to left first value
 * @returns {Object} test result
 */
export function testReduceRightRightToLeftFirst() {
  const arr = [1, 2, 3];
  const order = [];
  arr.reduceRight((acc, cur) => {
    order.push(cur);
    return acc + cur;
  }, 0);

  return {
    result: order[0],
    expected: 3
  };
}

/**
 * Test reduce vs reduceRight left concat
 * @returns {Object} test result
 */
export function testReduceVsReduceRightLeft() {
  const arr = [[1, 2], [3, 4], [5, 6]];
  const leftConcat = arr.reduce((acc, cur) => acc.concat(cur), []);

  return {
    result: leftConcat[0],
    expected: 1
  };
}

/**
 * Test reduce vs reduceRight right concat
 * @returns {Object} test result
 */
export function testReduceVsReduceRightRight() {
  const arr = [[1, 2], [3, 4], [5, 6]];
  const rightConcat = arr.reduceRight((acc, cur) => acc.concat(cur), []);

  return {
    result: rightConcat[0],
    expected: 5
  };
}

/**
 * Test reduce mutable accumulator object
 * @returns {Object} test result
 */
export function testMutableAccumulatorObject() {
  class SumObj {
    constructor() {
      this.sum = 0;
    }
  }
  const arr = [{ x: 1 }, { x: 2 }, { x: 3 }];
  const result = arr.reduce((acc, cur) => {
    acc.sum += cur.x;
    return acc;
  }, new SumObj());

  return {
    result: result.sum,
    expected: 6
  };
}

/**
 * Test reduce immutable accumulator object
 * @returns {Object} test result
 */
export function testImmutableAccumulatorObject() {
  const arr = [{ x: 1 }, { x: 2 }, { x: 3 }];
  const result = arr.reduce((acc, cur) => {
    return { sum: acc.sum + cur.x };
  }, { sum: 0 });

  return {
    result: result.sum,
    expected: 6
  };
}

/**
 * Test reduce mutable accumulator array
 * @returns {Object} test result
 */
export function testMutableAccumulatorArray() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.reduce((acc, cur) => {
    if (cur % 2 === 0) {
      acc.push(cur);
    }
    return acc;
  }, []);

  return {
    result: result.length,
    expected: 2
  };
}

/**
 * Test reduce immutable accumulator array
 * @returns {Object} test result
 */
export function testImmutableAccumulatorArray() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.reduce((acc, cur) => {
    if (cur % 2 === 0) {
      return [...acc, cur];
    }
    return acc;
  }, []);

  return {
    result: result.length,
    expected: 2
  };
}

/**
 * Test reduce performance optimization
 * @returns {Object} test result
 */
export function testPerformanceOptimization() {
  class MultiResult {
    constructor() {
      this.sum = 0;
      this.even = [];
      this.product = 1;
    }
  }
  const arr = [1, 2, 3, 4, 5, 6];
  const result = arr.reduce((acc, cur) => {
    acc.sum += cur;
    if (cur % 2 === 0) {
      acc.even.push(cur);
    }
    acc.product *= cur;
    return acc;
  }, new MultiResult());

  return {
    result: result.sum,
    expected: 21
  };
}

/**
 * Test reduce performance optimization even count
 * @returns {Object} test result
 */
export function testPerformanceOptimizationEven() {
  class MultiResult {
    constructor() {
      this.sum = 0;
      this.even = [];
      this.product = 1;
    }
  }
  const arr = [1, 2, 3, 4, 5, 6];
  const result = arr.reduce((acc, cur) => {
    acc.sum += cur;
    if (cur % 2 === 0) {
      acc.even.push(cur);
    }
    acc.product *= cur;
    return acc;
  }, new MultiResult());

  return {
    result: result.even.length,
    expected: 3
  };
}

/**
 * Test reduce performance optimization product
 * @returns {Object} test result
 */
export function testPerformanceOptimizationProduct() {
  class MultiResult {
    constructor() {
      this.sum = 0;
      this.even = [];
      this.product = 1;
    }
  }
  const arr = [1, 2, 3, 4, 5, 6];
  const result = arr.reduce((acc, cur) => {
    acc.sum += cur;
    if (cur % 2 === 0) {
      acc.even.push(cur);
    }
    acc.product *= cur;
    return acc;
  }, new MultiResult());

  return {
    result: result.product,
    expected: 720
  };
}

/**
 * Test reduce early termination simulation
 * @returns {Object} test result
 */
export function testEarlyTermination() {
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  let sum = 0;
  try {
    arr.reduce((acc, cur) => {
      sum += cur;
      if (sum >= 15) {
        throw new Error('Stop');
      }
      return acc;
    }, 0);
  } catch (e) {
    // Early termination
  }

  return {
    result: sum,
    expected: 15
  };
}

/**
 * Test reduce with null callback throws TypeError
 * @returns {Object} test result
 */
export function testReduceNullCallback() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce(null);
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce with undefined callback throws TypeError
 * @returns {Object} test result
 */
export function testReduceUndefinedCallback() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce(undefined);
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce with number callback throws TypeError
 * @returns {Object} test result
 */
export function testReduceNumberCallback() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce(123);
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce with string callback throws TypeError
 * @returns {Object} test result
 */
export function testReduceStringCallback() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce('function');
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce with object callback throws TypeError
 * @returns {Object} test result
 */
export function testReduceObjectCallback() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce({});
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce with array callback throws TypeError
 * @returns {Object} test result
 */
export function testReduceArrayCallback() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce([1, 2, 3]);
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce with no parameters throws TypeError
 * @returns {Object} test result
 */
export function testReduceNoParameters() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce();
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce with object as initialValue
 * @returns {Object} test result
 */
export function testReduceObjectInitialValue() {
  class SumObj {
    sum = 0;
  }
  const arr = [{ x: 1 }, { x: 2 }];
  const result = arr.reduce((acc, cur) => {
    acc.sum += cur.x;
    return acc;
  }, new SumObj());

  return {
    result: result.sum,
    expected: 3
  };
}

/**
 * Test reduce with undefined as initialValue returns NaN
 * @returns {Object} test result
 */
export function testReduceUndefinedInitialValue() {
  const arr = [1, 2, 3];
  const result = arr.reduce((acc, cur) => acc + cur, undefined);

  return {
    result: Number.isNaN(result),
    expected: true
  };
}

/**
 * Test reduce with MAX_VALUE
 * @returns {Object} test result
 */
export function testReduceMaxValue() {
  const arr = [Number.MAX_VALUE, 1];
  const result = arr.reduce((acc, cur) => acc + cur);

  return {
    result: result,
    expected: Infinity
  };
}

/**
 * Test reduce with index signature object array
 * @returns {Object} test result
 */
export function testReduceIndexSignatureObject() {
  class NameMap {
  }
  const arr = [{ id: 1, name: 'a' }, { id: 2, name: 'b' }];
  const result = arr.reduce((acc, cur) => {
    acc[cur.id] = cur.name;
    return acc;
  }, new NameMap());

  return {
    result: result[1] === 'a' && result[2] === 'b',
    expected: true
  };
}

/**
 * Test reduce merge object array into single object
 * @returns {Object} test result
 */
export function testReduceMergeObjectArray() {
  const arr = [{ a: 1 }, { b: 2 }, { c: 3 }];
  const result = arr.reduce((acc, cur) => {
    for (const key in cur) {
      acc[key] = cur[key];
    }
    return acc;
  }, {});

  return {
    result: result.a === 1 && result.b === 2 && result.c === 3,
    expected: true
  };
}

/**
 * Test reduce deep flatten multi-dimensional array
 * @returns {Object} test result
 */
export function testReduceDeepFlatten() {
  function flatten(acc, cur) {
    if (Array.isArray(cur)) {
      return cur.reduce(flatten, acc);
    }
    acc.push(cur);
    return acc;
  }
  const arr = [[1, [2, 3]], [4, [5, 6]]];
  const result = arr.reduce(flatten, []);

  return {
    result: result.length === 6 && result[0] === 1 && result[5] === 6,
    expected: true
  };
}

/**
 * Test reduce mixed number and string array
 * @returns {Object} test result
 */
export function testReduceMixedNumberString() {
  const arr = [1, '2', 3, '4'];
  const result = arr.reduce((acc, cur) => acc + Number(cur), 0);

  return {
    result: result,
    expected: 10
  };
}

/**
 * Test reduce mixed multiple types array
 * @returns {Object} test result
 */
export function testReduceMixedTypes() {
  const arr = [1, 'a', true, null, undefined];
  const result = arr.reduce((acc, cur) => {
    const type = typeof cur;
    acc[type] = (acc[type] || 0) + 1;
    return acc;
  }, {});

  return {
    result: result.number === 1 && result.string === 1 && result.boolean === 1 && result.object === 1,
    expected: true
  };
}

/**
 * Test reduce callback calls non-existent method
 * @returns {Object} test result
 */
export function testReduceNonExistentMethod() {
  const arr = [1, 2, 3];
  let error = null;
  try {
    arr.reduce((acc, cur) => {
      return acc.nonExistentMethod(cur);
    }, 0);
  } catch (e) {
    error = e;
  }

  return {
    result: error instanceof TypeError,
    expected: true
  };
}

/**
 * Test reduce callback returns undefined
 * @returns {Object} test result
 */
export function testReduceCallbackReturnsUndefined() {
  const arr = [1, 2, 3];
  const result = arr.reduce((acc, cur) => {
    if (cur === 2) return undefined;
    return acc + cur;
  }, 0);

  return {
    result: Number.isNaN(result),
    expected: true
  };
}

/**
 * Test reduce this in callback is undefined
 * @returns {Object} test result
 */
export function testReduceThisUndefined() {
  const arr = [1, 2, 3];
  let thisValue = 'initial';
  arr.reduce(function (acc, cur) {
    thisValue = this;
    return acc + cur;
  }, 0);

  return {
    result: thisValue === undefined,
    expected: true
  };
}

/**
 * Test reduce callback deletes array elements
 * @returns {Object} test result
 */
export function testReduceCallbackDeletesElement() {
  const arr = [1, 2, 3, 4, 5];
  const values = [];
  arr.reduce((acc, cur, idx, array) => {
    values.push(cur);
    if (idx === 1) {
      delete array[2];
    }
    return acc + cur;
  }, 0);

  return {
    result: values.length === 4 && values[0] === 1 && values[1] === 2 && values[2] === 4 && values[3] === 5,
    expected: true
  };
}

/**
 * Test reduce count character frequency with class
 * @returns {Object} test result
 */
export function testReduceCharFrequencyClass() {
  class CountMap {
  }
  const arr = ['a', 'b', 'a', 'c', 'b', 'a'];
  const count = arr.reduce((acc, cur) => {
    acc[cur] = (acc[cur] || 0) + 1;
    return acc;
  }, new CountMap());

  return {
    result: count.a === 3 && count.b === 2 && count.c === 1,
    expected: true
  };
}

/**
 * Test reduce count character frequency
 * @returns {Object} test result
 */
export function testReduceCharFrequency() {
  const str = 'hello world';
  const frequency = str.split('').reduce((acc, cur) => {
    if (cur !== ' ') {
      acc[cur] = (acc[cur] || 0) + 1;
    }
    return acc;
  }, {});

  return {
    result: frequency.h === 1 && frequency.e === 1 && frequency.l === 3 && frequency.o === 2 && frequency.w === 1 && frequency.r === 1 && frequency.d === 1,
    expected: true
  };
}

/**
 * Test reduce group object array by property
 * @returns {Object} test result
 */
export function testReduceGroupByProperty() {
  class AgeGroup {
  }

  const people = [
    { name: 'Alice', age: 25 },
    { name: 'Bob', age: 30 },
    { name: 'Charlie', age: 25 }
  ];
  const grouped = people.reduce((acc, cur) => {
    const key = cur.age;
    if (!acc[key]) {
      acc[key] = [];
    }
    acc[key].push(cur);
    return acc;
  }, new AgeGroup());

  return {
    result: grouped[25].length === 2 && grouped[30].length === 1,
    expected: true
  };
}

/**
 * Test reduce flatten deeply nested array
 * @returns {Object} test result
 */
export function testReduceFlattenDeeplyNested() {
  function flatten(acc, cur) {
    if (Array.isArray(cur)) {
      return cur.reduce(flatten, acc);
    }
    acc.push(cur);
    return acc;
  }
  const arr = [[1], [[2, 3]], [[[4]]]];
  const flattened = arr.reduce(flatten, []);

  return {
    result: flattened.length === 4 && flattened[0] === 1 && flattened[1] === 2 && flattened[2] === 3 && flattened[3] === 4,
    expected: true
  };
}

/**
 * Test reduce mutable SumObj
 * @returns {Object} test result
 */
export function testReduceMutableSumObj() {
  class SumObj {
    sum = 0;
  }
  const arr = [{ x: 1 }, { x: 2 }, { x: 3 }];
  const result = arr.reduce((acc, cur) => {
    acc.sum += cur.x;
    return acc;
  }, new SumObj());

  return {
    result: result.sum,
    expected: 6
  };
}

/**
 * Test reduce immutable SumResult
 * @returns {Object} test result
 */
export function testReduceImmutableSumResult() {
  const arr = [{ x: 1 }, { x: 2 }, { x: 3 }];
  const result = arr.reduce((acc, cur) => {
    return { sum: acc.sum + cur.x };
  }, { sum: 0 });

  return {
    result: result.sum,
    expected: 6
  };
}

/**
 * Test reduce depth-first search
 * @returns {Object} test result
 */
export function testReduceDepthFirstSearch() {
  function dfs(node) {
    return [node.value, ...node.children.reduce((acc, child) => {
      return acc.concat(dfs(child));
    }, [])];
  }
  const tree = {
    value: 1,
    children: [
      { value: 2, children: [{ value: 4 }, { value: 5 }] },
      { value: 3, children: [{ value: 6 }] }
    ]
  };
  const result = dfs(tree);

  return {
    result: result.length === 6 && result[0] === 1 && result[1] === 2 && result[2] === 4 && result[3] === 5 && result[4] === 3 && result[5] === 6,
    expected: true
  };
}

/**
 * Test reduce implements factorial
 * @returns {Object} test result
 */
export function testReduceFactorial() {
  function factorial(n) {
    return Array.from({ length: n }, (_, i) => i + 1).reduce((acc, cur) => acc * cur, 1);
  }

  return {
    result: factorial(5),
    expected: 120
  };
}

/**
 * Test reduce implements fibonacci sequence
 * @returns {Object} test result
 */
export function testReduceFibonacci() {
  function fibonacci(n) {
    return Array.from({ length: n - 2 }, () => { }).reduce((acc) => {
      const next = acc[acc.length - 1] + acc[acc.length - 2];
      acc.push(next);
      return acc;
    }, [0, 1]);
  }
  const result = fibonacci(10);

  return {
    result: result.length === 10 && result[0] === 0 && result[1] === 1 && result[9] === 34,
    expected: true
  };
}

/**
 * Test reduce with Map
 * @returns {Object} test result
 */
export function testReduceMap() {
  const arr = [['a', 1], ['b', 2], ['c', 3]];
  const map = arr.reduce((acc, [key, value]) => {
    acc.set(key, value);
    return acc;
  }, new Map());

  return {
    result: map.get('a') === 1 && map.get('b') === 2 && map.get('c') === 3,
    expected: true
  };
}

/**
 * Test reduce with ArrayLike object
 * @returns {Object} test result
 */
export function testReduceArrayLike() {
  const obj = {
    length: 3,
    0: 1,
    1: 2,
    2: 3
  };
  const result = Array.from(obj).reduce((acc, cur) => acc + cur, 0);

  return {
    result: result,
    expected: 6
  };
}

/**
 * Test reduce nested object property sum
 * @returns {Object} test result
 */
export function testReduceNestedObjectSum() {
  const arr = [{ value: 1, data: { count: 2 } }, { value: 3, data: { count: 4 } }];
  const total = arr.reduce((acc, cur) => acc + cur.value + cur.data.count, 0);

  return {
    result: total,
    expected: 10
  };
}
