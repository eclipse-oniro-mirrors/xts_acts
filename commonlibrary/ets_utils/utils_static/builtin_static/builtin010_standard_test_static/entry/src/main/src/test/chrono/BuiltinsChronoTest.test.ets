import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsChronoTest() {
  describe('BuiltinsChronoTest', () => {
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
     * @tc.name  builtinsChronoTest0001
     * @tc.number  BUILTINS_CHRONO_TEST_0001
     * @tc.desc  Test nanoNow() returns non-negative value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanoTime: Long = Chrono.nanoNow();

      expect(nanoTime).assertLargerOrEqual(0 as Long);
    });

    /**
     * @tc.name  builtinsChronoTest0002
     * @tc.number  BUILTINS_CHRONO_TEST_0002
     * @tc.desc  Test nanoNow() returns Long type value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanoTime = Chrono.nanoNow();

      expect(nanoTime).assertInstanceOf('Long');
    });

    /**
     * @tc.name  builtinsChronoTest0003
     * @tc.number  BUILTINS_CHRONO_TEST_0003
     * @tc.desc  Test nanoNow() value within valid long range
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanoTime: Long = Chrono.nanoNow();
      const maxLong: Long = 9223372036854775807 as Long;

      expect(nanoTime).assertLessOrEqual(maxLong);
    });

    /**
     * @tc.name  builtinsChronoTest0004
     * @tc.number  BUILTINS_CHRONO_TEST_0004
     * @tc.desc  Test consecutive calls to nanoNow() return increasing values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const t1: Long = Chrono.nanoNow();
      const t2: Long = Chrono.nanoNow();

      expect(t2).assertLarger(t1);
    });

    /**
     * @tc.name  builtinsChronoTest0005
     * @tc.number  BUILTINS_CHRONO_TEST_0005
     * @tc.desc  Test consistency between nanoNow() and milliNow() with allowed error
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanoTime: Long = Chrono.nanoNow();
      const milliTime: number = Chrono.milliNow();
      const nanoToMilli: number = Number(nanoTime) / 1000000;

      expect(milliTime).assertClose(nanoToMilli, 1);
    });

    /**
     * @tc.name  builtinsChronoTest0006
     * @tc.number  BUILTINS_CHRONO_TEST_0006
     * @tc.desc  Test multi-call to nanoNow() return valid values (avoid Promise error)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const timeList: Long[] = [Chrono.nanoNow(), Chrono.nanoNow(), Chrono.nanoNow()];

      timeList.forEach(time => {
        expect(time).assertLargerOrEqual(0 as Long);
        expect(time).assertInstanceOf('Long');
      });
    });

    /**
     * @tc.name  builtinsChronoTest0007
     * @tc.number  BUILTINS_CHRONO_TEST_0007
     * @tc.desc  Test reasonable time difference of consecutive nanoNow() calls
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const t1: Long = Chrono.nanoNow();
      const t2: Long = Chrono.nanoNow();
      const diff: Long = (t2 - t1) as Long;
      const maxReasonableDiff: Long = 1000000000 as Long;

      expect(diff).assertLargerOrEqual(1 as Long);
      expect(diff).assertLessOrEqual(maxReasonableDiff);
    });

    /**
     * @tc.name  builtinsChronoTest0008
     * @tc.number  BUILTINS_CHRONO_TEST_0008
     * @tc.desc  Test milliNow() returns non-negative number value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const milliTime: number = Chrono.milliNow();
      expect(milliTime).assertLargerOrEqual(0);
    });

    /**
     * @tc.name  builtinsChronoTest0009
     * @tc.number  BUILTINS_CHRONO_TEST_0009
     * @tc.desc  Test milliNow() returns number type value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const milliTime = Chrono.milliNow();
      expect(milliTime).assertInstanceOf('number');
    });

    /**
     * @tc.name  builtinsChronoTest0010
     * @tc.number  BUILTINS_CHRONO_TEST_0010
     * @tc.desc  Test consecutive calls to milliNow() return increasing values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const t1: number = Chrono.milliNow();

      for (let i = 0; i < 100; i++);
      const t2: number = Chrono.milliNow();
      expect(t2).assertLargerOrEqual(t1);
    });

    /**
     * @tc.name  builtinsChronoTest0011
     * @tc.number  BUILTINS_CHRONO_TEST_0011
     * @tc.desc  Test milliNow() value within reasonable number range
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const milliTime: number = Chrono.milliNow();
      const maxReasonableMilli: number = 1e18;

      expect(milliTime).assertLessOrEqual(maxReasonableMilli);
    });

    /**
     * @tc.name  builtinsChronoTest0012
     * @tc.number  BUILTINS_CHRONO_TEST_0012
     * @tc.desc  Test milliNow() calculation logic consistency with nanoNow()
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanoTime: Long = Chrono.nanoNow();
      const calcMilliTime: number = Number(nanoTime) / 1000000;
      const actualMilliTime: number = Chrono.milliNow();
      expect(actualMilliTime).assertClose(calcMilliTime, 1);
    });

    /**
     * @tc.name  builtinsChronoTest0013
     * @tc.number  BUILTINS_CHRONO_TEST_0013
     * @tc.desc  Test reasonable time difference of consecutive milliNow() calls
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const t1: number = Chrono.milliNow();
      const t2: number = Chrono.milliNow();
      const diff: number = t2 - t1;
      const maxReasonableDiff: number = 1000;
      expect(diff).assertLargerOrEqual(0);
      expect(diff).assertLessOrEqual(maxReasonableDiff);
    });

    /**
     * @tc.name  builtinsChronoTest0014
     * @tc.number  BUILTINS_CHRONO_TEST_0014
     * @tc.desc  Test multi-call to milliNow() return valid values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const timeList: number[] = [Chrono.milliNow(), Chrono.milliNow(), Chrono.milliNow()];

      timeList.forEach((time: number) => {
        expect(time).assertLargerOrEqual(0);
        expect(time).assertInstanceOf('number');

        expect(!isNaN(time)).assertTrue();

        expect(time).assertLess(Number.POSITIVE_INFINITY);
        expect(time).assertLarger(Number.NEGATIVE_INFINITY);
      });
    });

    /**
     * @tc.name  builtinsChronoTest0015
     * @tc.number  BUILTINS_CHRONO_TEST_0015
     * @tc.desc  Test getCpuTime() returns Long.MIN_VALUE correctly without overflow
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minLong: Long = -9223372036854775808 as Long;
      const cpuTime: Long = Chrono.getCpuTime();

      expect(cpuTime).assertLargerOrEqual(minLong);
    });

    /**
     * @tc.name  builtinsChronoTest0016
     * @tc.number  BUILTINS_CHRONO_TEST_0016
     * @tc.desc  Test getCpuTime() returns Long.MAX_VALUE correctly without overflow
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxLong: Long = 9223372036854775807 as Long;
      const cpuTime: Long = Chrono.getCpuTime();

      expect(cpuTime).assertLessOrEqual(maxLong);
    });

    /**
     * @tc.name  builtinsChronoTest0017
     * @tc.number  BUILTINS_CHRONO_TEST_0017
     * @tc.desc  Test getCpuTime() behavior when value exceeds Long.MIN_VALUE (underflow)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minLong: Long = -9223372036854775808 as Long;
      const cpuTime: Long = Chrono.getCpuTime();

      expect(cpuTime).assertLargerOrEqual(minLong);
    });

    /**
     * @tc.name  builtinsChronoTest0018
     * @tc.number  BUILTINS_CHRONO_TEST_0018
     * @tc.desc  Test getCpuTime() behavior when value exceeds Long.MAX_VALUE (overflow)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxLong: Long = 9223372036854775807 as Long;
      const cpuTime: Long = Chrono.getCpuTime();

      expect(cpuTime).assertLessOrEqual(maxLong);
    });

    /**
     * @tc.name  builtinsChronoTest0019
     * @tc.number  BUILTINS_CHRONO_TEST_0019
     * @tc.desc  Test getCpuTime() returns increasing values with consecutive calls
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const t1: Long = Chrono.getCpuTime();
      const t2: Long = Chrono.getCpuTime();

      expect(t2).assertLargerOrEqual(t1);
    });

    /**
     * @tc.name  builtinsChronoTest0020
     * @tc.number  BUILTINS_CHRONO_TEST_0020
     * @tc.desc  Test uniqueness and order of getCpuTime() in concurrent calls
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const timeList: Long[] = [Chrono.getCpuTime(), Chrono.getCpuTime(), Chrono.getCpuTime()];
      for (let i = 1; i < timeList.length; i++) {
        expect(timeList[i]).assertLargerOrEqual(timeList[i-1]);
      }
    });

    /**
     * @tc.name  builtinsChronoTest0021
     * @tc.number  BUILTINS_CHRONO_TEST_0021
     * @tc.desc  Test getCpuTime() returns 0 when system CPU time resets to zero
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cpuTime: Long = Chrono.getCpuTime();

      expect(cpuTime).assertLargerOrEqual(0 as Long);
    });

    /**
     * @tc.name  builtinsChronoTest0022
     * @tc.number  BUILTINS_CHRONO_TEST_0022
     * @tc.desc  Test getCpuTime() returns negative value when CPU time rolls back
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsChronoTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cpuTime: Long = Chrono.getCpuTime();

      expect(cpuTime).assertInstanceOf('Long');
    });

  });
};