@Concurrent
export function builtinsNumberConstructorTest0200() {
  let TAG='builtinsNumberConstructorTest0200'
  try {
    let numObj = new Number();
    console.log(`${numObj}`);
    if(JSON.stringify(0) !== JSON.stringify(numObj)){
      throw new Error(`${TAG} value.toString() invalid: ${JSON.stringify(0)}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function builtinsNumberIsFiniteTest0100() {
  let TAG='builtinsNumberIsFiniteTest0100'
  try {
    const num = Number.isFinite(0);
    console.log(`${num}`)
    if(num.toString() !== 'true'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function builtinsNumberIsIntegerTest0100() {
  let TAG='builtinsNumberIsIntegerTest0100'
  try {
    const num = Number.isInteger(0);
    console.log(`${num}`);
    if(num.toString() !== 'true'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
@Concurrent
export function builtinsNumberIsNaNTest0100() {
  let TAG='builtinsNumberIsNaNTest0100'
  try {
    const num = Number.isNaN('NaN');
    console.log(`${num}`);
    if(num.toString() !== 'false'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
@Concurrent
export function builtinsNumberIsSafeIntegerTest0100() {
  let TAG='builtinsNumberIsSafeIntegerTest0100'
  try {
    const num = Number.isSafeInteger(3);
    console.log(`${num}`);
    if(num.toString() !== 'true'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
@Concurrent
export function builtinsNumberParseTest0100() {
  let TAG='builtinsNumberParseTest0100'
  try {
    const num = Number.parseFloat('3');
    console.log(`${num}`);
    if(num.toString() !== '3'){
      throw new Error(`${TAG} value.toString() invalid: ${num.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function builtinsNumberPropertyTest0100() {
  let TAG='builtinsNumberPropertyTest0100'
  try {
    const num1 = Number.EPSILON;
    console.log(`${num1}`);
    if(num1.toString() !== '2.220446049250313e-16'){
      throw new Error(`${TAG} value.toString() invalid: ${num1.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function builtinsNumberPrototypeTest0100() {
  let TAG='builtinsNumberPrototypeTest0100'
  try {
    const num = 77.1234;
    const exponentialStr1 = num.toExponential();
    if(exponentialStr1.toString() !== '7.71234e+1'){
      throw new Error(`${TAG} value.toString() invalid: ${exponentialStr1.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
