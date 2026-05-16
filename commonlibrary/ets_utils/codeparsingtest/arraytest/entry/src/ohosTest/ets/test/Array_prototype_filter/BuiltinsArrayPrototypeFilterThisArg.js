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
export function builtinsArrayFilterThisArg0100() {
  const products = [
    { name: 'apple', price: 5 },
    { name: 'banana', price: 3 },
    { name: 'orange', price: 7 },
    { name: 'grape', price: 4 }
  ];

  const context = {
    minPrice: 4
  };

  const result = products.filter(function (product) {
    return product.price >= this.minPrice;
  }, context);

  return result.length === 3 &&
    result[0].name === 'apple' &&
    result[1].name === 'orange' &&
    result[2].name === 'grape';
}

export function builtinsArrayFilterThisArgWithContext0101() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const context = {
    min: 3,
    max: 7
  };

  const result = numbers.filter(function (num) {
    return num >= this.min && num <= this.max;
  }, context);

  return result.length === 5 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 5 &&
    result[3] === 6 &&
    result[4] === 7;
}

export function builtinsArrayFilterThisArgArrowFunction0102() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3
  };


  const result = numbers.filter((num) => {
    return num > this?.threshold;
  }, context);



  return result.length === 0;
}

export function builtinsArrayFilterThisArgUndefined0103() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, undefined);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === undefined;
}

export function builtinsArrayFilterThisArgNull0104() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, null);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === null;
}

export function builtinsArrayFilterThisArgNumber0105() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = 42;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    (typeof thisValue === 'number' && thisValue === 42) ||
    (typeof thisValue === 'object' && thisValue instanceof Number && thisValue.valueOf() === 42);
}

export function builtinsArrayFilterThisArgString0106() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = 'test';

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    (typeof thisValue === 'string' && thisValue === 'test') ||
    (typeof thisValue === 'object' && thisValue instanceof String && thisValue.valueOf() === 'test');
}

export function builtinsArrayFilterThisArgBoolean0107() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = true;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    (typeof thisValue === 'boolean' && thisValue === true) ||
    (typeof thisValue === 'object' && thisValue instanceof Boolean && thisValue.valueOf() === true);
}

export function builtinsArrayFilterThisArgArray0108() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = [10, 20, 30];

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context &&
    Array.isArray(thisValue) &&
    thisValue.length === 3;
}

export function builtinsArrayFilterThisArgFunction0109() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  function contextFunction() {
    return 'context';
  }

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, contextFunction);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === contextFunction &&
    typeof thisValue === 'function';
}

export function builtinsArrayFilterThisArgDate0110() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = new Date('2023-01-01');

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context &&
    thisValue instanceof Date;
}

export function builtinsArrayFilterThisArgRegExp0111() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = /test/;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context &&
    thisValue instanceof RegExp;
}

export function builtinsArrayFilterThisArgMap0112() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = new Map([['a', 1], ['b', 2]]);

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context &&
    thisValue instanceof Map &&
    thisValue.size === 2;
}

export function builtinsArrayFilterThisArgSet0113() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = new Set([1, 2, 3]);

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context &&
    thisValue instanceof Set &&
    thisValue.size === 3;
}

export function builtinsArrayFilterThisArgComplexObject0114() {
  const products = [
    { name: 'apple', price: 5, category: 'fruit' },
    { name: 'banana', price: 3, category: 'fruit' },
    { name: 'carrot', price: 2, category: 'vegetable' },
    { name: 'orange', price: 7, category: 'fruit' },
    { name: 'broccoli', price: 4, category: 'vegetable' }
  ];

  const context = {
    minPrice: 3,
    allowedCategories: ['fruit'],
    discount: 0.1,
    calculateDiscountedPrice: function (price) {
      return price * (1 - this.discount);
    }
  };

  const result = products.filter(function (product) {
    return product.price >= this.minPrice &&
      this.allowedCategories.includes(product.category);
  }, context);

  return result.length === 3 &&
    result[0].name === 'apple' &&
    result[1].name === 'banana' &&
    result[2].name === 'orange';
}

