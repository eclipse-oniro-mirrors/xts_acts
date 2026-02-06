import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

interface INumDenObj {
  num: number;
  den: number;
}

class RationalNumber {
  private readonly _numerator: number;
  private readonly _denominator: number;

  constructor(numerator: number, denominator: number) {
    if (!Number.isInteger(numerator)) {
      throw new Error("Numerator must be an integer");
    }
    if (!Number.isInteger(denominator)) {
      throw new Error("Denominator must be an integer");
    }
    if (denominator === 0) {
      throw new Error("Denominator cannot be zero");
    }
    let adjustedNumerator = numerator;
    let adjustedDenominator = denominator;
    if (adjustedDenominator < 0) {
      adjustedNumerator = -adjustedNumerator;
      adjustedDenominator = -adjustedDenominator;
    }
    const gcdValue = this.gcd(Math.abs(adjustedNumerator), adjustedDenominator);
    this._numerator = adjustedNumerator / gcdValue;
    this._denominator = adjustedDenominator / gcdValue;
  }

  get numerator(): number {
    return this._numerator;
  }

  get denominator(): number {
    return this._denominator;
  }

  add(other: RationalNumber): RationalNumber {
    const newNumerator = this.numerator * other.denominator + other.numerator * this.denominator;
    const newDenominator = this.denominator * other.denominator;
    return new RationalNumber(newNumerator, newDenominator);
  }

  subtract(other: RationalNumber): RationalNumber {
    const newNumerator = this.numerator * other.denominator - other.numerator * this.denominator;
    const newDenominator = this.denominator * other.denominator;
    return new RationalNumber(newNumerator, newDenominator);
  }

  multiply(other: RationalNumber): RationalNumber {
    const newNumerator = this.numerator * other.numerator;
    const newDenominator = this.denominator * other.denominator;
    return new RationalNumber(newNumerator, newDenominator);
  }

  divide(other: RationalNumber): RationalNumber {
    if (other.numerator === 0) {
      throw new Error("Cannot divide by zero");
    }
    const newNumerator = this.numerator * other.denominator;
    const newDenominator = this.denominator * other.numerator;
    return new RationalNumber(newNumerator, newDenominator);
  }

  equals(other: RationalNumber): boolean {
    return this.numerator === other.numerator && this.denominator === other.denominator;
  }

  toString(): string {
    if (this.numerator === 0) {
      return "0";
    }
    if (this.denominator === 1) {
      return this.numerator.toString();
    }
    return `${this.numerator}/${this.denominator}`;
  }

  private gcd(a: number, b: number): number {
    let numA = a;
    let numB = b;
    while (numB !== 0) {
      const temp = numB;
      numB = numA % numB;
      numA = temp;
    }
    return numA;
  }
}


