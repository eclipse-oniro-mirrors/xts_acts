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
 * Curry a function
 * @param {Function} fn - Function to curry
 * @returns {Function} Curried function
 */
function curry(fn) {
  return function curried(...args) {
    if (args.length >= fn.length) {
      return fn.apply(this, args);
    }
    return function (...moreArgs) {
      return curried.apply(this, [...args, ...moreArgs]);
    };
  };
}

/**
 * Memoize a function
 * @param {Function} fn - Function to memoize
 * @returns {Function} Memoized function
 */
function memoize(fn) {
  const cache = {};
  return function (...args) {
    const key = JSON.stringify(args);
    if (cache[key]) {
      return cache[key];
    }
    const result = fn.apply(this, args);
    cache[key] = result;
    return result;
  };
}

/**
 * Throttle a function
 * @param {Function} fn - Function to throttle
 * @returns {Function} Throttled function
 */
function throttle(fn) {
  return function (...args) {
    return fn.apply(this, args);
  };
}

/**
 * Debounce a function
 * @param {Function} fn - Function to debounce
 * @param {number} delay - Delay in milliseconds
 * @returns {Function} Debounced function
 */
function debounce(fn, delay) {
  let timeoutId;
  return function (...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => fn.apply(this, args), delay);
    return false;
  };
}

/**
 * Compose multiple functions
 * @param {...Function} fns - Functions to compose
 * @returns {Function} Composed function
 */
function compose(...fns) {
  return function (x) {
    return fns.reduceRight((acc, fn) => fn.call(this, acc), x);
  };
}

/**
 * Create a partially applied function
 * @param {Function} fn - Function to apply partially
 * @param {...any} args - Partial arguments
 * @returns {Function} Partially applied function
 */
function partial(fn, ...args) {
  return function (...moreArgs) {
    return fn.apply(this, [...args, ...moreArgs]);
  };
}
export function builtinsArrayFindThisArg0100() {
  const inventory = [
    { name: "apples", quantity: 2 },
    { name: "bananas", quantity: 0 },
    { name: "cherries", quantity: 5 }
  ];

  const context = {
    minQuantity: 3
  };

  const result = inventory.find(function (fruit) {
    return fruit.quantity !== undefined && fruit.quantity >= this.minQuantity;
  }, context);

  return result?.name === "cherries" &&
    result?.quantity === 5;
}

export function builtinsArrayFindThisArgWithContext0101() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const context = {
    min: 3,
    max: 7
  };

  const result = numbers.find(function (num) {
    return num >= this.min && num <= this.max;
  }, context);

  return result === 3;
}

export function builtinsArrayFindThisArgArrowFunction0102() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3
  };

  const result = numbers.find((num) => {
    return num > this?.threshold;
  }, context);

  return result === undefined;
}

export function builtinsArrayFindThisArgUndefined0103() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, undefined);

  return result === 4 &&
    thisValue === undefined;
}

export function builtinsArrayFindThisArgNull0104() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, null);

  return result === 4 &&
    thisValue === null;
}











export function builtinsArrayFindThisArgObject0105() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context;
}

export function builtinsArrayFindThisArgArray0106() {
  const numbers = [1, 2, 3, 4, 5];

  const context = [10, 20, 30];
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this[0];
  }, context);

  return result === undefined &&
    thisValue === context;
}

export function builtinsArrayFindThisArgFunction0107() {
  const numbers = [1, 2, 3, 4, 5];

  function contextFunction() { this.value = 10; }
  const context = contextFunction;
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 5;
  }, context);

  return result === undefined &&
    thisValue === context;
}


