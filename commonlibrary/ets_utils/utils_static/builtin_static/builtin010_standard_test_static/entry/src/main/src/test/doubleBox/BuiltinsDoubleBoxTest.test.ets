import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsDoubleBoxTest() {
  describe('BuiltinsDoubleBoxTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name  builtinsDoubleBoxTest0001
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0001
     * @tc.desc  Test default constructor initializes value to 0.0 and get() returns consistent value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox();

      expect(doubleBox.get()).assertEqual(0.0);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0002
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0002
     * @tc.desc  Test default constructor value within double range
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox();
      const minValue = -1.7976931348623157e+308;
      const maxValue = 1.7976931348623157e+308;

      expect(doubleBox.get()).assertLargerOrEqual(minValue);
      expect(doubleBox.get()).assertLessOrEqual(maxValue);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0003
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0003
     * @tc.desc  Test default constructor with set() method after initialization
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox();
      expect(doubleBox.get()).assertEqual(0.0);

      doubleBox.set(10.5);
      expect(doubleBox.get()).assertEqual(10.5);

      doubleBox.set(-5.25);
      expect(doubleBox.get()).assertEqual(-5.25);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0004
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0004
     * @tc.desc  Test parameterized constructor with typical positive decimal (e.g., 10.5)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = 10.5;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0005
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0005
     * @tc.desc  Test parameterized constructor with typical negative decimal (e.g., -5.25)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = -5.25;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0006
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0006
     * @tc.desc  Test parameterized constructor with zero value (0.0)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = 0.0;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0007
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0007
     * @tc.desc  Test parameterized constructor with maximum value (Number.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.MAX_VALUE;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0008
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0008
     * @tc.desc  Test parameterized constructor with minimum positive value (Number.MIN_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minValue = Number.MIN_VALUE;
      const doubleBox = new DoubleBox(minValue);

      expect(doubleBox.get()).assertEqual(minValue);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0009
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0009
     * @tc.desc  Test parameterized constructor with positive infinity (Number.POSITIVE_INFINITY)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.POSITIVE_INFINITY;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertPosUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0010
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0010
     * @tc.desc  Test parameterized constructor with negative infinity (Number.NEGATIVE_INFINITY)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.NEGATIVE_INFINITY;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertNegUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0011
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0011
     * @tc.desc  Test parameterized constructor with NaN value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = NaN;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertNaN();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0012
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0012
     * @tc.desc  Test static box method with typical positive decimal (10.5)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = DoubleBox.box(10.5);

      expect(doubleBox.get()).assertEqual(10.5);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0013
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0013
     * @tc.desc  Test static box method with typical negative decimal (-5.25)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = DoubleBox.box(-5.25);

      expect(doubleBox.get()).assertEqual(-5.25);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0014
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0014
     * @tc.desc  Test static box method with zero value (0.0)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = DoubleBox.box(0.0);

      expect(doubleBox.get()).assertEqual(0.0);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0015
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0015
     * @tc.desc  Test static box method with maximum value (Number.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.MAX_VALUE;
      const doubleBox = DoubleBox.box(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0016
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0016
     * @tc.desc  Test static box method with maximum negative value (-Number.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = -Number.MAX_VALUE;
      const doubleBox = DoubleBox.box(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0017
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0017
     * @tc.desc  Test static box method with positive infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.POSITIVE_INFINITY;
      const doubleBox = DoubleBox.box(value);

      expect(doubleBox.get()).assertPosUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0018
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0018
     * @tc.desc  Test static box method with negative infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.NEGATIVE_INFINITY;
      const doubleBox = DoubleBox.box(value);

      expect(doubleBox.get()).assertNegUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0019
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0019
     * @tc.desc  Test static box method with NaN value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = DoubleBox.box(NaN);

      expect(doubleBox.get()).assertNaN();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0020
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0020
     * @tc.desc  Test static box method with minimum positive value (Number.MIN_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minValue = Number.MIN_VALUE;
      const doubleBox = DoubleBox.box(minValue);

      expect(doubleBox.get()).assertEqual(minValue);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0021
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0021
     * @tc.desc  Test get() method returns typical positive decimal (10.5)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(10.5);

      expect(doubleBox.get()).assertEqual(10.5);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0022
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0022
     * @tc.desc  Test get() method returns typical negative decimal (-5.25)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(-5.25);

      expect(doubleBox.get()).assertEqual(-5.25);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0023
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0023
     * @tc.desc  Test get() method returns zero value (0.0)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0.0);

      expect(doubleBox.get()).assertEqual(0.0);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0024
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0024
     * @tc.desc  Test get() method returns maximum value (Number.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.MAX_VALUE;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0025
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0025
     * @tc.desc  Test get() method returns minimum positive value (Number.MIN_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = Number.MIN_VALUE;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0026
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0026
     * @tc.desc  Test get() method returns positive infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(Number.POSITIVE_INFINITY);

      expect(doubleBox.get()).assertPosUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0027
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0027
     * @tc.desc  Test get() method returns negative infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(Number.NEGATIVE_INFINITY);

      expect(doubleBox.get()).assertNegUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0028
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0028
     * @tc.desc  Test get() method returns NaN
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(NaN);

      expect(doubleBox.get()).assertNaN();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0029
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0029
     * @tc.desc  Test get() method returns negative zero value (-0.0)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(-0.0);

      expect(doubleBox.get()).assertEqual(-0.0);
      expect(1 / doubleBox.get()).assertNegUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0030
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0030
     * @tc.desc  Test get() method returns negative maximum value (-Number.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = -Number.MAX_VALUE;
      const doubleBox = new DoubleBox(value);

      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0031
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0031
     * @tc.desc  Test get() method returns correct value after set() call
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0.0);
      doubleBox.set(20.5);

      expect(doubleBox.get()).assertEqual(20.5);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0032
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0032
     * @tc.desc  Test set() method with typical positive decimal (10.5)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const result = doubleBox.set(10.5);

      expect(result).assertEqual(10.5);
      expect(doubleBox.get()).assertEqual(10.5);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0033
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0033
     * @tc.desc  Test set() method with typical negative decimal (-5.25)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const result = doubleBox.set(-5.25);

      expect(result).assertEqual(-5.25);
      expect(doubleBox.get()).assertEqual(-5.25);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0034
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0034
     * @tc.desc  Test set() method with zero value (0.0)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const result = doubleBox.set(0.0);

      expect(result).assertEqual(0.0);
      expect(doubleBox.get()).assertEqual(0.0);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0035
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0035
     * @tc.desc  Test set() method with maximum value (Number.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const value = Number.MAX_VALUE;
      const result = doubleBox.set(value);

      expect(result).assertEqual(value);
      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0036
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0036
     * @tc.desc  Test set() method with minimum positive value (Number.MIN_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const value = Number.MIN_VALUE;
      const result = doubleBox.set(value);

      expect(result).assertEqual(value);
      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0037
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0037
     * @tc.desc  Test set() method with positive infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const value = Number.POSITIVE_INFINITY;
      const result = doubleBox.set(value);

      expect(result).assertPosUnlimited();
      expect(doubleBox.get()).assertPosUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0038
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0038
     * @tc.desc  Test set() method with negative infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const value = Number.NEGATIVE_INFINITY;
      const result = doubleBox.set(value);

      expect(result).assertNegUnlimited();
      expect(doubleBox.get()).assertNegUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0039
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0039
     * @tc.desc  Test set() method with NaN value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const result = doubleBox.set(NaN);

      expect(result).assertNaN();
      expect(doubleBox.get()).assertNaN();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0040
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0040
     * @tc.desc  Test set() method with negative zero value (-0.0)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const result = doubleBox.set(-0.0);

      expect(result).assertEqual(-0.0);
      expect(1 / result).assertNegUnlimited();
      expect(doubleBox.get()).assertEqual(-0.0);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0041
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0041
     * @tc.desc  Test set() method with negative maximum value (-Number.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const value = -Number.MAX_VALUE;
      const result = doubleBox.set(value);

      expect(result).assertEqual(value);
      expect(doubleBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0042
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0042
     * @tc.desc  Test set() method with overflow value (Number.MAX_VALUE * 1.01)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const value = Number.MAX_VALUE * 1.01;
      const result = doubleBox.set(value);

      expect(result).assertPosUnlimited();
      expect(doubleBox.get()).assertPosUnlimited();
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0043
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0043
     * @tc.desc  Test set() method with precision loss scenario (0.1 + 0.2)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);
      const value = 0.1 + 0.2;
      const result = doubleBox.set(value);

      expect(result).assertEqual(value);
      expect(doubleBox.get()).assertEqual(value);
      expect(result).assertLarger(0.3);
      expect(result).assertLess(0.3000000000000001);
    });

    /**
     * @tc.name  builtinsDoubleBoxTest0044
     * @tc.number  BUILTINS_DOUBLE_BOX_TEST_0044
     * @tc.desc  Test set() method with repeated calls (cover old value)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsDoubleBoxTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleBox = new DoubleBox(0);

      const firstResult = doubleBox.set(10.0);
      expect(firstResult).assertEqual(10.0);
      expect(doubleBox.get()).assertEqual(10.0);

      const secondResult = doubleBox.set(20.0);
      expect(secondResult).assertEqual(20.0);
      expect(doubleBox.get()).assertEqual(20.0);
    });
  });
}