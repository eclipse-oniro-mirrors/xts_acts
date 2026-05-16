'use static'


export function testBigIntAsIntN() {
  let TAG='testBigIntAsIntN'
  try {
    const I64_CEIL = 2n**63n;
    let value1 = BigInt.asIntN(64, I64_CEIL - 1n);
    console.log('result ' + value1.toString());
    if(value1.toString()!='9223372036854775807'){
      throw new Error(`${TAG} value.toString() invalid: ${value1.toString()}`)
    }
    const U64_CEIL = 2n**64n;
    let value2 = BigInt.asUintN(64, U64_CEIL - 1n);
    console.log('result ' + value2.toString());
    if(value2 <= 0n){
      throw new Error(`${TAG} value.toString() invalid: ${value2.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigIntPrototypeToString() {
  let TAG='testBigIntPrototypeToString'
  try {
    const bigint1 = 3500n;
    let value1 = Number(bigint1).toLocaleString();
    console.log('result ' + value1.toString());
    if(value1.toString()!='3,500'){
      throw new Error(`${TAG} value.toString() invalid: ${value1.toString()}`)
    }
    let s = 17n;
    let value2 = s.toString();
    console.log('result ' + value2);
    if(value2 != '17'){
      throw new Error(`${TAG} value.toString() invalid: ${value2.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