export function builtinsArrayFindThisArgNumber0108() {
  const numbers = [1, 2, 3, 4, 5];

  const context = 42;
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, context);

  return result === 4 &&
    typeof thisValue === 'number' &&
    thisValue === 42;
}
export function builtinsArrayFindThisArgString0109() {
  const numbers = [1, 2, 3, 4, 5];

  const context = "hello";
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, context);

  return result === 4 &&
    typeof thisValue === 'string' &&
    thisValue === "hello";
}
export function builtinsArrayFindThisArgBoolean0110() {
  const numbers = [1, 2, 3, 4, 5];

  const context = true;
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, context);

  return result === 4 &&
    typeof thisValue === 'boolean' &&
    thisValue === true;
}


export function builtinsArrayFindThisArgWithBind0113() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };

  const boundFunction = function (num) {
    return num > this.value / 2;
  }.bind(context);

  const result = numbers.find(boundFunction);

  return result === undefined;
}

export function builtinsArrayFindThisArgWithCall0114() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  const callback = function (num) {
    return num > this.value / 2;
  };

  const result = numbers.find(callback, context);

  return result === undefined;
}

export function builtinsArrayFindThisArgWithApply0115() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  const callback = function (num) {
    return num > this.value / 2;
  };

  const result = numbers.find(callback, context);

  return result === undefined;
}

export function builtinsArrayFindThisArgInNestedFunction0116() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  let outerThis;
  let innerThis;

  const result = numbers.find(function (num) {
    outerThis = this;

    function innerFunction() {
      innerThis = this;
    }

    innerFunction();

    return num > this.value / 2;
  }, context);

  return result === undefined &&
    outerThis === context &&
    innerThis === undefined;
}

export function builtinsArrayFindThisArgWithClosure0117() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  let capturedThis;

  function createCallback() {
    return function (num) {
      capturedThis = this;
      return num > this.value / 2;
    };
  }

  const callback = createCallback();
  const result = numbers.find(callback, context);

  return result === undefined &&
    capturedThis === context;
}

export function builtinsArrayFindThisArgWithConstructor0118() {
  const numbers = [1, 2, 3, 4, 5];

  function Context(value) {
    this.value = value;
  }

  const context = new Context(10);
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithClass0119() {
  const numbers = [1, 2, 3, 4, 5];

  class Context {
    constructor(value) {
      this.value = value;
    }
  }

  const context = new Context(10);
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithStaticMethod0120() {
  const numbers = [1, 2, 3, 4, 5];

  class Context {
    static value = 10;

    static findNumber(num) {
      return num > this.value / 2;
    }
  }

  const result = numbers.find(Context.findNumber, Context);

  return result === undefined;
}

export function builtinsArrayFindThisArgWithPrototypeMethod0121() {
  const numbers = [1, 2, 3, 4, 5];

  class Context {
    constructor(value) {
      this.value = value;
    }

    findNumber(num) {
      return num > this.value / 2;
    }
  }

  const context = new Context(10);
  const result = numbers.find(context.findNumber, context);

  return result === undefined;
}

export function builtinsArrayFindThisArgWithGetter0122() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    get value() {
      return 10;
    }
  };

  const result = numbers.find(function (num) {
    return num > this.value / 2;
  }, context);

  return result === undefined;
}

export function builtinsArrayFindThisArgWithSetter0123() {
  const numbers = [1, 2, 3, 4, 5];
  let setValue;

  const context = {
    set value(val) {
      setValue = val;
    },
    get value() {
      return 10;
    }
  };

  const result = numbers.find(function (num) {
    if (num === 3) {
      this.value = num;
    }
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    setValue === 3;
}




export function builtinsArrayFindThisArgWithProxyHandler0125() {
  const numbers = [1, 2, 3, 4, 5];

  const handler = {
    get(target, prop) {
      if (prop === 'value') {
        return 10;
      }
      return target[prop];
    }
  };

  const proxy = new Proxy({}, handler);

  const result = numbers.find(function (num) {
    return num > this.value / 2;
  }, proxy);

  return result === undefined;
}

export function builtinsArrayFindThisArgWithError0126() {
  const numbers = [1, 2, 3, 4, 5];

  const error = new Error('test');
  error.value = 10;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, error);

  return result === undefined &&
    thisValue === error &&
    thisValue instanceof Error;
}

export function builtinsArrayFindThisArgWithDate0127() {
  const numbers = [1, 2, 3, 4, 5];

  const date = new Date();
  date.value = 10;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, date);

  return result === undefined &&
    thisValue === date &&
    thisValue instanceof Date;
}