export default function RationalNumberTest() {
  describe('RationalNumberTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number    SUB_RATIONAL_CONSTRUCTOR_NUM_STRING_0100
     * @tc.name      testRationalConstructorNumeratorString0001
     * @tc.desc      Constructor throws error when numerator is string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalConstructorNumeratorString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalConstructorNumeratorString0001';
        console.log(TAG + ' start');
        try {
          new RationalNumber(Number("not_a_number"), 2);
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_CONSTRUCTOR_NUM_FLOAT_0200
     * @tc.name      testRationalConstructorNumeratorFloat0002
     * @tc.desc      Constructor throws error when numerator is float.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalConstructorNumeratorFloat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalConstructorNumeratorFloat0002';
        console.log(TAG + ' start');
        try {
          new RationalNumber(3.14, 2);
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_CONSTRUCTOR_NUM_NULL_0400
     * @tc.name      testRationalConstructorNumeratorNull0004
     * @tc.desc      Constructor throws error when numerator is non-integer (null converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalConstructorNumeratorNull0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalConstructorNumeratorNull0004';
        console.log(TAG + ' start');
        try {
          new RationalNumber(Number(undefined), 2);
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_CONSTRUCTOR_DENOM_OBJ_0700
     * @tc.name      testRationalConstructorDenominatorObject0007
     * @tc.desc      Constructor throws error when denominator is object (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalConstructorDenominatorObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalConstructorDenominatorObject0007';
        console.log(TAG + ' start');
        try {
          const obj: INumDenObj = { num: 1, den: 3 };
          new RationalNumber(3, Number(obj));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Denominator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_CONSTRUCTOR_DENOM_ARRAY_0800
     * @tc.name      testRationalConstructorDenominatorArray0008
     * @tc.desc      Constructor throws error when denominator is array (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalConstructorDenominatorArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalConstructorDenominatorArray0008';
        console.log(TAG + ' start');
        try {
          new RationalNumber(3, Number([1, 2]));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Denominator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_CONSTRUCTOR_NUM_BIGINT_0900
     * @tc.name      testRationalConstructorNumeratorBigInt0009
     * @tc.desc      Constructor throws error when numerator is BigInt (converted to float).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalConstructorNumeratorBigInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalConstructorNumeratorBigInt0009';
        console.log(TAG + ' start');
        try {
          new RationalNumber(Number(100n) + 0.1, 2);
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_ADD_STRING_1100
     * @tc.name      testRationalAddString0011
     * @tc.desc      Add method throws error when parameter is string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalAddString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalAddString0011';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.add(new RationalNumber(Number("1/3"), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_ADD_NULL_1200
     * @tc.name      testRationalAddNull0012
     * @tc.desc      Add method throws error when parameter is null (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalAddNull0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalAddNull0012';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.add(new RationalNumber(Number(undefined), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_ADD_ARRAY_1300
     * @tc.name      testRationalAddArray0013
     * @tc.desc      Add method throws error when parameter is array (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalAddArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalAddArray0013';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.add(new RationalNumber(Number([1, 2]), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_SUB_UNDEF_1500
     * @tc.name      testRationalSubtractUndefined0015
     * @tc.desc      Subtract method throws error when parameter is undefined (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalSubtractUndefined0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalSubtractUndefined0015';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.subtract(new RationalNumber(Number(undefined), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_SUB_OBJ_1600
     * @tc.name      testRationalSubtractObject0016
     * @tc.desc      Subtract method throws error when parameter is object (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalSubtractObject0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalSubtractObject0016';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          const obj: INumDenObj = { num: 1, den: 3 };
          rationalNumber.subtract(new RationalNumber(Number(obj), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_MUL_BOOLEAN_1700
     * @tc.name      testRationalMultiplyBoolean0017
     * @tc.desc      Multiply method throws error when parameter is boolean (converted to float).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalMultiplyBoolean0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalMultiplyBoolean0017';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.multiply(new RationalNumber(Number(false) + 0.2, 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_MUL_BIGINT_1800
     * @tc.name      testRationalMultiplyBigInt0018
     * @tc.desc      Multiply method throws error when parameter is BigInt (converted to float).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalMultiplyBigInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalMultiplyBigInt0018';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.multiply(new RationalNumber(Number(3n) + 0.3, 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_DIV_NULL_2000
     * @tc.name      testRationalDivideNull0020
     * @tc.desc      Divide method throws error when parameter is null (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalDivideNull0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalDivideNull0020';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.divide(new RationalNumber(Number(undefined), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_DIV_ZERO_2100
     * @tc.name      testRationalDivideZero0021
     * @tc.desc      Divide method throws error when parameter is zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalDivideZero0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalDivideZero0021';
        console.log(TAG + ' start');
        try {
          const dividend = new RationalNumber(1, 2);
          const divisor = new RationalNumber(0, 1);
          dividend.divide(divisor);
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Cannot divide by zero");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_DIV_STRING_2200
     * @tc.name      testRationalDivideString0022
     * @tc.desc      Divide method throws error when parameter is string (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalDivideString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalDivideString0022';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.divide(new RationalNumber(Number("0a"), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_DIV_ARRAY_2300
     * @tc.name      testRationalDivideArray0023
     * @tc.desc      Divide method throws error when parameter is array (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalDivideArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalDivideArray0023';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.divide(new RationalNumber(Number([0, 1]), 1));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_EQUALS_OBJ_2400
     * @tc.name      testRationalEqualsObject0024
     * @tc.desc      Equals method returns true when parameter has same numerator and denominator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalEqualsObject0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalEqualsObject0024';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          const other = new RationalNumber(1, 2);
          const result = rationalNumber.equals(other);
          expect(result).assertTrue();
        } catch (err) {
          console.error(err);
        }

      });

    /**
     * @tc.number    SUB_RATIONAL_EQUALS_ARRAY_2500
     * @tc.name      testRationalEqualsArray0025
     * @tc.desc      Equals method throws error when parameter is array (converted to NaN).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalEqualsArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalEqualsArray0025';
        console.log(TAG + ' start');
        try {
          const rationalNumber = new RationalNumber(1, 2);
          rationalNumber.equals(new RationalNumber(Number([1, 2]), 2));
          expect(true).assertFalse();
        } catch (err) {
          expect((err as Error).message).assertEqual("Numerator must be an integer");
        }

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_DIVIDEONE_2600
     * @tc.name      testRationalNumberDivideOne0026
     * @tc.desc      Divide 3/2 by 1/1 to get 3/2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberDivideOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberDivideOne0026';
        console.log(TAG + ' start');
        const dividend = new RationalNumber(3, 2);
        const divisor = new RationalNumber(1, 1);
        const result = dividend.divide(divisor);
        expect(result.numerator).assertEqual(3);
        expect(result.denominator).assertEqual(2);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_EQUALSREDUCE_2700
     * @tc.name      testRationalNumberEqualsReduce0027
     * @tc.desc      Check 6/8 equals 3/4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberEqualsReduce0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberEqualsReduce0027';
        console.log(TAG + ' start');
        const unreduced = new RationalNumber(6, 8);
        const reduced = new RationalNumber(3, 4);
        expect(unreduced.equals(reduced)).assertTrue();

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_COMPLEXOP_2800
     * @tc.name      testRationalNumberComplexOp0028
     * @tc.desc      Complex operation (1/2 + 1/3) * 2/5 = 1/3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberComplexOp0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberComplexOp0028';
        console.log(TAG + ' start');
        const first = new RationalNumber(1, 2);
        const second = new RationalNumber(1, 3);
        const factor = new RationalNumber(2, 5);
        const result = first.add(second).multiply(factor);
        expect(result.numerator).assertEqual(1);
        expect(result.denominator).assertEqual(3);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_TOSTRINGINTEGER_2900
     * @tc.name      testRationalNumberToStringInteger0029
     * @tc.desc      ToString returns "5" for 5/1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToStringInteger0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberToStringInteger0029';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(5, 1);
        expect(rationalNumber.toString()).assertEqual("5");

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_TOSTRINGZERO_3000
     * @tc.name      testRationalNumberToStringZero0030
     * @tc.desc      ToString returns "0" for 0/5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberToStringZero0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberToStringZero0030';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(0, 5);
        expect(rationalNumber.toString()).assertEqual("0");

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_NOTEQUALS_3100
     * @tc.name      testRationalNumberNotEquals0031
     * @tc.desc      Check 1/2 not equals 1/3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberNotEquals0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberNotEquals0031';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(1, 3);
        expect(leftOperand.equals(rightOperand)).assertFalse();

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_DIVIDENEGATIVE_3200
     * @tc.name      testRationalNumberDivideNegative0032
     * @tc.desc      Divide 1/2 by -2/3 to get -3/4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberDivideNegative0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberDivideNegative0032';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(-2, 3);
        const result = leftOperand.divide(rightOperand);
        expect(result.numerator).assertEqual(-3);
        expect(result.denominator).assertEqual(4);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_MULTIPLYNEGATIVE_3300
     * @tc.name      testRationalNumberMultiplyNegative0033
     * @tc.desc      Multiply 1/2 and -2/3 to get -1/3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberMultiplyNegative0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberMultiplyNegative0033';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(-2, 3);
        const result = leftOperand.multiply(rightOperand);
        expect(result.numerator).assertEqual(-1);
        expect(result.denominator).assertEqual(3);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_SUBTRACTNEGATIVE_3400
     * @tc.name      testRationalNumberSubtractNegative0034
     * @tc.desc      Subtract -1/3 from 1/2 to get 5/6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberSubtractNegative0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberSubtractNegative0034';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(-1, 3);
        const result = leftOperand.subtract(rightOperand);
        expect(result.numerator).assertEqual(5);
        expect(result.denominator).assertEqual(6);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_ADDNEGATIVE_3500
     * @tc.name      testRationalNumberAddNegative0035
     * @tc.desc      Add 1/2 and -1/3 to get 1/6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberAddNegative0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberAddNegative0035';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(-1, 3);
        const result = leftOperand.add(rightOperand);
        expect(result.numerator).assertEqual(1);
        expect(result.denominator).assertEqual(6);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_BOTHNEGATIVE_3600
     * @tc.name      testRationalNumberBothNegative0036
     * @tc.desc      Constructor converts -3/-4 to 3/4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberBothNegative0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberBothNegative0036';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(-3, -4);
        expect(rationalNumber.numerator).assertEqual(3);
        expect(rationalNumber.denominator).assertEqual(4);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_NEGATIVEDENOMINATOR_3700
     * @tc.name      testRationalNumberNegativeDenominator0037
     * @tc.desc      Constructor converts 3/-4 to -3/4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberNegativeDenominator0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberNegativeDenominator0037';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(3, -4);
        expect(rationalNumber.numerator).assertEqual(-3);
        expect(rationalNumber.denominator).assertEqual(4);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_NEGATIVENUMERATOR_3800
     * @tc.name      testRationalNumberNegativeNumerator0038
     * @tc.desc      Create RationalNumber with -3/4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberNegativeNumerator0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberNegativeNumerator0038';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(-3, 4);
        expect(rationalNumber.numerator).assertEqual(-3);
        expect(rationalNumber.denominator).assertEqual(4);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_DENOMINATORONE_3900
     * @tc.name      testRationalNumberDenominatorOne0039
     * @tc.desc      Create RationalNumber with 5/1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberDenominatorOne0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberDenominatorOne0039';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(5, 1);
        expect(rationalNumber.numerator).assertEqual(5);
        expect(rationalNumber.denominator).assertEqual(1);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_EQUALS_4300
     * @tc.name      testRationalNumberEquals0043
     * @tc.desc      Check 1/2 equals 2/4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberEquals0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberEquals0043';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(2, 4);
        expect(leftOperand.equals(rightOperand)).assertTrue();

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_DIVIDE_4400
     * @tc.name      testRationalNumberDivide0044
     * @tc.desc      Divide 1/2 by 2/3 to get 3/4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberDivide0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberDivide0044';
        console.log(TAG + ' start');
        const dividend = new RationalNumber(1, 2);
        const divisor = new RationalNumber(2, 3);
        const result = dividend.divide(divisor);
        expect(result.numerator).assertEqual(3);
        expect(result.denominator).assertEqual(4);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_MULTIPLY_4500
     * @tc.name      testRationalNumberMultiply0045
     * @tc.desc      Multiply 1/2 and 2/3 to get 1/3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberMultiply0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberMultiply0045';
        console.log(TAG + ' start');
        const multiplicand = new RationalNumber(1, 2);
        const multiplier = new RationalNumber(2, 3);
        const result = multiplicand.multiply(multiplier);
        expect(result.numerator).assertEqual(1);
        expect(result.denominator).assertEqual(3);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_SUBTRACT_4600
     * @tc.name      testRationalNumberSubtract0046
     * @tc.desc      Subtract 1/3 from 1/2 to get 1/6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberSubtract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberSubtract0046';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(1, 3);
        const result = leftOperand.subtract(rightOperand);
        expect(result.numerator).assertEqual(1);
        expect(result.denominator).assertEqual(6);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_ADD_4700
     * @tc.name      testRationalNumberAdd0047
     * @tc.desc      Add 1/2 and 1/3 to get 5/6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberAdd0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberAdd0047';
        console.log(TAG + ' start');
        const leftOperand = new RationalNumber(1, 2);
        const rightOperand = new RationalNumber(1, 3);
        const result = leftOperand.add(rightOperand);
        expect(result.numerator).assertEqual(5);
        expect(result.denominator).assertEqual(6);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_GETDENOMINATOR_4800
     * @tc.name      testRationalNumberGetDenominator0048
     * @tc.desc      Get correct denominator from 1/2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberGetDenominator0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberGetDenominator0048';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(1, 2);
        expect(rationalNumber.denominator).assertEqual(2);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_GETNUMERATOR_4900
     * @tc.name      testRationalNumberGetNumerator0049
     * @tc.desc      Get correct numerator from 1/2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberGetNumerator0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberGetNumerator0049';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(1, 2);
        expect(rationalNumber.numerator).assertEqual(1);

      });

    /**
     * @tc.number    SUB_RATIONALNUMBER_CONSTRUCTOR_5000
     * @tc.name      testRationalNumberConstructor0050
     * @tc.desc      Create normal RationalNumber with 1/2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRationalNumberConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'testRationalNumberConstructor0050';
        console.log(TAG + ' start');
        const rationalNumber = new RationalNumber(1, 2);
        expect(rationalNumber !== null).assertTrue();
        expect(rationalNumber.numerator === 1 && rationalNumber.denominator === 2).assertTrue();

      });
  });
}