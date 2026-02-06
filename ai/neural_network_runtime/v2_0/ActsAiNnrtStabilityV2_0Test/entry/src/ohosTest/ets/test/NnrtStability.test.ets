import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libacts_nnrt_stability_test from 'libacts_nnrt_stability_test.so';

export default function nnrtStabilityTest() {
  describe('ActsNnrtStabilityTest', () => {
    beforeAll(() => {
      hilog.info(0x0001, 'NNRtTest', 'NNRT Stability Test Suite Starting');
    })

    beforeEach(() => {
      hilog.info(0x0001, 'NNRtTest', 'Test case starting');
    })

    afterEach(() => {
      hilog.info(0x0001, 'NNRtTest', 'Test case completed');
    })

    afterAll(() => {
      hilog.info(0x0001, 'NNRtTest', 'NNRT Stability Test Suite Completed');
    })

    /**
     * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0100
     * @tc.number SUB_AI_NNR_Reliability_North_Stress_0100
     * @tc.desc   循环创建模型、编译并释放资源，验证稳定性
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNR_Reliability_North_Stress_0100', Level.LEVEL2, async () => {
      hilog.info(0x0001, 'NNRtTest', 'SUB_AI_NNR_Reliability_North_Stress_0100 START');

      try {
        let result:number = await libacts_nnrt_stability_test.SubAiNnrReliabilityNorthStress(100);
        hilog.info(0x0001, 'NNRtTest', 'Test result: %{public}d', result);
        expect(result).assertEqual(0);
      } catch (error) {
        hilog.error(0x0001, 'NNRtTest', 'Test failed with error: %{public}s', error.message);
        expect().assertFail();
      }

      hilog.info(0x0001, 'NNRtTest', 'SUB_AI_NNR_Reliability_North_Stress_0100 END');
    })

    /**
     * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0200
     * @tc.number SUB_AI_NNR_Reliability_North_Stress_0200
     * @tc.desc   创建模型和编译后，循环创建执行器并执行，验证执行器稳定性
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNR_Reliability_North_Stress_0200', Level.LEVEL2, async () => {
      hilog.info(0x0001, 'NNRtTest', 'SUB_AI_NNR_Reliability_North_Stress_0200 START');

      try {
        let result:number = await libacts_nnrt_stability_test.SubAiNnrReliabilityNorthStress(200);
        hilog.info(0x0001, 'NNRtTest', 'Test result: %{public}d', result);
        expect(result).assertEqual(0);
      } catch (error) {
        hilog.error(0x0001, 'NNRtTest', 'Test failed with error: %{public}s', error.message);
        expect().assertFail();
      }

      hilog.info(0x0001, 'NNRtTest', 'SUB_AI_NNR_Reliability_North_Stress_0200 END');
    })
  })
}
