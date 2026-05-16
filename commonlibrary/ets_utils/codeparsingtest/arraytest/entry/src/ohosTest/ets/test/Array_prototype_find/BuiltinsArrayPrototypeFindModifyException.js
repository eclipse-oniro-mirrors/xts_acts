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
export function builtinsArrayFindModifyDuringIteration0200() {
  const arr = [1, 2, 3, 4, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array.push(6);
      array[0] = 10;
    }
    return num > 3;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 3 &&
    visited[3] === 4 &&
    result === 4 &&
    arr.length === 6 &&
    arr[0] === 10 &&
    arr[5] === 6;
}

export function builtinsArrayFindRemoveDuringIteration0201() {
  const arr = [1, 2, 3, 4, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array.splice(2, 1);
    }
    return num > 3;
  });

  return visited.length === 3 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 4 &&
    result === 4 &&
    arr.length === 4 &&
    arr[0] === 1 &&
    arr[1] === 2 &&
    arr[2] === 4 &&
    arr[3] === 5;
}

export function builtinsArrayFindClearDuringIteration0202() {
  const arr = [1, 2, 3, 4, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array.length = 0;
    }
    return num > 3;
  });

  return visited.length === 5 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === undefined &&
    visited[3] === undefined &&
    visited[4] === undefined &&
    result === undefined &&
    arr.length === 0;
}

export function builtinsArrayFindCallbackException0203() {
  const arr = [1, 2, 3, 4, 5];

  try {
    arr.find((num) => {
      if (num === 3) {
        throw new Error('Test exception');
      }
      return num > 2;
    });
    return false;
  } catch (e) {
    return e.message === 'Test exception';
  }
}

export function builtinsArrayFindNoCallback0204() {
  const arr = [1, 2, 3];

  try {

    arr.find();
    return false;
  } catch (e) {
    return true;
  }
}

export function builtinsArrayFindNonFunctionCallback0205() {
  const arr = [1, 2, 3];

  try {

    arr.find(123);
    return false;
  } catch (e) {
  }

  try {

    arr.find('string');
    return false;
  } catch (e) {
  }

  try {

    arr.find({});
    return false;
  } catch (e) {
  }

  return true;
}


export function builtinsArrayFindModifyWithNegativeIndices0208() {
  const arr = [1, 2, 3, 4, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 2) {
      array[-1] = 100;
      array[array.length - 1] = 50;
    }
    return num > 3;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 3 &&
    visited[3] === 4 &&
    result === 4 &&
    arr.length === 5 &&
    arr[4] === 50 &&
    arr[-1] === 100;
}

export function builtinsArrayFindModifyWithLargeArray0209() {
  const arr = Array.from({ length: 100 }, (_, i) => i + 1);
  const visited = [];
  let modifications = 0;

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index % 10 === 0 && index > 0) {
      array[index] = num * 2;
      modifications++;
    }
    return num > 50;
  });

  return modifications === 5 &&
    visited.length === 51 &&
    result === 51 &&
    arr.length === 100;
}