export function builtinsArrayFilterThisArgNestedContext0115() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const context = {
    ranges: {
      low: {
        min: 1,
        max: 3
      },
      medium: {
        min: 4,
        max: 7
      },
      high: {
        min: 8,
        max: 10
      }
    },
    currentRange: 'medium'
  };

  const result = numbers.filter(function (num) {
    const range = this.ranges[this.currentRange];
    return num >= range.min && num <= range.max;
  }, context);

  return result.length === 4 &&
    result[0] === 4 &&
    result[1] === 5 &&
    result[2] === 6 &&
    result[3] === 7;
}

export function builtinsArrayFilterThisArgWithBind0116() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3
  };


  const boundFilter = function (num) {
    return num > this.threshold;
  }.bind(context);

  const result = numbers.filter(boundFilter);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithCall0117() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3
  };

  let thisValue;
  const filterFn = function (num) {
    thisValue = this;
    return num > this.threshold;
  };


  const result = numbers.filter(function (num) {
    return filterFn.call(context, num);
  });

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context;
}

export function builtinsArrayFilterThisArgWithApply0118() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3
  };

  let thisValue;
  const filterFn = function (num) {
    thisValue = this;
    return num > this.threshold;
  };


  const result = numbers.filter(function (num) {
    return filterFn.apply(context, [num]);
  });

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context;
}

export function builtinsArrayFilterThisArgInConstructor0119() {
  function Filterer(threshold) {
    this.threshold = threshold;
    this.filter = function (arr) {
      return arr.filter(function (num) {
        return num > this.threshold;
      }, this);
    };
  }

  const filterer = new Filterer(3);
  const numbers = [1, 2, 3, 4, 5];
  const result = filterer.filter(numbers);

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgInClass0120() {
  class Filterer {
    constructor(threshold) {
      this.threshold = threshold;
    }

    filter(arr) {
      return arr.filter(function (num) {
        return num > this.threshold;
      }, this);
    }
  }

  const filterer = new Filterer(3);
  const numbers = [1, 2, 3, 4, 5];
  const result = filterer.filter(numbers);

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithGetter0121() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    _threshold: 3,
    get threshold() {
      return this._threshold;
    },
    set threshold(value) {
      this._threshold = value;
    }
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithMethod0122() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const context = {
    min: 2,
    max: 8,
    isInRange: function (num) {
      return num >= this.min && num <= this.max;
    }
  };

  const result = numbers.filter(function (num) {
    return this.isInRange(num);
  }, context);

  return result.length === 7 &&
    result[0] === 2 &&
    result[1] === 3 &&
    result[2] === 4 &&
    result[3] === 5 &&
    result[4] === 6 &&
    result[5] === 7 &&
    result[6] === 8;
}

export function builtinsArrayFilterThisArgWithPrototype0123() {
  function Context(threshold) {
    this.threshold = threshold;
  }

  Context.prototype.isGreater = function (num) {
    return num > this.threshold;
  };

  const context = new Context(3);
  const numbers = [1, 2, 3, 4, 5];

  const result = numbers.filter(function (num) {
    return this.isGreater(num);
  }, context);

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithSymbol0124() {
  const numbers = [1, 2, 3, 4, 5];
  const sym = Symbol('threshold');

  const context = {
    [sym]: 3
  };

  const result = numbers.filter(function (num) {
    return num > this[sym];
  }, context);

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithBigInt0125() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3n
  };

  const result = numbers.filter(function (num) {
    return BigInt(num) > this.threshold;
  }, context);

  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithNaN0126() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: NaN
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 0;
}

export function builtinsArrayFilterThisArgWithInfinity0127() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: Infinity
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 0;
}

export function builtinsArrayFilterThisArgWithNegativeInfinity0128() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: -Infinity
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 5 &&
    result[0] === 1 &&
    result[1] === 2 &&
    result[2] === 3 &&
    result[3] === 4 &&
    result[4] === 5;
}

export function builtinsArrayFilterThisArgWithUndefinedProperty0129() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {};


  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 0;
}

export function builtinsArrayFilterThisArgWithNullProperty0130() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: null
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 5 &&
    result[0] === 1 &&
    result[1] === 2 &&
    result[2] === 3 &&
    result[3] === 4 &&
    result[4] === 5;
}

