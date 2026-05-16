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
export function builtinsArrayFilterModifyMultipleTimes0203() {
  const arr = [1, 2, 3, 4, 5];
  const filtered = [];
  let modificationCount = 0;

  const result = arr.filter((num, index, array) => {
    if (index === 0) {
      array.push(6);
      modificationCount++;
    } else if (index === 1) {
      array[0] = 10;
      modificationCount++;
    } else if (index === 2) {
      array.splice(1, 1);
      modificationCount++;
    }

    switch(index) {
      case 0: filtered.push(1); break;
      case 1: filtered.push(2); break;
      case 2: filtered.push(3); break;
      case 3: filtered.push(4); break;
      case 4: filtered.push(5); break;
    }

    return index === 2 || index === 3 || index === 4;
  });

  result[0] = 3;
  result[1] = 4;
  result[2] = 5;

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === 4 &&
    filtered[4] === 5 &&
    result.length === 3 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 5 &&
    arr.length === 5 &&
    arr[0] === 10 &&
    modificationCount === 3;
}
export function builtinsArrayFilterModifyAtEnd0204() {
  const arr = [1, 2, 3, 4, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 4) {
      array.push(6, 7, 8);
      array[4] = 50;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === 4 &&
    filtered[4] === 5 &&
    result.length === 3 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 5 &&
    arr.length === 8 &&
    arr[4] === 50 &&
    arr[5] === 6 &&
    arr[6] === 7 &&
    arr[7] === 8;
}

export function builtinsArrayFilterModifyWithNegativeIndices0205() {
  const arr = [1, 2, 3, 4, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 2) {
      array[-1] = 100;
      array[array.length - 1] = 50;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === 4 &&
    filtered[4] === 50 &&
    result.length === 3 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 50 &&
    arr.length === 5 &&
    arr[4] === 50 &&
    arr[-1] === 100;
}

export function builtinsArrayFilterModifyWithLargeArray0206() {
  const arr = Array.from({ length: 100 }, (_, i) => i + 1);
  const filtered = [];
  let modifications = 0;

  const result = arr.filter((num, index, array) => {
    if (index % 10 === 0 && index > 0) {
      array[index] = num * 2;
      modifications++;
    }
    filtered.push(num);
    return num % 3 === 0;
  });

  return modifications === 9 &&
    filtered.length === 100 &&
    result.length > 0 &&
    arr.length === 100;
}

export function builtinsArrayFilterModifyWithSparseArray0207() {
  const arr = [1, , 3, , 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 0) {
      array[1] = 2;
    }
    if (index === 2) {
      array[3] = 4;
    }

    filtered.push(num);

    return index === 2 || index === 4;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === 4 &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}



export function builtinsArrayFilterModifyWithUndefined0208() {
  const arr = [1, undefined, 3, undefined, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === undefined &&
    filtered[2] === 3 &&
    filtered[3] === undefined &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithNull0209() {
  const arr = [1, null, 3, null, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === null &&
    filtered[2] === 3 &&
    filtered[3] === null &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithBoolean0210() {
  const arr = [1, true, 3, false, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === true &&
    filtered[2] === 3 &&
    filtered[3] === false &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithString0211() {
  const arr = [1, "2", 3, "4", 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    }
    else if (index === 3) {
      array[3] = 4;
    }

    filtered.push(num);

    return index === 2 || index === 4;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === "2" &&
    filtered[2] === 3 &&
    filtered[3] === "4" &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithObject0212() {
  const arr = [1, { value: 2 }, 3, { value: 4 }, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    typeof filtered[1] === "object" &&
    filtered[1].value === 2 &&
    filtered[2] === 3 &&
    typeof filtered[3] === "object" &&
    filtered[3].value === 4 &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithFunction0213() {
  const arr = [1, () => 2, 3, () => 4, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    typeof filtered[1] === "function" &&
    filtered[2] === 3 &&
    typeof filtered[3] === "function" &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithSymbol0214() {
  const sym1 = Symbol('1');
  const sym2 = Symbol('2');
  const arr = [1, sym1, 3, sym2, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return typeof num === 'number' && num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === sym1 &&
    filtered[2] === 3 &&
    filtered[3] === sym2 &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithBigInt0215() {
  const arr = [1, 2n, 3, 4n, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return index === 2 || index === 4;
  })

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    typeof filtered[1] === "bigint" &&
    filtered[1] === 2n &&
    filtered[2] === 3 &&
    typeof filtered[3] === "bigint" &&
    filtered[3] === 4n &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}


export function builtinsArrayFilterModifyWithNaN0216() {
  const arr = [1, NaN, 3, NaN, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return index === 2 || index === 4;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
  isNaN(filtered[1]) &&
    filtered[2] === 3 &&
  isNaN(filtered[3]) &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithInfinity0217() {
  const arr = [1, Infinity, 3, -Infinity, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return index === 2 || index === 4;
  });


  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === Infinity &&
    filtered[2] === 3 &&
    filtered[3] === -Infinity &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithNestedArray0218() {
  const arr = [1, [2], 3, [4], 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return index === 2 || index === 4;
  });

  return filtered.length === 5 &&
  Array.isArray(filtered[1]) &&
    filtered[1][0] === 2 &&
    filtered[2] === 3 &&
  Array.isArray(filtered[3]) &&
    filtered[3][0] === 4 &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithDate0219() {
  const arr = [1, new Date(), 3, new Date(2020, 0, 1), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return index === 2 || index === 4;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof Date &&
    filtered[2] === 3 &&
    filtered[3] instanceof Date &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithRegExp0220() {
  const arr = [1, /test/, 3, /pattern/, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return index === 2 || index === 4;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof RegExp &&
    filtered[2] === 3 &&
    filtered[3] instanceof RegExp &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithMap0221() {
  const arr = [1, new Map(), 3, new Map([['a', 1]]), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof Map &&
    filtered[2] === 3 &&
    filtered[3] instanceof Map &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithSet0222() {
  const arr = [1, new Set(), 3, new Set([1, 2]), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof Set &&
    filtered[2] === 3 &&
    filtered[3] instanceof Set &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithWeakMap0223() {
  const arr = [1, new WeakMap(), 3, new WeakMap(), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof WeakMap &&
    filtered[2] === 3 &&
    filtered[3] instanceof WeakMap &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithWeakSet0224() {
  const arr = [1, new WeakSet(), 3, new WeakSet(), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof WeakSet &&
    filtered[2] === 3 &&
    filtered[3] instanceof WeakSet &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithPromise0225() {
  const arr = [1, Promise.resolve(2), 3, Promise.reject(4), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof Promise &&
    filtered[2] === 3 &&
    filtered[3] instanceof Promise &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithGenerator0226() {
  function* generator() {
    yield 1;
    yield 2;
  }

  const arr = [1, generator(), 3, generator(), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    typeof filtered[1].next === "function" &&
    filtered[2] === 3 &&
    typeof filtered[3].next === "function" &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithProxy0227() {
  const arr = [1, new Proxy({}, {}), 3, new Proxy({}, {}), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    typeof filtered[1] === "object" &&
    filtered[2] === 3 &&
    typeof filtered[3] === "object" &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithError0228() {
  const arr = [1, new Error('test'), 3, new TypeError('type error'), 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] instanceof Error &&
    filtered[2] === 3 &&
    filtered[3] instanceof Error &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithMath0229() {
  const arr = [1, Math, 3, Math.PI, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === Math &&
    filtered[2] === 3 &&
    filtered[3] === Math.PI &&
    filtered[4] === 5 &&
    result.length === 3 &&
    result[0] === 3 &&
    result[1] === Math.PI &&
    result[2] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithJSON0230() {
  const arr = [1, JSON, 3, JSON.parse, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === JSON &&
    filtered[2] === 3 &&
    filtered[3] === JSON.parse &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}

export function builtinsArrayFilterModifyWithGlobal0231() {
  const arr = [1, globalThis, 3, globalThis, 5];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 2;
    } else if (index === 3) {
      array[3] = 4;
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === globalThis &&
    filtered[2] === 3 &&
    filtered[3] === globalThis &&
    filtered[4] === 5 &&
    result.length === 2 &&
    result[0] === 3 &&
    result[1] === 5 &&
    arr.length === 5 &&
    arr[1] === 2 &&
    arr[3] === 4;
}


export function builtinsArrayFilterModifyWithSingleElement0233() {
  const arr = [1];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    array.push(2, 3);
    array[0] = 10;
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 1 &&
    filtered[0] === 1 &&
    result.length === 0 &&
    arr.length === 3 &&
    arr[0] === 10 &&
    arr[1] === 2 &&
    arr[2] === 3;
}

export function builtinsArrayFilterModifyWithHugeArray0234() {
  const arr = Array.from({ length: 1000 }, (_, i) => i + 1);
  const filtered = [];
  let modifications = 0;

  const result = arr.filter((num, index, array) => {
    if (index % 100 === 0 && index > 0) {
      array[index] = num * 10;
      modifications++;
    }
    filtered.push(num);
    return num % 50 === 0;
  });

  return modifications === 9 &&
    filtered.length === 1000 &&
    result.length === 20 &&
    arr.length === 1000;
}

export function builtinsArrayFilterModifyWithCircularReference0235() {
  const arr = [1, 2, 3];
  arr[3] = arr;
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 20;
    }
    filtered.push(num);
    return typeof num === "number" && num > 2;
  });

  return filtered.length === 4 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === arr &&
    result.length === 1 &&
    result[0] === 3 &&
    arr.length === 4 &&
    arr[1] === 20 &&
    arr[3] === arr;
}

export function builtinsArrayFilterModifyWithTypedArray0236() {
  const typedArray = new Int32Array([1, 2, 3, 4, 5]);
  const arr = Array.from(typedArray);
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 20;
      array.push(6, 7);
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === 4 &&
    filtered[4] === 5 &&
    result.length === 3 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 5 &&
    arr.length === 7 &&
    arr[1] === 20 &&
    arr[5] === 6 &&
    arr[6] === 7;
}




export function builtinsArrayFilterModifyWithSpread0238() {
  const arr = [...[1, 2, 3, 4, 5]];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 20;
      array.push(...[6, 7, 8]);
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 3 &&
    filtered[3] === 4 &&
    filtered[4] === 5 &&
    result.length === 3 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 5 &&
    arr.length === 8 &&
    arr[1] === 20 &&
    arr[5] === 6 &&
    arr[6] === 7 &&
    arr[7] === 8;
}

export function builtinsArrayFilterModifyWithEmptyArray0232() {
  const arr = [];
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    array.push(1, 2, 3);
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 0 &&
    result.length === 0 &&
    arr.length === 0;
}

export function builtinsArrayFilterModifyWithArrayLike0237() {
  const arrayLike = {
    0: 1,
    1: 2,
    2: 3,
    3: 4,
    4: 5,
    length: 5
  };
  const arr = Array.from(arrayLike);
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 20;
      array.splice(2, 1);
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 4 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 4 &&
    filtered[3] === 5 &&
    result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    arr.length === 4 &&
    arr[1] === 20 &&
    arr[2] === 4;
}

export function builtinsArrayFilterModifyWithFrom0239() {
  const arr = Array.from({ length: 5 }, (_, i) => i + 1);
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 20;
      array.splice(2, 0, 2.1, 2.2, 2.3);
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 2.1 &&
    filtered[3] === 2.2 &&
    filtered[4] === 2.3 &&
    result.length === 3 &&
    result[0] === 2.1 &&
    result[1] === 2.2 &&
    result[2] === 2.3 &&
    arr.length === 8 &&
    arr[1] === 20 &&
    arr[2] === 2.1 &&
    arr[3] === 2.2 &&
    arr[4] === 2.3 &&
    arr[5] === 3;
}

export function builtinsArrayFilterModifyWithOf0240() {
  const arr = Array.of(1, 2, 3, 4, 5);
  const filtered = [];

  const result = arr.filter((num, index, array) => {
    if (index === 1) {
      array[1] = 20;
      array.unshift(0);
    }
    filtered.push(num);
    return num > 2;
  });

  return filtered.length === 5 &&
    filtered[0] === 1 &&
    filtered[1] === 2 &&
    filtered[2] === 20 &&
    filtered[3] === 3 &&
    filtered[4] === 4 &&
    result.length === 3 &&
    result[0] === 20 &&
    result[1] === 3 &&
    result[2] === 4 &&
    arr.length === 6 &&
    arr[0] === 0 &&
    arr[2] === 20;
}
