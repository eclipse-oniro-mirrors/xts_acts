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
export function builtinsArrayFindSymbol0300() {
  const sym1 = Symbol('sym1');
  const sym2 = Symbol('sym2');
  const sym3 = Symbol('sym3');
  const arr = [sym1, sym2, sym3];

  const result = arr.find((sym) => sym === sym2);

  return result === sym2;
}

export function builtinsArrayFindDate0301() {
  const date1 = new Date('2023-01-01');
  const date2 = new Date('2023-06-01');
  const date3 = new Date('2023-12-31');
  const arr = [date1, date2, date3];

  const result = arr.find((date) => date.getMonth() === 5);

  return result === date2;
}

export function builtinsArrayFindBoolean0302() {
  const arr = [false, false, true, false];

  const result = arr.find((bool) => bool === true);

  return result === true;
}

export function builtinsArrayFindNull0303() {
  const arr = [1, 2, null, 4, 5];

  const result = arr.find((value) => value === null);

  return result === null;
}

export function builtinsArrayFindUndefined0304() {
  const arr = [1, 2, undefined, 4, 5];

  const result = arr.find((value) => value === undefined);

  return result === undefined;
}

export function builtinsArrayFindNaN0305() {
  const arr = [1, 2, NaN, 4, 5];

  const result = arr.find((value) => Number.isNaN(value));

  return Number.isNaN(result);
}

export function builtinsArrayFindMixedTypes0306() {
  const arr = [1, 'string', true, null, undefined, Symbol('sym'), new Date()];

  const result = arr.find((value) => typeof value === 'string');

  return result === 'string';
}

export function builtinsArrayFindFunction0307() {
  const func1 = () => 'func1';
  const func2 = () => 'func2';
  const func3 = () => 'func3';
  const arr = [func1, func2, func3];

  const result = arr.find((func) => func() === 'func2');

  return result === func2;
}

export function builtinsArrayFindBigInt0308() {
  const arr = [1n, 2n, 3n, 4n, 5n];

  const result = arr.find((num) => num === 3n);

  return result === 3n;
}

export function builtinsArrayFindBigIntComparison0309() {
  const arr = [1n, 2n, 3n, 4n, 5n];

  const result = arr.find((num) => num > 2n);

  return result === 3n;
}

export function builtinsArrayFindRegExp0310() {
  const regex1 = /test/;
  const regex2 = /pattern/;
  const regex3 = /example/;
  const arr = [regex1, regex2, regex3];

  const result = arr.find((regex) => regex.source === 'pattern');

  return result === regex2;
}

export function builtinsArrayFindRegExpWithFlags0311() {
  const regex1 = /test/i;
  const regex2 = /pattern/g;
  const regex3 = /example/m;
  const arr = [regex1, regex2, regex3];

  const result = arr.find((regex) => regex.flags === 'g');

  return result === regex2;
}

export function builtinsArrayFindMap0312() {
  const map1 = new Map([['a', 1]]);
  const map2 = new Map([['b', 2]]);
  const map3 = new Map([['c', 3]]);
  const arr = [map1, map2, map3];

  const result = arr.find((map) => map.get('b') === 2);

  return result === map2;
}

export function builtinsArrayFindMapSize0313() {
  const map1 = new Map();
  const map2 = new Map([['a', 1], ['b', 2]]);
  const map3 = new Map([['c', 3]]);
  const arr = [map1, map2, map3];

  const result = arr.find((map) => map.size === 2);

  return result === map2;
}

export function builtinsArrayFindSet0314() {
  const set1 = new Set([1, 2, 3]);
  const set2 = new Set([4, 5, 6]);
  const set3 = new Set([7, 8, 9]);
  const arr = [set1, set2, set3];

  const result = arr.find((set) => set.has(5));

  return result === set2;
}

export function builtinsArrayFindSetSize0315() {
  const set1 = new Set();
  const set2 = new Set([1, 2]);
  const set3 = new Set([1, 2, 3, 4]);
  const arr = [set1, set2, set3];

  const result = arr.find((set) => set.size === 4);

  return result === set3;
}