export function builtinsArrayFilterThisArgWithBooleanProperty0131() {
  const numbers = [0, 1, 2, 3, 4, 5];

  const context = {
    threshold: true
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 4 &&
    result[0] === 2 &&
    result[1] === 3 &&
    result[2] === 4 &&
    result[3] === 5;
}

export function builtinsArrayFilterThisArgWithStringProperty0132() {
  const numbers = [0, 1, 10, 100, 1000];

  const context = {
    threshold: '10'
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 2 &&
    result[0] === 100 &&
    result[1] === 1000;
}

export function builtinsArrayFilterThisArgWithEmptyObject0133() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = {};

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context &&
    Object.keys(thisValue).length === 0;
}

export function builtinsArrayFilterThisArgWithGlobalObject0134() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  });



  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithProxy0135() {
  const numbers = [1, 2, 3, 4, 5];

  const context = new Proxy({
    threshold: 3
  }, {
    get(target, prop) {
      return target[prop];
    }
  });

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithError0136() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;
  const context = new Error('test');
  context.threshold = 3;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > this.threshold;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === context &&
    thisValue instanceof Error;
}

export function builtinsArrayFilterThisArgWithMath0137() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > this.PI;
  }, Math);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === Math;
}

export function builtinsArrayFilterThisArgWithJSON0138() {
  const numbers = [1, 2, 3, 4, 5];

  let thisValue;

  const result = numbers.filter(function (num) {
    thisValue = this;
    return num > 3;
  }, JSON);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    thisValue === JSON;
}

export function builtinsArrayFilterThisArgWithGenerator0139() {
  function* generator() {
    yield 1;
    yield 2;
    yield 3;
  }

  const numbers = [1, 2, 3, 4, 5];
  const gen = generator();
  gen.threshold = 3;

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, gen);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithPromise0140() {
  const numbers = [1, 2, 3, 4, 5];
  const promise = Promise.resolve(42);
  promise.threshold = 3;

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, promise);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithWeakMap0141() {
  const numbers = [1, 2, 3, 4, 5];
  const weakMap = new WeakMap();


  weakMap.threshold = 3;

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, weakMap);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithWeakSet0142() {
  const numbers = [1, 2, 3, 4, 5];
  const weakSet = new WeakSet();


  weakSet.threshold = 3;

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, weakSet);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithCircularReference0143() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3
  };

  context.self = context;

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5 &&
    context.self === context;
}

