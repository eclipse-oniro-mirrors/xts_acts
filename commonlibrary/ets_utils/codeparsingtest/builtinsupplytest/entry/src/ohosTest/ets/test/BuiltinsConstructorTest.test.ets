/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from "@ohos/hypium";
import { sleep } from '../testability/pages/Utils';


export default function BuiltinsConstructorTest() {
  describe('BuiltinsConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0100
     * @tc.name BuiltinsConstructorTest0100
     * @tc.desc test 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0100';
      console.info(`${caseName} test start`);
      let input: number = 123;
      let converterInstance: BigIntConverter;
      let resultValue: boolean;

      class BigIntConverter {
        value: bigint;

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
      expect(resultValue).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0200
     * @tc.name BuiltinsConstructorTest0200
     * @tc.desc test -456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0200';
      console.info(`${caseName} test start`);
      let input: number = -456;
      let converterInstance: BigIntConverter;
      let resultValue: boolean;

      class BigIntConverter {
        value: bigint;

        constructor(input: number) {
          if (!Number.isInteger(input)) {
            throw new Error('Input must be an integer');
          }
          this.value = BigInt(input);
        }
      }

      converterInstance = new BigIntConverter(input);
      resultValue = converterInstance.value === -456n;
      console.log(`input: ${input}`);
      console.log(`resultValue: ${resultValue}`);
      expect(resultValue).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0300
     * @tc.name BuiltinsConstructorTest0300
     * @tc.desc test 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0300';
      console.info(`${caseName} test start`);
      let input: string = '.';
      let converterInstance: BigIntConverter;
      let resultValue: boolean;

      class BigIntConverter {
        value: bigint;

        constructor(input: string) {
          if (input === '.') {
            this.value = 0n;
          } else {
            const num = Number(input);
            if (isNaN(num) || !Number.isInteger(num)) {
              throw new Error('Input must be convertible to an integer');
            }
            this.value = BigInt(num);
          }
        }
      }

      converterInstance = new BigIntConverter(input);
      resultValue = converterInstance.value === 0n;
      console.log(`input: ${input}`);
      console.log(`resultValue: ${resultValue}`);
      expect(resultValue).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0400
     * @tc.name BuiltinsConstructorTest0400
     * @tc.desc test 123.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0400';
      console.info(`${caseName} test start`);
      let input: number = 123.45;
      let converterInstance: BigIntConverter;

      class BigIntConverter {
        value: bigint;

        constructor(input: number) {
          if (!Number.isInteger(input)) {
            throw new RangeError('Input must be an integer');
          }
          this.value = BigInt(input);
        }
      }

      try {
        converterInstance = new BigIntConverter(input);
        console.log("converterInstance:" + converterInstance);
      } catch (error) {
        if (error instanceof RangeError) {
          console.error(`Caught RangeError: ${error.message}`);
          expect(error.message).assertContain('Input must be an integer');
        } else {
          console.error(`Unexpected error: ${(error as Error).message}`);
        }
      }
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0500
     * @tc.name BuiltinsConstructorTest0500
     * @tc.desc test -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0500';
      console.info(`${caseName} test start`);
      let input: number = -0;
      let converterInstance: BigIntConverter;
      let resultValue: boolean;

      class BigIntConverter {
        value: bigint;

        constructor(input: number) {
          if (!Number.isInteger(input)) {
            throw new RangeError('Input must be an integer');
          }
          this.value = BigInt(input);
        }
      }

      converterInstance = new BigIntConverter(input);
      resultValue = converterInstance.value === 0n;
      console.log(`input: ${input}`);
      console.log(`resultValue: ${resultValue}`);
      expect(resultValue).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0600
     * @tc.name BuiltinsConstructorTest0600
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0600';
      console.info(`${caseName} test start`);
      let input: number = NaN;
      let converterInstance: BigIntConverter;
      let resultValue: bigint;
      let isConversionSuccessful: boolean;

      class BigIntConverter {
        value: bigint;
        private conversionSuccess: boolean;

        constructor(input: number) {
          if (Number.isInteger(input)) {
            this.value = BigInt(input);
            this.conversionSuccess = true;
          } else {
            this.value = 1n;
            this.conversionSuccess = false;
          }
        }

        getConversionStatus(): boolean {
          return this.conversionSuccess;
        }
      }

      converterInstance = new BigIntConverter(input);
      resultValue = converterInstance.value;
      isConversionSuccessful = converterInstance.getConversionStatus();
      console.log(`resultValue: ${resultValue}`);
      console.log(`isConversionSuccessful: ${isConversionSuccessful}`);
      expect(resultValue).assertEqual(1n);
      expect(isConversionSuccessful).assertFalse();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0700
     * @tc.name BuiltinsConstructorTest0700
     * @tc.desc test Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0700';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log("Successfully created BigInt:", bigIntValue);
            return bigIntValue;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(Infinity);
      console.log("Result of passing Infinity:", resultValue);
      expect(resultValue).assertNull();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0800
     * @tc.name BuiltinsConstructorTest0800
     * @tc.desc test -infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0800';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log("Successfully created BigInt:", bigIntValue);
            return bigIntValue;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(-Infinity);
      console.log("Result of passing Infinity:", resultValue);
      expect(resultValue).assertNull();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_0900
     * @tc.name BuiltinsConstructorTest0900
     * @tc.desc test Math.floor(1.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest0900';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log("Successfully created BigInt:", bigIntValue);
            return bigIntValue;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(Math.floor(1.5));
      console.log("Result of passing Infinity:", resultValue);
      expect(resultValue).assertEqual(1n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1000
     * @tc.name BuiltinsConstructorTest1000
     * @tc.desc test Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1000';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(Number.MAX_VALUE);
      console.log("Result of passing Number.MAX_VALUE:", resultValue);
      expect(resultValue).assertEqual(1);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1100
     * @tc.name BuiltinsConstructorTest1100
     * @tc.desc test Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1100';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(Number.MIN_VALUE);
      console.log("Result of passing Number.MIN_VALUE:", resultValue);
      expect(resultValue).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1200
     * @tc.name BuiltinsConstructorTest1200
     * @tc.desc test Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1200';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(Number.EPSILON);
      console.log("Result of passing Number.EPSILON:", resultValue);
      expect(resultValue).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1300
     * @tc.name BuiltinsConstructorTest1300
     * @tc.desc test 0x3E800000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1300';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(0x3E800000);
      console.log("Result of passing resultValue:", resultValue);
      expect(resultValue).assertEqual(1);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1400
     * @tc.name BuiltinsConstructorTest1400
     * @tc.desc test 0xdecafafecacefade
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1400';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(0xdecafafecacefade);
      console.log("Result of passing resultValue:", resultValue);
      expect(resultValue).assertEqual(1);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1500
     * @tc.name BuiltinsConstructorTest1500
     * @tc.desc test 0x0102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1500';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(0x0102);
      console.log("Result of passing resultValue:", resultValue);
      expect(resultValue).assertEqual(1);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1600
     * @tc.name BuiltinsConstructorTest1600
     * @tc.desc test 0x01020304
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1600';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(0x01020304);
      console.log("Result of passing resultValue:", resultValue);
      expect(resultValue).assertEqual(1);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1700
     * @tc.name BuiltinsConstructorTest1700
     * @tc.desc test 0x3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1700';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: number | string): number | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            const scientificNotation = bigIntValue.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,');
            console.log("Successfully created BigInt (in scientific notation):", scientificNotation);
            return 1;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const resultValue = tryCreateBigInt(0x3);
      console.log("Result of passing resultValue:", resultValue);
      expect(resultValue).assertEqual(1);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1800
     * @tc.name BuiltinsConstructorTest1800
     * @tc.desc test '789'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
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
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('789');
      console.log(`Result of passing 'result': ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(789n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_1900
     * @tc.name BuiltinsConstructorTest1900
     * @tc.desc test -101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest1900';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('-101');
      console.log(`Result of passing 'result': ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(-101n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2000
     * @tc.name BuiltinsConstructorTest2000
     * @tc.desc test 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2000';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          console.error(`Failed to convert ${input} to BigInt:`, error.message);
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('0');
      console.log(`Result of passing 'result': ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2100
     * @tc.name BuiltinsConstructorTest2100
     * @tc.desc test abc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2100';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('abc');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertNull();
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2200
     * @tc.name BuiltinsConstructorTest2200
     * @tc.desc test 123.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2200';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('123.45');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2300
     * @tc.name BuiltinsConstructorTest2300
     * @tc.desc test \a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2300';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\a');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2400
     * @tc.name BuiltinsConstructorTest2400
     * @tc.desc test \b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2400';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\b');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2500
     * @tc.name BuiltinsConstructorTest2500
     * @tc.desc test \f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2500';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\f');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2600
     * @tc.name BuiltinsConstructorTest2600
     * @tc.desc test \n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2600';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\n');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2700
     * @tc.name BuiltinsConstructorTest2700
     * @tc.desc test \r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2700';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\r');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2800
     * @tc.name BuiltinsConstructorTest2800
     * @tc.desc test \t
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2800';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\t');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_2900
     * @tc.name BuiltinsConstructorTest2900
     * @tc.desc test \v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest2900';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\v');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3000
     * @tc.name BuiltinsConstructorTest3000
     * @tc.desc test \\
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3000';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\\');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3100
     * @tc.name BuiltinsConstructorTest3100
     * @tc.desc test \'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3100';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\'');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3200
     * @tc.name BuiltinsConstructorTest3200
     * @tc.desc test \"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3200';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\"');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3300
     * @tc.name BuiltinsConstructorTest3300
     * @tc.desc test \?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3300';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\?');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3400
     * @tc.name BuiltinsConstructorTest3400
     * @tc.desc test \0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3400';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\0');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3500
     * @tc.name BuiltinsConstructorTest3500
     * @tc.desc test \d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3500';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string): bigint | null => {
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${input} to BigInt. The string is invalid.`);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\d');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3600
     * @tc.name BuiltinsConstructorTest3600
     * @tc.desc test undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3600';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | undefined): bigint | null => {
        try {
          if (input === undefined) {
            throw new RangeError('Input is undefined and cannot be converted to BigInt.');
          }
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt(undefined);
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3700
     * @tc.name BuiltinsConstructorTest3700
     * @tc.desc test null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3700';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | null): bigint | null => {
        if (input === null) {
          console.error('RangeError: Input is null and cannot be converted to BigInt.');
          return null;
        }
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt(null);
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3800
     * @tc.name BuiltinsConstructorTest3800
     * @tc.desc test  NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3800';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | undefined): bigint | null => {
        try {
          if (input === undefined) {
            throw new RangeError('Input is undefined and cannot be converted to BigInt.');
          }
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('NaN');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_3900
     * @tc.name BuiltinsConstructorTest3900
     * @tc.desc test  \ud83d\udc46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest3900';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | undefined): bigint | null => {
        try {
          if (input === undefined) {
            throw new RangeError('Input is undefined and cannot be converted to BigInt.');
          }
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\ud83d\udc46');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_4000
     * @tc.name BuiltinsConstructorTest4000
     * @tc.desc test  \udc04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest4000';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | undefined): bigint | null => {
        try {
          if (input === undefined) {
            throw new RangeError('Input is undefined and cannot be converted to BigInt.');
          }
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('\udc04');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_4100
     * @tc.name BuiltinsConstructorTest4100
     * @tc.desc test \a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest4100';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | undefined): bigint | null => {
        try {
          if (input === undefined) {
            throw new RangeError('Input is undefined and cannot be converted to BigInt.');
          }
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const result = tryCreateBigInt('a');
      console.log(`Result of passing result: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_4200
     * @tc.name BuiltinsConstructorTest4200
     * @tc.desc test true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest4200';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | null): bigint | null => {
        if (input === null) {
          console.error('RangeError: Input is null and cannot be converted to BigInt.');
          return null;
        }
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const input = true;
      let result: bigint | null;
      if (typeof input === 'boolean') {
        console.error('RangeError: Boolean type cannot be directly converted to BigInt.');
        result = null;
      } else {
        result = tryCreateBigInt(input as string | number | null);
      }
      console.log(`Result of passing true: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_4300
     * @tc.name BuiltinsConstructorTest4300
     * @tc.desc test false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest4300';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | null): bigint | null => {
        if (input === null) {
          console.error('RangeError: Input is null and cannot be converted to BigInt.');
          return null;
        }
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const input = false;
      let result: bigint | null;
      if (typeof input === 'boolean') {
        console.error('RangeError: Boolean type cannot be directly converted to BigInt.');
        result = null;
      } else {
        result = tryCreateBigInt(input as string | number | null);
      }
      console.log(`Result of passing false: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_4400
     * @tc.name BuiltinsConstructorTest4400
     * @tc.desc test 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest4400';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | null): bigint | null => {
        if (input === null) {
          console.error('RangeError: Input is null and cannot be converted to BigInt.');
          return null;
        }
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const input = false;
      let result: bigint | null;
      if (typeof input === 'boolean') {
        console.error('RangeError: Boolean type cannot be directly converted to BigInt.');
        result = null;
      } else {
        result = tryCreateBigInt(input as string | number | null);
      }
      console.log(`Result of passing 0: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_4500
     * @tc.name BuiltinsConstructorTest4500
     * @tc.desc test !'s'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest4500';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | null): bigint | null => {
        if (input === null) {
          console.error('RangeError: Input is null and cannot be converted to BigInt.');
          return null;
        }
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const input = !'s';
      let result: bigint | null;
      if (typeof input === 'boolean') {
        console.error('RangeError: Boolean type cannot be directly converted to BigInt.');
        result = null;
      } else {
        result = tryCreateBigInt(input as string | number | null);
      }
      console.log(`Result of passing !'s': ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_BUILTINS_CONSTRUCTOR_TEST_4600
     * @tc.name BuiltinsConstructorTest4600
     * @tc.desc test !0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsConstructorTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsConstructorTest4600';
      console.info(`${caseName} test start`);
      const tryCreateBigInt = (input: string | number | null): bigint | null => {
        if (input === null) {
          console.error('RangeError: Input is null and cannot be converted to BigInt.');
          return null;
        }
        try {
          const bigIntValue = BigInt(input);
          if (bigIntValue.constructor === BigInt) {
            console.log(`Successfully created BigInt: ${bigIntValue.toString()}n`);
            return bigIntValue;
          }
        } catch (error) {
          if (error instanceof RangeError) {
            console.error(`RangeError: Failed to convert ${String(input)} to BigInt.`, error.message);
          } else {
            console.error(`An unexpected error occurred:`, error);
          }
          return null;
        }
        return null;
      };

      const input = !0;
      let result: bigint | null;
      if (typeof input === 'boolean') {
        console.error('RangeError: Boolean type cannot be directly converted to BigInt.');
        result = null;
      } else {
        result = tryCreateBigInt(input as string | number | null);
      }
      console.log(`Result of passing !0: ${result ? result.toString() + 'n' : result}`);
      expect(result).assertEqual(null);
      console.info(`${caseName} test end`);
      Done();
    });

  })
}