export function builtinsArrayFindThisArgWithRegExp0128() {
  const numbers = [1, 2, 3, 4, 5];

  const regex = /test/;
  regex.value = 10;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, regex);

  return result === undefined &&
    thisValue === regex &&
    thisValue instanceof RegExp;
}

export function builtinsArrayFindThisArgWithMap0129() {
  const numbers = [1, 2, 3, 4, 5];

  const map = new Map();
  map.set('value', 10);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.get('value') / 2;
  }, map);

  return result === undefined &&
    thisValue === map &&
    thisValue instanceof Map;
}

export function builtinsArrayFindThisArgWithSet0130() {
  const numbers = [1, 2, 3, 4, 5];

  const set = new Set([10]);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > Array.from(this)[0] / 2;
  }, set);

  return result === undefined &&
    thisValue === set &&
    thisValue instanceof Set;
}

export function builtinsArrayFindThisArgWithWeakMap0131() {
  const numbers = [1, 2, 3, 4, 5];

  const weakMap = new WeakMap();
  const key = {};
  weakMap.set(key, 10);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.get(key) / 2;
  }, weakMap);

  return result === undefined &&
    thisValue === weakMap &&
    thisValue instanceof WeakMap;
}



export function builtinsArrayFindThisArgWithPromise0133() {
  const numbers = [1, 2, 3, 4, 5];

  const promise = Promise.resolve(10);
  promise.value = 10;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, promise);

  return result === undefined &&
    thisValue === promise &&
    thisValue instanceof Promise;
}

export function builtinsArrayFindThisArgWithGenerator0134() {
  const numbers = [1, 2, 3, 4, 5];

  function* generator() {
    yield 1;
    yield 2;
  }

  const gen = generator();
  gen.value = 10;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, gen);

  return result === undefined &&
    thisValue === gen;
}





export function builtinsArrayFindThisArgWithArrayLike0140() {
  const numbers = [1, 2, 3, 4, 5];

  const arrayLike = {
    0: 10,
    length: 1,
    value: 10
  };

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, arrayLike);

  return result === undefined &&
    thisValue === arrayLike;
}





export function builtinsArrayFindThisArgWithGeneratorFunction0147() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  let thisValue;

  function* generator(num) {
    thisValue = this;
    yield num > this.value / 2;
  }

  const result = numbers.find(function (num) {
    const gen = generator.call(this, num);
    return gen.next().value;
  }, context);

  return result === undefined &&
    thisValue === context;
}


export function builtinsArrayFindThisArgWithConstructorFunction0149() {
  const numbers = [1, 2, 3, 4, 5];

  function Context() {
    this.value = 10;
  }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, Context);

  return result === undefined &&
    thisValue === Context;
}

export function builtinsArrayFindThisArgWithNewKeyword0150() {
  const numbers = [1, 2, 3, 4, 5];

  function Context() {
    this.value = 10;
  }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, new Context());

  return result === undefined &&
    thisValue instanceof Context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithClassConstructor0151() {
  const numbers = [1, 2, 3, 4, 5];

  class Context {
    constructor() {
      this.value = 10;
    }
  }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, new Context());

  return result === undefined &&
    thisValue instanceof Context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithClassStatic0152() {
  const numbers = [1, 2, 3, 4, 5];

  class Context {
    static value = 10;
  }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, Context);

  return result === undefined &&
    thisValue === Context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithClassInstance0153() {
  const numbers = [1, 2, 3, 4, 5];

  class Context {
    constructor() {
      this.value = 10;
    }
  }

  const instance = new Context();
  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, instance);

  return result === undefined &&
    thisValue === instance &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithClassInheritance0154() {
  const numbers = [1, 2, 3, 4, 5];

  class Parent {
    constructor() {
      this.parentValue = 5;
    }
  }

  class Child extends Parent {
    constructor() {
      super();
      this.childValue = 10;
    }
  }

  const instance = new Child();
  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.childValue / 2;
  }, instance);

  return result === undefined &&
    thisValue === instance &&
    thisValue.childValue === 10 &&
    thisValue.parentValue === 5;
}

