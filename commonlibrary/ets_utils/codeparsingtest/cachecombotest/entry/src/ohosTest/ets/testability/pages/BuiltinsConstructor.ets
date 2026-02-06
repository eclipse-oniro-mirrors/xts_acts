@Concurrent
export function testBigIntPositive() {
  const TAG = 'testBigIntPositive';
  try {
    const caseName = 'BuiltinsConstructorTest0100';
    console.info(`${caseName} test start`);
    let input: number = 123;
    let converterInstance: BigIntConverter;
    let resultValue: boolean;

    class BigIntConverter {
      public value: bigint;
      constructor(input: number) {
        if (input < 0 || !Number.isInteger(input)) {
          throw new Error('Input must be a positive integer');
        }
        this.value = BigInt(input);
      }
    }

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

@Concurrent
export function testBigIntString() {
  const TAG = 'testBigIntString';
  try {
    const caseName = 'BuiltinsConstructorTest1800';
    console.info(`${caseName} test start`);
    const tryCreateBigInt = (input: string): bigint | null => {
      try {
        const bigIntValue = BigInt(input);
        if (bigIntValue.constructor === BigInt) {
          console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
          return bigIntValue;
        }
      } catch (error) {
        console.error(`Failed to convert ${input} to BigInt:`, (error as Error).message);
        return null;
      }
      return null;
    };

    const result = tryCreateBigInt('789');
    console.log(`Result: ${result ? result.toString() + 'n' : result}`);
    if (result !== 789n) {
      throw new Error(`${TAG} expect 789n`);
    }
    console.info(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}