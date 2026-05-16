import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsIntBoxTest() {
  describe('BuiltinsIntBoxTest', () => {
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
     * @tc.name  builtinsIntBoxTest0001
     * @tc.number  BUILTINS_INT_BOX_TEST_0001
     * @tc.desc  Test default constructor initializes value to 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = new IntBox();
      expect(intBox.get()).assertEqual(0);
    });

    /**
     * @tc.name  builtinsIntBoxTest0002
     * @tc.number  BUILTINS_INT_BOX_TEST_0002
     * @tc.desc  Test default constructor value within int range (-2147483648 to 2147483647)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = new IntBox();
      const minValue = -2147483648;
      const maxValue = 2147483647;

      expect(intBox.get()).assertLargerOrEqual(minValue);
      expect(intBox.get()).assertLessOrEqual(maxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0003
     * @tc.number  BUILTINS_INT_BOX_TEST_0003
     * @tc.desc  Test default constructor with set() method after initialization
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = new IntBox();
      expect(intBox.get()).assertEqual(0);

      intBox.set(10);
      expect(intBox.get()).assertEqual(10);

      intBox.set(-5);
      expect(intBox.get()).assertEqual(-5);
    });

    /**
     * @tc.name  builtinsIntBoxTest0004
     * @tc.number  BUILTINS_INT_BOX_TEST_0004
     * @tc.desc  Test constructor with value 10 (positive number)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = new IntBox(10);
      expect(intBox.get()).assertEqual(10);
    });

    /**
     * @tc.name  builtinsIntBoxTest0005
     * @tc.number  BUILTINS_INT_BOX_TEST_0005
     * @tc.desc  Test constructor with min int value (-2147483648)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minValue = -2147483648;
      const intBox = new IntBox(minValue);
      expect(intBox.get()).assertEqual(minValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0006
     * @tc.number  BUILTINS_INT_BOX_TEST_0006
     * @tc.desc  Test constructor with max int value (2147483647)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxValue = 2147483647;
      const intBox = new IntBox(maxValue);
      expect(intBox.get()).assertEqual(maxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0007
     * @tc.number  BUILTINS_INT_BOX_TEST_0007
     * @tc.desc  Test constructor with value 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = new IntBox(0);
      expect(intBox.get()).assertEqual(0);
    });

    /**
     * @tc.name  builtinsIntBoxTest0008
     * @tc.number  BUILTINS_INT_BOX_TEST_0008
     * @tc.desc  Test constructor with negative value (-5)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = new IntBox(-5);
      expect(intBox.get()).assertEqual(-5);
    });

    /**
     * @tc.name  builtinsIntBoxTest0009
     * @tc.number  BUILTINS_INT_BOX_TEST_0009
     * @tc.desc  Test constructor with middle value (123456)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = 123456;
      const intBox = new IntBox(value);
      expect(intBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsIntBoxTest0010
     * @tc.number  BUILTINS_INT_BOX_TEST_0010
     * @tc.desc  Test static method box with value 10
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = IntBox.box(10);
      expect(intBox.get()).assertEqual(10);
    });

    /**
     * @tc.name  builtinsIntBoxTest0011
     * @tc.number  BUILTINS_INT_BOX_TEST_0011
     * @tc.desc  Test static method box with min int value (-2147483648)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minValue = -2147483648;
      const intBox = IntBox.box(minValue);
      expect(intBox.get()).assertEqual(minValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0012
     * @tc.number  BUILTINS_INT_BOX_TEST_0012
     * @tc.desc  Test static method box with max int value (2147483647)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxValue = 2147483647;
      const intBox = IntBox.box(maxValue);
      expect(intBox.get()).assertEqual(maxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0013
     * @tc.number  BUILTINS_INT_BOX_TEST_0013
     * @tc.desc  Test static method box with value 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = IntBox.box(0);
      expect(intBox.get()).assertEqual(0);
    });

    /**
     * @tc.name  builtinsIntBoxTest0014
     * @tc.number  BUILTINS_INT_BOX_TEST_0014
     * @tc.desc  Test static method box with negative value (-5)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intBox = IntBox.box(-5);
      expect(intBox.get()).assertEqual(-5);
    });

    /**
     * @tc.name  builtinsIntBoxTest0015
     * @tc.number  BUILTINS_INT_BOX_TEST_0015
     * @tc.desc  Test static method box with middle value (123456)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value = 123456;
      const intBox = IntBox.box(value);
      expect(intBox.get()).assertEqual(value);
    });

    /**
     * @tc.name  builtinsIntBoxTest0016
     * @tc.number  BUILTINS_INT_BOX_TEST_0016
     * @tc.desc  Test static method box creates new instance
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box1 = IntBox.box(5);
      const box2 = IntBox.box(5);
      expect(box1 == box2).assertFalse();
    });

    /**
     * @tc.name  builtinsIntBoxTest0017
     * @tc.number  BUILTINS_INT_BOX_TEST_0017
     * @tc.desc  Test get() returns value set in constructor
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(10);

      expect(box.get()).assertEqual(10);
    });

    /**
     * @tc.name  builtinsIntBoxTest0018
     * @tc.number  BUILTINS_INT_BOX_TEST_0018
     * @tc.desc  Test get() returns min int value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minValue = -2147483648;
      const box = new IntBox(minValue);

      expect(box.get()).assertEqual(minValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0019
     * @tc.number  BUILTINS_INT_BOX_TEST_0019
     * @tc.desc  Test get() returns max int value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxValue = 2147483647;
      const box = new IntBox(maxValue);

      expect(box.get()).assertEqual(maxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0020
     * @tc.number  BUILTINS_INT_BOX_TEST_0020
     * @tc.desc  Test get() returns 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);

      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.name  builtinsIntBoxTest0021
     * @tc.number  BUILTINS_INT_BOX_TEST_0021
     * @tc.desc  Test get() returns negative value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(-5);

      expect(box.get()).assertEqual(-5);
    });

    /**
     * @tc.name  builtinsIntBoxTest0022
     * @tc.number  BUILTINS_INT_BOX_TEST_0022
     * @tc.desc  Test get() returns max int -1 value (critical value)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const criticalMaxValue = 2147483646;
      const box = new IntBox(criticalMaxValue);

      expect(box.get()).assertEqual(criticalMaxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0023
     * @tc.number  BUILTINS_INT_BOX_TEST_0023
     * @tc.desc  Test get() returns min int +1 value (critical value)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const criticalMinValue = -2147483647;
      const box = new IntBox(criticalMinValue);

      expect(box.get()).assertEqual(criticalMinValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0024
     * @tc.number  BUILTINS_INT_BOX_TEST_0024
     * @tc.desc  Test get() returns value after set() call
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      box.set(200);

      expect(box.get()).assertEqual(200);
    });

    /**
     * @tc.name  builtinsIntBoxTest0025
     * @tc.number  BUILTINS_INT_BOX_TEST_0025
     * @tc.desc  Test get() returns last set value after repeated set()
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      box.set(50);
      box.set(150);

      expect(box.get()).assertEqual(150);
    });

    /**
     * @tc.name  builtinsIntBoxTest0026
     * @tc.number  BUILTINS_INT_BOX_TEST_0026
     * @tc.desc  Test set() returns new value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const newValue = 10;

      expect(box.set(newValue)).assertEqual(newValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0027
     * @tc.number  BUILTINS_INT_BOX_TEST_0027
     * @tc.desc  Test set() with min int value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const minValue = -2147483648;

      expect(box.set(minValue)).assertEqual(minValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0028
     * @tc.number  BUILTINS_INT_BOX_TEST_0028
     * @tc.desc  Test set() with max int value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const maxValue = 2147483647;

      expect(box.set(maxValue)).assertEqual(maxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0029
     * @tc.number  BUILTINS_INT_BOX_TEST_0029
     * @tc.desc  Test set() with value 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);

      expect(box.set(0)).assertEqual(0);
    });

    /**
     * @tc.name  builtinsIntBoxTest0030
     * @tc.number  BUILTINS_INT_BOX_TEST_0030
     * @tc.desc  Test set() with negative value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);

      expect(box.set(-5)).assertEqual(-5);
    });

    /**
     * @tc.name  builtinsIntBoxTest0031
     * @tc.number  BUILTINS_INT_BOX_TEST_0031
     * @tc.desc  Test set() returns value and get() reflects it
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const newValue = 100;

      expect(box.set(newValue)).assertEqual(newValue);
      expect(box.get()).assertEqual(newValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0032
     * @tc.number  BUILTINS_INT_BOX_TEST_0032
     * @tc.desc  Test set() with value exceeds max int (2147483647 + 1)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const criticalMaxValue = 2147483646;

      expect(box.set(criticalMaxValue)).assertEqual(criticalMaxValue);
      expect(box.get()).assertEqual(criticalMaxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0033
     * @tc.number  BUILTINS_INT_BOX_TEST_0033
     * @tc.desc  Test set() with value below min int (-2147483648 - 1)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const criticalMinValue = -2147483647;

      expect(box.set(criticalMinValue)).assertEqual(criticalMinValue);
      expect(box.get()).assertEqual(criticalMinValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0034
     * @tc.number  BUILTINS_INT_BOX_TEST_0034
     * @tc.desc  Test set() with critical value (max int - 1)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const criticalMaxValue = 2147483646;
      expect(box.set(criticalMaxValue)).assertEqual(criticalMaxValue);
      expect(box.get()).assertEqual(criticalMaxValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0035
     * @tc.number  BUILTINS_INT_BOX_TEST_0035
     * @tc.desc  Test set() with critical value (min int + 1)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);
      const criticalMinValue = -2147483647;
      expect(box.set(criticalMinValue)).assertEqual(criticalMinValue);
      expect(box.get()).assertEqual(criticalMinValue);
    });

    /**
     * @tc.name  builtinsIntBoxTest0036
     * @tc.number  BUILTINS_INT_BOX_TEST_0036
     * @tc.desc  Test repeated set() covers old value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsIntBoxTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new IntBox(0);

      box.set(50);
      expect(box.get()).assertEqual(50);

      const secondValue = 150;
      expect(box.set(secondValue)).assertEqual(secondValue);
      expect(box.get()).assertEqual(secondValue);
    });
  });
}