export function builtinsArrayFindThisArgWithMixin0155() {
  const numbers = [1, 2, 3, 4, 5];

  const mixin = {
    get value() {
      return 10;
    }
  };

  const context = Object.assign({}, mixin);
  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithObjectCreate0156() {
  const numbers = [1, 2, 3, 4, 5];

  const prototype = { value: 10 };
  const context = Object.create(prototype);
  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithObjectDefineProperty0157() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {};
  Object.defineProperty(context, 'value', {
    value: 10,
    writable: true,
    enumerable: true,
    configurable: true
  });

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10;
}

export function builtinsArrayFindThisArgWithObjectDefineProperties0158() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {};
  Object.defineProperties(context, {
    value: {
      value: 10,
      writable: true,
      enumerable: true,
      configurable: true
    },
    multiplier: {
      value: 2,
      writable: true,
      enumerable: true,
      configurable: true
    }
  });

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / this.multiplier;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10 &&
    thisValue.multiplier === 2;
}

export function builtinsArrayFindThisArgWithObjectGetOwnPropertyDescriptor0159() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  const descriptor = Object.getOwnPropertyDescriptor(context, 'value');

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    descriptor.value === 10;
}

export function builtinsArrayFindThisArgWithObjectKeys0160() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10, name: 'test' };
  const keys = Object.keys(context);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    keys.includes('value') &&
    keys.includes('name');
}

export function builtinsArrayFindThisArgWithObjectValues0161() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10, name: 'test' };
  const values = Object.values(context);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    values.includes(10) &&
    values.includes('test');
}

export function builtinsArrayFindThisArgWithObjectEntries0162() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10, name: 'test' };
  const entries = Object.entries(context);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    entries.some(([key, value]) => key === 'value' && value === 10);
}

export function builtinsArrayFindThisArgWithObjectFromEntries0163() {
  const numbers = [1, 2, 3, 4, 5];

  const entries = [['value', 10], ['name', 'test']];
  const context = Object.fromEntries(entries);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10 &&
    thisValue.name === 'test';
}

export function builtinsArrayFindThisArgWithObjectAssign0164() {
  const numbers = [1, 2, 3, 4, 5];

  const context = Object.assign({}, { value: 10 }, { name: 'test' });

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10 &&
    thisValue.name === 'test';
}

export function builtinsArrayFindThisArgWithObjectSpread0165() {
  const numbers = [1, 2, 3, 4, 5];

  const base = { value: 10 };
  const context = { ...base, name: 'test' };

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === undefined &&
    thisValue === context &&
    thisValue.value === 10 &&
    thisValue.name === 'test';
}

export function builtinsArrayFindThisArgWithArrayMap0166() {
  const numbers = [1, 2, 3, 4, 5];

  const context = [10, 20, 30].map((value, index) => ({ index, value }));

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this[0].value / 2;
  }, context);

  return result === undefined &&
    thisValue === context;
}

export function builtinsArrayFindThisArgWithArrayFilter0167() {
  const numbers = [1, 2, 3, 4, 5];

  const context = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].filter(num => num > 5);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this[0];
  }, context);

  return result === undefined &&
    thisValue === context;
}




export function builtinsArrayFindThisArgWithArrayReduce0168() {
  const numbers = [1, 2, 3, 4, 5];

  const context = [1, 2, 3, 4, 5].reduce((acc, curr) => acc + curr, 0);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this / 2;
  }, context);

  return result === undefined &&
    typeof thisValue === 'number' &&
    thisValue === 15;
}