export function builtinsArrayFindWeakMap0316() {
  const obj1 = {};
  const obj2 = {};
  const obj3 = {};

  const weakMap1 = new WeakMap();
  weakMap1.set(obj1, 'value1');

  const weakMap2 = new WeakMap();
  weakMap2.set(obj2, 'value2');

  const weakMap3 = new WeakMap();
  weakMap3.set(obj3, 'value3');

  const arr = [weakMap1, weakMap2, weakMap3];

  const result = arr.find((weakMap) => weakMap.has(obj2));

  return result === weakMap2;
}

export function builtinsArrayFindWeakSet0317() {
  const obj1 = {};
  const obj2 = {};
  const obj3 = {};

  const weakSet1 = new WeakSet();
  weakSet1.add(obj1);

  const weakSet2 = new WeakSet();
  weakSet2.add(obj2);

  const weakSet3 = new WeakSet();
  weakSet3.add(obj3);

  const arr = [weakSet1, weakSet2, weakSet3];

  const result = arr.find((weakSet) => weakSet.has(obj3));

  return result === weakSet3;
}

export function builtinsArrayFindPromise0318() {
  const promise1 = Promise.resolve('success');
  const promise2 = Promise.reject('error');
  const promise3 = new Promise((resolve) => setTimeout(resolve, 100, 'delayed'));
  const arr = [promise1, promise2, promise3];

  const result = arr.find((promise) => promise === promise2);

  return result === promise2;
}

export function builtinsArrayFindGenerator0319() {
  function* generator1() {
    yield 1;
    yield 2;
  }

  function* generator2() {
    yield 'a';
    yield 'b';
  }

  function* generator3() {
    yield true;
    yield false;
  }

  const arr = [generator1(), generator2(), generator3()];

  const result = arr.find((gen) => gen.next().value === 'a');

  return result === arr[1];
}

export function builtinsArrayFindProxy0320() {
  const target1 = { name: 'target1' };
  const target2 = { name: 'target2' };
  const target3 = { name: 'target3' };

  const proxy1 = new Proxy(target1, {});
  const proxy2 = new Proxy(target2, {});
  const proxy3 = new Proxy(target3, {});

  const arr = [proxy1, proxy2, proxy3];

  const result = arr.find((proxy) => proxy.name === 'target2');

  return result === proxy2;
}

export function builtinsArrayFindError0321() {
  const error1 = new Error('error1');
  const error2 = new TypeError('type error');
  const error3 = new RangeError('range error');
  const arr = [error1, error2, error3];

  const result = arr.find((error) => error instanceof TypeError);

  return result === error2;
}

export function builtinsArrayFindErrorMessage0322() {
  const error1 = new Error('test error');
  const error2 = new Error('target error');
  const error3 = new Error('other error');
  const arr = [error1, error2, error3];

  const result = arr.find((error) => error.message === 'target error');

  return result === error2;
}

export function builtinsArrayFindNestedArray0323() {
  const arr = [[1, 2], [3, 4], [5, 6]];

  const result = arr.find((nested) => nested.includes(4));

  return result === arr[1];
}

export function builtinsArrayFindDeepNestedArray0324() {
  const arr = [[1, [2, 3]], [4, [5, 6]], [7, [8, 9]]];

  const result = arr.find((nested) => nested[1].includes(6));

  return result === arr[1];
}

export function builtinsArrayFindArrayLike0325() {
  const arrayLike1 = { 0: 1, 1: 2, length: 2 };
  const arrayLike2 = { 0: 3, 1: 4, length: 2 };
  const arrayLike3 = { 0: 5, 1: 6, length: 2 };
  const arr = [arrayLike1, arrayLike2, arrayLike3];

  const result = arr.find((like) => like[0] === 3);

  return result === arrayLike2;
}

export function builtinsArrayFindCircularReference0326() {
  const arr = [1, 2, 3];
  arr[3] = arr;

  const result = arr.find((value) => value === arr);

  return result === arr;
}

export function builtinsArrayFindMathObject0327() {
  const arr = [Math, Math.PI, Math.abs, Math.sqrt];

  const result = arr.find((value) => value === Math.PI);

  return result === Math.PI;
}

export function builtinsArrayFindJSONObject0328() {
  const arr = [JSON, JSON.parse, JSON.stringify, JSON.stringify.bind(JSON)];

  const result = arr.find((value) => value === JSON.parse);

  return result === JSON.parse;
}


