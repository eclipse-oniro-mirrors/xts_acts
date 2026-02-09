'use static'
import { ArrayList, buffer, Deque, HashMap, LinkedList, TreeSet, url, util, Stack } from '@kit.ArkTS';

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  age: number;
}

async function fn() {
  return 'hello world';
}


export function testUtil_format() {
  const caseName = 'DynamicUtilConcurrentTest_format';
  try {
    console.log(`${caseName} test start`);
    let value1 = 'testPara1';
    let value2: int = 64;
    let result = util.format(value1, value2);
    if (result !== value1) {
      throw new Error(`${caseName} format mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testUtil_errnoToString() {
  const caseName = 'DynamicUtilConcurrentTest_errnoToString';
  try {
    console.log(`${caseName} test start`);
    let value: int = -1;
    let result = util.errnoToString(value);
    if (result !== 'operation not permitted') {
      throw new Error(`${caseName} errnoToString mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testUtil_generateRandomUUID() {
  const caseName = 'DynamicUtilConcurrentTest_generateRandomUUID';
  try {
    console.log(`${caseName} test start`);
    let result = util.generateRandomUUID();
    if (result.length !== 36) {
      throw new Error(`${caseName} generateRandomUUID mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testUtil_generateRandomBinaryUUID() {
  const caseName = 'DynamicUtilConcurrentTest_generateRandomBinaryUUID';
  try {
    console.log(`${caseName} test start`);
    let result = util.generateRandomBinaryUUID();
    if (result?.length !== 16) {
      throw new Error(`${caseName} generateRandomBinaryUUID mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testUtil_parseUUID() {
  const caseName = 'DynamicUtilConcurrentTest_parseUUID';
  try {
    console.log(`${caseName} test start`);
    let value = '84bdf796-66cc-4655-9b89-d6218d100f9c';
    let result = util.parseUUID(value);
    if (result.length !== 16) {
      throw new Error(`${caseName} parseUUID mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testUtil_getHash() {
  const caseName = 'DynamicUtilConcurrentTest_getHash';
  try {
    console.log(`${caseName} test start`);
    let person: GeneratedObjectLiteralInterface_1 = { name: 'Alice', age: 30 };
    let result1 = util.getHash(person);
    let result2 = util.getHash(person);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

export function testTextDecoder_create() {
  const caseName = 'DynamicUtilConcurrentTest_TextDecoder_create';
  try {
    console.log(`${caseName} test start`);
    let result = util.TextDecoder.create();
    let retStr = result.encoding;
    if (retStr !== 'utf-8') {
      throw new Error(`${caseName} TextDecoder.create mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testTextEncoder() {
  const caseName = 'DynamicUtilConcurrentTest_TextEncoder';
  try {
    console.log(`${caseName} test start`);
    let result = new util.TextEncoder();
    let retStr = result.encoding;
    if (retStr !== 'utf-8') {
      throw new Error(`${caseName} TextEncoder mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testTextEncoder_constructor() {
  const caseName = 'DynamicUtilConcurrentTest_TextEncoder_constructor';
  try {
    console.log(`${caseName} test start`);
    let result = new util.TextEncoder();
    let retStr = result.encoding;
    if (retStr !== 'utf-8') {
      throw new Error(`${caseName} TextEncoder constructor mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testTextEncoderCreate() {
  const caseName = 'DynamicUtilConcurrentTest_TextEncoderCreate';
  try {
    console.log(`${caseName} test start`);
    let result = util.TextEncoder.create('iso-8859-14');
    let retStr = result.encoding;
    if (retStr !== 'iso-8859-14') {
      throw new Error(`${caseName} TextEncoderCreate mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testTextEncoder_encodeInto() {
  const caseName = 'DynamicUtilConcurrentTest_TextEncoder_encodeInto';
  try {
    console.log(`${caseName} test start`);
    let textEncoder = new util.TextEncoder();
    let result = textEncoder.encodeInto('\uD800¥¥');
    if (result.toString() !== '237,160,128,194,165,194,165') {
      throw new Error(`${caseName} TextEncoder encodeInto mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testTextEncoder_encodeIntoUint8Array() {
  const caseName = 'DynamicUtilConcurrentTest_TextEncoder_encodeIntoUint8Array';
  try {
    console.log(`${caseName} test start`);
    let textEncoder = new util.TextEncoder();
    let buffer = new ArrayBuffer(10);
    let dest = new Uint8Array(buffer);
    let result = textEncoder.encodeIntoUint8Array('test', dest);
    // 只验证是否成功写入，不验证返回值
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testTextDecoder_decodeToString() {
  const caseName = 'DynamicUtilConcurrentTest_TextDecoder_decodeToString';
  try {
    console.log(`${caseName} test start`);
    const that = util.TextDecoder.create('utf-8');
    const uint8arr = new Uint8Array([0, 65, 49, 53, 79, 75, 70, 69]);
    let retStr = that.decodeToString(uint8arr);
    let str = encodeURI(retStr);
    if (str !== '%00A15OKFE') {
      throw new Error(`${caseName} TextDecoder decodeToString mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testUtil_generateRandomUUID2() {
  const caseName = 'DynamicUtilConcurrentTest_generateRandomUUID';
  try {
    console.log(`${caseName} test start`);
    let uuid = util.generateRandomUUID();
    const regex = new RegExp("^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$", "i");
    if (!regex.test(uuid) || uuid.length !== 36) {
      throw new Error(`${caseName} generateRandomUUID mismatch`);

    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Array() {
  const caseName = 'DynamicGetHashConcurrentTest_Array';
  try {
    console.log(`${caseName} test start`);
    let arr1:int[] = [0, 1, 2, 3];
    let arr2 = new Array<number>();
    let result1 = util.getHash(arr1);
    let result2 = util.getHash(arr2);
    if (result1 === result2) {
      throw new Error(`${caseName} getHash Array mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_ArrayList() {
  const caseName = 'DynamicGetHashConcurrentTest_ArrayList';
  try {
    console.log(`${caseName} test start`);
    let a = new ArrayList<number>();
    a.add(7)
    let result1 = util.getHash(a);
    a.add(9);
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash ArrayList mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_LinkedList() {
  const caseName = 'DynamicGetHashConcurrentTest_LinkedList';
  try {
    console.log(`${caseName} test start`);
    let a = new LinkedList<number>();
    a.add(7)
    let result1 = util.getHash(a);
    a.add(9);
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash LinkedList mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Set() {
  const caseName = 'DynamicGetHashConcurrentTest_Set';
  try {
    console.log(`${caseName} test start`);
    let a = new Set<number>();
    a.add(7)
    let result1 = util.getHash(a);
    a.add(9);
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash Set mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Map() {
  const caseName = 'DynamicGetHashConcurrentTest_Map';
  try {
    console.log(`${caseName} test start`);
    let a = new Map<number, number>();
    a.set(7, 0)
    let result1 = util.getHash(a);
    a.set(9, 2);
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash Map mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_BigInt64Array() {
  const caseName = 'DynamicGetHashConcurrentTest_BigInt64Array';
  try {
    console.log(`${caseName} test start`);
    let a = new BigInt64Array(8);
    a[0] = 1n;
    let result1 = util.getHash(a);
    a[1] = 2n;
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash BigInt64Array mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Float64Array() {
  const caseName = 'DynamicGetHashConcurrentTest_Float64Array';
  try {
    console.log(`${caseName} test start`);
    let a = new Float64Array(8);
    a[0] = 1;
    let result1 = util.getHash(a);
    a[1] = 2;
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash Float64Array mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Uint8Array() {
  const caseName = 'DynamicGetHashConcurrentTest_Uint8Array';
  try {
    console.log(`${caseName} test start`);
    let a = new Uint8Array(8);
    a[0] = 1;
    let result1 = util.getHash(a);
    a[1] = 2;
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash Uint8Array mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Buffer() {
  const caseName = 'DynamicGetHashConcurrentTest_Buffer';
  try {
    console.log(`${caseName} test start`);
    let a = buffer.from([1, 2, 3]);
    let result1 = util.getHash(a);
    a.fill(1);
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash Buffer mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_URLParams() {
  const caseName = 'DynamicGetHashConcurrentTest_URLParams';
  try {
    console.log(`${caseName} test start`);
    let a = new url.URLParams('www.baidu.com');
    a.append('1', 'kuku');
    let result1 = util.getHash(a);
    a.append('2', 'kuku');
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash URLParams mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Deque() {
  const caseName = 'DynamicGetHashConcurrentTest_Deque';
  try {
    console.log(`${caseName} test start`);
    let a = new Deque<number>();
    a.insertFront(7);
    let result1 = util.getHash(a);
    a.insertFront(9);
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash Deque mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_HashMap() {
  const caseName = 'DynamicGetHashConcurrentTest_HashMap';
  try {
    console.log(`${caseName} test start`);
    let a = new HashMap<string, number>();
    a.set('1', 7);
    let result1 = util.getHash(a);
    a.set('3', 7);
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash HashMap mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_TreeSet() {
  const caseName = 'DynamicGetHashConcurrentTest_TreeSet';
  try {
    console.log(`${caseName} test start`);
    let a = new TreeSet<string>();
    a.add('1');
    let result1 = util.getHash(a);
    a.add('3');
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash TreeSet mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_Stack() {
  const caseName = 'DynamicGetHashConcurrentTest_Stack';
  try {
    console.log(`${caseName} test start`);
    let a = new Stack<string>();
    a.push('1');
    let result1 = util.getHash(a);
    a.push('3');
    let result2 = util.getHash(a);
    if (result1 !== result2) {
      throw new Error(`${caseName} getHash Stack mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


export function testGetHash_null() {
  const caseName = 'DynamicGetHashConcurrentTest_null';
  try {
    console.log(`${caseName} test start`);
    let caught = false;
    try {
      util.getHash(null);
    } catch (err) {
      if (err.code === 401) {
        caught = true;
      }
    }
    if (!caught) {
      throw new Error(`${caseName} getHash null mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}