export function builtinsArrayFindThisArgWithArrowFunctionThis0143() {
  const numbers = [1, 2, 3, 4, 5];
  const context = { value: 10 };
  const lexicalThis = this;
  let thisValue;

  numbers.find(() => {
    thisValue = this;
  }, context);

  return thisValue === lexicalThis &&
    thisValue !== context;
}



export function builtinsArrayFindThisArgWithArrayEvery0169() {
  const numbers = [1, 2, 3, 4, 5];

  const context = [2, 4, 6, 8, 10];

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return this.every(n => n % 2 === 0);
  }, context);

  return result === 1 &&
    thisValue === context;
}

export function builtinsArrayFindThisArgWithArraySome0170() {
  const numbers = [1, 2, 3, 4, 5];

  const context = [1, 3, 5, 7, 9];

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return this.some(n => n === 5);
  }, context);

  return result === 1 &&
    thisValue === context;
}


export function builtinsArrayFindThisArgWithAsyncGeneratorFunction0148() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  let thisValue;

  async function* asyncGenerator(num) {
    thisValue = this;
    yield num > this.value / 2;
  }

  const result = numbers.find(async function (num) {
    const gen = asyncGenerator.call(this, num);
    const { value } = await gen.next();
    return value;
  }, context);

  return result === 1 &&
    thisValue === context;
}


export function builtinsArrayFindThisArgWithArrayForEach0171() {
  const numbers = [1, 2, 3, 4, 5];

  const context = [];
  [1, 2, 3, 4, 5].forEach(function (num) {
    this.push(num * 2);
  }, context);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this[0];
  }, context);

  return result === 3 &&
    thisValue === context &&
    thisValue[0] === 2;
}

export function builtinsArrayFindThisArgWithArrayMapThis0172() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { multiplier: 2 };
  const mapped = [1, 2, 3].map(function (num) {
    return num * this.multiplier;
  }, context);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > mapped[0];
  }, context);

  return result === 3 &&
    thisValue === context &&
    mapped[0] === 2;
}

export function builtinsArrayFindThisArgWithArrayFilterThis0173() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { threshold: 3 };
  const filtered = [1, 2, 3, 4, 5].filter(function (num) {
    return num > this.threshold;
  }, context);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num === filtered[0];
  }, context);

  return result === 4 &&
    thisValue === context &&
    filtered[0] === 4;
}


export function builtinsArrayFindThisArgWithFunctionCall0175() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  function callback(num) {
    return num > this.value / 2;
  }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return callback.call(this, num);
  }, context);

  return result === 6 &&
    thisValue === context;
}

export function builtinsArrayFindThisArgWithFunctionApply0176() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  function callback(num) {
    return num > this.value / 2;
  }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return callback.apply(this, [num]);
  }, context);

  return result === 6 &&
    thisValue === context;
}

export function builtinsArrayFindThisArgWithFunctionBind0177() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  function callback(num) {
    return num > this.value / 2;
  }

  const boundCallback = callback.bind(context);
  const result = numbers.find(boundCallback);

  return result === 6;
}

export function builtinsArrayFindThisArgWithNestedBind0178() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context1 = { value: 10 };
  const context2 = { value: 20 };

  function callback(num) {
    return num > this.value / 2;
  }

  const bound1 = callback.bind(context1);
  const bound2 = bound1.bind(context2);
  const result = numbers.find(bound2);

  return result === 6;
}

export function builtinsArrayFindThisArgWithPartialApplication0179() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  function callback(threshold, num) {
    return num > threshold;
  }

  const partialCallback = partial(callback, context.value / 2);
  const result = numbers.find(partialCallback, context);

  return result === 6;
}

