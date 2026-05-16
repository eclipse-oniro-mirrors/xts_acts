'use static'

class BigIntConverter {
  public value: bigint;
  constructor(input: number) {
    if (input < 0 || !Number.isInteger(input)) {
      throw new Error('Input must be a positive integer');
    }
    this.value = BigInt(input);
  }
}
export function testBigIntPositive() {
  const TAG = 'testBigIntPositive';
  try {
    const caseName = 'BuiltinsConstructorTest0100';
    console.info(`${caseName} test start`);
    let input: int = 123;
    let converterInstance: BigIntConverter;
    let resultValue: boolean;


    converterInstance = new BigIntConverter(input);
    resultValue = converterInstance.value === 123n;
    console.log(`input: ${input}`);
    console.log(`resultValue: ${resultValue}`);
    if (!resultValue){
      throw new Error(`${TAG} expect 123n`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}