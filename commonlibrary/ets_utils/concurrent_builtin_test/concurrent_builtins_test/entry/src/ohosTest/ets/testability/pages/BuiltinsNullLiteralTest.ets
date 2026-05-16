@Concurrent
export function BuiltinsNullLiteralTest0900() {
  let TAG='BuiltinsNullLiteralTest'
  try {
    let value1 = null;
    let value2 = 'notNull';
    let logicalOrResult = value1 || value2 || null;
    let logicalAndResult = value1 && value2 && null;
    if(logicalOrResult != 'notNull' || logicalAndResult != null){
      throw new Error(`${TAG} value.toString() invalid: ${logicalOrResult}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}