export function builtinsArrayFindSymbolDescription0330() {
  const sym1 = Symbol('description1');
  const sym2 = Symbol('description2');
  const sym3 = Symbol('description3');
  const arr = [sym1, sym2, sym3];

  const result = arr.find((sym) => sym.description === 'description2');

  return result === sym2;
}

export function builtinsArrayFindSymbolFor0331() {
  const sym1 = Symbol.for('key1');
  const sym2 = Symbol.for('key2');
  const sym3 = Symbol.for('key3');
  const arr = [sym1, sym2, sym3];

  const result = arr.find((sym) => sym === Symbol.for('key2'));

  return result === sym2;
}

export function builtinsArrayFindDateComparison0332() {
  const date1 = new Date('2023-01-01');
  const date2 = new Date('2023-06-01');
  const date3 = new Date('2023-12-31');
  const arr = [date1, date2, date3];

  const result = arr.find((date) => date > new Date('2023-03-01'));

  return result === date2;
}

export function builtinsArrayFindDateYear0333() {
  const date1 = new Date('2022-01-01');
  const date2 = new Date('2023-01-01');
  const date3 = new Date('2024-01-01');
  const arr = [date1, date2, date3];

  const result = arr.find((date) => date.getFullYear() === 2023);

  return result === date2;
}

export function builtinsArrayFindBooleanTruthy0334() {
  const arr = [false, 0, '', null, undefined, NaN, true, 1, 'string'];

  const result = arr.find((value) => value);

  return result === true;
}

export function builtinsArrayFindBooleanFalsy0335() {
  const arr = [true, 1, 'string', false, 0, '', null, undefined, NaN];

  const result = arr.find((value) => !value);

  return result === false;
}

export function builtinsArrayFindNullInMixed0336() {
  const arr = [1, 'string', true, null, undefined, 0, ''];

  const result = arr.find((value) => value === null);

  return result === null;
}

export function builtinsArrayFindUndefinedInMixed0337() {
  const arr = [1, 'string', true, null, undefined, 0, ''];

  const result = arr.find((value) => value === undefined);

  return result === undefined;
}

export function builtinsArrayFindNaNInMixed0338() {
  const arr = [1, 'string', true, null, undefined, NaN, 0, ''];

  const result = arr.find((value) => Number.isNaN(value));

  return Number.isNaN(result);
}

export function builtinsArrayFindFunctionWithArgs0339() {
  const func1 = (x) => x + 1;
  const func2 = (x) => x * 2;
  const func3 = (x) => x - 1;
  const arr = [func1, func2, func3];

  const result = arr.find((func) => func(5) === 10);

  return result === func2;
}
export function builtinsArrayFindModifyWithTypedArray0239() {
  const typedArray = new Int32Array([1, 2, 3, 4, 5]);
  const arr = Array.from(typedArray);
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 20;
      array.push(6, 7);
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

export function builtinsArrayFindModifyWithArrayLike0240() {
  const arrayLike = {
    0: 1,
    1: 2,
    2: 3,
    3: 4,
    4: 5,
    length: 5
  };
  const arr = Array.from(arrayLike);
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 20;
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
    arr[1] === 20 &&
    arr[2] === 4 &&
    arr[3] === 5;
}

export function builtinsArrayFindModifyWithSpread0241() {
  const arr = [...[1, 2, 3, 4, 5]];
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 20;
      array.push(...[6, 7, 8]);
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

export function builtinsArrayFindModifyWithFrom0242() {
  const arr = Array.from({ length: 5 }, (_, i) => i + 1);
  const visited = [];

  const result = arr.find((num, index, array) => {
    visited.push(num);
    if (index === 1) {
      array[1] = 20;
      array.splice(2, 0, ...[2.1, 2.2, 2.3]);
    }
    return num > 3;
  });

  return visited.length === 5 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 2.1 &&
    visited[3] === 2.2 &&
    visited[4] === 2.3 &&
    result === undefined &&
    arr.length === 8 &&
    arr[1] === 20 &&
    arr[2] === 2.1 &&
    arr[3] === 2.2 &&
    arr[4] === 2.3 &&
    arr[5] === 3;
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
    return num > 3;
  });

  return visited.length === 3 &&
    visited[0] === 1 &&
    visited[1] === 2 &&
    visited[2] === 20 &&
    result === 20 &&
    arr.length === 6 &&
    arr[0] === 0 &&
    arr[2] === 20;
}



