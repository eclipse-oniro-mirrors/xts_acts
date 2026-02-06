import { main1 } from './Reflex';
import { regExpSymbolMatch, regExpSymbolReplace, regExpSymbolSearch, regExpSymbolSplit } from './RegexpUtil';

@Concurrent
export function testRegExpToString1() {
  const TAG = 'testRegExpToString1'
  try {
    const reg = new RegExp('a+b+c');
    const str = reg.toString();
    if (str !== '/a+b+c/') {
      throw new Error(`${TAG} unexpected toString: ${str}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testRegExpTest1() {
  const TAG = 'testRegExpTest1'
  try {
    const pattern = 'hello world!';
    const reg = new RegExp(pattern);
    const res = reg.test('hello world!');
    if (res !== true) {
      throw new Error(`${TAG} test() expected true`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testRegExpSymbolSplit1() {
  const TAG = 'testRegExpSymbolSplit1'
  try {
    const res = regExpSymbolSplit(/-/, 'a-b-c');
    if (JSON.stringify(res) !== '["a","b","c"]') {
      throw new Error(`${TAG} unexpected split result: ${JSON.stringify(res)}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testRegExpSymbolSearch1() {
  const TAG = 'testRegExpSymbolSearch1'
  try {
    const idx: number = regExpSymbolSearch(/a/, 'abc');
    if (idx !== 0) {
      throw new Error(`${TAG} unexpected search index: ${idx}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testRegExpSymbolReplace1() {
  const TAG = 'testRegExpSymbolReplace1'
  try {
    const out: string = regExpSymbolReplace(/a/, 'abc', 'A');
    if (out !== 'Abc') {
      throw new Error(`${TAG} unexpected: ${out}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testRegExpSymbolMatch1() {
  const TAG = 'testRegExpSymbolMatch1'
  try {
    const out: string[] | null = regExpSymbolMatch(/[0-9]+/g, '2016-01-02');
    if (JSON.stringify(out) !== '["2016","01","02"]') {
      throw new Error(`${TAG} unexpected: ${JSON.stringify(out)}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


@Concurrent
export function testRegExpInstanceDotAll1() {
  const TAG = 'testRegExpInstanceDotAll1'
  try {
    const reg1 = /except/s;
    const reg2 = /excepts/;
    if (reg1.dotAll !== true || reg2.dotAll !== false) {
      throw new Error(`${TAG} dotAll mismatch`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testRegExpConstructor1() {
  const TAG = 'testRegExpConstructor1'
  try {
    const reg = new RegExp(/ab+c/i);
    if (!(reg instanceof RegExp)) {
      throw new Error(`${TAG} not instance of RegExp`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testMultipleGenericsIsFirstGreaterThanZero1() {
  const TAG = 'testMultipleGenericsIsFirstGreaterThanZero1'
  try {
    class G11<T extends number | string, U extends boolean> {
      private first: T;
      private second: U;
      constructor(first: T, second: U) {
        this.first = first;
        this.second = second;
      }
      isFirstGreaterThanZero(): boolean {
        if (typeof this.first === 'number') {
          return this.first > 0;
        }
        return false;
      }
    }
    const pair = new G11(42, true);
    const ok = pair.isFirstGreaterThanZero();
    if (ok !== true) {
      throw new Error(`${TAG} expected true but got ${ok}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testBigIntValueOf1() {
  const TAG = 'testBigIntValueOf1'
  try {
    const bigIntValue: bigint = 123n;
    const bigIntObject: BigInt = Object(bigIntValue) as BigInt;
    const result: bigint = bigIntObject.valueOf();
    if (result !== 123n) {
      throw new Error(`${TAG} unexpected result: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testUndefinedLiteral1() {
  const TAG = 'testUndefinedLiteral1'
  try {
    const simpleUndefinedVar: undefined = undefined;
    if (simpleUndefinedVar !== undefined) {
      throw new Error(`${TAG} value should be undefined`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testBigIntToString1() {
  const TAG = 'testBigIntToString1'
  try {
    const bigIntNumber: bigint = 123n;
    const str1: string = bigIntNumber.toString();
    if (str1.indexOf('123') === -1) {
      throw new Error(`${TAG} unexpected toString result: ${str1}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testBigIntToLocaleString1() {
  const TAG = 'testBigIntToLocaleString1'
  try {
    const bigNum: bigint = 12345678901234567890n;
    const out: string = bigNum.toLocaleString('en-US');
    if (out !== '12,345,678,901,234,567,890') {
      throw new Error(`${TAG} unexpected toLocaleString: ${out}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testStringCharAt1() {
  const TAG = 'testStringCharAt1'
  try {
    const s = 'Every green bus drives fast.';
    const ch = s.charAt(0);
    if (ch !== 'E') {
      throw new Error(`${TAG} unexpected char: ${ch}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testStringPadEnd1() {
  const TAG = 'testStringPadEnd1'
  try {
    const s = 'abc';
    const out = s.padEnd(10, 's');
    if (out !== 'abcsssssss') {
      throw new Error(`${TAG} unexpected result: ${out}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testStringStartsWith1() {
  const TAG = 'testStringStartsWith1'
  try {
    const s = 'Hello world everyone';
    const ok = s.startsWith('Hello');
    if (ok !== true) {
      throw new Error(`${TAG} startsWith failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testStringLiteralUnion1() {
  const TAG = 'testStringLiteralUnion1'
  try {
    type Color = 'red' | 'green' | 'blue';
    const favoriteColor: Color = 'blue';
    if (favoriteColor !== 'blue') {
      throw new Error(`${TAG} expected 'blue', got ${favoriteColor}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testRequiredUtilityType1() {
  const TAG = 'testRequiredUtilityType1'
  try {
    interface Person {
      name?: string;
      age?: number;
      address?: string;
    }
    type RequiredPerson = Required<Person>;
    const p: RequiredPerson = { name: 'A', age: 1, address: 'X' };
    if (p.name === undefined || p.age === undefined || p.address === undefined) {
      throw new Error(`${TAG} fields should be required`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testReflectMain1Once() {
  const TAG = 'testReflectMain1Once'
  try {
    const out = main1();
    if (out !== 'TypeError') {
      throw new Error(`${TAG} unexpected result: ${out}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}