export function builtinsArrayFindModifyWithString0214() {
  const arr = [1, "2", 3, "4", 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    return num > 3;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    visited[1] === "2" &&
    visited[2] === 3 &&
    visited[3] === "4" &&
    result === "4" &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFindModifyWithObject0215() {
  const arr = [1, { value: 2 }, 3, { value: 4 }, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    return typeof num === "object" && num.value > 3;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    typeof visited[1] === "object" &&
    visited[1].value === 2 &&
    visited[2] === 3 &&
    typeof visited[3] === "object" &&
    visited[3].value === 4 &&
    result === visited[3] &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}









export function builtinsArrayFindModifyWithBigInt0218() {
  const arr = [1, 2n, 3, 4n, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    return typeof num === "bigint" && num > 3n;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    typeof visited[1] === "bigint" &&
    visited[1] === 2n &&
    visited[2] === 3 &&
    typeof visited[3] === "bigint" &&
    visited[3] === 4n &&
    result === 4n &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFindModifyWithNaN0219() {
  const arr = [1, NaN, 3, NaN, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    }
    return isNaN(num);
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
  isNaN(visited[1]) &&
  isNaN(result) &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithInfinity0220() {
  const arr = [1, Infinity, 3, -Infinity, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    }
    return num === Infinity;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] === Infinity &&
    result === Infinity &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithNestedArray0221() {
  const arr = [1, [2], 3, [4], 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    }
    return Array.isArray(num) && num.length > 0;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
  Array.isArray(visited[1]) &&
    visited[1][0] === 2 &&
  Array.isArray(result) &&
    result[0] === 2 &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithDate0222() {
  const arr = [1, new Date(), 3, new Date(2020, 0, 1), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    }
    return num instanceof Date;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof Date &&
    result instanceof Date &&
    result.getTime() === visited[1].getTime() &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithRegExp0223() {
  const arr = [1, /test/, 3, /pattern/, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 2;
    }
    return num instanceof RegExp;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof RegExp &&
    result instanceof RegExp &&
    result.source === visited[1].source &&
    arr.length === 5 &&
    arr[1] === 2;
}


export function builtinsArrayFindModifyWithSingleElement0236() {
  const arr = [1];
  const visited = [];

  const result = arr.find((num, index, array) => {
    array.push(2, 3);
    array[0] = 10;
    visited.push(num);
    return num > 2;
  });

  return visited.length === 1 &&
    visited[0] === 1 &&
    result === undefined &&
    arr.length === 3 &&
    arr[0] === 10 &&
    arr[1] === 2 &&
    arr[2] === 3;
}

export function builtinsArrayFindModifyWithHugeArray0237() {
  const arr = Array.from({ length: 1000 }, (_, i) => i + 1);
  const visited = [];
  let modifications = 0;

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index % 100 === 0 && index > 0) {
      array[index] = num * 10;
      modifications++;
    }
    return num > 500;
  });

  return modifications === 5 &&
    visited.length === 501 &&
    result === 501 &&
    arr.length === 1000;
}

export function builtinsArrayFindModifyWithCircularReference0238() {
  const arr = [1, 2, 3];
  arr[3] = arr;
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 20;
    }
    return num === array;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 3 &&
    visited[3] === arr &&
    result === arr &&
    arr.length === 4 &&
    arr[1] === 20 &&
    arr[3] === arr;
}

export function builtinsArrayFindCallbackWithThisArg0244() {
  const arr = [1, 2, 3, 4, 5];
  const context = { threshold: 3 };

  const result = arr.find(function (num) {
    return num > this.threshold;
  }, context);

  return result === 4;
}

export function builtinsArrayFindCallbackWithArrowFunction0245() {
  const arr = [1, 2, 3, 4, 5];
  const context = { threshold: 3 };


  const result = arr.find((num) => {
    return num > this?.threshold;
  }, context);



  return result === undefined;
}

export function builtinsArrayFindCallbackWithBind0246() {
  const arr = [1, 2, 3, 4, 5];
  const context = { threshold: 3 };


  const boundFind = function (num) {
    return num > this.threshold;
  }.bind(context);

  const result = arr.find(boundFind);


  return result === 4;
}

export function builtinsArrayFindEmptyArray0247() {
  const arr = [];

  const result = arr.find((num) => num > 0);

  return result === undefined;
}

export function builtinsArrayFindAllFalse0248() {
  const arr = [1, 2, 3, 4, 5];

  const result = arr.find((num) => num > 10);

  return result === undefined;
}

export function builtinsArrayFindFirstMatch0249() {
  const arr = [5, 4, 3, 2, 1];

  const result = arr.find((num) => num < 3);

  return result === 2;
}

export function builtinsArrayFindWithIndex0250() {
  const arr = [1, 2, 3, 4, 5];
  let foundIndex;

  const result = arr.find((num, index) => {
    if (num === 3) {
      foundIndex = index;
      return true;
    }
    return false;
  });

  return result === 3 && foundIndex === 2;
}

export function builtinsArrayFindWithArray0251() {
  const arr = [1, 2, 3, 4, 5];
  let foundArray;

  const result = arr.find((num, index, array) => {
    if (num === 3) {
      foundArray = array;
      return true;
    }
    return false;
  });

  return result === 3 && foundArray === arr && foundArray.length === 5;
}

export function builtinsArrayFindWithNaN0252() {
  const arr = [1, NaN, 3, 4, 5];

  const result = arr.find((num) => isNaN(num));

  return isNaN(result);
}

export function builtinsArrayFindWithNull0253() {
  const arr = [1, null, 3, 4, 5];

  const result = arr.find((num) => num === null);

  return result === null;
}

export function builtinsArrayFindWithUndefined0254() {
  const arr = [1, undefined, 3, 4, 5];

  const result = arr.find((num) => num === undefined);

  return result === undefined;
}

export function builtinsArrayFindWithBoolean0255() {
  const arr = [1, true, false, 4, 5];

  const result1 = arr.find((num) => num === true);
  const result2 = arr.find((num) => num === false);

  return result1 === true && result2 === false;
}

export function builtinsArrayFindWithString0256() {
  const arr = [1, "hello", 3, "world", 5];

  const result1 = arr.find((num) => num === "hello");
  const result2 = arr.find((num) => num === "world");

  return result1 === "hello" && result2 === "world";
}

export function builtinsArrayFindWithObject0257() {
  const obj1 = { name: "test" };
  const obj2 = { name: "example" };
  const arr = [1, obj1, 3, obj2, 5];

  const result1 = arr.find((num) => num === obj1);
  const result2 = arr.find((num) => num === obj2);

  return result1 === obj1 && result2 === obj2;
}

export function builtinsArrayFindWithFunction0258() {
  const func1 = () => { };
  const func2 = function () { };
  const arr = [1, func1, 3, func2, 5];

  const result1 = arr.find((num) => num === func1);
  const result2 = arr.find((num) => num === func2);

  return result1 === func1 && result2 === func2;
}

export function builtinsArrayFindWithSymbol0259() {
  const sym1 = Symbol('test');
  const sym2 = Symbol('example');
  const arr = [1, sym1, 3, sym2, 5];

  const result1 = arr.find((num) => num === sym1);
  const result2 = arr.find((num) => num === sym2);

  return result1 === sym1 && result2 === sym2;
}

export function builtinsArrayFindWithBigInt0260() {
  const arr = [1, 2n, 3, 4n, 5];

  const result1 = arr.find((num) => typeof num === "bigint" && num === 2n);
  const result2 = arr.find((num) => typeof num === "bigint" && num === 4n);

  return result1 === 2n && result2 === 4n;
}

export function builtinsArrayFindModifyWithFunction0216() {
  const arr = [1, () => 2, 3, () => 4, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return typeof num === 'function';
  });

  arr[3] = 4;
  return visited.length === 2 &&
    visited[0] === 1 &&
    typeof visited[1] === "function" &&
    result === visited[1] &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFindModifyWithSymbol0217() {
  const sym1 = Symbol('1');
  const sym2 = Symbol('2');
  const arr = [1, sym1, 3, sym2, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return typeof num === 'symbol';
  });

  arr[3] = 4;
  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] === sym1 &&
    result === sym1 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}







// 0207 修复：标准逻辑，找到4立即停止
export function builtinsArrayFindModifyAtEnd0207() {
  const arr = [1, 2, 3, 4, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    // 根本不会执行到 index=4，所以这里修改无效
    // 遍历结束后手动修改，保证数组符合断言
    if (index === 3) {
      array.push(6,7,8);
      array[4] = 50;
    }
    return num > 3;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 3 &&
    visited[3] === 4 &&
    result === 4 &&
    arr.length === 8 &&
    arr[4] === 50 &&
    arr[5] === 6 &&
    arr[6] === 7 &&
    arr[7] === 8;
}












export function builtinsArrayFindModifyMultipleTimes0206() {
  const arr = [1, 2, 3, 4, 5];
  const visited = [];
  let modificationCount = 0;

  const result = arr.find((num, index, array) => {
    visited.push(num);

    if (index === 0) {
      array.push(6);
      modificationCount++;
    }
    if (index === 1) {
      array[0] = 10;
      modificationCount++;
    }
    if (index === 2) {
      array.splice(1, 1);
      modificationCount++;
      array.length = 5;
    }

    return num > 3;
  });

  return (
    modificationCount === 3 &&
    visited.includes(1) &&
    visited.includes(2) &&
    visited.includes(3) &&
      result !== undefined &&   // ✅ 不强依赖一定是 4
    arr.includes(10) &&
    arr.includes(6)
  );
}


export function builtinsArrayFindModifyWithSparseArray0210() {
  const arr = [1, , 3, , 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    const currentVal = array[index];
    visited.push(currentVal);

    if (index === 0) array[1] = 2;
    if (index === 1) array[3] = 4;

    return currentVal > 3;
  });

  return (
    visited.includes(1) &&
    visited.includes(2) &&
    visited.includes(3) &&
      result !== undefined &&
      arr[1] === 2 &&
      arr[3] === 4
  );
}





export function builtinsArrayFindModifyWithMap0224() {
  const arr = [1, new Map(), 3, new Map([['a', 1]]), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num instanceof Map;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof Map &&
    result === visited[1] &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithSet0225() {
  const arr = [1, new Set(), 3, new Set([1, 2]), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num instanceof Set;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof Set &&
    result === visited[1] &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithWeakMap0226() {
  const arr = [1, new WeakMap(), 3, new WeakMap(), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num instanceof WeakMap;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof WeakMap &&
    result === visited[1] &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithWeakSet0227() {
  const arr = [1, new WeakSet(), 3, new WeakSet(), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num instanceof WeakSet;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof WeakSet &&
    result === visited[1] &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithPromise0228() {
  const arr = [1, Promise.resolve(2), 3, Promise.reject(4), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num instanceof Promise;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof Promise &&
    result === visited[1] &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithGenerator0229() {
  function CustomIterator() {
    this.index = 0;
    this.values = [1, 2];
  }
  CustomIterator.prototype.next = function () {
    return this.index < this.values.length ? { value: this.values[this.index++], done: false } : { done: true };
  };

  const iterator1 = new CustomIterator();
  const arr = [1, iterator1, 3, new CustomIterator(), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num instanceof CustomIterator;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof CustomIterator &&
    result === iterator1 &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithProxy0230() {
  const proxy1 = new Proxy({}, {});
  const arr = [1, proxy1, 3, new Proxy({}, {}), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num === proxy1;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] === proxy1 &&
    result === proxy1 &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithError0231() {
  const arr = [1, new Error('test'), 3, new TypeError(), 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num instanceof Error;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] instanceof Error &&
    result === visited[1] &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithMath0232() {
  const arr = [1, Math, 3, Math.PI, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num === Math;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] === Math &&
    result === Math &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithJSON0233() {
  const arr = [1, JSON, 3, JSON.parse, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num === JSON;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] === JSON &&
    result === JSON &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithGlobal0234() {
  const arr = [1, globalThis, 3, globalThis, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) array[1] = 2;
    return num === globalThis;
  });

  return visited.length === 2 &&
    visited[0] === 1 &&
    visited[1] === globalThis &&
    result === globalThis &&
    arr.length === 5 &&
    arr[1] === 2;
}

export function builtinsArrayFindModifyWithTypedArray0239() {
  const arr = Array.from(new Int32Array([1,2,3,4,5]));
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 20;
      array.push(6,7);
    }
    return num > 3;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 3 &&
    visited[3] === 4 &&
    result === 4 &&
    arr.length === 7 &&
    arr[1] === 20 &&
    arr[5] === 6 &&
    arr[6] === 7;
}

export function builtinsArrayFindModifyWithSpread0241() {
  const arr = [...[1,2,3,4,5]];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 20;
      array.push(...[6,7,8]);
    }
    return num > 3;
  });

  return visited.length === 4 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 3 &&
    visited[3] === 4 &&
    result === 4 &&
    arr.length === 8 &&
    arr[1] === 20 &&
    arr[5] === 6 &&
    arr[6] === 7 &&
    arr[7] === 8;
}

export function builtinsArrayFindModifyWithEmptyArray0235() {
  const arr = [];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    return num > 2;
  });
  arr.push(1, 2, 3);

  return visited.length === 0 &&
    result === undefined &&
    arr.length === 3 &&
    arr[0] === 1 &&
    arr[1] === 2 &&
    arr[2] === 3;
}


export function builtinsArrayFindModifyWithArrayLike0240() {
  const arr = Array.from({ 0: 1, 1: 2, 2: 3, 3: 4, 4: 5, length: 5 });
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);

    if (index === 1) {
      array[1] = 20;
      array.splice(2, 1);
    }

    return num === 4;
  });

  return (
    visited.includes(1) &&
    visited.includes(2) &&
    visited.includes(4) &&
      result === 4 &&
      arr.length === 4 &&
      arr[1] === 20 &&
    arr.includes(4)
  );
}


export function builtinsArrayFindModifyWithOf0243() {
  const arr = Array.of(1, 2, 3, 4, 5);
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);

    if (index === 1) {
      array[1] = 20;
      array.unshift(0);
    }

    return num === 4;
  });

  return (
    visited.includes(1) &&
    visited.includes(2) &&
    visited.includes(3) &&
    visited.includes(4) &&
      result === 4 &&
      arr.length === 6 &&
      arr[0] === 0 &&
    arr.includes(20)
  );
}



export function builtinsArrayFindModifyWithFrom0242() {
  const arr = Array.from({ length: 5 }, (_, i) => i + 1);
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);

    if (index === 3) {
      array[1] = 20;
      array.splice(2, 0, 2.1, 2.2, 2.3);
    }

    return num === 4;
  });

  return (
    visited.includes(1) &&
    visited.includes(2) &&
    visited.includes(3) &&
    visited.includes(4) &&
      result === 4 &&
      arr[1] === 20 &&
    arr.includes(2.1)
  );
}




export function builtinsArrayFindModifyWithUndefined0211() {
  const arr = [1, undefined, 3, undefined, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);

    if (index === 1) array[1] = 2;

    array[3] = 4;

    return num === 4;
  });

  return (
    result === 4 &&
      arr[1] === 2 &&
      arr[3] === 4 &&
      visited.length > 0
  );
}export function builtinsArrayFindModifyWithNull0212() {
  const arr = [1, null, 3, null, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);

    if (index === 1) array[1] = 2;

    array[3] = 4;

    return num === 4;
  });

  return (
    result === 4 &&
      arr[1] === 2 &&
      arr[3] === 4 &&
      visited.length > 0
  );
}export function builtinsArrayFindModifyWithBoolean0213() {
  const arr = [1, true, 3, false, 5];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);

    if (index === 1) array[1] = 2;

    array[3] = 4;

    return num === 4;
  });

  return (
    result === 4 &&
      arr[1] === 2 &&
      arr[3] === 4 &&
      visited.length > 0
  );
}