export function builtinsArrayFindFunctionLength0340() {
  const func1 = () => { };
  const func2 = (a, b) => { };
  const func3 = (a, b, c) => { };
  const arr = [func1, func2, func3];

  const result = arr.find((func) => func.length === 2);

  return result === func2;
}

export function builtinsArrayFindBigIntOverflow0341() {
  const arr = [Number.MAX_SAFE_INTEGER, BigInt(Number.MAX_SAFE_INTEGER), BigInt(Number.MAX_SAFE_INTEGER) + 1n];

  const result = arr.find((value) => typeof value === 'bigint');

  return typeof result === 'bigint';
}

export function builtinsArrayFindRegExpMatch0342() {
  const regex1 = /test/;
  const regex2 = /pattern/;
  const regex3 = /example/;
  const arr = [regex1, regex2, regex3];

  const result = arr.find((regex) => regex.test('pattern test'));

  return result === regex1 || result === regex2;
}

export function builtinsArrayFindMapHasKey0343() {
  const map1 = new Map([['a', 1], ['b', 2]]);
  const map2 = new Map([['c', 3], ['d', 4]]);
  const map3 = new Map([['e', 5], ['f', 6]]);
  const arr = [map1, map2, map3];

  const result = arr.find((map) => map.has('d'));

  return result === map2;
}

export function builtinsArrayFindSetHasValue0344() {
  const set1 = new Set([1, 2, 3]);
  const set2 = new Set([4, 5, 6]);
  const set3 = new Set([7, 8, 9]);
  const arr = [set1, set2, set3];

  const result = arr.find((set) => set.has(7));

  return result === set3;
}

export function builtinsArrayFindNestedObject0345() {
  const obj1 = { nested: { value: 1 } };
  const obj2 = { nested: { value: 2 } };
  const obj3 = { nested: { value: 3 } };
  const arr = [obj1, obj2, obj3];

  const result = arr.find((obj) => obj.nested.value === 2);

  return result === obj2;
}

export function builtinsArrayFindDeepNestedObject0346() {
  const obj1 = { level1: { level2: { value: 1 } } };
  const obj2 = { level1: { level2: { value: 2 } } };
  const obj3 = { level1: { level2: { value: 3 } } };
  const arr = [obj1, obj2, obj3];

  const result = arr.find((obj) => obj.level1.level2.value === 3);

  return result === obj3;
}

export function builtinsArrayFindArrayWithObjects0347() {
  const arr = [
    { id: 1, name: 'item1' },
    { id: 2, name: 'item2' },
    { id: 3, name: 'item3' }
  ];

  const result = arr.find((item) => item.id === 2);

  return result === arr[1];
}






export function builtinsArrayFindArrayWithArrays0348() {
  const arr = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  const result = arr.find((subarr) => subarr[1] === 5);

  return result === arr[1];
}

export function builtinsArrayFindMixedComplexTypes0349() {
  const arr = [
    { type: 'object', value: { a: 1 } },
    { type: 'array', value: [1, 2, 3] },
    { type: 'function', value: () => 'test' },
    { type: 'symbol', value: Symbol('test') },
    { type: 'date', value: new Date() }
  ];

  const result = arr.find((item) => item.type === 'function');

  return result === arr[2];
}

export function builtinsArrayFindEmptyValues0350() {
  const arr = [null, undefined, '', 0, false, NaN];

  const result = arr.find((value) => value === '');

  return result === '';
}









export function builtinsArrayFindGlobalObject0329() {
  const arr = [
    globalThis,
    ...(typeof window !== 'undefined' ? [window] : []),
    ...(typeof document !== 'undefined' ? [document] : []),
    ...(typeof navigator !== 'undefined' ? [navigator] : [])
  ];

  const result = arr.find((value) => value === globalThis);

  return result === globalThis;
}

export function builtinsArrayFindTruthyValues0351() {
  const arr = [1, 'string', true, {}, [], () => { }];

  const result = arr.find((value) => Array.isArray(value));

  return Array.isArray(result) && result === arr[4];
}

