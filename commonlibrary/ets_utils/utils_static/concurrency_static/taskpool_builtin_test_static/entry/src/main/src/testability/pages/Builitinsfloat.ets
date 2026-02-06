'use static'
// 1. 字面量本身

export function testFloatLiteral() {
  const TAG = 'testFloatLiteral';
  try {
    const floatNum = 5.8;
    const intPart = Math.trunc(floatNum);
    if (intPart !== 5) {
      throw new Error(`${TAG} expect 5, got ${intPart}`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// 2. 字符串解析

export function testParseFloat() {
  const TAG = 'testParseFloat';
  try {
    const floatValue = parseFloat('2.3');
    if (typeof floatValue !== 'number') {
      throw new Error(`${TAG} type error`);
    }
    if (floatValue !== 2.3) {
      throw new Error(`${TAG} value error`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// 3. 科学计数法

export function testScientific() {
  const TAG = 'testScientific';
  try {
    const expFloat: number = 3.5e2;
    if (expFloat !== 350) {
      throw new Error(`${TAG} expect 350, got ${expFloat}`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// 4. 千位分隔符

export function testUnderscore() {
  const TAG = 'testUnderscore';
  try {
    const num = 1_000.5;
    if (num !== 1000.5) {
      throw new Error(`${TAG} expect 1000.5, got ${num}`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// 5. 数组聚合

export function testArraySum() {
  const TAG = 'testArraySum';
  try {
    const arr = [1.5, 2.7, 3.2, 0.8, 4.1];
    let sum: number = 0;
    for (const v: number of arr) {
      if (v > 2) {
        sum += v;
      }
    }
    if (sum !== 10) {
      throw new Error(`${TAG} expect 10, got ${sum}`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// 6. 基本加法

export function testAdd() {
  const TAG = 'testAdd';
  try {
    const result = 1.2 + 2.3;
    if (result !== 3.5) {
      throw new Error(`${TAG} expect 3.5, got ${result}`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// 7. 取整函数

export function testFloor() {
  const TAG = 'testFloor';
  try {
    const res = Math.floor(3.9);
    if (res !== 3) {
      throw new Error(`${TAG} expect 3, got ${res}`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

// 8. 复利计算

export function testCompoundInterest() {
  const TAG = 'testCompoundInterest';
  try {
    const amount: number = 1000 * Math.pow(1 + 0.05 / 12.0, 12 * 2);
    if (Math.abs(amount - 1104.941335558327) > 1e-10) {
      throw new Error(`${TAG} amount mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}