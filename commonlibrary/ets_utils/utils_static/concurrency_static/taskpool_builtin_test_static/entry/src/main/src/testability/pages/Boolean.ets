'use static'


export function testBooleanConstructor() {
  let TAG='testBooleanConstructor'
  try {
    let result = new Boolean(0);
    console.log('result ' + result.valueOf().toString());
    if(result.valueOf().toString()!='false'){
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}



export function testBoolean() {
  let TAG='testBooleanConstructor'
  try {
    let value = true;
    let result = Boolean(value);
    console.log('result ' + result.toString());
    if(result != true){
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBooleanprototypetoString() {
  let TAG='testBooleanprototypetoString'
  try {
    let boolean1:boolean = false;
    let result = boolean1.toString();
    console.log('result ' + boolean1.toString());
    if(result.toString() != 'false'){
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBooleanPrototypeValueOf() {
  let TAG='testBooleanPrototypeValueOf'
  try {
    let flag1 = new Boolean(0);
    let result = flag1.valueOf();
    console.log('result ' + result);
    if(result.toString() != 'false'){
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


// 1. 字面量 true   → 对应 SUB_BOOLEAN_LITERAL_TEST_0100
// -----------------------------------------------------------

export function testBoolLiteralTrue() {
  const TAG = 'testBoolLiteralTrue';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest0100';
    console.log(`${caseName} test start`);
    const isTrue = true;
    console.log(`${isTrue}`);
    if (true !== isTrue) { throw new Error(`${TAG} expect true`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 2. 字面量 false  → 对应 SUB_BOOLEAN_LITERAL_TEST_0200
// -----------------------------------------------------------

export function testBoolLiteralFalse() {
  const TAG = 'testBoolLiteralFalse';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest0200';
    console.log(`${caseName} test start`);
    const isFalse = false;
    console.log(`${isFalse}`);
    if (false !== isFalse) { throw new Error(`${TAG} expect false`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 3. 逻辑非 !       → 对应 SUB_BOOLEAN_LITERAL_TEST_0300
// -----------------------------------------------------------

export function testBoolNot() {
  const TAG = 'testBoolNot';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest0300';
    console.log(`${caseName} test start`);
    const original = true;
    const negated = !original;
    console.log(`${negated}`);
    if (false !== negated) { throw new Error(`${TAG} expect false`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 4. 逻辑与 &&      → 对应 SUB_BOOLEAN_LITERAL_TEST_0400
// -----------------------------------------------------------

export function testBoolAnd() {
  const TAG = 'testBoolAnd';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest0400';
    console.log(`${caseName} test start`);
    const a = true;
    const b = false;
    const result = a && b;
    console.log(`${result}`);
    if (false !== result) { throw new Error(`${TAG} expect false`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 5. 逻辑或 ||      → 对应 SUB_BOOLEAN_LITERAL_TEST_0500
// -----------------------------------------------------------

export function testBoolOr() {
  const TAG = 'testBoolOr';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest0500';
    console.log(`${caseName} test start`);
    const a = true;
    const b = false;
    const result = a || b;
    console.log(`${result}`);
    if (true !== result) { throw new Error(`${TAG} expect true`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 6. if 条件判断    → 对应 SUB_BOOLEAN_LITERAL_TEST_0600
// -----------------------------------------------------------

export function testBoolIf() {
  const TAG = 'testBoolIf';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest0600';
    console.log(`${caseName} test start`);
    const isConditionMet = true;
    let count: int = 0;
    if (isConditionMet) {
      count = count + 1;
    }
    if (1 !== count) { throw new Error(`${TAG} expect 1`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 7. 数组遍历/存在 true → 对应 SUB_BOOLEAN_LITERAL_TEST_0900
// -----------------------------------------------------------

export function testBoolArraySome() {
  const TAG = 'testBoolArraySome';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest0900';
    console.log(`${caseName} test start`);
    const boolArray = [false, false, true];
    let hasTrue = false;
    for (let i: int = 0; i < boolArray.length; i++) {
      if (boolArray[i]) {
        hasTrue = true;
        break;
      }
    }
    console.log(`${hasTrue}`);
    if (true !== hasTrue) { throw new Error(`${TAG} expect true`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 8. 比较运算产生布尔 → 对应 SUB_BOOLEAN_LITERAL_TEST_1300
// -----------------------------------------------------------

export function testBoolCompare() {
  const TAG = 'testBoolCompare';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest1300';
    console.log(`${caseName} test start`);
    const num: int = 5;
    const condition = num > 3;
    console.log(`${condition}`);
    if (true !== condition) { throw new Error(`${TAG} expect true`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 9. 三目运算          → 对应 SUB_BOOLEAN_LITERAL_TEST_1100
// -----------------------------------------------------------

export function testBoolTernary() {
  const TAG = 'testBoolTernary';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest1100';
    console.log(`${caseName} test start`);
    const isAdult = true;
    const message: int = isAdult ? 0 : 1;
    console.log(`${message}`);
    if (0 !== message) { throw new Error(`${TAG} expect 0`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// -----------------------------------------------------------
// 10. 复合布尔表达式   → 对应 SUB_BOOLEAN_LITERAL_TEST_3000
// -----------------------------------------------------------

export function testBoolComplex() {
  const TAG = 'testBoolComplex';
  try {
    const caseName = 'BuiltinsBooleanLiteralTest3000';
    console.log(`${caseName} test start`);
    const conditionA = true;
    const conditionB = false;
    const conditionC = true;
    const conditionD = false;
    const complexCondition = (conditionA && !conditionB) || (conditionC && !conditionD);
    console.log('Complex condition result:', complexCondition);
    if (true !== complexCondition) { throw new Error(`${TAG} expect true`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}