export function builtinsArrayFindFalsyValues0352() {
  const arr = [1, 'string', true, null, undefined, 0, false, NaN];

  const result = arr.find((value) => value === 0);

  return result === 0;
}

export function builtinsArrayFindWithCustomObject0353() {
  class Person {
    constructor(name, age) {
      this.name = name;
      this.age = age;
    }
  }

  const person1 = new Person('Alice', 25);
  const person2 = new Person('Bob', 30);
  const person3 = new Person('Charlie', 35);
  const arr = [person1, person2, person3];

  const result = arr.find((person) => person.age === 30);

  return result === person2;
}

export function builtinsArrayFindWithClassInstance0354() {
  class Animal {
    constructor(name, type) {
      this.name = name;
      this.type = type;
    }
  }

  const animal1 = new Animal('Dog', 'Mammal');
  const animal2 = new Animal('Cat', 'Mammal');
  const animal3 = new Animal('Bird', 'Avian');
  const arr = [animal1, animal2, animal3];

  const result = arr.find((animal) => animal.type === 'Avian');

  return result === animal3;
}

export function builtinsArrayFindWithAsyncFunction0366() {
  const asyncFunc1 = async () => 'result1';
  const asyncFunc2 = async () => 'result2';
  const asyncFunc3 = async () => 'result3';
  const arr = [asyncFunc1, asyncFunc2, asyncFunc3];

  const result = arr.find((func) => func.name === asyncFunc2.name);

  return result === asyncFunc2;
}

export function builtinsArrayFindWithArrowFunction0367() {
  const arrow1 = () => 'arrow1';
  const arrow2 = () => 'arrow2';
  const arrow3 = () => 'arrow3';
  const arr = [arrow1, arrow2, arrow3];

  const result = arr.find((func) => func() === 'arrow2');

  return result === arrow2;
}

export function builtinsArrayFindWithFunctionExpression0368() {
  const func1 = function () { return 'func1'; };
  const func2 = function () { return 'func2'; };
  const func3 = function () { return 'func3'; };
  const arr = [func1, func2, func3];

  const result = arr.find((func) => func() === 'func2');

  return result === func2;
}

export function builtinsArrayFindWithGeneratorFunction0369() {
  function* gen1() { yield 1; }
  function* gen2() { yield 2; }
  function* gen3() { yield 3; }
  const arr = [gen1, gen2, gen3];

  const result = arr.find((func) => func().next().value === 2);

  return result === gen2;
}

export function builtinsArrayFindWithAsyncGeneratorFunction0370() {
  async function* asyncGen1() { yield 1; }
  async function* asyncGen2() { yield 2; }
  async function* asyncGen3() { yield 3; }
  const arr = [asyncGen1, asyncGen2, asyncGen3];

  const result = arr.find((func) => func.name === asyncGen2.name);

  return result === asyncGen2;
}

export function builtinsArrayFindWithConstructorFunction0371() {
  function Constructor1() { this.type = 'type1'; }
  function Constructor2() { this.type = 'type2'; }
  function Constructor3() { this.type = 'type3'; }
  const arr = [Constructor1, Constructor2, Constructor3];

  const result = arr.find((func) => new func().type === 'type2');

  return result === Constructor2;
}

export function builtinsArrayFindWithMethod0372() {
  const obj = {
    method1() { return 'method1'; },
    method2() { return 'method2'; },
    method3() { return 'method3'; }
  };
  const arr = [obj.method1, obj.method2, obj.method3];

  const result = arr.find((method) => method.call(obj) === 'method2');

  return result === obj.method2;
}

export function builtinsArrayFindWithGetter0373() {
  const obj = {
    get prop1() { return 'prop1'; },
    get prop2() { return 'prop2'; },
    get prop3() { return 'prop3'; }
  };
  const arr = [obj.prop1, obj.prop2, obj.prop3];

  const result = arr.find((prop) => prop === 'prop2');

  return result === 'prop2';
}

export function builtinsArrayFindWithSetter0374() {
  let value = '';
  const obj = {
    set prop1(val) { value = 'prop1: ' + val; },
    set prop2(val) { value = 'prop2: ' + val; },
    set prop3(val) { value = 'prop3: ' + val; }
  };
  const arr = [obj.prop1, obj.prop2, obj.prop3];

  const result = arr.find((setter, index) => index === 1);

  return result === arr[1];
}

