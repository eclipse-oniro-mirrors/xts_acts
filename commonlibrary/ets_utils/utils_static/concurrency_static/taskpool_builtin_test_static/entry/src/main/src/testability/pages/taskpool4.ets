'use static'


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


export function testRegExpInstanceDotAll1() {
  const TAG = 'testRegExpInstanceDotAll1'
  try {
    const reg1 = new RegExp("except", "s");
    const reg2 = new RegExp("excepts");
    if (reg1.dotAll !== true || reg2.dotAll !== false) {
      throw new Error(`${TAG} dotAll mismatch`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testRegExpConstructor1() {
  const TAG = 'testRegExpConstructor1'
  try {
    const reg = new RegExp(new RegExp("ab+c", "i"));
    if (!(reg instanceof RegExp)) {
      throw new Error(`${TAG} not instance of RegExp`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigIntValueOf1() {
  const TAG = 'testBigIntValueOf1'
  try {
    const bigIntValue: bigint = 123n;
    const bigIntObject: BigInt = bigIntValue as BigInt;
    const result: bigint = bigIntObject.valueOf();
    if (result !== 123n) {
      throw new Error(`${TAG} unexpected result: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${(err as Error).message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


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


