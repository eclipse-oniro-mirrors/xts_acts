'use static'

export function testWeakSetConstructor1() {
  let TAG = 'testWeakSetConstructor1'
  try {
    const ws = new WeakSet<number>();
    const str = ws != undefined && ws != null
    if (!str) {
      throw new Error(`${TAG} WeakSet constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

interface GeneratedObjectLiteralInterface_1 {}

export function testWeakSetAdd1() {
  let TAG = 'testWeakSetAdd1'
  try {
    const weakset = new WeakSet<GeneratedObjectLiteralInterface_1>();
    const interfaceObject: GeneratedObjectLiteralInterface_1 = {};
    let res = weakset.add(interfaceObject);
    const str = res != undefined && res != null
    if (!str) {
      throw new Error(`${TAG} WeakSet add method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakSetHas1() {
  let TAG = 'testWeakSetHas1'
  try {
    const weakset = new WeakSet<GeneratedObjectLiteralInterface_1>();
    const interfaceObject: GeneratedObjectLiteralInterface_1 = {};
    weakset.add(interfaceObject);
    let res = weakset.has(interfaceObject);
    if (!res) {
      throw new Error(`${TAG} WeakSet has method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakSetDelete1() {
  let TAG = 'testWeakSetDelete1'
  try {
    const weakset = new WeakSet<GeneratedObjectLiteralInterface_1>();
    const interfaceObject: GeneratedObjectLiteralInterface_1 = {};
    weakset.add(interfaceObject);
    weakset.delete(interfaceObject);
    let res = weakset.has(interfaceObject);
    if (res) {
      throw new Error(`${TAG} WeakSet delete method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakRefConstructor1() {
  let TAG = 'testWeakRefConstructor1'
  try {
    let ret = new WeakRef<Object>(new Object());
    if (ret.deref === undefined) {
      throw new Error(`${TAG} WeakRef constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakRefDeref() {
  let TAG = 'testWeakRefDeref'
  try {
    let ret = new WeakRef<Object>(new Object());
    let res = ret.deref();
    const str = res != undefined && res != null
    if (!str) {
      throw new Error(`${TAG} WeakRef deref method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakMapSetGet1() {
  let TAG = 'testWeakMapSetGet1'
  try {
    let weakMap: WeakMap<object, number> = new WeakMap<object, number>();
    let a = new Object();
    weakMap.set(a, 123);
    let value = weakMap.get(a);
    if (value !== 123) {
      throw new Error(`${TAG} WeakMap set/get failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakMapSymbolIterator() {
  let TAG = 'testWeakMapSymbolIterator'
  try {
    let arr = [1, 2, 3];
    let iterator = arr.$_iterator();
    if (iterator.next().value !== 1 || iterator.next().value !== 2 ||
      iterator.next().value !== 3 || !iterator.next().done) {
      throw new Error(`${TAG} Symbol.iterator failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakMapDelete1() {
  let TAG = 'testWeakMapDelete1'
  try {
    const weakMap1 = new WeakMap<Object, number>();
    let a = new Object();
    weakMap1.set(a, 1);
    if (!weakMap1.delete(a)) {
      throw new Error(`${TAG} WeakMap delete failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


interface GeneratedObjectLiteralInterface_4 {}

export function testWeakMapGet1() {
  let TAG = 'testWeakMapGet1'
  try {
    let weakMap = new WeakMap<object, string>();


    let key: GeneratedObjectLiteralInterface_4 = {}
    let value = weakMap.get(key);
    if (value !== undefined) {
      throw new Error(`${TAG} WeakMap get should return undefined`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakMapHas1() {
  let TAG = 'testWeakMapHas1'
  try {
    let weakMap: WeakMap<object, string> = new WeakMap<object, string>();
    let key: object[] = [];
    if (weakMap.has(key)) {
      throw new Error(`${TAG} WeakMap has should return false`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testWeakMapSet1() {
  let TAG = 'testWeakMapSet1'
  try {
    const weakMap1: WeakMap<object, String> = new WeakMap<object, String>();

    let object1: GeneratedObjectLiteralInterface_4 = {};
    weakMap1.set(object1, 'foo');
    if (weakMap1.get(object1) !== 'foo') {
      throw new Error(`${TAG} WeakMap set/get failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testSetAdd1() {
  let TAG = 'testSetAdd1'
  try {
    const odds = new Set<string>(['a', 'b']);
    let value = odds.add('c');
    const result = value.has('c');
    if (!result) {
      throw new Error(`${TAG} Set add failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testSetClear1() {
  let TAG = 'testSetClear1'
  try {
    const odds = new Set<int>([1, 2, 3, 4]);
    odds.clear();
    let value = odds.size;
    if (value !== 0) {
      throw new Error(`${TAG} Set clear failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testSetDelete1() {
  let TAG = 'testSetDelete1'
  try {
    const odds = new Set<int>([1, 2, 3]);
    const deleteResult = odds.delete(3);
    const sizeResult = odds.size;
    if (!deleteResult || sizeResult !== 2) {
      throw new Error(`${TAG} Set delete failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testSetEntries1() {
  let TAG = 'testSetEntries1'
  try {
    const odds = new Set<int>([1, 3, 5, 7, 9]);
    let set = odds.entries();
    const value1 = JSON.stringify(set.next().value);
    const value2 = JSON.stringify(set.next().value);
    const value3 = JSON.stringify(set.next().value);
    if (value1 !== '[1,1]' || value2 !== '[3,3]' || value3 !== '[5,5]') {
      throw new Error(`${TAG} Set entries failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testSetHas1() {
  let TAG = 'testSetHas1'
  try {
    const set1 = new Set<int>([1, 2, 3]);
    let value = set1.has(2);
    if (!value) {
      throw new Error(`${TAG} Set has failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testSetKeys1() {
  let TAG = 'testSetKeys1'
  try {
    let mySet = new Set<string>(['apple', 'banana', 'cat']);
    let setIter = mySet.keys();
    let value1 = setIter.next();
    let value2 = setIter.next();
    let value3 = setIter.next();
    const result1 = JSON.stringify(value1);
    const result2 = JSON.stringify(value2);
    const result3 = JSON.stringify(value3);
    if (result1 !== '{"value":"apple","done":false}' ||
      result2 !== '{"value":"banana","done":false}' ||
      result3 !== '{"value":"cat","done":false}') {
      throw new Error(`${TAG} Set keys failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpExec1() {
  let TAG = 'testRegExpExec1'
  try {
    const regex1 = new RegExp('foo*', 'g');
    const str1 = 'table football, foosball';
    let array1: RegExpExecArray | null;
    let foundCount: int = 0;
    while ((array1 = regex1.exec(str1)) !== null) {
      foundCount++;
      if (foundCount > 2) {
        break; // 防止无限循环
      }
    }
    if (foundCount !== 2) {
      throw new Error(`${TAG} RegExp exec failed, expected 2 matches, got ${foundCount}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpExecWithGroups1() {
  let TAG = 'testRegExpExecWithGroups1'
  try {
    const re: RegExp = new RegExp("quick\\s(?<color>brown).+?(jumps)", "gi");
    const result: RegExpExecArray | null = re.exec('The Quick Brown Fox Jumps Over The Lazy Dog');
    if (!result || result[0] !== 'Quick Brown Fox Jumps') {
      throw new Error(`${TAG} RegExp exec with groups failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpExecWithCapture1() {
  let TAG = 'testRegExpExecWithCapture1'
  try {
    const matches = new RegExp("(hello \\S+)").exec('This is a hello world!');
    if (!matches || matches[1] !== 'hello world!') {
      throw new Error(`${TAG} RegExp exec with capture failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpTest1() {
  let TAG = 'testRegExpTest1'
  try {
    const str = 'table football';
    const regex = new RegExp('foo*');
    const result = regex.test(str);
    if (!result) {
      throw new Error(`${TAG} RegExp test failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpTestGlobal1() {
  let TAG = 'testRegExpTestGlobal1'
  try {
    const regex = new RegExp("foo", "g");
    const test1 = regex.test('foo');
    const test2 = regex.test('foo');
    const test3 = regex.test('barfoo');
    if (!test1 || test2 || !test3) {
      throw new Error(`${TAG} RegExp global test failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpToString1() {
  let TAG = 'testRegExpToString1'
  try {
    const regex = new RegExp('a+b+c');
    const result = regex.toString();
    if (result !== '/a+b+c/') {
      throw new Error(`${TAG} RegExp toString failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpToStringWithFlags1() {
  let TAG = 'testRegExpToStringWithFlags1'
  try {
    const regex = new RegExp('bar', 'g');
    const result = regex.toString();
    if (result !== '/bar/g') {
      throw new Error(`${TAG} RegExp toString with flags failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testPromiseResolve1() {
  let TAG = 'testPromiseResolve1'
  try {
    let array: string[] = [];
    const p: Promise<string> = new Promise<string>((resolve, reject) => {
      resolve('resolve');
      array.push('resolve result : success')
    });
    if (array[0] !== 'resolve result : success') {
      throw new Error(`${TAG} Promise resolve failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testPromiseReject1() {
  let TAG = 'testPromiseReject1'
  try {
    let array: string[] = [];
    const p: Promise<string> = new Promise<string>((resolve, reject) => {
      reject(Error('reject'));
      array.push('reject result : success')
    });
    if (array[0] !== 'reject result : success') {
      throw new Error(`${TAG} Promise reject failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testPromiseConstructor1() {
  let TAG = 'testPromiseConstructor1'
  try {
    const p1: Promise<string> = new Promise<string>((resolve, reject) => {
      resolve('test');
    });

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testPromiseStaticResolve1() {
  let TAG = 'testPromiseStaticResolve1'
  try {
    const p = Promise.resolve('test');

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testPromiseStaticReject1() {
  let TAG = 'testPromiseStaticReject1'
  try {
    const p = Promise.reject(Error('error'));

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testPromiseAll1() {
  let TAG = 'testPromiseAll1'
  try {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(2);
    const p3 = Promise.resolve(3);

    const allPromise = Promise.all([p1, p2, p3]);

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testPromiseRace1() {
  let TAG = 'testPromiseRace1'
  try {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(2);

    const racePromise = Promise.race([p1, p2]);
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

interface GeneratedObjectLiteralInterface_8 {}


export function testObjectConstructor1() {
  let TAG = 'testObjectConstructor1'
  try {
    const obj = new Object();
    if (typeof obj !== 'object') {
      throw new Error(`${TAG} Object constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

interface GeneratedObjectLiteralInterface_6 {
  a: string;
  b: number;
}


export function testObjectGetOwnPropertyNames1() {
  let TAG = 'testObjectGetOwnPropertyNames1'
  try {
    const object1: GeneratedObjectLiteralInterface_6 = {
      a: 'somestring',
      b: 42,
    };
    let value = Object.keys(object1);
    const resultStr = JSON.stringify(value);
    if (resultStr !== '["a","b"]') {
      throw new Error(`${TAG} Object.getOwnPropertyNames failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberToExponential1() {
  let TAG = 'testNumberToExponential1'
  try {
    const num: number = 123456;
    const result = num.toExponential(2);
    if (result !== '1.23e+5') {
      throw new Error(`${TAG} toExponential failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberToFixed1() {
  let TAG = 'testNumberToFixed1'
  try {
    const num = 2.34;
    const result = num.toFixed(1);
    if (result !== '2.3') {
      throw new Error(`${TAG} toFixed failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberToPrecision1() {
  let TAG = 'testNumberToPrecision1'
  try {
    const num = 123.456;
    const result = num.toPrecision(4);
    if (result !== '123.5') {
      throw new Error(`${TAG} toPrecision failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberToString1() {
  let TAG = 'testNumberToString1'
  try {
    const num: int = 233;
    const result = num.toString(16);
    if (result !== 'e9') {
      throw new Error(`${TAG} toString failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberValueOf1() {
  let TAG = 'testNumberValueOf1'
  try {
    const num = new Number(42);
    const result = num.valueOf();
    if (result !== 42) {
      throw new Error(`${TAG} valueOf failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberIsFinite1() {
  let TAG = 'testNumberIsFinite1'
  try {
    const result1 = Number.isFinite(42);
    const result2 = Number.isFinite(Infinity);
    if (!result1 || result2) {
      throw new Error(`${TAG} isFinite failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberIsInteger1() {
  let TAG = 'testNumberIsInteger1'
  try {
    const result1 = Number.isInteger(42);
    const result2 = Number.isInteger(42.5);
    if (!result1 || result2) {
      throw new Error(`${TAG} isInteger failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testNumberIsNaN1() {
  let TAG = 'testNumberIsNaN1'
  try {
    const result1 = Number.isNaN(NaN);
    const result2 = Number.isNaN(42);
    if (!result1 || result2) {
      throw new Error(`${TAG} isNaN failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


interface GeneratedObjectLiteralInterface_7 {
  name: string;
  age: number;
}

export function testJsonParse1() {
  let TAG = 'testJsonParse1'
  try {
    const jsonText = '{"name":"John","age":30}';
    const result =
      JSON.parse<GeneratedObjectLiteralInterface_7>(jsonText, Type.from<GeneratedObjectLiteralInterface_7>());
    if (result?.name !== 'John' || result?.age !== 30) {
      throw new Error(`${TAG} JSON.parse failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testJsonStringify1() {
  let TAG = 'testJsonStringify1'
  try {
    const obj: GeneratedObjectLiteralInterface_7 = { name: 'John', age: 30 };
    const result = JSON.stringify(obj);
    if (result !== '{"name":"John","age":30}') {
      throw new Error(`${TAG} JSON.stringify failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapSet1() {
  let TAG = 'testMapSet1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    if (map.get('key1') !== 'value1') {
      throw new Error(`${TAG} Map.set failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapGet1() {
  let TAG = 'testMapGet1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    const result = map.get('key1');
    if (result !== 'value1') {
      throw new Error(`${TAG} Map.get failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapHas1() {
  let TAG = 'testMapHas1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    if (!map.has('key1')) {
      throw new Error(`${TAG} Map.has failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapDelete1() {
  let TAG = 'testMapDelete1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    map.delete('key1');
    if (map.has('key1')) {
      throw new Error(`${TAG} Map.delete failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapClear1() {
  let TAG = 'testMapClear1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    map.set('key2', 'value2');
    map.clear();
    if (map.size !== 0) {
      throw new Error(`${TAG} Map.clear failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapSize1() {
  let TAG = 'testMapSize1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    map.set('key2', 'value2');
    if (map.size !== 2) {
      throw new Error(`${TAG} Map.size failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapEntries1() {
  let TAG = 'testMapEntries1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    const entries = map.entries();
    const firstEntry: [string, string] | undefined = entries.next().value;
    if (firstEntry?.[0] !== 'key1' || firstEntry?.[1] !== 'value1') {
      throw new Error(`${TAG} Map.entries failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testMapKeys1() {
  let TAG = 'testMapKeys1'
  try {
    const map = new Map<string, string>();
    map.set('key1', 'value1');
    const keys = map.keys();
    const firstKey: string | undefined = keys.next().value;
    if (firstKey !== 'key1') {
      throw new Error(`${TAG} Map.keys failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleConstructor1() {
  let TAG = 'testLocaleConstructor1'
  try {
    const locale = new Intl.Locale('en-US');
    if (locale.language !== 'en') {
      throw new Error(`${TAG} Locale constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleToString1() {
  let TAG = 'testLocaleToString1'
  try {
    const locale = new Intl.Locale('fr-Latn-FR', {
      hourCycle: 'h11', calendar: 'gregory'
    });
    const result = locale.toString();
    if (result !== 'fr-Latn-FR-u-ca-gregory-hc-h11') {
      throw new Error(`${TAG} Locale toString failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleBaseName1() {
  let TAG = 'testLocaleBaseName1'
  try {
    const locale = new Intl.Locale('fr-Latn-FR', {
      hourCycle: 'h11', calendar: 'gregory'
    });
    if (locale.baseName !== 'fr-Latn-FR') {
      throw new Error(`${TAG} Locale baseName failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleLanguage1() {
  let TAG = 'testLocaleLanguage1'
  try {
    const locale = new Intl.Locale('en-Latn-US');
    if (locale.language !== 'en') {
      throw new Error(`${TAG} Locale language failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleRegion1() {
  let TAG = 'testLocaleRegion1'
  try {
    const locale = new Intl.Locale('en-Latn-US');
    if (locale.region !== 'US') {
      throw new Error(`${TAG} Locale region failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleScript1() {
  let TAG = 'testLocaleScript1'
  try {
    const locale = new Intl.Locale('en-Latn-US');
    if (locale.script !== 'Latn') {
      throw new Error(`${TAG} Locale script failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleCalendar1() {
  let TAG = 'testLocaleCalendar1'
  try {
    const locale = new Intl.Locale('fr-FR-u-ca-buddhist');
    if (locale.calendar !== 'buddhist') {
      throw new Error(`${TAG} Locale calendar failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testLocaleHourCycle1() {
  let TAG = 'testLocaleHourCycle1'
  try {
    const locale = new Intl.Locale('en-US', {
      hourCycle: 'h12'
    });
    if (locale.hourCycle !== 'h12') {
      throw new Error(`${TAG} Locale hourCycle failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