export function builtinsArrayFindThisArgWithCurrying0180() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  const curriedCallback = curry(function (threshold, num) {
    return num > threshold;
  });

  const partiallyApplied = curriedCallback(context.value / 2);
  const result = numbers.find(partiallyApplied, context);

  return result === 6;
}

export function builtinsArrayFindThisArgWithMemoization0181() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  const memoizedCallback = memoize(function (num) {
    return num > this.value / 2;
  });

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return memoizedCallback.call(this, num);
  }, context);

  return result === 6 &&
    thisValue === context;
}


export function builtinsArrayFindThisArgWithDebouncing0183() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  const debouncedCallback = debounce(function (num) {
    return num > this.value / 2;
  }, 100);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return debouncedCallback.call(this, num);
  }, context);

  return result === undefined &&
    thisValue === context;
}


export function builtinsArrayFindThisArgWithErrorThrowing0185() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10, throwAt: 3 };

  try {
    numbers.find(function (num) {
      if (num === this.throwAt) {
        throw new Error('Test error');
      }
      return num > this.value / 2;
    }, context);
    return false;
  } catch (e) {
    return e.message === 'Test error';
  }
}

export function builtinsArrayFindThisArgWithAsyncError0187() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };

  const result = numbers.find(async function (num) {
    if (num === 3) {
      throw new Error('Async error');
    }
    return num > this.value / 2;
  }, context);

  return result === 1;
}

export function builtinsArrayFindThisArgWithSyncError0188() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };

  try {
    numbers.find(function (num) {
      if (num === 3) {
        throw new Error('Sync error');
      }
      return num > this.value / 2;
    }, context);
    return false;
  } catch (e) {
    return e.message === 'Sync error';
  }
}

export function builtinsArrayFindThisArgWithDynamicContext0189() {
  const numbers = [1, 2, 3, 4, 5, 6];

  let context = { value: 10 };

  const result = numbers.find(function (num) {
    this.value = 5;
    return num > this.value;
  }, context);

  return result === 6 &&
    context.value === 5;
}
export function builtinsArrayFindThisArgWithChangingContext0190() {
  const numbers = [1, 2, 3, 4, 5, 6];

  let context1 = { value: 10 };
  let context2 = { value: 5 };
  let currentContext = context1;

  const result = numbers.find(function (num) {
    if (num === 3) {
      currentContext = context2;
    }
    return num > currentContext.value;
  }, context1);

  return result === 6;
}


export function builtinsArrayFindThisArgWithArrayReduceThis0174() {
  const numbers = [1, 2, 3, 4, 5, 6, 7];

  const context = { initial: 0 };
  const reduced = [1,2,3].reduce(function (acc, curr) {
    return acc + curr + this.initial;
  }.bind(context), context.initial);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > reduced;
  }, context);

  return result === 7 &&
    thisValue === context &&
    reduced === 6;
}

export function builtinsArrayFindThisArgWithThrottling0182() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  const throttledCallback = throttle(function (num) {
    return num > this.value / 2;
  });

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return throttledCallback.call(this, num);
  }, context);

  return result === 6 &&
    thisValue === context;
}


export function builtinsArrayFindThisArgWithComposition0184() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };

  const isGreaterThanThreshold = function (num) {
    return num > this.value / 2;
  };
  const isEven = function (num) {
    return num % 2 === 0;
  };

  const composedCallback = compose(isEven, isGreaterThanThreshold);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return isEven.call(this, num) && isGreaterThanThreshold.call(this, num);
  }, context);

  return result === 6 && thisValue === context;
}

export function builtinsArrayFindThisArgWithTryCatch0186() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10, errorAt: 3 };
  let errorCaught = false;

  const result = numbers.find(function(num) {
    try {
      if (num === this.errorAt) {
        throw new Error('Test error');
      }
      return num > this.value / 2;
    } catch (e) {
      errorCaught = true;
      return false;
    }
  }, context);

  return result === 6 &&
    errorCaught === true;
}


