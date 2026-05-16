import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libSensorCppStandard from 'libsensorcppstandard.so';

export default function ActsSensorNativeTest() {
  describe('ActsSensorNativeTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   OH_Sensor_GetInfos_001
     * @tc.number OH_Sensor_GetInfos_001
     * @tc.desc   OH_Sensor_GetInfos_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_GetInfos_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorGetInfosTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_GetInfos_002
     * @tc.number OH_Sensor_GetInfos_002
     * @tc.desc   OH_Sensor_GetInfos_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_GetInfos_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorGetInfosTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_001
     * @tc.number OH_Sensor_Subscribe_001
     * @tc.desc   OH_Sensor_Subscribe_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_002
     * @tc.number OH_Sensor_Subscribe_002
     * @tc.desc   OH_Sensor_Subscribe_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_003
     * @tc.number OH_Sensor_Subscribe_003
     * @tc.desc   OH_Sensor_Subscribe_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_003', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_004
     * @tc.number OH_Sensor_Subscribe_004
     * @tc.desc   OH_Sensor_Subscribe_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_004', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_005
     * @tc.number OH_Sensor_Subscribe_005
     * @tc.desc   OH_Sensor_Subscribe_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_005', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_006
     * @tc.number OH_Sensor_Subscribe_006
     * @tc.desc   OH_Sensor_Subscribe_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_006', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_007
     * @tc.number OH_Sensor_Subscribe_007
     * @tc.desc   OH_Sensor_Subscribe_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_007', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_008
     * @tc.number OH_Sensor_Subscribe_008
     * @tc.desc   OH_Sensor_Subscribe_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_008', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_009
     * @tc.number OH_Sensor_Subscribe_009
     * @tc.desc   OH_Sensor_Subscribe_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_009', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_010
     * @tc.number OH_Sensor_Subscribe_010
     * @tc.desc   OH_Sensor_Subscribe_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_010', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_011
     * @tc.number OH_Sensor_Subscribe_011
     * @tc.desc   OH_Sensor_Subscribe_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_011', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_012
     * @tc.number OH_Sensor_Subscribe_012
     * @tc.desc   OH_Sensor_Subscribe_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_012', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_013
     * @tc.number OH_Sensor_Subscribe_013
     * @tc.desc   OH_Sensor_Subscribe_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_013', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Subscribe_014
     * @tc.number OH_Sensor_Subscribe_014
     * @tc.desc   OH_Sensor_Subscribe_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Subscribe_014', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscribeTest(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Unsubscribe_001
     * @tc.number OH_Sensor_Unsubscribe_001
     * @tc.desc   OH_Sensor_Unsubscribe_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Unsubscribe_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorUnsubscribeTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Unsubscribe_002
     * @tc.number OH_Sensor_Unsubscribe_002
     * @tc.desc   OH_Sensor_Unsubscribe_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Unsubscribe_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorUnsubscribeTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Unsubscribe_003
     * @tc.number OH_Sensor_Unsubscribe_003
     * @tc.desc   OH_Sensor_Unsubscribe_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Unsubscribe_003', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorUnsubscribeTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Unsubscribe_004
     * @tc.number OH_Sensor_Unsubscribe_004
     * @tc.desc   OH_Sensor_Unsubscribe_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Unsubscribe_004', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorUnsubscribeTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Unsubscribe_005
     * @tc.number OH_Sensor_Unsubscribe_005
     * @tc.desc   OH_Sensor_Unsubscribe_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Unsubscribe_005', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorUnsubscribeTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Sensor_Unsubscribe_006
     * @tc.number OH_Sensor_Unsubscribe_006
     * @tc.desc   OH_Sensor_Unsubscribe_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_Sensor_Unsubscribe_006', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorUnsubscribeTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionId_SetType_001
     * @tc.number OH_SensorSubscriptionId_SetType_001
     * @tc.desc   OH_SensorSubscriptionId_SetType_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionId_SetType_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionIdSetTypeTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionId_SetType_002
     * @tc.number OH_SensorSubscriptionId_SetType_002
     * @tc.desc   OH_SensorSubscriptionId_SetType_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionId_SetType_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionIdSetTypeTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionId_SetType_003
     * @tc.number OH_SensorSubscriptionId_SetType_003
     * @tc.desc   OH_SensorSubscriptionId_SetType_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionId_SetType_003', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionIdSetTypeTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionId_GetType_001
     * @tc.number OH_SensorSubscriptionId_GetType_001
     * @tc.desc   OH_SensorSubscriptionId_GetType_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionId_GetType_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionIdGetTypeTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionId_GetType_002
     * @tc.number OH_SensorSubscriptionId_GetType_002
     * @tc.desc   OH_SensorSubscriptionId_GetType_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionId_GetType_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionIdGetTypeTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionAttribute_SetSamplingInterval_001
     * @tc.number OH_SensorSubscriptionAttribute_SetSamplingInterval_001
     * @tc.desc   OH_SensorSubscriptionAttribute_SetSamplingInterval_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionAttribute_SetSamplingInterval_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionAttrSetSamplingIntervalTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionAttribute_SetSamplingInterval_002
     * @tc.number OH_SensorSubscriptionAttribute_SetSamplingInterval_002
     * @tc.desc   OH_SensorSubscriptionAttribute_SetSamplingInterval_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionAttribute_SetSamplingInterval_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionAttrSetSamplingIntervalTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionAttribute_GetSamplingInterval_001
     * @tc.number OH_SensorSubscriptionAttribute_GetSamplingInterval_001
     * @tc.desc   OH_SensorSubscriptionAttribute_GetSamplingInterval_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionAttribute_GetSamplingInterval_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionAttrGetSamplingIntervalTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriptionAttribute_GetSamplingInterval_002
     * @tc.number OH_SensorSubscriptionAttribute_GetSamplingInterval_002
     * @tc.desc   OH_SensorSubscriptionAttribute_GetSamplingInterval_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriptionAttribute_GetSamplingInterval_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriptionAttrGetSamplingIntervalTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriber_SetCallback_001
     * @tc.number OH_SensorSubscriber_SetCallback_001
     * @tc.desc   OH_SensorSubscriber_SetCallback_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriber_SetCallback_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriberSetCallbackTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriber_SetCallback_002
     * @tc.number OH_SensorSubscriber_SetCallback_002
     * @tc.desc   OH_SensorSubscriber_SetCallback_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriber_SetCallback_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriberSetCallbackTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriber_GetCallback_001
     * @tc.number OH_SensorSubscriber_GetCallback_001
     * @tc.desc   OH_SensorSubscriber_GetCallback_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriber_GetCallback_001', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriberGetCallbackTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_SensorSubscriber_GetCallback_002
     * @tc.number OH_SensorSubscriber_GetCallback_002
     * @tc.desc   OH_SensorSubscriber_GetCallback_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OH_SensorSubscriber_GetCallback_002', Level.LEVEL3, () => {
      const result = libSensorCppStandard.OHSensorSubscriberGetCallbackTest(1);
      expect(result).assertEqual(0);
    })
  })
}