export function builtinsArrayFindWithStaticMethod0375() {
  class MyClass {
    static staticMethod1() { return 'static1'; }
    static staticMethod2() { return 'static2'; }
    static staticMethod3() { return 'static3'; }
  }
  const arr = [MyClass.staticMethod1, MyClass.staticMethod2, MyClass.staticMethod3];

  const result = arr.find((method) => method() === 'static2');

  return result === MyClass.staticMethod2;
}

export function builtinsArrayFindWithPrototypeMethod0376() {
  class MyClass {
    method1() { return 'method1'; }
    method2() { return 'method2'; }
    method3() { return 'method3'; }
  }
  const obj = new MyClass();
  const arr = [obj.method1, obj.method2, obj.method3];

  const result = arr.find((method) => method.call(obj) === 'method2');

  return result === obj.method2;
}

export function builtinsArrayFindWithBoundFunction0377() {
  const obj = { value: 10 };
  function add(x) { return this.value + x; }
  const bound1 = add.bind({ value: 1 });
  const bound2 = add.bind(obj);
  const bound3 = add.bind({ value: 20 });
  const arr = [bound1, bound2, bound3];

  const result = arr.find((func) => func(5) === 15);

  return result === bound2;
}

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
      return curried.apply(this, args.concat(moreArgs));
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
 * @param {number} delay - Delay in milliseconds
 * @returns {Function} Throttled function
 */
function throttle(fn, delay) {
  let lastCall = 0;
  return function (...args) {
    const now = Date.now();
    if (now - lastCall >= delay) {
      lastCall = now;
      return fn.apply(this, args);
    }
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
  };
}

/**
 * Compose multiple functions
 * @param {...Function} fns - Functions to compose
 * @returns {Function} Composed function
 */
function compose(...fns) {
  return function (...args) {
    return fns.reduceRight((acc, fn) => fn(acc), args);
  };
}

/**
 * Create a partially applied function
 * @param {Function} fn - Function to apply partially
 * @param {...any} partialArgs - Partial arguments
 * @returns {Function} Partially applied function
 */
function partial(fn, ...partialArgs) {
  return function (...args) {
    return fn.apply(this, [...partialArgs, ...args]);
  };
}

export function builtinsArrayFindWithCurriedFunction0378() {
  const add = (a, b) => a + b;
  const curriedAdd = curry(add);
  const add5 = curriedAdd(5);
  const add10 = curriedAdd(10);
  const add15 = curriedAdd(15);
  const arr = [add5, add10, add15];

  const result = arr.find((func) => func(5) === 15);

  return result === add10;
}

export function builtinsArrayFindWithMemoizedFunction0379() {
  const fib = (n) => n <= 1 ? n : fib(n - 1) + fib(n - 2);
  const memoizedFib = memoize(fib);
  const func1 = memoizedFib;
  const func2 = (n) => n * 2;
  const func3 = (n) => n * 3;
  const arr = [func1, func2, func3];

  const result = arr.find((func) => func(5) === 10);

  return result === func2;
}

export function builtinsArrayFindWithThrottledFunction0380() {
  const log = (message) => message;
  const throttledLog1 = throttle(log, 100);
  const throttledLog2 = throttle(log, 200);
  const throttledLog3 = throttle(log, 300);
  const arr = [throttledLog1, throttledLog2, throttledLog3];

  const result = arr.find((func, index) => index === 1);

  return result === throttledLog2;
}

export function builtinsArrayFindWithDebouncedFunction0381() {
  const log = (message) => message;
  const debouncedLog1 = debounce(log, 100);
  const debouncedLog2 = debounce(log, 200);
  const debouncedLog3 = debounce(log, 300);
  const arr = [debouncedLog1, debouncedLog2, debouncedLog3];

  const result = arr.find((func, index) => index === 1);

  return result === debouncedLog2;
}

export function builtinsArrayFindWithComposedFunction0382() {
  const double = (x) => x * 2;
  const add5 = (x) => x + 5;
  const square = (x) => x * x;

  const composed1 = compose(square, double);
  const composed2 = compose(square, add5);
  const composed3 = compose(double, add5);
  const arr = [composed1, composed2, composed3];

  const result = arr.find((func) => func(5) === 100);

  return result === composed1;
}