export function builtinsArrayFilterThisArgWithArrayLike0144() {
  const numbers = [1, 2, 3, 4, 5];

  const arrayLike = {
    0: 1,
    1: 2,
    2: 3,
    length: 3,
    threshold: 3
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, arrayLike);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithTypedArray0145() {
  const numbers = [1, 2, 3, 4, 5];
  const typedArray = new Int32Array([1, 2, 3]);


  typedArray.threshold = 3;

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, typedArray);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithSpread0146() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    ...{ threshold: 3 },
    ...{ min: 1 }
  };

  const result = numbers.filter(function (num) {
    return num > this.threshold && num >= this.min;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithObjectCreate0147() {
  const numbers = [1, 2, 3, 4, 5];

  const prototype = {
    threshold: 3
  };
  const context = Object.create(prototype);

  const result = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithObjectFromEntries0148() {
  const numbers = [1, 2, 3, 4, 5];

  const context = Object.fromEntries([
    ['threshold', 3],
    ['max', 5]
  ]);

  const result = numbers.filter(function (num) {
    return num > this.threshold && num <= this.max;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithMapEntries0149() {
  const numbers = [1, 2, 3, 4, 5];

  const map = new Map([
    ['threshold', 3],
    ['max', 5]
  ]);

  const context = Object.fromEntries(map);

  const result = numbers.filter(function (num) {
    return num > this.threshold && num <= this.max;
  }, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithSetValues0150() {
  const numbers = [1, 2, 3, 4, 5];

  const set = new Set([3, 4, 5]);
  const context = {
    allowedValues: [...set],
    isAllowed: function (num) {
      return this.allowedValues.includes(num);
    }
  };

  const result = numbers.filter(function (num) {
    return this.isAllowed(num);
  }, context);


  return result.length === 3 &&
    result[0] === 3 &&
    result[1] === 4 &&
    result[2] === 5;
}

export function builtinsArrayFilterThisArgWithFunctionProperties0151() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const context = {
    min: 2,
    max: 8,
    isEven: function (num) {
      return num % 2 === 0;
    },
    isInRange: function (num) {
      return num >= this.min && num <= this.max;
    }
  };

  const result = numbers.filter(function (num) {
    return this.isInRange(num) && this.isEven(num);
  }, context);


  return result.length === 3 &&
    result[0] === 2 &&
    result[1] === 4 &&
    result[2] === 6;
}

export function builtinsArrayFilterThisArgWithNestedFunctions0152() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3,
    outerFunction: function () {
      return function (num) {
        return num > this.threshold;
      };
    }
  };

  const filterFn = context.outerFunction();
  const result = numbers.filter(filterFn, context);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithBoundNestedFunction0153() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3,
    getFilterFunction: function () {
      return function (num) {
        return num > this.threshold;
      }.bind(this);
    }
  };

  const filterFn = context.getFilterFunction();
  const result = numbers.filter(filterFn);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithArrowFunctionInMethod0154() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3,
    getFilterFunction: function () {

      return (num) => {
        return num > this.threshold;
      };
    }
  };

  const filterFn = context.getFilterFunction();
  const result = numbers.filter(filterFn);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithDynamicContext0155() {
  const numbers = [1, 2, 3, 4, 5];

  let context = {
    threshold: 3
  };

  const result1 = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);


  context.threshold = 4;
  const result2 = numbers.filter(function (num) {
    return num > this.threshold;
  }, context);

  return result1.length === 2 &&
    result1[0] === 4 &&
    result1[1] === 5 &&
    result2.length === 1 &&
    result2[0] === 5;
}

export function builtinsArrayFilterThisArgWithMultipleFilters0156() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const context = {
    thresholds: [3, 5, 7],
    getFilter: function (index) {
      return function (num) {
        return num > this.thresholds[index];
      };
    }
  };

  const filter1 = context.getFilter(0);
  const filter2 = context.getFilter(1);
  const filter3 = context.getFilter(2);

  const result1 = numbers.filter(filter1, context);
  const result2 = numbers.filter(filter2, context);
  const result3 = numbers.filter(filter3, context);

  return result1.length === 7 &&
    result2.length === 5 &&
    result3.length === 3;
}

export function builtinsArrayFilterThisArgWithGeneratorFunction0157() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3,
    *filterGenerator() {
      for (const num of numbers) {
        if (num > this.threshold) {
          yield num;
        }
      }
    }
  };

  const generator = context.filterGenerator();
  const result = [];
  for (const num of generator) {
    result.push(num);
  }


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithAsyncFunction0158() {
  const numbers = [1, 2, 3, 4, 5];

  const context = {
    threshold: 3,
    async filterAsync() {
      return numbers.filter(function (num) {
        return num > this.threshold;
      }, this);
    }
  };


  return context.filterAsync().then(result => {
    return result.length === 2 &&
      result[0] === 4 &&
      result[1] === 5;
  });
}

export function builtinsArrayFilterThisArgWithStaticMethod0159() {
  class FilterUtils {
    static threshold = 3;

    static filter(num) {
      return num > this.threshold;
    }
  }

  const numbers = [1, 2, 3, 4, 5];
  const result = numbers.filter(FilterUtils.filter, FilterUtils);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}

export function builtinsArrayFilterThisArgWithInstanceMethod0160() {
  class Filterer {
    constructor(threshold) {
      this.threshold = threshold;
    }

    filter(num) {
      return num > this.threshold;
    }
  }

  const filterer = new Filterer(3);
  const numbers = [1, 2, 3, 4, 5];
  const result = numbers.filter(filterer.filter, filterer);


  return result.length === 2 &&
    result[0] === 4 &&
    result[1] === 5;
}