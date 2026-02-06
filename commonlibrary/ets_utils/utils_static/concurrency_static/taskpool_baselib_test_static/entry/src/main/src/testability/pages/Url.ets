'use static'
import Url from '@ohos.url';
import { url } from '@kit.ArkTS';
import { ArrayList } from '@kit.ArkTS';


export function testURLParams_entries() {
  const caseName = 'DynamicURLParamsConcurrentTest_entries';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('key1=value1&key2=value2');
    const entries: string[] = [];
    for (const pair of params.entries()) {
      entries.push(pair[0], pair[1]);
    }
    if (entries[1] !== 'value1') {
      throw new Error(`${caseName} entries mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_append() {
  const caseName = 'DynamicURLParamsConcurrentTest_append';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('key1=value1&key2=value2');
    params.append('ma 大', 'jk￥');
    const paramsResult = params.toString();
    if (paramsResult !==
      'key1=value1&key2=value2&ma+%E5%A4%A7=jk%EF%BF%A5') {
      throw new Error(`${caseName} append mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_delete() {
  const caseName = 'DynamicURLParamsConcurrentTest_delete';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('key1=value1&key2=value2');
    params.delete('key2');
    const paramsResult = params.toString();
    if (paramsResult !== 'key1=value1') {
      throw new Error(`${caseName} delete mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_getAll() {
  const caseName = 'DynamicURLParamsConcurrentTest_getAll';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('b=1&b=2&b=3&b=4&c=5');
    const valuesForKeyB = params.getAll('b');
    const expectedValuesForKeyB = ['1', '2', '3', '4'];
    if (valuesForKeyB.length !== expectedValuesForKeyB.length) {
      throw new Error(`${caseName} getAll length mismatch`);
    }
    for (let i: int = 0; i < valuesForKeyB.length; i++) {
      if (valuesForKeyB[i] !== expectedValuesForKeyB[i]) {
        throw new Error(`${caseName} getAll value mismatch`);
      }
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_get() {
  const caseName = 'DynamicURLParamsConcurrentTest_get';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('b=1&b=2&b=3&b=4&c=5');
    const valueForKeyB = params.get('b');
    if (valueForKeyB !== '1') {
      throw new Error(`${caseName} get mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_has() {
  const caseName = 'DynamicURLParamsConcurrentTest_has';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('a=1&a=2&b=3&b=4&c=5');
    const hasKey = params.has('b');
    if (!hasKey) {
      throw new Error(`${caseName} has mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_set() {
  const caseName = 'DynamicURLParamsConcurrentTest_set';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('name=Jonathan&name=YH&name=DKH');
    params.set('name', 'zhuDi');
    const paramsResult = params.toString();
    if (paramsResult !== 'name=zhuDi') {
      throw new Error(`${caseName} set mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_sort() {
  const caseName = 'DynamicURLParamsConcurrentTest_sort';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('name=Jonathan&name=YH&name=DKH&1=c&5=c&a=c&ad=c&ab=c&b=c&ca=c');
    params.sort();
    const sorted = params.toString();
    if (sorted !==
      '1=c&5=c&a=c&ab=c&ad=c&b=c&ca=c&name=YH&name=DKH&name=Jonathan') {
      throw new Error(`${caseName} sort mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_keys() {
  const caseName = 'DynamicURLParamsConcurrentTest_keys';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('1=value1&5=value2&a=value3&ad=value4&ab=value5&b=value6&ca=value7');
    const keysIterator = params.keys();
    const keysArray = Array.from(keysIterator);
    if (keysArray.toString() !== '1,5,a,ad,ab,b,ca') {
      throw new Error(`${caseName} keys mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURLParams_values() {
  const caseName = 'DynamicURLParamsConcurrentTest_values';
  try {
    console.log(`${caseName} test start`);
    const params = new Url.URLParams('key1=1&key2=5&key3=a&key4=ad&key6=ab&key5=c');
    const valuesIterator = params.values();
    const valuesArray = Array.from(valuesIterator);
    if (valuesArray.toString() !== '1,5,a,ad,ab,c') {
      throw new Error(`${caseName} values mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURL_parseURL() {
  const caseName = 'DynamicURLConcurrentTest_parseURL';
  try {
    console.log(`${caseName} test start`);
    const urlObject = Url.URL.parseURL('https://username:password@host:8080/test/test1/test3');
    const result = urlObject.toString();
    if (result !==
      'https://username:password@host:8080/test/test1/test3') {
      throw new Error(`${caseName} parseURL mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testURL_parseURL_withBase() {
  const caseName = 'DynamicURLConcurrentTest_parseURL_withBase';
  try {
    console.log(`${caseName} test start`);
    const url1 = Url.URL.parseURL('path2/path3', 'https://.com/test/test1 ');
    if (url1.toString() !==
      'https://.com/test/path2/path3') {
      throw new Error(`${caseName} parseURL withBase mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testUrlParameter001() {
  const caseName = 'testUrlParameter001';
  try {
    console.log(`${caseName} test start`);
    const that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
    if (that.toString() !== 'http://username:password@host:8080/directory/file?foo=1&bar=2') {
      throw new Error(`${caseName} URL string mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}