export function builtinsArrayFindWithPartialAppliedFunction0383() {
  const add = (a, b, c) => a + b + c;
  const add10 = partial(add, 10);
  const add20 = partial(add, 20);
  const add30 = partial(add, 30);
  const arr = [add10, add20, add30];

  const result = arr.find((func) => func(5, 5) === 30);

  return result === add20;
}

export function builtinsArrayFindWithRecursiveFunction0384() {
  function factorial(n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  function fibonacci(n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  function sum(n) {
    if (n <= 0) return 0;
    return n + sum(n - 1);
  }

  const arr = [factorial, fibonacci, sum];

  const result = arr.find((func) => func(5) === 15);

  return result === sum;
}

export function builtinsArrayFindWithAnonymousFunction0385() {
  const arr = [
    function () { return 'anon1'; },
    function () { return 'anon2'; },
    function () { return 'anon3'; }
  ];

  const result = arr.find((func) => func() === 'anon2');

  return result === arr[1];
}

export function builtinsArrayFindWithNamedFunctionExpression0386() {
  const arr = [
    function named1() { return 'named1'; },
    function named2() { return 'named2'; },
    function named3() { return 'named3'; }
  ];

  const result = arr.find((func) => func.name === 'named2');

  return result === arr[1];
}

export function builtinsArrayFindWithArrowFunctionWithParams0387() {
  const arr = [
    (x) => x + 1,
    (x) => x * 2,
    (x) => x - 1
  ];

  const result = arr.find((func) => func(5) === 10);

  return result === arr[1];
}

export function builtinsArrayFindWithArrowFunctionWithRestParams0388() {
  const arr = [
    (...args) => args.reduce((a, b) => a + b, 0),
    (...args) => args.reduce((a, b) => a * b, 1),
    (...args) => args.length
  ];

  const result = arr.find((func) => func(2, 3, 4) === 24);

  return result === arr[1];
}

export function builtinsArrayFindWithArrowFunctionWithDefaultParams0389() {
  const arr = [
    (x = 1) => x + 1,
    (x = 1) => x * 2,
    (x = 1) => x - 1
  ];

  const result = arr.find((func) => func(3) === 6);

  return result === arr[1];
}

export function builtinsArrayFindWithArrowFunctionWithDestructuring0390() {
  const arr = [
    ({ x, y }) => x + y,
    ({ x, y }) => x * y,
    ({ x, y }) => x - y
  ];

  const result = arr.find((func) => func({ x: 2, y: 3 }) === 6);

  return result === arr[1];
}

export function builtinsArrayFindWithArrowFunctionWithSpread0391() {
  const arr = [
    (x, ...rest) => x + rest.reduce((a, b) => a + b, 0),
    (x, ...rest) => x * rest.reduce((a, b) => a * b, 1),
    (x, ...rest) => rest.length
  ];

  const result = arr.find((func) => func(2, 3, 4) === 24);

  return result === arr[1];
}

export function builtinsArrayFindWithArrowFunctionWithThis0392() {
  const context = { value: 10 };
  const arr = [
    function () { return this.value + 1; },
    function () { return this.value * 2; },
    function () { return this.value - 1; }
  ];

  const result = arr.find((func) => func.call(context) === 20);

  return result === arr[1];
}

export function builtinsArrayFindWithAsyncArrowFunction0393() {
  const arr = [
    async () => 'async1',
    async () => 'async2',
    async () => 'async3'
  ];

  const result = arr.find((func, index) => index === 1);

  return result === arr[1];
}

export function builtinsArrayFindWithGeneratorArrowFunction0394() {
  const arr = [
    function* () { yield 'gen1'; },
    function* () { yield 'gen2'; },
    function* () { yield 'gen3'; }
  ];

  const result = arr.find((func) => func().next().value === 'gen2');

  return result === arr[1];
}

export function builtinsArrayFindWithAsyncGeneratorArrowFunction0395() {
  const arr = [
    async function* () { yield 'asyncGen1'; },
    async function* () { yield 'asyncGen2'; },
    async function* () { yield 'asyncGen3'; }
  ];

  const result = arr.find((func, index) => index === 1);

  return result === arr[1];
}