export function builtinsArrayFindThisArgBigInt0111() {
  const numbers = [1, 2, 3, 4, 5];

  const context = 42n;
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, context);

  return result === 4 &&
    typeof thisValue === "bigint" &&
    thisValue === 42n;
}

export function builtinsArrayFindThisArgSymbol0112() {
  const numbers = [1, 2, 3, 4, 5];

  const context = Symbol("test");
  let thisValue;

  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, context);

  return result === 4 &&
    typeof thisValue === "symbol" &&
    thisValue === context;
}

export function builtinsArrayFindThisArgWithProxy0124() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const target = { value: 10 };
  const proxy = new Proxy(target, {
    get(target, prop) {
      return target[prop];
    }
  });

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, proxy);

  return result === 6 &&
    thisValue === proxy;
}

export function builtinsArrayFindThisArgWithWeakSet0132() {
  const numbers = [1, 2, 3, 4, 5];

  const weakSet = new WeakSet();
  const value = {};
  weakSet.add(value);

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, weakSet);

  return result === 4 &&
    thisValue === weakSet &&
    thisValue instanceof WeakSet;
}



export function builtinsArrayFindThisArgWithAsyncGenerator0135() {
  const numbers = [1, 2, 3, 4, 5, 6];

  async function* asyncGenerator() {
    yield 1;
    yield 2;
  }

  const gen = asyncGenerator();
  gen.value = 10;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, gen);

  return result === 6 &&
    thisValue === gen;
}

export function builtinsArrayFindThisArgWithCircularReference0136() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const context = { value: 10 };
  context.self = context;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === 6 &&
    thisValue === context &&
    thisValue.self === context;
}

export function builtinsArrayFindThisArgWithGlobalObject0137() {
  const numbers = [1, 2, 3, 4, 5, 6];

  const originalValue = globalThis.testValue;
  globalThis.testValue = 10;

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.testValue / 2;
  }, globalThis);


  if (originalValue === undefined) {
    delete globalThis.testValue;
  } else {
    globalThis.testValue = originalValue;
  }

  return result === 6 &&
    thisValue === globalThis;
}

export function builtinsArrayFindThisArgWithMathObject0138() {
  const numbers = [1, 2, 3, 4, 5];


  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.PI;
  }, Math);

  return result === 4 &&
    thisValue === Math;
}

export function builtinsArrayFindThisArgWithJSONObject0139() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, JSON);

  return result === 4 &&
    thisValue === JSON;
}
export function builtinsArrayFindThisArgWithFunctionLength0141() {
  const numbers = [1, 2, 3, 4, 5];

  function contextFunction(a, b, c) { }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > this.length;
  }, contextFunction);

  return result === 4 &&
    thisValue === contextFunction &&
    thisValue.length === 3;
}
export function builtinsArrayFindThisArgWithFunctionName0142() {
  const numbers = [1, 2, 3, 4, 5];

  function contextFunction() { }

  let thisValue;
  const result = numbers.find(function (num) {
    thisValue = this;
    return num > 3;
  }, contextFunction);

  return result === 4 &&
    thisValue === contextFunction &&
    thisValue.name === "contextFunction";
}



export function builtinsArrayFindThisArgWithArrowFunctionLexicalThis0144() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };

  function outerFunction() {
    return numbers.find(() => {
      return this.value;
    });
  }

  const result = outerFunction.call(context);

  return result === 1;
}

export function builtinsArrayFindThisArgWithBoundArrowFunction0145() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  const arrowFunction = () => {
    return this.value;
  };

  const boundArrow = arrowFunction.bind(context);
  const result = boundArrow();

  return result === undefined;
}

export function builtinsArrayFindThisArgWithAsyncFunction0146() {
  const numbers = [1, 2, 3, 4, 5];

  const context = { value: 10 };
  let thisValue;

  const result = numbers.find(async function (num) {
    thisValue = this;
    return num > this.value / 2;
  }, context);

  return result === 1 &&
    thisValue === context;
}

