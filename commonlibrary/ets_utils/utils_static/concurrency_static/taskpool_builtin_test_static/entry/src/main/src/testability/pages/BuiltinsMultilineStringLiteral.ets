'use static'


export function BuiltinsMultilineStringLiteralTest0100() {
  let TAG='BuiltinsMultilineStringLiteralTest'
  try {
    const repeatStr = `La`;
    const repeated = `${repeatStr.repeat(3)}`;
    if(repeated!=`LaLaLa`){
      throw new Error(`${TAG} value.toString() invalid: ${repeated}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function BuiltinsMultilineStringLiteralTest1600() {
  let TAG='BuiltinsMultilineStringLiteralTest1600'
  try {
    const isMember = true;
    const accessMsg = `You ${isMember? 'have' : 'do not have'} access.
      Please check your membership.`;
    if(accessMsg !=`You have access.
      Please check your membership.`){
      throw new Error(`${TAG} value.toString() invalid: ${accessMsg.toString()}`)
    }

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

