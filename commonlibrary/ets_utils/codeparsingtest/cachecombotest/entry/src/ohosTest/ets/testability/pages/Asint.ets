
@Concurrent
export function BuiltinsAsIntNTest2600() {
  const TAG = 'BuiltinsAsIntNTest2600';
  const bits: number = 8;
  const int: bigint = 127n;
  let result: bigint = 0n;
  try {
    result = BigInt.asIntN(bits, int);
    console.log('result:' + result);
    if(result !== 127n){
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function BuiltinsAsUintNTest0100() {
  let TAG='BuiltinsAsUintNTest0100'
  try {
    const bits = 1;
    const int = 0n;
    const result = BigInt.asUintN(bits, int);
    console.log('result:' + result);
    if(result.toString()!='0'){
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function BuiltinsBigIntLiteralTest0100() {
  let TAG='BuiltinsBigIntLiteralTest0100'
  try {
    const bigInt1 = 123n;
    const bigInt2 = 985n;
    const bigInt3 = 211n;
    const bigInt4 = 996n;
    const bigIntArray = [bigInt1, bigInt2, bigInt3, bigInt4];
    let maxBigInt = bigIntArray[0];
    for (let i = 0; i < bigIntArray.length; i++) {
      if (bigIntArray[i] > maxBigInt) {
        maxBigInt = bigIntArray[i];
      }
    }
    const expectedMax = 996n;
    if(expectedMax.toString()!='996'){
      throw new Error(`${TAG} value.toString() invalid: ${expectedMax.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function BuiltinsBigIntLiteralTest1500() {
  let TAG='BuiltinsBigIntLiteralTest1500'
  try {
    const str1 = '1_2_3_4_5';
    const cleanStr = str1.replace(/[^0-9-]/g, '');
    const bigint1 = BigInt(cleanStr);
    console.log(`${bigint1}`);
    if(bigint1.toString()!='12345'){
      throw new Error(`${TAG} value.toString() invalid: ${bigint1.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function testBigIntAdd() {
  const TAG = 'testBigIntAdd';
  try {
    const num1 = 123n;
    const num2 = 456n;
    const result = num1 + num2;
    if (result !== 579n) {
      throw new Error(`${TAG} result=${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// ============ 2. 减法 ======================================
@Concurrent
export function testBigIntSub() {
  const TAG = 'testBigIntSub';
  try {
    const num1 = 456n;
    const num2 = 123n;
    const result = num1 - num2;
    if (result !== 333n) {
      throw new Error(`${TAG} result=${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// ============ 3. 乘法 ======================================
@Concurrent
export function testBigIntMul() {
  const TAG = 'testBigIntMul';
  try {
    const num1 = 123n;
    const num2 = 456n;
    const result = num1 * num2;
    if (result !== 56088n) {
      throw new Error(`${TAG} result=${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// ============ 4. 除法 ======================================
@Concurrent
export function testBigIntDiv() {
  const TAG = 'testBigIntDiv';
  try {
    const num1 = 456n;
    const num2 = 123n;
    const result = num1 / num2;
    if (result !== 3n) {
      throw new Error(`${TAG} result=${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// ============ 5. 取余 ======================================
@Concurrent
export function testBigIntMod() {
  const TAG = 'testBigIntMod';
  try {
    const num1 = 456n;
    const num2 = 123n;
    const result = num1 % num2;
    if (result !== 87n) {
      throw new Error(`${TAG} result=${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// ============ 6. 幂运算 =====================================
@Concurrent
export function testBigIntPow() {
  const TAG = 'testBigIntPow';
  try {
    const base = 2n;
    const exponent = 10n;
    const result = base ** exponent;
    if (result !== 1024n) {
      throw new Error(`${TAG} result=${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// ============ 7. 小于比较 ===================================
@Concurrent
export function testBigIntLessThan() {
  const TAG = 'testBigIntLessThan';
  try {
    const num1 = 123n;
    const num2 = 456n;
    const isLess = num1 < num2;
    if (isLess !== true) {
      throw new Error(`${TAG} isLess=${isLess}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// ============ 8. 判偶运算 ===================================
@Concurrent
export function testBigIntIsEven() {
  const TAG = 'testBigIntIsEven';
  try {
    const num = 12n;
    const isEven = num % 2n === 0n;
    if (isEven !== true) {
      throw new Error(`${TAG} isEven=${isEven}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}