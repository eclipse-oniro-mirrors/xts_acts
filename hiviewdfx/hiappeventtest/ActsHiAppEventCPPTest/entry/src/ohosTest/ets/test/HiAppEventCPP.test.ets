import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import hi_app_event_test from 'libhi_app_event_test.so';

export default function hiAppEventCPPTest() {
  describe('HiAppEventCPPTest', () => {
    beforeAll(() => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'beforeAll: Test suite started');
    })

    beforeEach(() => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'beforeEach: Test case started');
    })

    afterEach(() => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'afterEach: Test case finished');
    })

    afterAll(() => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'afterAll: Test suite finished');
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_0100
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0100
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_0100', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 0100 start');
      let result: number = hi_app_event_test.hiAppEventTest(100);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_0200
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0200
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_0200', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 0200 start');
      let result: number = hi_app_event_test.hiAppEventTest(200);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_0300
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0300
     * @tc.desc   The keyvalue is reported as a boolean list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_0300', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 0300 start');
      let result: number = hi_app_event_test.hiAppEventTest(300);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_0400
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0400
     * @tc.desc   The keyvalue is reported as a boolean list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_0400', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 0400 start');
      let result: number = hi_app_event_test.hiAppEventTest(400);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_0500
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0500
     * @tc.desc   The keyvalue is reported as a boolean list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_0500', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 0500 start');
      let result: number = hi_app_event_test.hiAppEventTest(500);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_0800
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0800
     * @tc.desc   The keyvalue type is double.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_0800', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 0800 start');
      let result: number = hi_app_event_test.hiAppEventTest(800);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_0900
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0900
     * @tc.desc   The keyvalue is reported as a double list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_0900', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 0900 start');
      let result: number = hi_app_event_test.hiAppEventTest(900);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1000
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1000
     * @tc.desc   The keyvalue type is float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1000', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1000 start');
      let result: number = hi_app_event_test.hiAppEventTest(1000);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1100
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1100
     * @tc.desc   The keyvalue is reported as a float list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1100', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1100 start');
      let result: number = hi_app_event_test.hiAppEventTest(1100);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1200
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1200
     * @tc.desc   The keyvalue is of the int type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1200', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1200 start');
      let result: number = hi_app_event_test.hiAppEventTest(1200);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1300
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1300
     * @tc.desc   The keyvalue is reported as an int list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1300', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1300 start');
      let result: number = hi_app_event_test.hiAppEventTest(1300);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1400
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1400
     * @tc.desc   The keyvalue type is long.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1400', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1400 start');
      let result: number = hi_app_event_test.hiAppEventTest(1400);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1500
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1500
     * @tc.desc   The keyvalue type is long.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1500', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1500 start');
      let result: number = hi_app_event_test.hiAppEventTest(1500);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1600
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1600
     * @tc.desc   The keyvalue type is long.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1600', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1600 start');
      let result: number = hi_app_event_test.hiAppEventTest(1600);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1700
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1700
     * @tc.desc   The keyvalue type is long.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1700', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1700 start');
      let result: number = hi_app_event_test.hiAppEventTest(1700);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1800
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1800
     * @tc.desc   The keyvalue type is long.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1800', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1800 start');
      let result: number = hi_app_event_test.hiAppEventTest(1800);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_1900
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1900
     * @tc.desc   The keyvalue type is long.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_1900', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 1900 start');
      let result: number = hi_app_event_test.hiAppEventTest(1900);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2100
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2100
     * @tc.desc   The keyvalue is reported as a string list, 100 list parameters .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2100', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2100 start');
      let result: number = hi_app_event_test.hiAppEventTest(2100);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2200
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2200
     * @tc.desc   The keyvalue is reported as a string, 8 * 1024 lenth.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2200', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2200 start');
      let result: number = hi_app_event_test.hiAppEventTest(2200);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2300
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2300
     * @tc.desc   Reported event name is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2300', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2300 start');
      let result: number = hi_app_event_test.hiAppEventTest(2300);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2400
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2400
     * @tc.desc   Reported event name is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2400', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2400 start');
      let result: number = hi_app_event_test.hiAppEventTest(2400);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2500
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2500
     * @tc.desc   Reported event name starts with number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2500', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2500 start');
      let result: number = hi_app_event_test.hiAppEventTest(2500);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2700
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2700
     * @tc.desc   key and values 33 parameters are reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2700', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2700 start');
      let result: number = hi_app_event_test.hiAppEventTest(2700);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2800
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2800
     * @tc.desc   key and value is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2800', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2800 start');
      let result: number = hi_app_event_test.hiAppEventTest(2800);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_2900
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2900
     * @tc.desc   key is not string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_2900', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 2900 start');
      let result: number = hi_app_event_test.hiAppEventTest(2900);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3000
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3000
     * @tc.desc   key start with number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3000', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3000 start');
      let result: number = hi_app_event_test.hiAppEventTest(3000);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3100
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3100
     * @tc.desc   The keyvalue is reported as a string, 8 * 1024 + 1 length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3100', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3100 start');
      let result: number = hi_app_event_test.hiAppEventTest(3100);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3200
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3200
     * @tc.desc   key and value is NULL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3200', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3200 start');
      let result: number = hi_app_event_test.hiAppEventTest(3200);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3300
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3300
     * @tc.desc   101 List Parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3300', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3300 start');
      let result: number = hi_app_event_test.hiAppEventTest(3300);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3400
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3400
     * @tc.desc   key and values 32 parameters are reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3400', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3400 start');
      let result: number = hi_app_event_test.hiAppEventTest(3400);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3500
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3500
     * @tc.desc   key and values 32 parameters are reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3500', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3500 start');
      let result: number = hi_app_event_test.hiAppEventTest(3500);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3600
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3600
     * @tc.desc   key and values 32 parameters are reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3600', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3600 start');
      let result: number = hi_app_event_test.hiAppEventTest(3600);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3700
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3700
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3700', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3700 start');
      let result: number = hi_app_event_test.hiAppEventTest(3700);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3800
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3800
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3800', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3800 start');
      let result: number = hi_app_event_test.hiAppEventTest(3800);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_3900
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3900
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_3900', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 3900 start');
      let result: number = hi_app_event_test.hiAppEventTest(3900);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_4000
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4000
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_4000', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 4000 start');
      let result: number = hi_app_event_test.hiAppEventTest(4000);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_4100
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4100
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_4100', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 4100 start');
      let result: number = hi_app_event_test.hiAppEventTest(4100);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_4200
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4200
     * @tc.desc   The keyvalue is of the boolean type and the bool value is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_4200', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 4200 start');
      let result: number = hi_app_event_test.hiAppEventTest(4200);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_4300
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4300
     * @tc.desc   DFX_DFT_HiviewKit_HiAppEvent_Native_4300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_4300', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 4300 start');
      let result: number = hi_app_event_test.hiAppEventTest(4300);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_4400
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4400
     * @tc.desc   check the interface of SetEventConfig for EVENT_MAIN_THREAD_JANK_V2 when the log type is in format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_4400', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 4400 start');
      let result: number = hi_app_event_test.hiAppEventTest(4400);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   DFX_DFT_HiviewKit_HiAppEvent_Native_4500
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4500
     * @tc.desc   check the interface of SetEventConfig for EVENT_MAIN_THREAD_JANK_V2 when the log type is in format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFT_HiviewKit_HiAppEvent_Native_4500', Level.LEVEL0, () => {
      hilog.info(0x0001, 'HiAppEventCPPTest', 'Test case 4500 start');
      let result: number = hi_app_event_test.hiAppEventTest(4500);
      expect(result).assertEqual(0);
    })

  })
}
